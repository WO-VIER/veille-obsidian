# LLM Wiki et Veille Technologique

## En une phrase
Comment le pattern LLM Wiki s'intègre dans un système de veille technologique concret pour transformer les sources brutes en connaissances capitalisées.

## Contexte
Le pattern LLM Wiki delegación mantenimiento del wiki a la IA. En un contexto de veille tecnológica, permite:
- Recoger fuentes pasivas (RSS, GitHub, etc.) en `raw/`
- Transformar cada fuente en una nota de síntesis en `wiki/notes/`
- Conectar las notas entre sí con enlaces Zettelkasten
- Mantener un índice actualizado

## Puntos clave
- **Ingest**: La IA lee una fuente, crea una síntesis, actualiza el índice
- **Query**: El usuario pregunta, la IA responde conectando notas existentes
- **Lint**: Verificación periódica de salud del wiki (enlaces rotos, contradicciones)

## Integración con el vault
- Las fuentes activas viven en `raw/active/`
- Las fuentes pasivas viven en `raw/passive/`
- Las notas finales viven en `wiki/notes/`
- Los métodos y templates viven en `wiki/` ( raíz para visibilidad)

## Fuentes
- [LLM Wiki (Andrej Karpathy)](../../raw/active/Github/llm-wiki.md)
- [Thread by @karpathy](../../raw/active/X/Thread by @karpathy.md)