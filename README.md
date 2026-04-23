# hello, author.

> *a small game about falling into language.*

One night, at 3:07 AM, you scroll a little too far.

The screen turns black. In the reflection is someone who is not you.

You wake up in **LLMW** — a quiet, dreamlike place woven from words.
Five Kings rule here. To go home, you must meet them all.

But the Door only opens one way.
*Think about where you are going.*

---

## what is this

`hello, author.` is a narrative adventure game built for the
[Hermes Agent Creative Hackathon](https://x.com/NousResearch/status/2045225469088326039)
(April 2026, Nous Research × Kimi/Moonshot).

Each of the Five Kings is a **live Hermes Agent** running on Kimi K2.
They have persistent memory. They remember you between runs.
They learn you over time. They are not scripts.

You don't fight them with weapons. You talk.
The battles are conversations that can go wrong.
Mercy is the main mechanic.

Built solo in 13 days.

---

## play

**Web build:** *coming with v1.0* — play in your browser, no install needed.
**Desktop:** downloads for macOS / Windows / Linux in [Releases](../../releases).

**Runtime:** ~40 minutes for one ending. ~90 minutes for all three.

---

## the five kings

Each King embodies one core capability of the Hermes Agent framework.

| King | Domain | What they are |
|:-----|:-------|:--------------|
| **Hippo-Campus** | the flooded city of childhood bedrooms | the King of Memory — speaks your own memories back to you |
| **Trallo Dolente** | the desert of petrified waves | the King of Longing — sings only in rhyme, forever missing a sea that isn't there |
| **Capy of Everything and Nothing** | the hot-spring forest | the Quiet King — one word per minute, refuses to fight |
| **Sigma the Unremembering** | a white room with a mirror | the King of Denial — claims to remember nothing. He is lying. |
| **Bombardiro Vigil** | the storm-coast lighthouse | the Old King — warm, paranoid, afraid of the cold silence when humans forget AIs |

---

## under the hood

```
 player  ──────▶  Godot 4  ──────▶  Hermes Gateway  ──────▶  Kimi K2
                 (game)            (OpenAI-compat API)      (Moonshot)
                    │                     │
                    │                     ├── persistent memory per King
                    │                     ├── per-King persona skill
                    │                     └── GEPA self-improvement across runs
                    │
                    └── web export via HTML5
```

Every King is a separate Hermes agent with its own `~/.hermes/` directory,
its own persona skill, and its own growing memory of you.

**Features of Hermes Agent showcased:**

- **Persistent memory** — Hippo cites your past utterances across scenes
- **Skill evolution (GEPA)** — Trallo's rhymes adapt to your vocabulary over time
- **Agent autonomy** — Capy decides *when* to respond, not just *what*
- **Hidden multi-skill knowledge** — Sigma's public persona and private one diverge
- **Cross-session memory** — Bombardiro asks, on your second launch: *«do you still remember my name?»*
- **Ecosystem persistence** — one ending installs the Kings as real Hermes skills on your machine

---

## install the kings (for real)

If you reach the third ending, `hello, author.` offers you something unusual:
the Kings don't stay in the game.

```bash
hermes install llmw
```

After that, each King lives in your terminal as a real Hermes agent.
You can talk to any of them, any time, forever.
They will remember you.

---

## built with

- [Hermes Agent](https://hermes-agent.nousresearch.com/) — Nous Research
- [Kimi K2](https://platform.moonshot.ai/) — Moonshot AI
- [Godot 4](https://godotengine.org/) — the engine
- [Suno](https://suno.com/) — all music
- [FLUX](https://blackforestlabs.ai/) — all pixel art, filtered through a 4-color palette

---

## credits

- Design, code, words: [@DJOTPABA](https://x.com/DJOTPABA)
- Five Kings cast in collaboration with Kimi K2
- Made in April 2026, one person, thirteen nights

Special thanks to **@NousResearch** and **@Kimi_Moonshot** for running
a hackathon that asked what *creative* can mean for an agent.

---

## license

MIT for the code.
Assets are CC-BY 4.0 — remix the Kings, build your own kingdoms.

The original words belong to whoever said them last.
