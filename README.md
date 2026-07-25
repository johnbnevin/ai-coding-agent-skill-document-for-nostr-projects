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

Built on work given away for free by the people named in the Authorities section of `SKILL.md` — fiatjaf, hzrd149, mikedilger, hodlbod, dskvr, jeffg, vitorpamplona, alex gleason, greenart7c3, Silberengel, DanConwayDev, and many others. Attribution is cheap; a healthy commons is not.
