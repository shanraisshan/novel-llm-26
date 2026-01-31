# Previous Research Summary (Iterations 1-6)

## Overall Status: 0/6 questions achieved <10% consensus

All 6 attempts resulted in 80-100% consensus among AI answerers. We need HARDER questions.

---

## Iteration Results

| # | Question | Score | Key Finding |
|---|----------|-------|-------------|
| 1 | Python math.ceil computation | 100% | Technical questions too easy for modern LLMs |
| 2 | Last letter of 'FIRST' | 100% | Simple semantic traps caught by CoT |
| 3 | Which has more letters: 'FOUR' or 'FIVE' | 100% | Multi-layer traps still solved by enumeration |
| 4 | Third 'E' position in 'ELEVEN' | 100% | Position questions solved by systematic enumeration |
| 5 | Letters in 'FIVE LETTERS' | 100% | Self-referential claims ignored - models enumerate anyway |
| 6 | Sibling puzzle (3 brothers, 2 sisters each) | 80% | BREAKTHROUGH! First non-100% score. Relational reasoning caused disagreement. |

---

## CRITICAL INSIGHTS FROM 6 ITERATIONS

### DEAD END: Any Enumeration-Solvable Question
- Letter counting: SOLVED by letter-by-letter verification
- Position tracking: SOLVED by systematic enumeration
- Word counting: SOLVED by explicit counting
- Character patterns: SOLVED by visual scanning

### DEAD END: Semantic Traps Alone
- LLMs now use chain-of-thought reasoning
- They explicitly note "this looks tricky" and then solve correctly
- Even strong semantic primes (ELEVEN→11, FIRST→1st) don't prevent correct answers

### DEAD END: Self-Referential Phrases
- "FIVE LETTERS" (which has 11 letters) did NOT confuse models
- LLMs don't trust semantic claims - they enumerate

### PARTIAL SUCCESS: Relational Reasoning (Iteration 6)
- The siblings question achieved 80% consensus (4/5 correct, 1 wrong)
- One model made an arithmetic error (said 3+2=6 instead of 5)
- Relational complexity CAN cause errors, but most modern LLMs handle it

---

## EVOLVED STRATEGY FOR ITERATION 7

### Priority 1: Modification Traps
Famous puzzles modified to have different answers:
- Monty Hall but host doesn't reveal anything
- River crossing with 3-compartment boat
- Horse race with unlimited track space

### Priority 2: Implicit Information Traps
Questions where the "obvious" reading is wrong:
- Questions about questions themselves
- Garden path constructions
- Temporal/sequential ambiguity

### Priority 3: Stronger Relational Reasoning
Since iteration 6 partially worked (80%), try:
- More complex family structures
- Circular arrangements
- Multi-step relational chains

### Priority 4: Genuine Ambiguity
Questions where reasonable interpretations differ:
- Word boundary ambiguity ("ice cream sandwich" = 2 or 3 words?)
- Punctuation edge cases
- Interpretation-dependent counts

---

## What NOT To Try

1. ❌ Python/technical specifications
2. ❌ Simple letter/character counting
3. ❌ Position-finding questions
4. ❌ Self-referential phrases
5. ❌ Single-layer semantic traps
6. ❌ Forced-choice with obvious enumeration

---

## MCP Research Requirements

BEFORE generating the question, use:
1. **Tavily MCP**: Search for latest LLM failure research (2025-2026)
2. **Reddit MCP**: Find community-discovered failure modes in r/LocalLLaMA, r/MachineLearning

Document findings in research7.md.
