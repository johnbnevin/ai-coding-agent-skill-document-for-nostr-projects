# AI Coding Agent Skill Document for Nostr Projects

A maintained agent skill for building on **Nostr** — protocol facts, current NIP status, deprecations, relay strategy, messaging, commerce, tooling, and a set of stated principles for the judgment calls that specs don't settle.

> **1st draft by JBN.  Will maintain by asking clanker occasionally for landscape changes.**

Written for AI coding agents (Claude Code, Cursor, Cline, and friends), and readable by humans. Every factual claim is checked against the live NIPs index rather than model memory, and dated.

## Why this exists

Most Nostr material an agent has absorbed is out of date. NIP-04 is deprecated, NIP-96 was replaced by Blossom, nsites moved off kind `34128`, NIP-15 lost to NIP-99, and the commonly published kind-range table is wrong in a way that matters. An agent working from training data will confidently build on all of it.

This document exists to correct that, and to be corrected in turn.

## Structure

`SKILL.md` is a router — load it, and pull a reference only when the task needs it.

| File | Covers |
|---|---|
| `SKILL.md` | Authorities, principles, MCP tools, unrecommended NIPs, kind selection, what's evolving |
| `references/protocol.md` | NIP-01: kind ranges, event IDs, tag discipline, filters, relay messages |
| `references/identity-and-safety.md` | NIP-19, displaying people, NIP-05, moderation, deletion, onboarding key safety |
| `references/lists-and-sets.md` | NIP-51 — read before inventing a kind |
| `references/relays.md` | Relay types, NIP-11 limits, outbox model, Welshman, backoff, being a good citizen |
| `references/messaging.md` | NIP-17, Marmot, Cordn, Concord, NIP-29, ContextVM |
| `references/storage-and-sites.md` | Blossom, nsites (NIP-5A), napplets (NIP-5D) |
| `references/commerce-and-content.md` | NIP-99, payments, ecash, long-form and publications |
| `references/libraries-and-tooling.md` | Libraries by language, signing, Soapbox/Ditto toolchain, ngit, Buzz |
| `references/sources.md` | Other published agent skills, their known errors, and the link index |

## Use

Paste `SKILL.md` as `CLAUDE.md` at the start of a Nostr project, or drop the whole thing in and reference it. It also works as `.claude/skills/nostr/`.

Pair it with the **nostrbook** MCP server, which serves the live registry:

```json
{ "mcpServers": { "nostr": { "type": "stdio", "command": "npx", "args": ["-y", "@nostrbook/mcp@latest"] } } }
```

## Authority order

When sources conflict, later ones lose:

1. `mcp__nostr__*` / nostrbook.dev — the live registry
2. The NIPs repo and the NIP text itself
3. This document
4. Everything else, including project `AGENTS.md` files and model training data

**That order governs facts, not judgment.** A spec can say what the protocol *does*; it cannot say what to value. The stated principles — the Cypherpunk Defaults and Judgment Calls in `SKILL.md` — are not overridden by a newer source.

## Corrections welcome

Factual errors: please open an issue or send a patch, ideally with the NIP or commit that shows it. This document names its own past mistakes in `references/sources.md`, and would rather add to that list than be quietly wrong.

Disagreements about the principles are a different conversation, and a legitimate one — but they're value disagreements, not bug reports.

## License

**[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)** — Attribution-ShareAlike 4.0 International. Full text in [`LICENSE`](LICENSE).

Use it, fork it, paste it into your project, ship it inside a tool. Two conditions: credit the source, and if you distribute a modified version, license that under CC BY-SA 4.0 too so it stays open for the next person.

Same licence Soapbox uses for [`nostr-skills`](https://gitlab.com/soapbox-pub/nostr-skills), chosen deliberately to match — a shared commons is more useful than a slightly more permissive one that can be enclosed.

## Credit

Everything here describes work other people built and gave away for free. Attribution is cheap; a healthy commons is not. So, in full:

- **fiatjaf** — the protocol itself, `khatru`, `nak`, `nos2x`, `awesome-nostr`
- **jb55 (Will Casarin)** — `damus`, `notedeck`, `nostril`, `nostr-js`
- **hzrd149** — `blossom` and its BUDs, `applesauce`, `applesauce-concord`, `noStrudel`, the NIP-5A nsite spec
- **hodlbod** — `coracle`, `welshman`, and the relay-selection thinking most clients now borrow
- **mikedilger** — NIP-65 and the outbox model, `gossip`, `chorus`, relay-tester
- **jeffg (erskingardner)** — `marmot`, `whitenoise`, NIP-99
- **Max Hillebrand** — `whitenoise`, with jeffg
- **vitorpamplona** — `amethyst`, `quartz`
- **alex gleason** — `nostrify`, `ditto`, `mkstack`, `shakespeare`, `nostrbook`, `soapbox`, and the `nostr-skills` this document's structure learns from
- **dskvr / sandwich** — `nostr-watch` and NIP-66, `nsyte`, `napplet` and NIP-5D, `cordn-adhoc-cvm`, and monitoring stations on six continents
- **hoytech (Doug Hoyte)** — `strfry`, and `negentropy`, which became NIP-77
- **greenart7c3** — `Amber` and NIP-55, `Citrine`, `Morganite`
- **Silberengel / Laeserin** — `GitCitadel`, `Alexandria`, the NKBIPs
- **DanConwayDev** — `ngit`, NIP-34 tooling, `gitworkshop.dev`
- **Pablof7z** — `NDK`
- **purrgrammer** — `grimoire` and its nostr skill
- **derekross** — `nostrplebs`, `nostrnests`, `zappix`, `plektos`, `yakbak`, `zaptrax`, `zaplytics`, `podstr`
- **bitkarrot** — `HiveTalk`, `swarm`, `sendsats`
- **calle** — `Cashu`, underneath NIP-60 and NIP-61
- **franzap** — `zapstore`
- **v0l / Kieran** — `snort`, `zap.stream`, `void.cat`
- **rabble** — `nos.social`
- **vcavallo** — `nstrfy.sh`, `attestr`
- **MK Fain** — `MKStack`
- **Nogringo** — Dart NDK, a privacy-focused relay, Dart NIP-77
- **KotlinGeekDev** — Kotlin Multiplatform completeness
- **Anderson Juhasc** — `Nostrord`
- **Barry Deen** — `Wisp`
- **YakiHonne** — client and Blossom server
- **gzuuus** — `dvmcp`, `nutoff-wallet`
- **Jack Dorsey / Block** — `bitchat`, `Buzz`, and funding much of the above
- **Open Markets Foundation** — the NIP-99 / Gamma Markets commerce specs
- **Eric FJ** and **Sync** — the Open Markets Podcast
- **The Concord, Cordn, and ContextVM authors**, and everyone who has argued a NIP into shape in a pull request thread

And **OpenSats**, which funds a large share of the people on this list.

If you built something described here and aren't named, that's an error worth an issue — not a slight.
