# ASR reference

Prices are list prices as of November 2026, in USD. WER figures are approximate, for clean read English, and say little about accented, noisy, or non-English speech.

## Commercial

| Service | Price | WER (clean en) | Streaming | Diarization | Languages |
|---|---|---|---|---|---|
| OpenAI whisper-1 | $0.006/min | ~8–12% | No | No | 99 |
| OpenAI gpt-4o-transcribe | ~$0.006/min | ~5–8% | Limited | No | 50+ |
| OpenAI gpt-4o-mini-transcribe | ~$0.003/min | ~7–10% | Limited | No | 50+ |
| Deepgram Nova-3 | ~$0.0043–0.0077/min | ~5–7% | Yes | Yes | 30+ |
| AssemblyAI Universal-3 | ~$0.0025–0.0045/min | ~5–7% | Yes | Yes | 99 |
| Speechmatics | ~$0.0017–0.0036/min | ~6–8% | Yes | Yes | 50+ |
| Soniox | ~$0.001–0.002/min | ~6–9% | Yes | Yes | 60+ |
| Gladia | ~$0.0025/min | ~7–9% | Yes | Yes | 100 |
| Rev AI | $0.02/min | ~6–8% | No | Yes | 30+ |
| Google Chirp 3 | ~$0.016/min | ~6–9% | Yes | Yes | 125 |
| Azure Speech | ~$0.017/min | ~6–9% | Yes | Yes | 100+ |
| Amazon Transcribe | ~$0.024/min | ~7–10% | Yes | Yes | 100 |
| ElevenLabs Scribe v2 | ~$0.0067/min | ~4–6% | No | Yes | 99 |
| Mistral Voxtral | ~$0.003–0.006/min | ~6–8% | No | No | 8 |

## Open weights

| Model | Params | License | WER (en) | Languages | Notes |
|---|---|---|---|---|---|
| Whisper large-v3 | 1.5B | MIT | ~7–9% | 99 | Robust default |
| Whisper large-v3-turbo | 809M | MIT | ~8–10% | 99 | ~8× faster; best trade-off |
| distil-whisper large-v3.5 | 756M | MIT | ~9–11% | en | 6× faster |
| Parakeet-TDT-0.6B v3 | 0.6B | CC-BY-4.0 | ~5–6% | 25 European | Very fast |
| Canary-Qwen-2.5B | 2.5B | CC-BY-4.0 | ~5.6% | en | Accuracy plus LLM |
| Canary-1B-v2 | 1B | CC-BY-4.0 | ~6–7% | 25 | Also speech translation |
| Kyutai STT | 1B / 2.6B | CC-BY-4.0 | ~6–8% | en, fr | Streaming |
| Moonshine | 27–61M | MIT | ~9–12% | en | Edge |
| Vosk | 50–500M | Apache 2.0 | ~10–15% | 20+ (incl. fa) | CPU, offline |
| MMS / Wav2Vec2 | 300M | MIT | variable | 1100+ (incl. fa) | Language breadth |
| SenseVoice | ~234M | Apache 2.0 | ~7–9% | zh, en, ja, ko | Emotion + events |
| Qwen3-ASR | 1.7B–8B | Apache 2.0 | ~5–7% | 52 | LLM-based |

## Cost math

- `$/hour = price per minute × 60`.
- $0.001/min ≈ $0.06/hr; $0.0043/min ≈ $0.26/hr; $0.017/min ≈ $1.02/hr.
- Self-hosted Whisper turbo on one L4-class GPU: ~30–60× real time → $0.01–0.04 per audio hour at $0.5–1.2/GPU-hr.

## Selection heuristics

- **Accuracy on English at any cost** → Deepgram Nova-3, AssemblyAI Universal-3, Scribe v2, Canary-Qwen.
- **Phone/agent stack** → Nova-3 or AssemblyAI for streaming plus diarization.
- **Bulk transcription** → self-host Whisper turbo; Soniox/Gladia if self-hosting is not allowed.
- **Compliance-heavy / EU** → Speechmatics, Gladia, Azure.
- **Persian** → Whisper large-v3 with human review (WER ~10–15% on clean speech, worse on casual audio), Azure fa-IR, Google fa-IR, Speechmatics; Vosk fa is light but inaccurate.

## Traps

- Diarization quality is rarely reflected in WER; test it separately on overlapping speech.
- Streaming APIs often score worse than batch mode — measure both if latency matters.
- Timestamp accuracy varies widely; check word-level timing if you need subtitles.
- Long-audio pricing may be tiered; a 3-hour file is not always 180× the per-minute rate.
