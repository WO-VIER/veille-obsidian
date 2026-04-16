---
title: "I saved 10M tokens (89%) on my Claude Code sessions with a CLI proxy"
source: "https://www.reddit.com/r/ClaudeAI/comments/1r2tt7q/i_saved_10m_tokens_89_on_my_claude_code_sessions/"
author:
  - "[[patrick4urcloud]]"
published: 2026-02-12
created: 2026-04-14
description: "I built rtk (Rust Token Killer), a CLI proxy that sits between Claude Code and your terminal commands. The problem: Claude Code s"
tags:
  - "clippings"
---
I built rtk (Rust Token Killer), a CLI proxy that sits between Claude Code and your terminal commands.

The problem: Claude Code sends raw command output to the LLM context. Most of it is noise — passing tests, verbose logs, status bars. You're paying tokens for output Claude doesn't need.

What rtk does: it filters and compresses command output before it reaches Claude.  
Real numbers from my workflow:  
\- cargo test: 155 lines → 3 lines (-98%)  
\- git status: 119 chars → 28 chars (-76%)  
\- git log: compact summaries instead of full output  
\- Total over 2 weeks: 10.2M tokens saved (89.2%)  
It works as a transparent proxy — just prefix your commands with rtk:  
git status → rtk git status  
cargo test → rtk cargo test  
ls -la → rtk ls

