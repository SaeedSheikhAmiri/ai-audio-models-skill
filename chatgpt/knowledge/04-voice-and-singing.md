# Voice conversion, cloning, and singing reference

## Voice conversion and cloning

| Model / service | Type | License / price | Similarity | Real-time | Notes |
|---|---|---|---|---|---|
| RVC | Open weights | MIT | High (10–30 min data) | Yes (~90 ms) | Community standard; easy training |
| so-vits-svc | Open weights | AGPL | High | Near | Popular for singing |
| OpenVoice v2 | Open weights | MIT | Medium | Yes | Tone-color cloning, light |
| Seed-VC | Open weights | Apache 2.0 | High | Yes | Zero-shot, speech + singing |
| GPT-SoVITS | Open weights | MIT | High | No | Strong from ~1 min of data |
| Chatterbox VC | Open weights | MIT | High | No | Same family as Chatterbox TTS |
| ElevenLabs Voice Changer | Cloud | Subscription | High | Yes | Simple, good quality |
| Respeecher | Cloud / studio | Enterprise | Very high | No | Film/TV, voice rights handled |
| Altered Studio | Cloud | Subscription | High | Yes | Dubbing, games |
| Voice.ai / Kits VC | Cloud / desktop | Freemium | Medium–high | Yes | Consumer |

### Choosing

- **Custom voice from scratch** → RVC (cheap, controllable) or GPT-SoVITS (quality per minute of data).
- **Zero-shot, no training** → Seed-VC, OpenVoice v2, Chatterbox VC.
- **Managed, no infrastructure** → ElevenLabs.
- **Broadcast/film with rights** → Respeecher.

### Consent and compliance

- Obtain **explicit written consent** from the voice owner; store it with the project.
- Disclose synthetic speech where required (EU AI Act, US state laws, platform policies).
- Watermark outputs where the model supports it (e.g., Perth in Chatterbox); log model, date, and operator.
- Refuse cloning of public figures or private individuals without consent, and refuse content intended to deceive.

## Singing synthesis

| Option | Type | Price / license | Quality | Notes |
|---|---|---|---|---|
| Synthesizer V Studio | Commercial | ~$89 + voicebanks $50–100 | Best in class | Phonetic and vibrato control |
| Vocaloid 6 / CeVIO / Piapro | Commercial | $100–300 | High | Large legacy ecosystem |
| Suno / Udio | Cloud | Subscription | High (generated) | Limited fine control |
| Kits.AI / Voicify / Jammable | Cloud | Subscription | Medium–high | Voice cloning on vocals |
| DiffSinger | Open | Apache 2.0 | Medium–high | Needs data/training |
| ACE-Step / DiffRhythm / YuE | Open | Apache/NC | Medium | Full vocals inside songs |
| RVC / so-vits-svc / Seed-VC | Open | MIT/AGPL | High (conversion) | Convert an existing vocal |

### The two different problems

1. **Synthesis from scratch** (lyrics + melody → singing): Synthesizer V for studio work, Suno for speed, DiffSinger if you can train.
2. **Conversion** (a real singer → another timbre): RVC and so-vits-svc remain the standard; Seed-VC for zero-shot.

Conversion usually sounds better than synthesis because it inherits real phrasing and breath. If the user has a singer available, recommend conversion first.
