#!/usr/bin/env python3
from __future__ import annotations

import csv
import html
import io
import os
import pwd
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path("/root/veille-obsidian")
ENV_FILE = ROOT / "wallabag" / ".env"
ACTIVE_WALLABAG_DIR = ROOT / "veille-vault" / "raw" / "active" / "wallabag"


def read_env(path: Path) -> dict[str, str]:
    env: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        env[key.strip()] = value.strip()
    return env


def run(cmd: list[str]) -> str:
    result = subprocess.run(cmd, check=True, text=True, capture_output=True)
    return result.stdout


def clean_text(value: str) -> str:
    text = value or ""
    text = re.sub(r"<script.*?</script>", " ", text, flags=re.IGNORECASE | re.DOTALL)
    text = re.sub(r"<style.*?</style>", " ", text, flags=re.IGNORECASE | re.DOTALL)
    text = re.sub(r"<[^>]+>", " ", text)
    text = html.unescape(text)
    text = re.sub(r"\s+", " ", text).strip()
    return text


def fetch_entries(username: str) -> list[dict[str, str]]:
    safe_username = username.replace("'", "''")
    sql = f"""
COPY (
    SELECT
        e.id,
        COALESCE(NULLIF(e.title, ''), 'Sans titre') AS title,
        COALESCE(NULLIF(e.url, ''), e.given_url, '') AS url,
        COALESCE(e.given_url, '') AS given_url,
        COALESCE(e.domain_name, '') AS domain_name,
        COALESCE(e.language, '') AS language,
        COALESCE(to_char(e.created_at, 'YYYY-MM-DD"T"HH24:MI:SS'), '') AS created_at,
        COALESCE(to_char(e.updated_at, 'YYYY-MM-DD"T"HH24:MI:SS'), '') AS updated_at,
        COALESCE(to_char(e.published_at, 'YYYY-MM-DD"T"HH24:MI:SS'), '') AS published_at,
        CASE WHEN e.is_archived THEN 'true' ELSE 'false' END AS is_archived,
        CASE WHEN e.is_starred THEN 'true' ELSE 'false' END AS is_starred,
        COALESCE(e.reading_time, 0)::text AS reading_time,
        COALESCE(e.content, '') AS content,
        COALESCE(string_agg(t.label, ' | ' ORDER BY t.label), '') AS tags
    FROM wallabag_entry e
    JOIN wallabag_user u ON u.id = e.user_id
    LEFT JOIN wallabag_entry_tag et ON et.entry_id = e.id
    LEFT JOIN wallabag_tag t ON t.id = et.tag_id
    WHERE u.username = '{safe_username}'
    GROUP BY e.id
    ORDER BY e.id ASC
) TO STDOUT WITH CSV HEADER
""".strip()

    output = run(
        [
            "docker",
            "exec",
            "wallabag-db",
            "psql",
            "-U",
            "postgres",
            "-d",
            "wallabag",
            "-v",
            "ON_ERROR_STOP=1",
            "-c",
            sql,
        ]
    )

    reader = csv.DictReader(io.StringIO(output))
    return list(reader)


def markdown_for_entry(entry: dict[str, str], captured_at: str) -> str:
    url = entry.get("url") or entry.get("given_url") or ""
    domain = entry.get("domain_name") or "inconnu"
    language = entry.get("language") or "inconnue"
    tags_raw = entry.get("tags") or ""
    tags = [tag.strip() for tag in tags_raw.split("|") if tag.strip()]
    tags_text = ", ".join(tags) if tags else "(aucun)"

    plain = clean_text(entry.get("content", ""))
    excerpt = plain[:3000] if plain else "Aucun contenu extrait par Wallabag."

    title = (entry.get("title") or "Sans titre").replace("\n", " ").strip()
    reading_time = entry.get("reading_time") or "0"

    lines = [
        f"# [Wallabag] {title}",
        "",
        "## Metadonnees",
        f"- ID Wallabag: {entry.get('id', '').strip()}",
        f"- Capture: {captured_at}",
        f"- URL: {url}",
        f"- Domaine: {domain}",
        f"- Langue: {language}",
        f"- Temps de lecture estime: {reading_time} min",
        f"- Archive: {entry.get('is_archived', 'false')}",
        f"- Favori: {entry.get('is_starred', 'false')}",
        f"- Tags: {tags_text}",
        "",
        "## Extrait brut",
        excerpt,
        "",
        "## Resume IA preliminaire",
        "- Non genere automatiquement.",
        "",
        "## Points a verifier",
        "- Classer la source (primaire / secondaire / communautaire).",
        "- Verifier les faits techniques critiques avant reutilisation.",
        "",
        "## Action possible",
        "- Si pertinent, creer ou enrichir une note dans `wiki/notes/`.",
    ]
    return "\n".join(lines) + "\n"


def chown_if_possible(path: Path) -> None:
    try:
        user = pwd.getpwnam("larasail")
    except KeyError:
        return
    os.chown(path, user.pw_uid, user.pw_gid)


def main() -> None:
    if not ENV_FILE.exists():
        raise SystemExit(f"Fichier introuvable: {ENV_FILE}")

    env = read_env(ENV_FILE)
    username = env.get("WALLABAG_ADMIN_USER", "veille")

    ACTIVE_WALLABAG_DIR.mkdir(parents=True, exist_ok=True)
    chown_if_possible(ACTIVE_WALLABAG_DIR)

    entries = fetch_entries(username)
    captured_at = datetime.now(timezone.utc).replace(microsecond=0).isoformat()

    created = 0
    skipped = 0

    for entry in entries:
        entry_id = (entry.get("id") or "").strip()
        if not entry_id:
            continue

        output = ACTIVE_WALLABAG_DIR / f"wallabag-entry-{entry_id}.md"
        if output.exists():
            skipped += 1
            continue

        content = markdown_for_entry(entry, captured_at)
        output.write_text(content, encoding="utf-8")
        chown_if_possible(output)
        created += 1

    print(f"created={created} skipped={skipped} total={len(entries)}")


if __name__ == "__main__":
    main()