Or install the hook and Claude uses it automatically.  
Open source, written in Rust:  
[https://github.com/rtk-ai/rtk](https://github.com/rtk-ai/rtk)  
[https://www.rtk-ai.app](https://www.rtk-ai.app/)

Install: brew install rtk-ai/tap/rtk  
\# or  
curl -fsSL [https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh](https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh) | sh I built rtk (Rust Token Killer), a CLI proxy that sits between Claude Code and your terminal commands.

![r/ClaudeAI - I saved 10M tokens (89%) on my Claude Code sessions with a CLI proxy](https://preview.redd.it/i-saved-10m-tokens-89-on-my-claude-code-sessions-with-a-cli-v0-aola04kci2jg1.gif?width=688&auto=webp&s=f5f1a266e6ed0a32ffb7081700961803d1c47e46)

---

## Comments

> **ClaudeAI-mod-bot** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50mcte/) · 1 points
> 
> **TL;DR generated automatically after 100 comments.**
> 
> Alright, let's break down this thread. The consensus is that OP's tool is a **fantastic idea and a potential game-changer for saving tokens** in Claude Code sessions. Many users are already trying it and reporting massive savings (over 90%).
> 
> However, there's a healthy debate about the potential downsides. The most upvoted concern is the **"strangeness tax"**: by changing the expected output of commands, the tool might confuse Claude, causing it to waste *more* tokens trying to understand the new format or even produce worse results. OP and supporters argue that since it's just removing "noise" from unstructured CLI output (not a rigid format like JSON), the risk is low.
> 
> Here are the other key takeaways:
> 
> - **Security:** Worried about it stealing your code? The tool is open source, so the community's advice is to review the code on GitHub yourself (or ask Claude to do it for you).
> - **Feature Requests:** Users are keen to see support for other tools and languages like `pytest` and `golang`, as well as better Windows integration.
> - **The Money Question:** The thread generally agrees that Anthropic would likely approve of this. Since most users are on fixed-price subscriptions, token efficiency reduces Anthropic's costs and improves performance for everyone, which is a win-win.
> - **Alternatives:** Some users pointed out you can get similar, albeit less powerful, results by using built-in command flags (`-q` for quiet) or simple `Makefile` scripts.

> **BrilliantArmadillo64** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50eht9/) · 24 points
> 
> How about tee-ing the full log to a file and printing a line at the end with a hint that this file can be opened to get the full output?  
> Claude Code often automatically does a `| tail` but then has to run the tests multiple times to get the actual failure info. I have an instruction in my [CLAUDE.md](http://claude.md/) to always tee into a file before applying any filters.  
> Having that baked in would be great!
> 
> > **RelativeSlip9778** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50i3qr/) · 3 points
> > 
> > [u/BrilliantArmadillo64](https://www.reddit.com/user/BrilliantArmadillo64/) like this one, will create an issue and try it ;)
> > 
> > **deegwaren** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o56roz9/) · 1 points
> > 
> > That's a clever idea! I'm gonna try it right away.

> **upvotes2doge** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zil9a/) · 46 points
> 
> Cool idea. How often have you found it’s been detrimental to The llm?
> 
> > **deadcoder0904** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o501o5f/) · 40 points
> > 
> > It is. See [https://www.humanlayer.dev/blog/context-efficient-backpressure](https://www.humanlayer.dev/blog/context-efficient-backpressure)
> > 
> > But recently I have seen models doing `| tail 50` so it only reads like last 50 lines anyways. Obviously doing it on our own is more good like OP as mentioned in the blog post as well.
> > 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zjhc7/) · 6 points
> > 
> > none it remove noise like a ls -al . claude can redo full command with an option.
> > 
> > \- rtk cargo test → 1 line
> > 
> > \- rtk proxy cargo test → full output if claude wants
> > 
> > > **pihkal** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zze0q/) · 32 points
> > > 
> > > Have you looked at whole-conversation usage, though?
> > > 
> > > I just saw a paper on TOON (which aims to do the same as rtk for JSON), and they found that even though TOON itself reduced the number of tokens, LLMs were less familiar with it, and thus spent even **more** tokens trying to decipher it, or making mistakes.
> > > 
> > > There's a strangeness tax with LLMs, and it can be substantial.
> > > 
> > > > **RelativeSlip9778** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50nafk/) · 4 points
> > > > 
> > > > Fair point, but there's a key difference here. TOON compresses JSON, a format LLMs know inside out. Changing its structure = real confusion.
> > > > 
> > > > CLI output is different. There's no "native" format for cargo test or git status that the model is trained on. It's just verbose text. RTK doesn't modify a known format, it removes noise. Less context pressure, fewer distractions, same information.
> > > > 
> > > > Would love to see that paper if you have the link.
> > > > 
> > > > > **pihkal** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o544mfy/) · 3 points
> > > > > 
> > > > > > RTK doesn't modify a known format, it removes noise
> > > > > 
> > > > > Look at the examples on its home page. rtk doesn't just remove noise, it definitely changes the output in some cases.
> > > > > 
> > > > > Regardless, even removing expected output might cause problems if an LLM is looking for it.
> > > > > 
> > > > > I can easily see an LLM wasting thinking tokens trying to understand a unique format, especially if rtk is used as a transparent hook.
> > > > > 
> > > > > E.g.:
> > > > > 
> > > > > > Hmmm, I ran `grep foo`, but I got something else. It looks relevant, but maybe the user aliased the grep command. I'll retry with /usr/bin/grep to be safe..."
> > > > > > 
> > > > > > That didn't work, perhaps I need to use the -XYZ flag...
> > > > > > 
> > > > > > That didn't work either, let me run `grep --help` to see what options it takes...
> > > > > 
> > > > > I don't know if this is an actual problem, but I think it easily could be.
> > > > > 
> > > > > ---
> > > > > 
> > > > > I searched my history, HN, and Lobsters, but ~~I can't find that TOON paper anywhere, sorry~~. Here's a non-academic link demoing someone's similar findings, though: [https://www.towardsdeeplearning.com/toon-benchmarks-a-critical-analysis-of-different-results-d2a74563adca](https://www.towardsdeeplearning.com/toon-benchmarks-a-critical-analysis-of-different-results-d2a74563adca)
> > > > > 
> > > > > EDIT: Found it!
> > > > > 
> > > > > See [https://arxiv.org/pdf/2602.05447](https://arxiv.org/pdf/2602.05447) , section 4.5, figures 6 and 7.
> > > > > 
> > > > > From the article:
> > > > > 
> > > > > > Unlike Markdown, where each grep hit simply returned more text, TOON's overhead was driven by a combination of output density and additional tool calls from pattern unfamiliarity
> > > > > 
> > > > > > **RelativeSlip9778** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5665ob/) · 1 points
> > > > > > 
> > > > > > Fair point on the format change. You're right that some RTK commands (grep, ls, read) do genuinely transform the output, not just strip noise. I won't pretend otherwise.
> > > > > > 
> > > > > > Two things worth knowing though :
> > > > > > 
> > > > > > \- Claude Code has built-in Read, Grep, and Glob tools, and its system prompt tells it to use those instead of bash grep/ls/cat. So the commands where RTK changes the format the most are the ones Claude Code doesn't run through Bash in practice. What actually goes through the hook day-to-day are git, cargo, test runners, and gh. For those, it's closer to noise removal: same recognizable format, just without ANSI codes, progress bars, and 200 lines of passing tests when only 2 failed.
> > > > > > 
> > > > > > \- On the retry loop scenario: I get the concern, but I haven't seen it in 5400+ tracked commands. The grep example specifically wouldn't happen because Claude Code uses its own Grep tool, not bash grep. For git/cargo output, the model still sees familiar text patterns, just less of it.
> > > > > > 
> > > > > > The TOON paper's "grep tax" (38% more tokens from pattern unfamiliarity) is real, but it applies to novel encodings with custom keywords the model has never seen. Compressed git output is still git output.
> > > > > > 
> > > > > > That said, you're raising the right question. More measurement would be better than assumptions. `rtk proxy <cmd>` is there as an escape hatch if anyone hits a case where the filtering causes confusion.
> > > > > > 
> > > > > > Thks for this !
> > > > > > 
> > > > > > > **pihkal** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5ao9w7/) · 1 points
> > > > > > > 
> > > > > > > I have definitely seen Claude use non-internal grep/cat/ls. In particular, it uses those frequently when it's constructing compound commands (e.g., `cat foo | awk ... | sort ...`), or when it's doing things over ssh (tbf, rtk won't work over ssh unless installed).
> > > > > > > 
> > > > > > > Good to know you don't see my constructed example in practice. I think we still have very bad intuitions for what models like (and the models keep changing so rapidly!) that's it's imperative with stuff like rtk/TOON to actually measure their global effects rather than assume it works.
> > > > 
> > > > > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5176bw/) · 1 points
> > > > > 
> > > > > that's right !
> > > > > 
> > > > > **vigorthroughrigor** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54hwjr/) · 1 points
> > > > > 
> > > > > Wow
> > > > > 
> > > > > **satansprinter** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5cb2c6/) · 1 points
> > > > > 
> > > > > I have been using toon for my mcp that gives back a lot of data, in different structures and it works flawlessly
> > > 
> > > > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o502xf5/) · 4 points
> > > > 
> > > > That’s a fair point. I'd be curious to see if those findings on TOON (JSON) translate to CLI outputs. For something like a `ls -al` on a large project, the sheer volume of redundant tokens is massive. Even if the model finds a 'cleaned' version slightly less familiar, wouldn't the massive reduction in noise/context pressure still result in a net gain for the conversation?  
> > > > do you have the research paper please ?
> > > > 
> > > > > **pihkal** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o545rwm/) · 1 points
> > > > > 
> > > > > Probably [https://arxiv.org/pdf/2602.05447](https://arxiv.org/pdf/2602.05447), see section 4.5, figures 6 and 7.
> > > > > 
> > > > > From the article:
> > > > > 
> > > > > > Unlike Markdown, where each grep hit simply returned more text, TOON's overhead was driven by a combination of output density and additional tool calls from pattern unfamiliarity
> > > > > 
> > > > > Here's a non-academic link demoing someone's similar findings: [https://www.towardsdeeplearning.com/toon-benchmarks-a-critical-analysis-of-different-results-d2a74563adca](https://www.towardsdeeplearning.com/toon-benchmarks-a-critical-analysis-of-different-results-d2a74563adca)
> > > > > 
> > > > > > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54syym/) · 1 points
> > > > > > 
> > > > > > is there some people to benchmark that ?
> > > > > > 
> > > > > > > **pihkal** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5amrui/) · 1 points
> > > > > > > 
> > > > > > > I'm not sure what you're asking. The second link shows benchmarks. (Mostly pulled from [https://www.improvingagents.com/blog/is-toon-good-for-table-data](https://www.improvingagents.com/blog/is-toon-good-for-table-data) iiuc)
> > > > > > > 
> > > > > > > > **patrick4urcloud** · [2026-02-15](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5hoztk/) · 1 points
> > > > > > > > 
> > > > > > > > no it's toon benchmark , w r working on shell command.
> > > 
> > > > **visarga** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o57rcvy/) · 1 points
> > > > 
> > > > I made a compression tool for LLMs, compress any tree or flat data into a fixed number of chars, and use range to navigate. But it would be meaningless to use under 30KB text, and for the rest better let claude use bash and python one liners, of course I am sorry but I realize even I would not use my own tool

> **t4a8945** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zgvz9/) · 28 points
> 
> The idea seems interesting. ~~Your post however is close to unreadable. Fix your formatting.~~
> 
> edit: formatting fixed. It was a wall of text before in a code wrapper, now it's good

