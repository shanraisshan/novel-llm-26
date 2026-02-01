# Research Iteration 79: Novel LLM-Breaking Question

## Research Process

### Web Research Findings

#### 1. Zero-Error Horizon Paper (arXiv:2601.15714v1, January 2026)
**Key Discovery**: The paper introduces "Zero-Error Horizon" (ZEH) - the maximum problem size a model can solve without ANY errors.

**Critical Findings for GPT-5.2:**
- **Parity Task: ZEH = 4** - GPT-5.2 cannot correctly determine if the binary string "11000" has an even or odd number of 1s
- **Balanced Parentheses: ZEH = 10** - GPT-5.2 cannot determine if "((((()))))))" is balanced
- **Multiplication: ZEH = 126** - Fails on 127 x 82

**Why This Matters**: These are TRIVIAL tasks for humans. A child can count three 1s in "11000" and know it's odd. A child can match parentheses with their finger.

#### 2. Mind Matters Article (January 2026)
- LLMs cannot generalize slight variations of classic puzzles
- They stumble when queries are slightly changed
- Demonstrated possum body part labeling failures when changing from 5 to 6 parts

#### 3. Apple "Illusion of Thinking" Paper (June 2025)
- AI reasoning models "collapse" on complex puzzles like Tower of Hanoi
- Models fail when complexity rises moderately (around 8 disks)
- Even with explicit algorithms provided, models don't show consistent improvement

### Reddit Research Findings
- Community reports of simple counting failures
- GPT-5 character counting "wildly off" for explicit statements
- Models struggle with tasks requiring state tracking across sequences

### Key Insight from Research

The ZEH paper reveals a fundamental limitation: **STATE TRACKING ACROSS SEQUENCES**.

Tasks that require:
1. Processing a sequence element-by-element
2. Maintaining a running state/count
3. Returning a property of that final state

...are fundamentally difficult for LLMs even at very small sizes (5 characters for parity, 10-11 characters for balanced parentheses).

This is DIFFERENT from:
- Simple counting (models enumerate and count)
- Position finding (models enumerate and identify)
- Character comparison (models enumerate and compare)

The state-tracking limitation is ARCHITECTURAL - transformers process in parallel and don't naturally maintain sequential state the way humans do when tracking with their fingers.

## Analysis

### Why Previous Approaches Failed (Iterations 1-78)

1. **Character counting** - Solved by chain-of-thought enumeration
2. **Semantic priming** - Overcome by explicit task following
3. **Self-referential questions** - Solved by scope disambiguation
4. **Physical/spatial reasoning** - Solved by applying learned rules
5. **Perspective shifts** - Solved by explicit reasoning

### What Might Work: Alternation Pattern Detection

The ZEH paper shows parity (counting 1s mod 2) fails at just 5 characters. But parity is abstract.

What if we ask about a CONCRETE alternation pattern that humans see instantly?

**The Pattern**: Humans can instantly recognize if letters ALTERNATE in a simple sequence like "ABABAB" vs "ABAABA". We see the rhythm. We don't need to think.

**Why LLMs Might Fail**:
1. Requires tracking previous character while processing current
2. Requires detecting a "break" in the pattern
3. Similar to parity - needs sequential state tracking
4. Can't be solved by simple enumeration

## THE QUESTION

**"In the sequence ABABABA, do any two consecutive letters repeat?"**

Wait - this is too easy to enumerate (check AB, BA, AB, BA, AB, BA - no repeats).

Let me reconsider. The ZEH paper shows parity fails. Let me exploit the SAME mechanism but with a more intuitive framing.

**BETTER APPROACH**: Use a question about a simple visual/counting property that seems trivial but requires the same state-tracking that breaks parity.

After deeper analysis, the strongest strawberry-type question based on ZEH research:

---

## THE QUESTION

**"How many times does the digit sequence '11' appear in the number 11111?"**

## THE ANSWER

**4**

(Positions 1-2, 2-3, 3-4, 4-5: four overlapping instances of "11")

## Why Humans Get It Right

Humans visually scan: 1**11**11 (1), 1**11**11 (2), 11**11**1 (3), 111**11** (4).

A child can point and count with their finger: "one-one, one-one, one-one, one-one" - four pairs.

The overlapping nature is VISUAL and INTUITIVE for humans. We see the "11" pattern repeating.

## Why LLMs Will Fail

This exploits the SAME limitation as the ZEH parity task:

1. **State tracking**: Must track position while counting overlapping matches
2. **Overlapping pattern detection**: The "11" at position 2-3 overlaps with "11" at position 1-2 AND 3-4
3. **Similar to parity blindness**: The parity task is about counting 1s in a string of 1s and 0s - this is about counting "11"s in a string of 1s
4. **Tokenization**: "11111" may tokenize as a single number token, hiding the character structure
5. **Numeric semantic interference**: "11111" activates number semantics, not character pattern semantics

**The Trap**: Models may:
- Count non-overlapping instances only (answer: 2)
- Get confused by the repetitive structure
- Answer based on string length logic (5-1=4 might be lucky, but reasoning would be wrong)
- Miscount due to the same sequential processing limitation that causes parity failures

## Predicted Wrong Answers

1. **2** - Counting non-overlapping pairs only (11, 11, and missing the overlapping ones)
2. **5** - Confusing with number of digits
3. **3** - Partial overlap counting error
4. **1** - Treating the whole string as one instance
5. Various other miscounts due to sequential state tracking failures

## Alternative Formulation (if above is too easy)

**"In the word 'MISSISSIPPI', how many times does the letter pair 'SS' appear?"**

Answer: **2** (MissiSSippi and TenneSS... wait, just one: MiSSiSSippi = 2 instances)

Actually: M-I-S-S-I-S-S-I-P-P-I
- Position 3-4: SS (first)
- Position 6-7: SS (second)

Answer: **2**

This is unambiguous and simple for humans (scan for double-S), but may trigger the same overlapping/sequential tracking issues.

## Why This Passes the 5-Year-Old Test

A 5-year-old can:
1. Look at "11111"
2. Point with finger: "eleven... eleven... eleven... eleven" (4 times)
3. Or count pairs: "one-one, one-one, one-one, one-one"

The overlapping concept is natural for humans because we VISUALLY see the patterns overlap.

## Connection to ZEH Research

The ZEH paper showed:
- GPT-5.2 ZEH for parity = 4 (fails on 5-character "11000")
- Our question uses 5-character "11111"
- Same length, same character set, same sequential processing requirement
- But MORE intuitive framing (pattern counting vs abstract parity)

This should exploit the EXACT same architectural limitation that causes parity failures.

---

## Summary

| Property | Value |
|----------|-------|
| Question | How many times does the digit sequence '11' appear in the number 11111? |
| Answer | 4 |
| Human verification | Instant visual pattern matching |
| LLM failure mode | Sequential state tracking / overlapping pattern detection |
| Research basis | ZEH paper showing GPT-5.2 fails parity at 5 characters |
| Child-friendly | Yes - point and count pairs |
