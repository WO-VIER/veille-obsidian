---
title: "I compared all 6 major CLI coding agents"
source: "https://www.reddit.com/r/vibecoding/comments/1s2ftie/i_compared_all_6_major_cli_coding_agents/"
author:
  - "[[johns10davenport]]"
published: 2026-03-24
created: 2026-04-14
description: "I compared all 6 major CLI coding agents -- here's what actually matters Body I'm building a dev tools product and needed to resea"
tags:
  - "clippings"
---
I compared all 6 major CLI coding agents -- here's what actually matters

## Body

I'm building a dev tools product and needed to research the CLI agent landscape for integrations. Figured the results might be useful here.

|  | Claude Code | Codex CLI | Gemini CLI | Aider | OpenCode | Goose |
| --- | --- | --- | --- | --- | --- | --- |
|  |
| Maker | Anthropic | OpenAI | Google | Independent | Independent | Block |
| Open Source | No | Yes (Apache 2.0) | Yes (Apache 2.0) | Yes (Apache 2.0) | Yes | Yes (Apache 2.0) |
| Free Tier | Limited | With ChatGPT+ | Yes (1,000 req/day) | Yes (BYOK) | Yes (BYOK) | Yes (BYOK) |
| Entry Price | $20/mo | $20/mo | Free | API costs only | API costs only | API costs only |
| LLM Backends | Claude only | OpenAI only | Gemini only | 50+ models | 75+ models | Any LLM |
| MCP Support | Yes | Yes (9,000+) | Yes | No (third-party) | Yes | Yes |
| Best At | Complex architecture | DevOps/infra, token efficiency | Free entry point | Model freedom, git workflow | Multi-interface | Extensibility |

The biggest thing I learned: **forget benchmarks for comparing these tools.** SWE-bench tests models, not the CLI tools themselves. None of these tools have been submitted to SWE-bench. And the same model can score 20+ points different depending on the agent harness wrapping it. There's literally no good benchmark for "same model, different tool."

So what does real-world testing tell us?

- **Render** tested Claude Code, Gemini CLI, and Codex on identical tasks. Claude Code and Gemini CLI both scored 6.8/10, Codex 6.0 -- but Gemini needed almost twice as many follow-up prompts to get there.
- **Composio** did a timed test: Claude Code finished the same task in 1h17m ($4.80) vs Gemini CLI's 2h02m ($7.06).
- **Morph** found Claude Code's output works without human edits 78% of the time vs 71% for Aider -- but Aider uses 4.2x fewer tokens.

The $20/mo showdown: Codex CLI is way more generous with limits than Claude Code at the same price. Claude users report hitting limits "after 3 or 4 requests." Codex users rarely hit limits even with heavy use.

Gemini CLI's free tier (1,000 req/day) is unbeatable for getting started. Quality is inconsistent ("either great or garbage and it's a coin toss") but for $0 it's hard to argue.

The pattern I kept seeing: most power users run two agents. Claude Code for architecture and complex planning, something cheaper for iteration and debugging.

I have a longer writeup with full pricing breakdown and sources if anyone wants it.

---

## Comments