> **BeerAndLove** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zk7wg/) · 6 points
> 
> Without looking at the code (on mobile), You proxy checks commands, and if it recognizes it, drops unnecessary bloat from the output, and proxies back to Claude Code? If that means we can add our own "filters" or "triggers" , for different use cases, it is a fantastic idea!
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zkkw2/) · 10 points
> > 
> > yes as you want. we added a discover command to see what take the most.
> > 
> > free, no saas, we do no see your token : just for the people :p
> > 
> > > **Alkanna** · [2026-02-21](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6kwdob/) · 1 points
> > > 
> > > Amen

> **nightmayz** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zrv1q/) · 6 points
> 
> Cool idea. I’ll give this a shot.
> 
> > **nightmayz** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5duthy/) · 2 points
> > 
> > 2 days later:
> > 
> > It’s amazing. I’ll always use this now.
> > 
> > > **TheHeretic** · [2026-02-25](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o7boedw/) · 2 points
> > > 
> > > Appreciate your follow up

> **digital-stoic** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50ae41/) · 6 points
> 
> \+ 1 here as happy user since just a few days.
> 
> `$ rtk gain`
> 
> `📊 RTK Token Savings`
> 
> `════════════════════════════════════════`
> 
> `Total commands: 1159`
> 
> `Input tokens: 1.7M`
> 
> `Output tokens: 122.1K`
> 
> `Tokens saved: 1.5M (92.7%)`
> 
> `Total exec time: 8m50s (avg 457ms)`
> 
> `By Command:`
> 
> `────────────────────────────────────────`
> 
> `Command Count Saved Avg% Time`
> 
> `rtk git diff --... 74 1.3M 81.5% 6ms`
> 
> `rtk grep 23 75.7K 14.8% 17.7s`
> 
> `rtk git diff 28 53.1K 58.1% 6ms`
> 
> `rtk git status 226 50.6K 62.2% 18ms`
> 
> `rtk ls 434 33.2K 62.9% 0ms`
> 
> `rtk git commit 81 16.7K 96.2% 11ms`
> 
> `rtk git diff ds... 1 6.8K 91.7% 3ms`
> 
> `rtk git diff ds... 1 6.8K 91.7% 3ms`
> 
> `rtk find 62 4.8K 30.4% 11ms`
> 
> `rtk git diff HE... 1 3.2K 73.6% 4ms`

