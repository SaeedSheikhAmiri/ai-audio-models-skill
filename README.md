<div dir="rtl" align="right">

# AI Audio Models — Skill

یک بستهٔ دانش آماده برای **Claude** و **ChatGPT** که به مدل کمک می‌کند دربارهٔ انتخاب، قیمت، مجوز و مقایسهٔ مدل‌های صوتی هوش مصنوعی پاسخ درست بدهد: TTS، ASR، کلونینگ صدا، موسیقی، افکت صدا، آواز، مدل‌های Omni و پردازش سیگنال.

مبتنی بر گزارش دوزبانهٔ [نقشهٔ جامع مدل‌های صوتی](https://saeedsheikhamiri.github.io/audio-ai-models-report/) — ۸ دسته، ۱۹ جدول مقایسه و بیش از ۲۰۰ مدل.

</div>

---

## What's inside

| Path | Purpose |
|---|---|
| `SKILL.md` | Claude Agent Skill: workflow, decision matrix, guardrails |
| `references/*.md` | Deep reference loaded on demand (7 files) |
| `chatgpt/instructions.md` | Ready-to-paste Custom GPT instructions (under 8,000 chars) |
| `chatgpt/knowledge/*.md` | Files to upload as Custom GPT knowledge |
| `scripts/package.sh` | Builds `ai-audio-models-skill.zip` for Claude upload |

## Install in Claude

**Claude Code (recommended)**

```bash
mkdir -p ~/.claude/skills
cp -R ai-audio-models-skill ~/.claude/skills/ai-audio-models
```

Or project-scoped: copy the folder to `.claude/skills/ai-audio-models/` inside your repository.

**Claude.ai (Skills upload)**

```bash
./scripts/package.sh          # produces dist/ai-audio-models-skill.zip
```

Then: Settings → Capabilities → Skills → Upload, and select the zip. The archive must contain `SKILL.md` at its root.

**Claude API** — upload the same zip as a skill and attach it to the request.

## Install in ChatGPT

ChatGPT has no skill format, so the equivalent is a Custom GPT:

1. Create a new GPT → **Configure**.
2. Paste the contents of `chatgpt/instructions.md` into **Instructions**.
3. Upload every file from `chatgpt/knowledge/` under **Knowledge**.
4. Turn off web browsing if you want answers grounded only in the files; leave it on if you want live price checks — but instruct the model to date-stamp prices either way.
5. Save and test with the prompts below.

A **Project** works too: same instructions in the project's custom instructions, same files attached.

## Test prompts

Run these to check the skill is actually working. A good answer is short, gives one primary recommendation, shows the cost math, and flags the license.

- "I need a Persian audiobook narrator for 20 hours of text. What should I use and what will it cost?"
- "We're building a phone agent for English. Latency must stay under 300 ms. Which STT and TTS?"
- "Can I use Suno output in a commercial YouTube ad?"
- "We transcribe 800 hours a month. Should we self-host Whisper or pay an API?"
- "Clone my voice from a 30-second sample — which open model, and what are the legal constraints?"
- "Which model gives the best stem separation for remixing, and what does it cost to run?"

## Design notes

- **Progressive disclosure.** `SKILL.md` is deliberately short; the heavy tables live in `references/` so they only load when needed.
- **Prices are dated.** Every file states the month. The skill instructs the model to treat numbers as estimates and to verify.
- **License-first.** The most common expensive mistake is recommending a non-commercial weight for a commercial product, so licensing is a mandatory step, not an appendix.
- **Persian is first-class.** A dedicated reference covers WER expectations, normalization pitfalls, and the open-model gap.

## Updating

Prices and model versions move monthly. To refresh:

1. Edit the relevant file under `references/`.
2. Copy it to `chatgpt/knowledge/` with the same numbered name.
3. Bump the date in `SKILL.md` and `chatgpt/instructions.md`.
4. Run `./scripts/package.sh` and re-upload the zip.

## License

Content licensed under **CC BY 4.0** — use it, adapt it, just credit *Saeed Sheikh Amiri* and link back. See [LICENSE](LICENSE).

## Author

**Saeed Sheikh Amiri** · November 2026

- Report: <https://saeedsheikhamiri.github.io/audio-ai-models-report/>
- Repository: <https://github.com/SaeedSheikhAmiri/ai-audio-models-skill>
