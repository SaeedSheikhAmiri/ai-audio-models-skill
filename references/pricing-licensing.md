# Pricing, TCO, and licensing reference

## Unit economics

| Work | Unit | Cloud range | Per hour equivalent |
|---|---|---|---|
| Cheap TTS | 1M chars | $4–16 | $0.40–1.50 |
| Mid TTS | 1M chars | $15–30 | $1.40–2.70 |
| Premium TTS | 1M chars | $60–240 | $5–22 |
| Cheap ASR | minute | $0.001–0.002 | $0.06–0.12 |
| Mid ASR | minute | $0.0025–0.005 | $0.15–0.30 |
| Premium ASR | minute | $0.016–0.02 | $0.96–1.20 |
| Music API | minute | $0.02–0.1 | $1.20–6 |

Anchors: 1 hour of speech ≈ 90,000 characters; 1 hour of audio = 60 minutes. Never compare the two units directly.

## Self-host TCO

| Item | Approximate cost |
|---|---|
| Cloud GPU L4/A10G | $0.5–1.2 / hour |
| Cloud GPU A100/H100 | $2–4 / hour |
| RTX 4090 (rented) | $0.3–0.7 / hour |
| Dedicated GPU server | $300–1,500 / month |
| Maintenance | 15–30% of infrastructure |

Whisper large-v3-turbo on an L4: ~30–60× real time → $0.01–0.04 per audio hour. Break-even versus APIs: roughly **300–500 hours/month**, and only if you already have engineering capacity.

## Hidden costs

- Egress and storage for large audio catalogues.
- Regeneration from TTS errors, ASR retries, and failed generations.
- Version drift: outputs change when the vendor updates the model; pin or cache.
- Compliance work for biometric data (DPIA, retention, access controls).
- Integration: streaming, retries, fallbacks, and observability are real engineering.

## License matrix

| License | Commercial | Modify | Attribution | Examples |
|---|---|---|---|---|
| Apache 2.0 | Yes | Yes | Yes (NOTICE) | Kokoro, CosyVoice, Dia, Orpheus, Qwen3-Omni |
| MIT | Yes | Yes | Yes | Whisper, Piper, Chatterbox, Demucs, RVC |
| BSD | Yes | Yes | Yes | RNNoise |
| CC-BY 4.0 | Yes | Yes | Yes | Moshi, Parakeet/Canary |
| CC-BY-NC | No | Yes | Yes | MusicGen weights, F5-TTS weights, YuE weights |
| Stability Community | Yes below $1M revenue | Yes | Yes | Stable Audio Open |
| Llama/community proprietary | Conditional | Conditional | — | Some Meta/Microsoft models |
| CPML (Coqui) | No | Yes | — | XTTS-v2 |
| AGPL | Yes, with service source obligation | Yes | Yes | so-vits-svc |
| Proprietary cloud | Per contract | No | — | ElevenLabs, Suno, Deepgram |

## Procurement checklist

- [ ] License applies to **weights**, not just the repo.
- [ ] Commercial use explicitly permitted for your entity size.
- [ ] Output ownership and indemnity stated in writing.
- [ ] Data residency and retention acceptable for voice data.
- [ ] SLA, rate limits, and overage pricing documented.
- [ ] Version pinning or output caching available.
- [ ] Exit path: can you export models, voices, and generated assets?
- [ ] Benchmark on 50–200 of your own samples before signing.

## Red flags in vendor terms

- "Commercial use" that excludes broadcast, sync, or Content ID.
- Indemnity limited to the amount you paid (often near zero).
- Unilateral right to change models or pricing without notice.
- Training on your uploaded voice or audio by default.
- No export path for custom voices.
