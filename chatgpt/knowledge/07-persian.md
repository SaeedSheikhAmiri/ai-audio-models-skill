# Persian (Farsi) reference

Persian is a second-tier language for most audio models: supported, but rarely at English-level quality. Set expectations accordingly and always test on the user's own vocabulary.

## ASR

| Option | Quality | Cost | Notes |
|---|---|---|---|
| Whisper large-v3 / turbo | Good (~10–15% WER on clean speech; worse on casual/noisy) | $0.006/min (API) or self-host | Best open baseline; robust to noise |
| Azure Speech (fa-IR) | Good on formal/news speech | ~$0.017/min | Official support; SSML; diarization |
| Google Chirp 3 (fa-IR) | Good on formal speech | ~$0.016/min | Official support |
| Speechmatics | Decent | ~$0.002–0.004/min | Supports Persian; strong on accents |
| Vosk fa | Weak–moderate | Free | Light, offline, CPU |
| MMS (fa) | Weak | Free | Coverage, not quality |
| NVIDIA NeMo Persian | Good if fine-tuned | Self-host | Requires labeled data |

### Common failure modes

- **Digits:** spoken numbers vs. digits, and Persian vs. Latin numerals in output.
- **Half-space (the zero-width non-joiner, U+200C):** a prefixed verb such as *mi-ravam* may come out as one solid word (*miravam*) or as two separated words (*mi ravam*). All three variants are the same phrase to a human and different strings to your pipeline.
- **Letter variants:** Arabic yeh/kaf (U+064A, U+0643) versus Persian yeh/keheh (U+06CC, U+06A9); alef with madda (U+0622). Normalize before comparing transcripts.
- **Proper nouns and acronyms** — the dominant error source in technical or news content.
- **Code-switching** — Persian sentences with English technical terms degrade quickly.

### Recommended pipeline

1. Whisper large-v3-turbo for draft transcription.
2. Normalization layer: unify the two yeh and kaf forms, repair half-spaces, convert digits consistently.
3. Domain lexicon for names and acronyms.
4. Human review on a sample; measure WER per domain, not overall.
5. If WER is still too high, fine-tune Whisper on 10–50 hours of labeled in-domain audio.

## TTS

| Option | Quality | Cost | Notes |
|---|---|---|---|
| Azure Neural (fa-IR) | Good, stable | ~$15/1M chars | Official voices; SSML; custom neural voice available |
| Google Chirp 3 (fa-IR) | Good | ~$30/1M chars | Official support |
| Amazon Polly | Moderate | $4–30/1M | Limited Persian voice quality |
| ElevenLabs multilingual | Moderate–good; test pronunciation | $0.06–0.24/1k chars | Not Persian-specialized; verify names and numbers |
| Piper fa_IR | Moderate, robotic | Free | Fast, offline, edge-friendly |
| Community VITS/Coqui on ManaTTS | Variable | Free | Quality depends on data and training time |

### Persian text normalization for TTS

- Expand numbers, dates, currencies, and abbreviations before synthesis.
- Handle ezafe (the unstressed *-e* linking vowel) where it changes pronunciation — most models do not infer it.
- Provide a pronunciation lexicon for proper nouns.
- Watch half-space handling: it affects both pronunciation and timing.
- Test sentence-final intonation; many multilingual models flatten it.

## Datasets and resources

- **ManaTTS** — Persian TTS corpus, commonly used for community models.
- **Common Voice (fa)** — read speech, useful for ASR fine-tuning.
- **Persian speech corpora** on Hugging Face and OpenSLR — quality varies; check licensing.
- **ParsBERT-style normalization** rules are useful even outside BERT pipelines.

## What to tell users

- No open multilingual model at the current state of the art covers Persian at English-level quality.
- For production Persian, a fine-tuned open model plus a pronunciation dictionary is more realistic than expecting a general model to work out of the box.
- Budget for evaluation: 50–200 real samples across the domains you care about (news, casual, technical, telephony).