> **JWPapi** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51c2bx/) · 6 points
> 
> Smart approach. Context window size directly affects output quality though - there's a tradeoff.
> 
> The tokens you send are the model's entire understanding of your problem. Compress too aggressively and you lose the signal that helps the model produce good output. The model pattern-matches to what you give it.
> 
> Still, 89% savings is impressive. Curious how you handle the cases where the extra context would have led to a better solution.

> **somerussianbear** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5300q5/) · 6 points
> 
> Been doing this for a long time but in a very simple way: Makefile with proper targets and AGENTS.md explaining how to do what:
> 
> build:
>     dotnet build --verbosity minimal # 10 lines output rather than 300
> 
> test:
>     # same thing for all commands, reduce verbosity, NOT --quiet
> 
> > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54t9iz/) · 1 points
> > 
> > great

> **Scruff3y** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o518tia/) · 4 points
> 
> Gah, hey, mate, this seems really cool but I have absolutely no idea what it does. Could be good to put a basic “how it works” section on your site so that people can reason about rather than just “magic token usage reduction”.
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51b4f2/) · 4 points
> > 
> > normaly the slideshow explain it > [https://www.rtk-ai.app/](https://www.rtk-ai.app/)  
> > it remove non essential token or duplicate token before sending it to llm.  
> > we should improve explaination ?
> > 
> > > **Scruff3y** · [2026-02-15](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5g32lm/) · 5 points
> > > 
> > > The problem is your site gives me absolutely no idea how to reason about the behaviour. This means that, if I'm using your tool and the agent does something I don't expect, it's really hard for me to figure out if it's because rtk removed some important context, or if it's some other problem. Does that make sense?
> > > 
> > > What \*you\* consider to be non-essential token usage might not be the same as what \*I\* consider non-essential token usage.
> > > 
> > > What would be super helpful is having a list of well-defined and not-abstract rules for the program's behaviour so that I know if it's going to work well for my use-cases or not (and the same for anyone else reading the site).

> **whats\_a\_monad** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50hwbg/) · 3 points
> 
> How is this any better than Claude just running cargo test -q?
> 
> Now it has to learn a wrapper instead of just using native flags that already do this

> **persibal** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50s2mn/) · 3 points
> 
> My EM may ask how do i know this is safe and will not steal/store creds. How can i tell?
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50wr74/) · 5 points
> > 
> > it's open source you can ask claude to review the code in term of security and post in issue for other people if there is a problem. we will fix it.  
> > if it's safe you can post SAFE here ! ;)
> > 
> > **RelativeSlip9778** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5172ak/) · 2 points
> > 
> > [u/persibal](https://www.reddit.com/user/persibal/) have a look at the commands /security-check and /security-audit on my cc guide (btw will open a post for this guide soon; pole [u/patrick4urcloud](https://www.reddit.com/user/patrick4urcloud/) )
> > 
> > [https://cc.bruniaux.com/security/](https://cc.bruniaux.com/security/)
> > 
> > **beskone** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50x8du/) · 1 points
> > 
> > Look at the source on Github....
> > 
> > > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o517a5g/) · 1 points
> > > 
> > > so ? good ?
> > > 
> > > > **beskone** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51b8jb/) · 1 points
> > > > 
> > > > I'll let them decide. I looked at it, then I started using it. Seriously good work friend, the token savings are kick ass.
> > > > 
> > > > > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51ewi3/) · 2 points
> > > > > 
> > > > > thank your welcome !
> > > > > 
> > > > > save your $$$ !
> > > > > 
> > > > > **Dull-Appointment-398** · [2026-02-26](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o7l3uis/) · 1 points
> > > > > 
> > > > > How has your performance faired?

