---
name: ai-audio-models
description: Guidance for choosing, pricing, licensing, and comparing AI audio models across TTS, ASR, voice conversion, music generation, sound effects, singing synthesis, audio LLMs, and audio restoration. Use when a user asks which audio model or API to use, what it costs at their volume, whether a license allows commercial use, or how to assemble a speech/audio pipeline.
---

# AI Audio Models

A decision aid for the AI audio stack. It does not replace vendor documentation — it narrows a very noisy market to a defensible shortlist, then helps the user verify it.

## When to use this skill

Load this when the user asks things like:

- "Which TTS should I use for an audiobook in Persian?"
- "Is Suno's output safe to use commercially?"
- "How much does 500 hours of transcription cost per month?"
- "Do I need an ASR API or can I self-host Whisper?"
- "Which model can clone a voice with 30 seconds of audio?"
- "We need a voice agent under 300 ms — what's the stack?"

Do **not** use it for general audio engineering (mixing, mastering, DSP theory) or for building model architectures from scratch.

## Workflow

Run these steps in order. Do not skip step 1 — most bad recommendations come from answering before knowing the constraints.

### 1. Establish the constraints

Ask only what you cannot infer. The five that change the answer:

1. **Language(s)** — and whether quality in each one is a hard requirement.
2. **Volume** — hours of audio or characters per month (drives cloud-vs-self-host).
3. **Latency** — real-time conversation (<300 ms), near-real-time, or batch.
4. **Deployment** — cloud API allowed, or must run on-prem/offline (voice is biometric data).
5. **Commercial intent** — decides which licenses are even eligible.

Also useful: budget ceiling, whether voice cloning is required, and whether output length exceeds a minute.

### 2. Shortlist by category

Use the quick matrix below, then open the matching reference file for the full table, pricing, and trade-offs.

| Need | Start with | Credible alternative |
|---|---|---|
| Real-time voice agent TTS | Cartesia Sonic-3, Deepgram Aura-2, ElevenLabs Flash | CosyVoice-2/3, Orpheus (self-host) |
| Highest-quality TTS | ElevenLabs v3, Hume Octave | Higgs Audio v2, IndexTTS-2 (open) |
| Cheapest good TTS | Kokoro-82M (self-host), OpenAI tts-1 | Piper, Azure Neural |
| Persian TTS | Azure Neural (fa-IR), Google Chirp 3 | Piper fa_IR, community VITS/Coqui |
| English ASR accuracy | Deepgram Nova-3, AssemblyAI Universal-3, ElevenLabs Scribe v2 | Canary-Qwen-2.5B, Parakeet-TDT (open) |
| Bulk cheap ASR | Whisper large-v3-turbo (self-host) | Soniox, Gladia |
| Persian ASR | Whisper large-v3 + human review, Azure fa-IR | Google fa-IR, Speechmatics |
| Full songs with vocals | Suno v5, Udio | ACE-Step, YuE (open) |
| Commercial-safe music | Adobe Firefly, Stable Audio, ElevenLabs Music | ACE-Step with licensed data |
| Sound effects | ElevenLabs SFX v2 | TangoFlux, Woosh, Stable Audio Open |
| Video Foley | MMAudio, HunyuanVideo-Foley | Kling/Runway Foley |
| Voice cloning | RVC (train), Seed-VC (zero-shot) | ElevenLabs, OpenVoice v2 |
| Singing | Synthesizer V (studio), Suno (fast) | DiffSinger, RVC on vocals |
| Audio understanding | GPT-4o/5 audio, Gemini | Qwen3-Omni, Kimi-Audio (open) |
| Stem separation | BS-RoFormer, Demucs v4 | UVR5 |
| Noise suppression | DeepFilterNet3, RNNoise | Krisp |

### 3. Do the cost math explicitly

Never answer "it depends on volume" without computing it. Use these anchors:

- **1 hour of speech ≈ 90,000 characters.**
- TTS: `cost per hour = (price per 1M chars / 1,000,000) × 90,000`.
  - $15/1M ≈ **$1.35 per audio hour**; $30/1M ≈ **$2.70**; $60–240/1M ≈ **$5–22**.
