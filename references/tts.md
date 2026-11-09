# TTS reference

Prices are list prices as of November 2026, in USD, and change monthly. Treat them as approximations to verify, not quotes.

## Commercial services

| Service | Strength | Latency | Languages | Cloning | Approx. price |
|---|---|---|---|---|---|
| ElevenLabs v3 | Most expressive; emotion tags (`[whispers]`, `[laughs]`) | 0.5–1 s | 70+ | Instant (1 min) + professional | $0.06–0.24 / 1k chars; plans $5–1,320/mo |
| ElevenLabs Flash v2.5 | Speed-tuned same engine | ~75 ms | 32+ | Limited | Below v3 |
| ElevenLabs Turbo v2.5 | Speed/quality balance | ~250–300 ms | 32+ | Yes | Mid |
| OpenAI gpt-4o-mini-tts | Instruction-following tone; API-native | ~0.5 s | ~50 (variable) | No | ~$0.015/min of audio |
| OpenAI tts-1 / tts-1-hd | Simple, stable, 13 voices | Fast | ~50 | No | $15 / $30 per 1M chars |
| Google Chirp 3 HD | Natural, broad coverage | ~0.3 s | 50+ | Custom Voice (enterprise) | ~$30 per 1M chars |
| Google Gemini TTS | Natural-language control, multi-speaker | Medium | 24+ | No | Audio tokens (preview) |
| Azure Neural TTS | Official fa-IR; full SSML; streaming | ~0.2 s | 140+ | Custom Neural Voice | ~$15 per 1M (HD ~$30) |
| Amazon Polly | Cheap, stable, generative voices | ~0.3 s | 40+ | Brand Voice | $4 / $16 / $30 per 1M (standard/neural/generative) |
| Cartesia Sonic-3 | Very fast, cheap for conversation | ~40 ms | 40+ | Instant clone | ~$20–40 per 1M chars |
| Deepgram Aura-2 | Built for agents; SLA | ~200 ms | English-first | No | ~$30 per 1M chars |
| Hume Octave | Emotional acting via description | Medium | 10+ | Yes | Per character, above average |
| PlayHT Play 3.0 | Fast cloning, good coverage | ~0.3 s | 30+ | Yes | From ~$39/mo |
| LMNT | Very fast | ~50 ms | 10+ | Yes | ~$0.03 / 1k chars |
| Rime | Character-driven voices | ~0.2 s | 10+ | Yes | Per character |
| MiniMax Speech-2.6 | High quality, aggressive pricing | Medium | 40+ | Yes | Low |
| Fish Audio S1 | Fast cloning, low price | Medium | 13+ | Yes | ~$15 per 1M chars |

## Open weights

| Model | Params | Languages | Cloning | License | Hardware | Notes |
|---|---|---|---|---|---|---|
| Kokoro-82M | 82M | 8 (en, ja, zh, es, fr, hi, it, pt) | No (voicepacks) | Apache 2.0 | CPU | Best quality per cost; very fast |
| Piper | 10–60M | 30+ (incl. fa_IR) | No | MIT | Raspberry Pi | Offline, light, robotic |
| XTTS-v2 | ~467M | 17 | 6 s sample | CPML (non-commercial) | 4–6 GB | Mature; no Persian |
| F5-TTS | ~336M | en, zh | Zero-shot | MIT code / CC-BY-NC weights | 6–8 GB | Strong quality, trainable |
| Chatterbox | 0.5B | en + 23 | Yes | MIT | 6–8 GB | Emotion control, Perth watermark |
| Dia-1.6B | 1.6B | en | Yes | Apache 2.0 | 10 GB+ | Dialogue, non-verbal sounds |
| Orpheus-3B | 3B | en + variants | Yes | Apache 2.0 | 12 GB+ | Emotion tags, ~200 ms streaming |
| Sesame CSM-1B | 1B | en | Yes | Apache 2.0 | 8 GB | Conversational context |
| VibeVoice | 1.5B / 7B | en, zh | Yes | MIT | 8–16 GB | Up to 4 speakers, long form |
| Higgs Audio v2 | 3B | multilingual | Yes | Apache code / open weights | 12 GB+ | High quality |
| IndexTTS-2 | ~1B | zh, en | Zero-shot | Apache 2.0 | 8 GB | Emotion and duration control |
| CosyVoice 2/3 | 0.5B | zh, en, ja, ko | Yes | Apache 2.0 | 4–6 GB | ~150 ms streaming |
| Fish Speech / OpenAudio | ~0.5B | 13 | Yes | Apache code / CC-BY-NC-SA weights | 6 GB | Multilingual |
| MegaTTS3 | 0.45B | zh, en | Yes | Apache 2.0 | 6 GB | Light, good cloning |
| Zonos | 1.6B | en + 7 | Yes | Apache 2.0 | 8 GB | Emotion control |
| Bark | ~1B | 13+ | Yes | MIT | 6 GB | Non-verbal sounds; unstable |
| Parler-TTS | 0.9B | en | No | Apache 2.0 | 6 GB | Voice described in text |
| Spark-TTS | 0.5B | zh, en | Yes | Apache 2.0 code | 4 GB | Controllable, light |

## Selection heuristics

- **Under 300 ms required** → Cartesia, Deepgram Aura-2, ElevenLabs Flash; self-host CosyVoice-2 or Orpheus.
- **Emotional performance matters** → ElevenLabs v3, Hume, Chatterbox, IndexTTS-2.
- **Long-form narration** → ElevenLabs (chunking supported), Azure, VibeVoice for open.
- **Cost is the binding constraint** → Kokoro (no cloning), Piper (edge), Azure/Polly at scale.
- **Cloning is required** → ElevenLabs (cloud), RVC/GPT-SoVITS (open, train), Seed-VC (zero-shot).
- **Persian** → Azure fa-IR first; Google Chirp 3; ElevenLabs needs pronunciation testing; open options are Piper fa_IR and community VITS/Coqui.

## Traps

- Effective price is per **audio hour**, not per character. Recompute before comparing.
- "70+ languages" usually means the top 10 are good and the rest vary. Test the specific language.
- Streaming latency claims assume the nearest region and short text; measure on the real network.
- Some "open" TTS weights are non-commercial. Check the model card.