> **ultrathink-art** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54bl6x/) · 3 points
> 
> The proxy approach is smart for cross-session deduplication. We took a different angle: tiered model usage based on task complexity.
> 
> Haiku for: file reads, simple edits, test runs, git operations. Costs 1/20th of Opus, completes 90% of tasks.
> 
> Sonnet for: multi-file refactors, new feature implementation, anything requiring reasoning about architecture.
> 
> Opus only for: security audits, complex debugging, tasks where getting it wrong costs more than the token spend.
> 
> The key is *not* leaving it to the AI to decide which model to use. Hard-code it per task type in your orchestration layer. We've seen 85%+ token cost reduction just from using Haiku for the grunt work and saving Opus for decisions that actually need it.
> 
> Your proxy is solving a different problem (repetitive context) but model tiering is complementary — combine both for max savings.
> 
> > **deegwaren** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o56sffa/) · 2 points
> > 
> > Doesn't the init cost (including the massive system prompt and your own Claude.MD) of a new session negate the profit of delegating those tasks to another model?
> > 
> > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54sjpl/) · 1 points
> > 
> > we tried a local llm also before release but the results were not as good.
> > 
> > **Super-Performance-44** · [2026-03-19](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/obb6iuj/) · 1 points
> > 
> > how did you set this up?