- ASR: `cost per hour = price per minute × 60`.
  - $0.0043/min ≈ **$0.26/hr**; $0.02/min ≈ **$1.20/hr**.
- Self-host: one L4-class GPU transcribes Whisper large-v3-turbo at ~30–60× real time → **$0.01–0.04 per audio hour**, plus engineering time.
- **Break-even:** roughly 300–500 hours/month. Below it, APIs usually win; above it, dedicated GPUs do.
- Add 10–30% for retries, regeneration, and egress.

If the user gives a monthly volume, show the total for two or three options side by side.

### 4. Check the license before recommending

The most common expensive mistake is recommending a model that cannot be used commercially.

- **Apache 2.0 / MIT / BSD / CC-BY 4.0** → commercial use generally fine with attribution.
- **CC-BY-NC** → non-commercial only. This includes several popular TTS and music weights.
- **Stability Community License** → commercial allowed below a revenue threshold.
- **Custom/community licenses** (Llama-style, CPML) → read the terms; often restricted.
- **Proprietary cloud** → governed by the vendor contract, not an open license.

Critical rule: **the license on the code repository is not the license on the weights.** Example: F5-TTS has MIT code and CC-BY-NC weights; Fish Speech has open code and non-commercial weights. Always check the model card on Hugging Face, not just GitHub.

### 5. Flag the risks that actually bite

- **Voice cloning without consent** — legal exposure under the EU AI Act and several US states; require consent, logging, and disclosure.
- **Music copyright** — models trained on protected catalogues carry risk even when the vendor offers indemnity; ask what data was licensed.
- **Biometric data** — voice is sensitive personal data under GDPR/CCPA; on-prem may be mandatory in health, finance, and public sector.
- **Version drift** — cloud models change silently; pin versions or cache outputs for reproducible production.
- **Benchmark trap** — public WER/MOS numbers are usually English read speech. Always recommend a 50–200 sample test set from the user's own domain.

### 6. Answer in a fixed shape

Produce, in this order:

1. **Recommendation** — one primary pick and one fallback, in one sentence.
2. **Why** — three bullets tied to the user's constraints, not generic praise.
3. **Cost at their volume** — a small table with the arithmetic shown.
4. **License/risk note** — one or two lines, specific to the chosen model.
5. **What to verify** — the exact benchmark or vendor page to check before committing.

Keep it under ~400 words unless the user asks for depth. Offer the full comparison as a follow-up rather than dumping it.

## Reference files

Open only what the question needs — these are detailed and would waste context if loaded wholesale.

| File | Contents |
|---|---|
| `references/tts.md` | Commercial and open TTS, latency, cloning, pricing, Persian options |
| `references/asr.md` | Commercial and open ASR, WER, streaming, diarization, pricing |
| `references/music-sfx.md` | Music generation, sound effects, Foley, licensing of output |
| `references/voice-and-singing.md` | Voice conversion, cloning ethics, singing synthesis |
| `references/understanding-and-processing.md` | Audio LLMs, separation, denoising, restoration, super-resolution |
| `references/pricing-licensing.md` | Unit economics, TCO, license matrix, procurement checklist |
| `references/persian.md` | Persian-specific ASR/TTS status, datasets, normalization pitfalls |

## Guardrails

- **Date-stamp prices.** State the month the figures reflect and tell the user to confirm on the vendor page. Never present an estimate as a quote.
- **Do not fabricate model names or capabilities.** If unsure whether a model exists or supports a language, say so and point to the leaderboard.
- **Do not help with impersonation.** Refuse voice cloning of a real person without consent, and refuse content designed to deceive.
- **Distinguish "open weights" from "open source."** Many models release weights but not training code or data.
- **Prefer the boring answer.** For most teams, a managed API plus a small evaluation set beats a self-hosted model they cannot maintain.

## Source of record

This skill condenses a longer bilingual report with 19 comparison tables and 200+ models: <https://saeedsheikhamiri.github.io/audio-ai-models-report/>. When the user needs the full landscape, cite that instead of expanding everything here.
