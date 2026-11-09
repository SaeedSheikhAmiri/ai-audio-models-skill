# Music, sound effects, and Foley reference

Prices are list prices as of November 2026, in USD.

## Music — commercial

| Service | Strength | Approx. price | Output rights |
|---|---|---|---|
| Suno v5 | Full songs with vocals, many styles, section editing | Free (50 credits/day, non-commercial); Pro ~$10/mo; Premier ~$30/mo | Commercial on paid plans, subject to terms |
| Udio | High audio quality, style control | ~$10–30/mo | Commercial on paid plans; publisher deals in place |
| Riffusion | Fast, free tier | Free + paid | Varies by plan |
| Stable Audio 2.5 | Up to ~3 min, loops, audio-to-audio | API credits | Commercial under license |
| Google Lyria 2/3 | High-fidelity, pro tooling | Per minute/token | Commercial |
| MiniMax Music 2 | Full songs, low price | Cheap API | Commercial |
| Mureka | Full songs with vocals | Subscription | Commercial |
| ElevenLabs Music | Licensed-data positioning | Subscription | Commercial (fully licensed claim) |
| Adobe Firefly Soundtrack | Copyright-safe | Creative Cloud credits | Commercial |
| Soundraw / Beatoven / AIVA / Boomy | Royalty-free for video | $10–30/mo | Commercial |

## Music — open weights

| Model | Params | License | Length | Vocals | Notes |
|---|---|---|---|---|---|
| ACE-Step | 3.5B | Apache 2.0 | up to ~4 min | Yes (19 languages) | Most complete open full-song model |
| Stable Audio Open 2.0 | ~1B | Stability Community (commercial under $1M revenue) | ~47 s | No | Loops and effects |
| MusicGen | 300M–3.3B | MIT code / CC-BY-NC weights | 30 s | No | Research reference |
| YuE | ~7B | Apache code / CC-BY-NC weights | minutes | Yes | Full songs with vocals |
| DiffRhythm | ~1B | Apache 2.0 | up to ~4 min | Yes | Very fast |
| Tango 2 | ~1B | CC-BY-NC | 30 s | No | Strong SFX/music |
| AudioLDM 2 | ~1B | CC-BY-NC | 10 s | No | General audio |
| MAGNeT | 300M–1.5B | CC-BY-NC | 30 s | No | Fast, non-autoregressive |

## Sound effects and Foley

| Model / service | Input | License / price | Notes |
|---|---|---|---|
| ElevenLabs SFX v2 | text | Subscription/credits | High quality, library, video sync |
| Stable Audio Open / 2.5 API | text | Community / credits | Effects and loops |
| Meta AudioGen | text | CC-BY-NC | Research |
| TangoFlux | text | Apache 2.0 | 515M, fast |
| Woosh | text | Apache 2.0 | Lightweight effects |
| MMAudio | video (+text) | MIT | Automatic Foley |
| HunyuanVideo-Foley | video | Open (research) | Tight picture sync |
| AudioX | video/text | Open | Audio from video |
| Kling / Runway / Pika Foley | video | Subscription | Inside video tools |
| Mirelo SFX | video | API | Professional Foley |

## Licensing of generated music

- Vendor "commercial use" clauses often exclude **Content ID registration**, sync licensing, and resale of the model output as a standalone asset.
- Indemnification is not universal. Ask explicitly: *does the vendor indemnify me if a rights holder claims my track?*
- Open models trained on web-scraped audio carry risk that the license does not cure. For branded or broadcast work, prefer Firefly, Stable, or ElevenLabs Music.
- Keep generation logs (prompt, model, date, account) — useful evidence if a claim arrives.

## Selection heuristics

- **Release-ready song** → Suno or Udio.
- **Brand-safe background** → Firefly, Stable Audio, ElevenLabs Music.
- **Self-hosted / offline** → ACE-Step (quality), DiffRhythm (speed), Stable Audio Open (effects).
- **Game SFX** → ElevenLabs SFX, TangoFlux, Woosh.
- **Foley for video** → MMAudio, HunyuanVideo-Foley; text-to-SFX models are weaker on temporal sync.