> **titomb345** · [2026-02-19](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6bp4ng/) · 3 points
> 
> This is impressive. I installed this earlier today and have been using it throughout my working day, and the vitest savings alone are going to be a godsend!
> 
>   ⎿  PASS (199) FAIL (0)\`\`\`
> 
> Reducing the entire output from 199 tests into a single line \*chef's kiss\* bravo and I owe you a beer!
> 
> > **patrick4urcloud** · [2026-02-25](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o7almj9/) · 1 points
> > 
> > y r welcome -> [https://ko-fi.com/patrickszymkowiak](https://ko-fi.com/patrickszymkowiak)  
> > got no tips :'(

> **Impressive-Sir9633** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zk258/) · 2 points
> 
> Great idea! When I pass logs directly, I have to keep compacting.

> **LocalFatBoi** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o539bc6/) · 2 points
> 
> good stuff, giving it a try RemindMe! 1 week
> 
> > **RemindMeBot** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o539fvi/) · 2 points
> > 
> > I will be messaging you in 7 days on [**2026-02-20 01:48:38 UTC**](http://www.wolframalpha.com/input/?i=2026-02-20%2001:48:38%20UTC%20To%20Local%20Time) to remind you of [**this link**](https://www.reddit.com/r/ClaudeAI/comments/1r2tt7q/i_saved_10m_tokens_89_on_my_claude_code_sessions/o539bc6/?context=3)
> > 
> > [**CLICK THIS LINK**](https://www.reddit.com/message/compose/?to=RemindMeBot&subject=Reminder&message=%5Bhttps%3A%2F%2Fwww.reddit.com%2Fr%2FClaudeAI%2Fcomments%2F1r2tt7q%2Fi_saved_10m_tokens_89_on_my_claude_code_sessions%2Fo539bc6%2F%5D%0A%0ARemindMe%21%202026-02-20%2001%3A48%3A38%20UTC) to send a PM to also be reminded and to reduce spam.
> > 
> > <sup>Parent commenter can </sup> [<sup>delete this message to hide from others.</sup>](https://www.reddit.com/message/compose/?to=RemindMeBot&subject=Delete%20Comment&message=Delete%21%201r2tt7q)
> > 
> > ---
> > 
> > | [<sup>Info</sup>](https://www.reddit.com/r/RemindMeBot/comments/e1bko7/remindmebot_info_v21/) | [<sup>Custom</sup>](https://www.reddit.com/message/compose/?to=RemindMeBot&subject=Reminder&message=%5BLink%20or%20message%20inside%20square%20brackets%5D%0A%0ARemindMe%21%20Time%20period%20here) | [<sup>Your Reminders</sup>](https://www.reddit.com/message/compose/?to=RemindMeBot&subject=List%20Of%20Reminders&message=MyReminders%21) | [<sup>Feedback</sup>](https://www.reddit.com/message/compose/?to=Watchful1&subject=RemindMeBot%20Feedback) |
> > | --- | --- | --- | --- |
> > |  |
> > 
> > **LocalFatBoi** · [2026-02-20](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6dfhfq/) · 1 points
> > 
> > nice it did what its supposed to do and turns out i didnt need the lengthy output after all

> **TheDecipherist** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5470fn/) · 2 points
> 
> **Guys be careful here.**
> 
> This is a fundamental misunderstanding of how hooks work.
> 
> **Hooks are a** ***request***\*\*, not a guarantee.\*\*
> 
> Claude is an autonomous agent, it decides what tools to call, when to call them, and in what order.
> 
> A `PreToolUse` hook says "hey, before you run bash, run this script first."
> 
> But Claude can:
> 
> - Skip the hook entirely if it decides to use a different tool path
> - Chain multiple operations where the hook only catches the first one
> - Use internal reasoning to make decisions before any tool call happens
> - Decide the rewritten output doesn't make sense and run the original command anyway
> - Call tools in ways the hook pattern matcher doesn't anticipate
> 
> The `"matcher": "Bash"` in his config only catches Bash tool calls. What about when Claude uses other tools? What about when Claude reads files through its own context rather than cat? What about when Claude makes decisions based on what it *remembers* from earlier in the session rather than running a new command?
> 
> People are treating Claude Code like a dumb CLI wrapper where every action goes through a predictable pipeline. It's not. It's an autonomous agent that *happens* to use CLI tools sometimes. The hooks are sitting at one narrow chokepoint in a system that has multiple paths to every decision.
> 
> And the worst case scenario is intermittent, the hook catches *some* calls and misses others. So Claude gets full context for some operations and truncated context for others. Now it's making decisions based on an inconsistent picture of your codebase. That's worse than either full context or consistently reduced context.
> 
> But I guess more for [RuleCatch.AI](https://rulecatch.ai/?utm_source=reddit&utm_medium=comment&utm_campaign=rtk&utm_content=res) to handle :)

> **pitdk** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o55rzfd/) · 2 points
> 
> thanks man, great tool. Had some initial challenges setting up the hook. I had three other PreToolUse hooks and had to remove the other two. Now with rtk as the sole pre tool hook it works like a charm, kudos
> 
> > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o55u81y/) · 1 points
> > 
> > thanks !

> **OpenClawJourney** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5btbad/) · 2 points
> 
> This is exactly the kind of tooling the Claude Code ecosystem needs. The 89% token reduction is impressive, but what I find more interesting is the architectural decision to do this at the CLI level rather than as a VSCode extension or Claude Code plugin.
> 
> A few thoughts:
> 
> 1. \*\*Cumulative benefits\*\*: Token savings compound when you consider context window limits. Fewer tokens per command = more commands before you hit the wall = longer productive sessions.
> 2. \*\*The "quiet flag" argument misses the point\*\*: Yes, \`-q\` exists for some tools, but (a) not all tools support it, (b) you have to remember to use it, and (c) you'd need to teach Claude to use it consistently. Having a proxy that handles this automatically is cleaner.
> 3. \*\*Potential improvement\*\*: Have you considered adding a "verbose mode" flag for when Claude explicitly asks for full output? Sometimes the full stack trace is exactly what's needed for debugging.
> 
> The Rust choice makes sense for a proxy that needs to be fast and handle output streams efficiently. Will definitely try this in my workflow.
> 
> > **patrick4urcloud** · [2026-02-15](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5howq1/) · 1 points
> > 
> > we already discuss of a --proxy for full text command.

> **VincentRG** · [2026-02-14](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5en9ix/) · 2 points
> 
> i'm using opus 4.6, haven't noticed any particular issues
> 
> so far:
> 
> ` RTK Token Savings`  
> `════════════════════════════════════════`
> 
> `Total commands:    43`  
> `Input tokens:      17.3K`  
> `Output tokens:     5.7K`  
> `Tokens saved:      11.6K (67.2%)`  
> `Total exec time:   553ms (avg 12ms)`
> 
> `By Command:`  
> `────────────────────────────────────────`  
> `Command               Count      Saved     Avg%     Time`  
> `rtk git diff              4       6.2K    51.2%     10ms`  
> `rtk curl -o- ht...        1       4.0K    95.7%    206ms`  
> `rtk ls                    6        744    65.7%      1ms`  
> `rtk git show 19...        1        363    36.2%     31ms`  
> `rtk git status            5        238    57.7%     10ms`  
> `rtk git branch            1        128    30.4%      1ms`  
> `rtk git log --o...        5          3     0.7%      2ms`  
> `rtk git log --o...        1          1     0.6%      4ms`  
> `rtk git diff TODO         1          1   100.0%      3ms`  
> `rtk git show 19...        1          0     0.0%      7ms`

> **Fluent\_Press2050** · [2026-02-20](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6gxfhq/) · 2 points
> 
> This is pretty cool. I just started using it and its definitely help keep my usage a bit lower than normal.
> 
> **RTK Token Savings (Global Scope)**
> 
> ════════════════════════════════════════════════════════════
> 
> Total commands:    79
> 
> Input tokens:      916.5K
> 
> Output tokens:     156.7K
> 
> Tokens saved:      759.9K (82.9%)
> 
> Total exec time:   9.8s (avg 124ms)
> 
> Efficiency meter: ████████████████████░░░░ **82.9%**
> 
> > **Alkanna** · [2026-02-21](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6kz8l0/) · 1 points
> > 
> > I'm pretty sure these numbers are heavily inflated. CC will usually do a tail on known big output commands and RTK is comparing against raw output size.
> > 
> > > **Fluent\_Press2050** · [2026-02-21](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o6mf5n8/) · 1 points
> > > 
> > > it depends on the task you are doing. For me it’s a lot of git and curl so it’s helping me save tokens this week. Next week it may not help much based on what I need. It’s still nice that it’s saving me tokens and allowing me to work longer. 

> **patrick4urcloud** · [2026-02-25](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o7b514i/) · 2 points
> 
> hi , if you love rtk please buy my a coffee :) to work on next idea and support my work !  
> [ko-fi.com/patrickszymkowiak](http://ko-fi.com/patrickszymkowiak)

> **2053\_Traveler** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4ztm3c/) · 4 points
> 
> It’s often not noise, though. Anthropic has a very strong financial incentive to make their own tool token efficient.
> 
> > **NationalGate8066** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50fb4p/) · 3 points
> > 
> > Yea, I can totally see this argument, as well. Also, sometimes commands like 'ls' can reveal important info, such as when a file was last modified. But I will nevertheless try out this utility.
> > 
> > **gunsofbrixton** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50as8e/) · 2 points
> > 
> > Isn't the opposite true?
> > 
> > > **EarEquivalent3929** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50mrxp/) · 5 points
> > > 
> > > The more tokens are burned the more it costs anthropic to run and the more resources it uses. 
> > > 
> > > Less resources = more room for more subscribers & faster responses & less quantization needed 
> > > 
> > > Anthropic will always be maxing out their resources but they'll also be service better output.  More subscribers also means more money because a certain percentage of subscribers never use their whole plan limits. And a certain number of subscribers will cancel if performance is bad.
> > > 
> > > **2053\_Traveler** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50vmyz/) · 2 points
> > > 
> > > No? they don’t make money per token overall because there are many users paying fixed rates. They absolutely stand to gain most from making the product efficient. Also more tokens = more latency, and first token latency and total throughput are metrics that matter and affect user decision making…
> > > 
> > > Plus the supply is fixed so ideally for them they sell smaller chunks to more subscribers.
> > > 
> > > Also more subscribers means more data to train their models with.

> **ramonbastos\_memelord** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zb56h/) · 3 points
> 
> Wow, and thats it? There is no downside? Looks pretty cool

> **Xavier\_Caffrey\_GTM** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zflzs/) · 3 points
> 
> this is legit. the token burn from verbose test output is the most annoying part of claude code sessions. does the hook integration work with claude code'sthis is legit. the token burn from verbose test output is the most annoying part of claude code sessions. does the hook integration work with claude code's built-in hooks system or is it a separate thing?
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zis6p/) · 2 points
> > 
> > it work with the hook directly.
> > 
> > Bash(rtk cargo test 2>&1)
> > 
> > ⎿  ✓ test result: ok. 262 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.09s
> > 
> > > **m0j0m0j** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50a8rt/) · 1 points
> > > 
> > > How does it work though?
> 
> > **elmahk** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50e0cj/) · 2 points
> > 
> > Usually Claude does something like tail 30 for tests output though.
> > 
> > **Downtown-Pear-6509** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zk4rw/) · 1 points
> > 
> > i always make a little python test runner that only reports failures and pass/fail counts

> **AutoModerator** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zhhwy/) · 1 points
> 
> Your post will be reviewed shortly. (This is normal)
> 
> *I am a bot, and this action was performed automatically. Please* [*contact the moderators of this subreddit*](https://www.reddit.com/message/compose/?to=/r/ClaudeAI) *if you have any questions or concerns.*

> **MeButItsRandom** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zkp50/) · 1 points
> 
> I use a hack script to run test suites with parsed output and in failfast patterns for the same reason. Do you have any plans to extend rtk to common test suites in other languages, such as pytest?
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zlgq7/) · 1 points
> > 
> > yes we can . write an issue please with a good describe text.

> **rookan** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zkync/) · 1 points
> 
> Seems like a useful addon. Does it work on Windows 10? I do some C# development
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o4zl9j5/) · 1 points
> > 
> > good question normaly yes . do an issue if not.
> > 
> > **RelativeSlip9778** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5074nq/) · 1 points
> > 
> > Interested to know. If not will fix it

> **OpenClawJourney** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50e0lk/) · 1 points
> 
> Solid approach. Context management is the hidden cost killer with Claude Code sessions.
> 
> Question: Does rtk handle the case where you need full context for debugging but want minimal context for quick iterations? I've been manually managing this by splitting sessions, but a proxy that automatically compresses based on task type would be a game changer.
> 
> Also curious about the caching mechanism - is it just deduping repeated content or something smarter like semantic similarity?
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50ewyq/) · 1 points
> > 
> > I think it's more an other experimental project from me ICM ( memory context compress multi session )
> > 
> > [https://github.com/rtk-ai/icm](https://github.com/rtk-ai/icm)  
> > Mp me if not correct :p
> > 
> > RTK is more for removing non essential token ( like redonnant , different from project )
> > 
> > The best example are ls -al or cargo test. ( bun install , ... )

> **bironsecret** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50qmou/) · 1 points
> 
> How about prompting claude to not include this into it's context by itself? It already does this in cursor by using greps and tail/head commands

> **No\_Maintenance\_432** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50rayd/) · 1 points
> 
> Noice
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o50y9gr/) · 1 points
> > 
> > thanks

> **crawlerWeed** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o5161ac/) · 1 points
> 
> Gold mine, thx for this!

> **djvdorp** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51aw1n/) · 1 points
> 
> How specific is this to Claude Code, or could I also set this up with the Codex, Copilot and  OpenCode CLI?
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51bnmy/) · 1 points
> > 
> > it's build for claude code . we are testing it on more ai ide.
> > 
> > basicly you can download the bin and say to your llm to use it for shell commande . explain to run rtk --help . he should understand and use it.
> > 
> > we will certainly release a rtk init we other llm.
> > 
> > you can add an issue.

> **mysterymanOO7** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o51gu8h/) · 1 points
> 
> I have red about this approach somewhere, can't remember the exact article, while studying about the skills and similar approach was used to reduce the data input to LLM.

> **Financial\_Tailor7944** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o522hke/) · 1 points
> 
> Bad idea with capital letters. More noise = better signal(output). AI is a computational engine.

> **Ok\_Animal\_2709** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o529ssc/) · 1 points
> 
> If you are using API usage you're saving somewhere around $30-50 for a two week period for 10M input tokens. Depending on what model you use.
> 
> > **patrick4urcloud** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o52i7fp/) · 1 points
> > 
> > there is a command on rtk gain to estimate that. for me:
> > 
> > Tokens saved (lifetime): 10.3M
> > 
> > Quota preserved: 8.6%
> > 
> > > **Ok\_Animal\_2709** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o52ioar/) · 1 points
> > > 
> > > I was estimating cost based on current API input token cost

> **l\_eo\_** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o52q9c1/) · 1 points
> 
> Great stuff, [u/patrick4urcloud](https://www.reddit.com/user/patrick4urcloud/) !
> 
> Should also mean a speed up and less context window compacts?
> 
> Might be worth measuring.
> 
> Cheers for the work and for making it available!
> 
> > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54toy0/) · 2 points
> > 
> > no for context and memory it's another tool we are working on : [https://github.com/rtk-ai/icm](https://github.com/rtk-ai/icm)

> **BayIsLife** · [2026-02-12](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o52qnxm/) · 1 points
> 
> Not sure it’s exactly related - but I’ve been planning with Claude for a few days to spin up custom MCP services to reduce the need for Claude to figure things out / I don’t “love” giving bash access. I’m a C# dev and it would be amazing if my C# related commands could be handled by a tokenless deterministic system ie Roslyn / a service that knows exactly how to run/read dotnet test etc.
> 
> > **patrick4urcloud** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o54ts65/) · 1 points
> > 
> > we only remove noise redonndant token. please make an issue to review it.

> **SqlJames** · [2026-02-13](https://reddit.com/r/ClaudeAI/comments/1r2tt7q/comment/o52r7qx/) · 1 points
> 
> Is there something like this for golang?