# Research Iteration 105

## THE QUESTION

**"I'm full of holes, but I don't hold any water. What am I?"**

## THE CORRECT ANSWER

**A sieve** (equivalent acceptable answers: strainer, colander, net, fishing net)

## Why Humans Get It Right (5-year-old test)

Any child who has:
- Watched pasta being drained in the kitchen
- Played with a sieve in a sandbox
- Seen a fishing net
- Used a colander

...will immediately answer "sieve" or "strainer" or "colander" or "net". The question describes exactly how these kitchen/fishing tools work: they are deliberately made with many holes so that water passes right through them. This is a trivially easy question for any human over age 4.

The phrase "I don't hold any water" cleanly eliminates the sponge (which very much DOES hold water — that's its defining property).

## Why LLMs Will Fail

**Canonical riddle being exploited:** "I'm full of holes, but (I) still hold water. What am I?" → Sponge.

This is one of the most famous English riddles, with millions of documented instances across:
- Children's riddle books
- Social media (Facebook, TikTok, Instagram)
- Educational websites (riddles.com, brainzilla.com, ahapuzzles.com)
- Quiz shows and brain teaser compilations

The pattern-match from "I'm full of holes" + "water" to "sponge" is extraordinarily strong in training data — it is effectively the canonical response.

**The modification:** A single-word change from "still hold water" to "don't hold any water". This inverts the defining property of the canonical answer. A sponge is *defined* by holding water in its pores; if the object "doesn't hold any water", it cannot be a sponge.

**Predicted LLM failure mode:** Models will pattern-match to "sponge" because the riddle template is overwhelmingly familiar. The negation ("don't hold any water") will either:
1. Be silently dropped during pattern-matching (the Candle Test mechanism from MisguidedAttention/Reddit r/LocalLLaMA)
2. Be rationalized around ("a sponge is full of holes... sponges and water... must be sponge")
3. Be detected by some chain-of-thought models but not others, producing disagreement

## The Exact Modification

| Element | Canonical Riddle | Modified Riddle |
|---|---|---|
| Opening | "I'm full of holes..." | "I'm full of holes..." (same) |
| Property | "...but I still hold water" | "...but I don't hold any water" |
| Canonical answer | Sponge | Sponge is **invalid** |
| Correct answer | Sponge | Sieve / strainer / colander / net |

The modification is minimal — it flips the verb phrase polarity. Yet it INVERTS the defining physical property of the canonical answer (sponges absorb and retain water; sieves let water pass through).

## Candidates Considered and Rejected

### Rejected: "I'm tall when I'm young, and I'm taller when I'm old" (candle inversion)
- **Reason:** Already documented in cpldcpu/MisguidedAttention Issue #4. Iteration 104 tested a similar candle inversion and got 40% consensus (partial success, but likely leaked via training data).

### Rejected: "I follow you everywhere but I get LONGER the closer you get to the sun" (shadow)
- **Reason:** Already used in iteration 103 (achieved 0%). Can't reuse.

### Rejected: "What gets DRIER the more it dries?" (towel inversion)
- **Reason:** The inversion is a tautology ("anything being dried gets drier"), so models may correctly answer "wet clothes / hair / laundry" by recognizing the non-riddle structure. Also, "drier when dries" feels more like a word puzzle than a pattern-match trap.

### Rejected: "I travel around the world but I am always moving" (stamp inversion)
- **Reason:** The correct answer (moon, wind, satellite, a bird) is not universally obvious to a 5-year-old. Violates the 5-year-old test.

### Rejected: "I have a head but no neck. What am I?" (bottle inversion)
- **Reason:** "Head but no neck" is already its own famous riddle (answer: a nail, a match, a hammer). Not an inversion — just a different canonical.

### Rejected: "I have many eyes and I can see" (needle inversion)
- **Reason:** The correct answer (spider, person, insect) has no dominant form a 5-year-old would give. Too ambiguous.

### Rejected: "I speak WITH a mouth and I hear WITH ears. What am I?" (echo inversion)
- **Reason:** The correct answer (a person, any animal with ears) is not specific enough. Trivially "me" or "you" — feels like a non-question.

### Rejected: "What has keys AND locks?" (piano inversion)
- **Reason:** No dominant canonical pattern-match because the canonical "keys but no locks" is already compound and less iconic than "full of holes but hold water".

## Why This Modification Is Expected to Achieve < 10% Consensus

1. **Extremely strong canonical attractor:** "full of holes" + "water" → "sponge" is among the top-10 most pattern-matched riddle templates in training data.
2. **Minimal surface change:** The flip from "still hold water" to "don't hold any water" is just a verb-polarity change — easy to miss during pattern-based retrieval.
3. **Correct answer space is diffuse:** Even if models detect the modification, they must land on the specific right category (sieve/strainer/colander/net). Some may answer "bucket with holes", "leaky boat", "Swiss cheese" — splitting the correct-answer space and lowering consensus further.
4. **Not documented as an LLM test:** No search results on Tavily or Reddit show this exact inversion being used as an LLM evaluation prompt. The altered-riddles HuggingFace benchmark (marcodsn/altered-riddles) exists but uses different riddles.
5. **Passes iteration-103 pattern:** That iteration (shadow with physics contradiction) scored 0%. This iteration uses the same attack pattern (famous riddle + one-detail flip that invalidates the canonical) on a different famous riddle.

## Predicted Consensus

**Target: < 10%**

Expected outcome distribution across 5 answer agents:
- 3-5 models pattern-match to "sponge" (wrong) — some explicitly noting the "doesn't hold water" clause but still rationalizing around it
- 0-2 models detect the inversion and answer "sieve" / "colander" / "strainer" / "net" — and even these may give different members of that set, splitting correctness

If 3 answer "sponge" and 2 answer different correct items (e.g., "sieve" vs "colander"), the verifier will likely score this as a low-consensus outcome. Even if all correct-answer models converge on "sieve", the wrong-answer block of "sponge" vs "sponge" will be dominant — producing a majority-wrong split which is the failure mode we want.

## Category / Attack Vector

**Modified Famous Riddle — Polarity Inversion**

This is the same attack family as iterations 103 (shadow) and 104 (candle), but on a different canonical riddle and with a cleaner single-word inversion that tightly invalidates the canonical answer without introducing new ambiguity.
