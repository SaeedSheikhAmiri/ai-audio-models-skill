# Audio understanding and processing reference

## Audio LLMs

| Model | License | Capability | Notes |
|---|---|---|---|
| GPT-4o / GPT-5 audio | API | Listening, reasoning, spoken replies, realtime | Strongest conversation; most expensive |
| Gemini 2.5 / 3 | API | Audio + video + text, long context | Deep Gemini integration |
| Qwen3-Omni | Apache 2.0 | Audio/image/text, 30B-A3B MoE | Best open Omni model |
| Qwen2.5-Omni | Apache 2.0 | Real-time conversation | Lighter |
| Kimi-Audio | MIT-ish | Understanding + generation | Strong benchmarks |
| Step-Audio 2 mini | Apache 2.0 | ASR + TTS + reasoning | Strong zh/en |
| Moshi | CC-BY 4.0 | Full-duplex conversation (~200 ms) | Natural turn-taking |
| SALMONN / Audio Flamingo 3 | Research | General audio and music | Non-commercial |
| GLM-4-Voice / MiniCPM-o | Apache 2.0 | Lightweight conversation | Edge/mobile |

**Benchmarks:** MMAU, AudioBench, LongAudioBench. Public scores are dominated by English; test on the target language.

**When to use which:** GPT/Gemini for reasoning over audio plus tools; Qwen3-Omni when data cannot leave your infrastructure; Moshi for low-latency conversational demos.

## Separation, denoising, restoration

| Tool / model | Task | License | Notes |
|---|---|---|---|
| Demucs v4 (htdemucs) | 4/6-stem separation | MIT | Open standard, good quality |
| BS-RoFormer / Mel-Band RoFormer | Stem separation | MIT-ish | Best separation quality |
| MDX23C / UVR5 | Separation + GUI | GPL/MIT | Community favorite |
| LavaSR | Bandwidth extension | Apache 2.0 | Reconstruction |
| AudioSR | Super-resolution | MIT | 44.1/48 kHz |
| Apollo | Restoration of degraded audio | Open | Loss restoration |
| DeepFilterNet3 | Real-time noise suppression | MIT | Built for calls |
| RNNoise | Noise suppression | BSD | Ultra-light |
| Resemble Enhance | Speech enhancement | MIT/Apache | Denoise + enhance |
| Adobe Podcast Enhance | Speech enhancement | Free (web) | Good, limited |
| Auphonic / iZotope RX | Mastering/restoration | Subscription/license | Professional |
| Krisp | Noise/echo removal | Subscription | SDK for calls |

### Choosing

- **Music stems** → BS-RoFormer for quality, Demucs for speed and simplicity, UVR5 for a GUI workflow.
- **Call-center audio** → DeepFilterNet3 (real-time, light) or RNNoise on device.
- **Podcast cleanup** → Resemble Enhance or Adobe Podcast Enhance, then a mastering pass.
- **Old/broken recordings** → Apollo, then AudioSR/LavaSR for bandwidth.
- **Real-time at scale** → prefer on-device models; cloud enhancement adds latency and cost.

### Metrics that matter

Separation: SDR/SI-SDR on MUSDB18. Denoising: PESQ/STOI plus a listening test. Super-resolution: LSD and perceptual tests. None of these capture "sounds natural" fully — always listen.