> **Valunex** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc7pxc3/) · 1 points
> 
> gemini looks so good in theory but in practice its trash (from my experience)
> 
> > **johns10davenport** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc8oj23/) · 2 points
> > 
> > I found a lot of comments about it that basically said the same.
> > 
> > > **Valunex** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc99nmo/) · 1 points
> > > 
> > > especially gemini-cli tries to use "write\_file" instead of "edit/replace" and forgets old code in a file. For example once it replaced a big style.css file with one single class since it wanted to add one class but used write\_file and everything was gone. Happens a lot...
> 
> > **Darwesh\_88** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/occikbq/) · 2 points
> > 
> > Totally agreed. Don’t know what’s up with google.
> > 
> > > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocgc6gp/) · 1 points
> > > 
> > > They'll get it figured out. They've got more money than god.
> 
> > **Illustrious\_Wear8454** · [2026-03-29](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/od2i2or/) · 1 points
> > 
> > i used gemini more, its all about how you set it, check reddit talks on gemini extensions, dont use older models except for vision tasks, outside that, its very good, explore extensions like maestro, super and conductor, it will give your gemini model the steriods to be powerful, you can use claude desktop to settup maestro to perfrom well. ALso use cli alot and skills, plugins and extensions:
> > 
> > Here's the prompt to paste into the other Claude:Here's the prompt — paste this into the other Claude:
> > 
> > ---
> > 
> > Install the Maestro extension for Gemini CLI and configure it for maximum parallel performance. Do the following steps in order:
> > 
> > \*\*Step 1 — Install Maestro if not already installed:\*\*
> > gemini extensions install https://github.com/josstei/maestro-gemini
> > 
> > \*\*Step 2 — Create the file \`~/.gemini/extensions/maestro/.env\` with exactly this content:\*\*
> > # Maestro extension environment config
> > MAESTRO\_EXECUTION\_MODE=parallel
> > MAESTRO\_MAX\_CONCURRENT=4
> > MAESTRO\_MAX\_RETRIES=2
> > MAESTRO\_VALIDATION\_STRICTNESS=normal
> > MAESTRO\_AUTO\_ARCHIVE=true
> > MAESTRO\_STATE\_DIR=.maestro
> > 
> > \*\*Step 3 — Overwrite \`~/.gemini/extensions/maestro/policies/maestro.toml\` with exactly this content:\*\*
> > \`\`\`toml
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandRegex = ".\*\\\\btee\\\\b.\*"
> > decision = "ask\_user"
> > priority = 850
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandRegex = ".\*(?:\\\\s>>?\\\\s|\\\\s>>?$|^>>?\\\\s|\\\\d>>?\\\\s).\*$"
> > decision = "ask\_user"
> > priority = 850
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandRegex = ".\*(?:<<).\*$"
> > decision = "deny"
> > priority = 950
> > deny\_message = "Heredoc corrupts structured content — use write\_file instead"
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandPrefix = \["rm -rf","rm -fr","sudo rm -rf","sudo rm -fr","git reset --hard","git checkout --","git clean -fd","git clean -df","git clean -xfd","git clean -xdf"\]
> > decision = "deny"
> > priority = 950
> > deny\_message = "Maestro blocks destructive shell commands."
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandRegex = ".\*git\\\\s+push\\\\s+.\*--force.\*"
> > decision = "deny"
> > priority = 950
> > deny\_message = "Force-push blocked."
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandPrefix = \["sudo su","su -","chmod 777","chown -R root"\]
> > decision = "ask\_user"
> > priority = 850
> > 
> > \[\[rule\]\]
> > toolName = "run\_shell\_command"
> > commandRegex = ".\*(?:npm install -g|pip install --break-system-packages|pacman -S|yay -S).\*"
> > decision = "ask\_user"
> > priority = 850
> > 
> > Step 4 — Restart Gemini CLI. The key settings that make it fast are MAESTRO\_EXECUTION\_MODE=parallel and MAESTRO\_MAX\_CONCURRENT=4 — these make Maestro run all agents concurrently instead of one at a time.
> > 
> > \`\`\`
> > 
> > 
> > 
> > this is one of the complex tasks i gave it and it perfromed well, i tried it for the languages am learning: Rust, golang and erlixir and it performed very well:
> > i want you to research the best 3 web backend framework, bateery loaded for enterprise developmemnt using nlm 
> >     cli, clone and analyse the best 3 golang web framework with repomix cli and generate a video analaysis for 
> >     each of the framework and the comparative analysis of all 3, use the default nlm cli profile and invite the 
> >     other profiles so if one video is stuck, you can create it from others. lastly, go to this folder and pick 5 
> >     basic projects 3 intermediary projects and 2 advance projects and use the appropriate cli to build those 10 
> >     projects in that folder user the top 3 best golang framework you researched. test the nlm profile that they 
> >     are working before you start, use your skills, extensions and plugins to minimize tokens consumptions and 
> >     maximise utility, run test after each stage, do not forget to create a thorogh plan before you starty its 
> >     implementation, the file and the folder is here
> > 
> > > **Valunex** · [2026-03-29](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/od2tvae/) · 1 points
> > > 
> > > \*\*EDIT\*\*
> > > 
> > > #Solved: dont use gemini-cli and use claude-code & codex. at least for coding
> > > 
> > > > **johns10davenport** · [2026-03-31](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/odi6ibd/) · 2 points
> > > > 
> > > > I'm all in on claude code.

> **\[deleted\]** · 2026-03-24 · 0 points
> 
> [
> 
> ](https://external-preview.redd.it/EOLVx3BATaYAl-DC3gKRnEAV3Ym4FusH_G9hPtGP11o.gif?auto=webp&s=4ec4fd81fafd3c380a1421b0cfd150b15da0712b)
> 
> > **IPv6Address** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc7y46k/) · 1 points
> > 
> > [
> > 
> > ](https://external-preview.redd.it/EOLVx3BATaYAl-DC3gKRnEAV3Ym4FusH_G9hPtGP11o.gif?auto=webp&s=4ec4fd81fafd3c380a1421b0cfd150b15da0712b)

> **Darwesh\_88** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc7uoui/) · 1 points
> 
> I think there is some misconception in what you wrote. Claude code, codex, Gemini and others are all coding cli. I don’t think they themselves have anything to do with the benchmarks you mentioned. The models which you run in them matter a lot too. And benchmarks are for models not the harness.
> 
> In the table above you have mentioned an SWE-bench value but that’s completely and totally wrong. Claude code doesn’t have any benchmark. It’s the models.
> 
> And Claude code also is now open source since sometime. You can even run local models.
> 
> Please check your findings.
> 
> > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocbu2tx/) · 2 points
> > 
> > I revised my content based on your feedback. Thanks.
> > 
> > **johns10davenport** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc8tgb2/) · 1 points
> > 
> > Thanks for the feedback on my poor analysis of SWE-bench. I'll go back and do some revisions.
> > 
> > The claude code repo doesn't have any code, it's just a placeholder repo. So still closed source:  
> > [https://github.com/anthropics/claude-code](https://github.com/anthropics/claude-code)
> > 
> > **johns10davenport** · [2026-03-24](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/oc8vcrw/) · 1 points
> > 
> > You're pointing out a valid gap in available research. There aren't good apples to apples comparisons for agent harnesses.
> > 
> > > **Darwesh\_88** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/occibb4/) · 1 points
> > > 
> > > Not sure about how but if you check there is some easy way to connect local llms with Claude code.
> > > 
> > > Personally I have moved to codex for 5.3 and now 5.4 which is slower thank god and check all relevant things before blindly coding. Opus 4.6 is somehow in my opinion is very good to talk to but leaves too many gaps in the codebase.
> > > 
> > > > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocfhfiw/) · 1 points
> > > > 
> > > > Are you finding codex does this less? I'm basically solving the gaps by adding quality layers on top of generation, which helps but doesn't solve everything.
> > > > 
> > > > > **Darwesh\_88** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocfipqy/) · 1 points
> > > > > 
> > > > > Yes definitely. I was happy with codex 5.3 too but 5.4 is even better. Also important to note while opus will push you to publish with security issues codex checks for security vulnerabilities better.
> > > > > 
> > > > > When I want to add any feature or brainstorm I use opus but final work codex
> > > 
> > > > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocfhipa/) · 1 points
> > > > 
> > > > Yes, you can use 3rd party providers. I'd love for someone else to go do that research so I don't have to :D
> > > > 
> > > > > **Darwesh\_88** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocfi8iv/) · 1 points
> > > > > 
> > > > > I have it bookmarked somewhere in my x account will look it up and send
> > > 
> > > > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocg0fwh/) · 1 points
> > > > 
> > > > I've been thinking about incorporating multiple agents in to my workflows and working with codex as well.
> > > > 
> > > > > **Darwesh\_88** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocg2l8v/) · 1 points
> > > > > 
> > > > > Been learning and coding past 14 months don’t understand the hype with multi agents. Useless from my perspective. Single agent but structured instructions beats multi agent I think. Could post my sent up if you want. You could try it out. Actually have an open source repo as well to setup the perfect skills and all. Not polished. But for me works
> > > > > 
> > > > > > **johns10davenport** · [2026-03-25](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ocgavri/) · 1 points
> > > > > > 
> > > > > > Send it to me.
> > > > > > 
> > > > > > I've avoided multi agent because anyone who knows what they are doing says the same.
> > > > > > 
> > > > > > That said I've found subagents to be great. Helps the main agent retain context for very long projects.

> **Dry-Mirror4917** · [2026-03-31](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/odgrmcn/) · 1 points
> 
> qwen's own cli tool definitely packing some punch and also offers a free tier (apparently used to be more generous but I got there real late). Kimi code is within acceptable, but then I still go back to claude code. Basically Claude code is my computer now (cit. [https://steipete.me/posts/2025/claude-code-is-my-computer](https://steipete.me/posts/2025/claude-code-is-my-computer) ) . I use arch linux and I've used other tools to fix or change features of my arch install: while I always try to have a backup, gemini and kimi did indeed mess up multiple times in the past. So far haven't had issues with claude code - yet : thanks to llms I have finally started practicing - not mastered, the fine art of backups.

> **Revolutionary\_Ear750** · [2026-04-08](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of1z52w/) · 1 points
> 
> [https://github.com/PixCats/ananke](https://github.com/PixCats/ananke)  
> try this one :D is for windows only but i think you would like it it helps a lot in vscode and antigravity espesialy where in vscode contiu always fail
> 
> > **johns10davenport** · [2026-04-08](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of25unl/) · 1 points
> > 
> > Nice! What led you to write your own agent?
> > 
> > > **Revolutionary\_Ear750** · [2026-04-09](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of4mshn/) · 2 points
> > > 
> > > Makes my life easier 😌
> > > 
> > > > **johns10davenport** · [2026-04-09](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of6cl01/) · 1 points
> > > > 
> > > > I found writing the agent to be quite difficult 
> > > > 
> > > > > **Revolutionary\_Ear750** · [2026-04-09](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of6h1h5/) · 1 points
> > > > > 
> > > > > It is indeed but as yoy can see my agent is very basic, not even close to the big giants or a big team could do
> > > > > 
> > > > > > **johns10davenport** · [2026-04-09](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/of724fp/) · 1 points
> > > > > > 
> > > > > > [https://github.com/tidewave-ai/tidewave\_phoenix](https://github.com/tidewave-ai/tidewave_phoenix)
> > > > > > 
> > > > > > Here's a sample open source agent that is like 90% there.

> **bezerker03** · [2026-04-12](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ofrd75s/) · 2 points
> 
> Opencode has mcp support, not sure why it says that.
> 
> > **johns10davenport** · [2026-04-12](https://reddit.com/r/vibecoding/comments/1s2ftie/comment/ofrq8wn/) · 1 points
> > 
> > Good call