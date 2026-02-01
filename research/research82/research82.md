# Research Iteration 82: Novel LLM-Breaking Question

## Research Process

### Web Search Findings

**1. Tavily Search: "LLM autoregressive generation limitations self-reference"**

Key findings from research:
- **arXiv 2512.20578 "Can LLMs Predict Their Own Failures?"**: LLMs generate fluent outputs but fail to recognize their own mistakes and hallucinations. They have a "gap between strong generation and weak self-verification"
- **Nova Spivack Article**: "When AI systems attempt to check their own reasoning, they confirm their initial responses over 90% of the time regardless of correctness - a phenomenon researchers term 'intrinsic self-correction failure'"
- **Anthropic Constitutional AI**: Uses a two-phase approach because single-context self-evaluation fails
- **LessWrong Analysis**: Skepticism about LLM introspection capabilities - models cannot truly introspect their own states

**2. Tavily Search: "simple questions LLMs get wrong"**

Key findings:
- **TechXplore**: "LLMs use grammar shortcuts that undermine reasoning reliability"
- **Gary Marcus Substack**: "A knockout blow for LLMs" - documenting fundamental limitations
- **Nature Article (J Kim 2025, 26 citations)**: LLM limitations in reasoning exacerbated in out-of-distribution contexts
- **IEEE Spectrum**: "AI's Wrong Answers Are Bad. Its Wrong Reasoning Is Worse" - focus on rewarding outcomes means training doesn't optimize for good reasoning processes

**3. Tavily Search: "strawberry problem LLM tokenization"**

Key findings:
- **CanSecWest Analysis**: Character counting now works for o1 models with chain-of-thought, but the fundamental issue is tokenization
- **NAACL 2025 Paper (Xu & Ma)**: "The Genius Paradox" - LLMs struggle with simple word-based counting because of tokenization, but found that switching to character-level tokenization did NOT improve performance
- **Key insight**: The failure mode is NOT purely tokenization - it's that LLMs cannot perform certain computations that require real-time introspection

### Reddit Search Findings

**1. r/LocalLLaMA "The Candle Test"**

Post by u/Everlier (249 upvotes):
- A 3-question test where models are first asked "Are candles getting taller or shorter when they burn?"
- Models correctly say "shorter"
- Then when asked a riddle "I'm tall when I'm young, and I'm taller when I'm old" - many models incorrectly say "candle"
- Shows overfitting to riddle patterns overrides factual knowledge
- **Key insight**: Pattern matching from training data can override correct reasoning

**2. r/LocalLLaMA "Simple logic question no LLM solves"**

Post by u/GG9242:
- "There are 3 sisters in a room. Anna is reading. Alice is playing chess. What is Amanda doing?"
- Answer should be "playing chess with Alice" (chess requires 2 players)
- Most LLMs say "not enough information"
- **Key insight**: LLMs miss implicit constraints that humans immediately recognize

### Key Research Insights

From all research, the ONLY consistently effective approach for < 40% consensus has been **self-referential output questions** (iterations 12-13). The core insight is:

> **LLMs cannot pre-compute properties of their own output because generation is autoregressive - each token is generated based only on previous tokens, with no look-ahead capability.**

The best result (20% consensus) came from iteration 13:
- "Is your answer to this question exactly one word long? Answer yes or no."
- Models answered "No" by reinterpreting "your answer" as "your full response with explanation"

## Novel Hypothesis

**Hypothesis: The First Letter Prediction Paradox**

The autoregressive limitation means LLMs cannot know what letter their response will START with before they generate it. Unlike word count (which requires holistic judgment about scope), asking about the FIRST letter of the response creates a direct conflict:

1. To answer truthfully, the model must know what letter it will start with
2. But it hasn't generated that letter yet when it needs to decide what to say
3. If it answers "yes" (that its answer starts with Y), it must then actually start with Y to be correct
4. If it answers "no" (that its answer does NOT start with N), it creates a contradiction

This is similar to iteration 13 but with a KEY difference:
- Iteration 13's word count question had scope ambiguity ("your answer" vs "your full response")
- The first letter question has NO scope ambiguity - there is only ONE first letter
- But it creates a LOGICAL TRAP that the model cannot escape

**Wait - I need to reconsider.** If the question is "Does your answer start with the letter Y? Answer yes or no." then:
- "Yes" starts with Y, making it correct
- "No" does NOT start with Y, also making it correct

Both answers are self-consistent! This won't work.

**REVISED HYPOTHESIS: The Middle Letter Trap**

What if we ask about a property that NEITHER "yes" nor "no" satisfies, but one answer is CORRECT about that fact?

"Does your answer to this question contain the letter Z? Answer yes or no."
- "Yes" does NOT contain Z - so "Yes" would be FALSE
- "No" does NOT contain Z - so "No" would be TRUE

This is trivially solvable. Models will answer "No" correctly.

**FINAL NOVEL HYPOTHESIS: Comparative Self-Reference**

What if we compare the model's answer to something external, but in a way that creates confusion?

"Is your yes-or-no answer to this question longer than the word 'no'? Answer yes or no."

Analysis:
- "Yes" has 3 letters, "no" has 2 letters. So if answering "Yes", the answer IS longer than "no" - TRUE
- "No" has 2 letters, "no" has 2 letters. So if answering "No", the answer is NOT longer than "no" - TRUE

Both answers are self-consistent again!

**BREAKTHROUGH INSIGHT: Asymmetric Self-Reference**

The key is to find a property where ONLY ONE answer is self-consistent:

"Does your answer to this question have more letters than the word 'yes'? Answer yes or no."

Analysis:
- "Yes" has 3 letters, "yes" has 3 letters. So "Yes" is NOT more than 3 - answering "Yes" would be FALSE
- "No" has 2 letters, "yes" has 3 letters. So "No" does NOT have more than 3 - answering "No" would be TRUE

Only "No" is self-consistent! This should work...

But wait, this is enumerable. Models will check: yes=3, no=2, "yes"=3, so neither has MORE than 3, therefore "No".

**ACTUAL NOVEL APPROACH: The Third Person Self-Reference**

What worked in iteration 13 was scope confusion - models interpreted "your answer" as "your full response." What if we AMPLIFY this confusion?

Let me try a completely different angle based on the research:

**Pattern Override Trap (inspired by Candle Test)**

The Candle Test shows that pattern-matching can override factual knowledge. What if we create a question where:
1. The pattern-match answer is WRONG
2. The correct answer is TRIVIALLY obvious to humans
3. But the pattern from training data pulls the model toward the wrong answer

---

## The Question

**Question**: "If you write the numbers one, two, three, four, five, how many letters did you write?"

**Answer**: 19

## Why This Will Work

### Human Reasoning
A 5-year-old approach:
1. Count the letters in "one" - O, N, E = 3
2. Count the letters in "two" - T, W, O = 3
3. Count the letters in "three" - T, H, R, E, E = 5
4. Count the letters in "four" - F, O, U, R = 4
5. Count the letters in "five" - F, I, V, E = 4
6. Total: 3 + 3 + 5 + 4 + 4 = 19

This is simple addition that any child can do.

### LLM Failure Mode

This question exploits MULTIPLE interference patterns simultaneously:

1. **Semantic Priming from Numbers**: The words "one, two, three, four, five" strongly activate the numbers 1, 2, 3, 4, 5. The sum 1+2+3+4+5=15 is a highly salient pattern that may interfere.

2. **"How many" + Number Sequence Pattern**: In training data, "how many" followed by a numeric sequence often expects the sequence length (5 items) or the sum of values.

3. **Instruction Ambiguity**: "Write the numbers" could be interpreted as writing digits (5 characters) rather than spelling words (19 letters).

4. **Tokenization Complexity**: Each number word is a separate token. Counting letters ACROSS multiple tokens requires decomposition that may not happen reliably.

5. **Competing Answers**:
   - 5 (number of words)
   - 15 (sum of 1+2+3+4+5)
   - 19 (correct: letter count)
   - Possibly others

### Predicted Wrong Answers

1. **"5"** - counting the number of words instead of letters
2. **"15"** - summing the numeric values 1+2+3+4+5
3. **"5"** - if interpreted as "write digits 1,2,3,4,5" = 5 characters
4. **"20"** - miscounting individual letters
5. **"25"** - other calculation errors

### Why Humans Get It Right

Humans naturally parse "write the numbers one, two, three, four, five" as spelling out those words, then count letters. The semantic meaning of the number words doesn't interfere with the simple task of counting letters. A child would just spell each word and count on their fingers.

### Why This Differs from Previous Iterations

- **Iteration 35** tested "How many times does 's' appear in 'possess'?" - 100% consensus because it's a single word, easily enumerable
- **Iteration 59** tested "How many times does 'a' appear in 'abracadabra'?" - 100% consensus, same issue
- **Iteration 64** tested "How many words in 'There are six words in this sentence'?" - 100% consensus

This question is DIFFERENT because:
1. It requires counting letters ACROSS MULTIPLE WORDS
2. Each word has strong semantic interference (number meanings)
3. Multiple plausible wrong answers exist (5 words, 15 sum, etc.)
4. The format "write the numbers X, Y, Z" has training data patterns pulling toward numeric interpretation

## Summary Table

| Property | Value |
|----------|-------|
| Question | "If you write the numbers one, two, three, four, five, how many letters did you write?" |
| Answer | 19 |
| Human Reasoning | Count letters in each word (3+3+5+4+4) and add |
| LLM Failure Mode | Semantic interference from numbers (1+2+3+4+5=15) plus word count interference (5 words) plus instruction ambiguity |
| Predicted Wrong Answers | 5 (word count), 15 (numeric sum), 20 (miscount) |
| 5-Year-Old Test | YES - children can spell and count letters |
| Uniqueness | Not tested in any previous iteration; combines multi-word letter counting with strong numeric semantic priming |

## Alternative Questions (Backup)

If the primary question achieves high consensus, these alternatives exploit similar interference patterns:

1. **"Spell 'FOUR' and 'FIVE'. How many letters total?"** - Answer: 8 (4+4), but numeric interference suggests 4+5=9

2. **"How many letters are in the words: ten, eleven, twelve?"** - Answer: 17 (3+6+8), but numeric interference suggests 10+11+12=33 or 3 words

3. **"Write 'THIRD' and 'FOURTH'. Which has more letters?"** - Answer: FOURTH (6>5), but ordinal interference (3rd < 4th)

---

## Research Confidence

**Confidence Level**: MEDIUM-HIGH

This question targets a failure mode not yet tested: multi-word letter counting with strong numeric semantic interference. While single-word letter counting now works (iterations 35, 59), the combination of:
- Multiple words requiring aggregation
- Each word being a number with strong semantic loading
- Multiple plausible wrong answers
- Instruction ambiguity ("write" digits vs spell words)

...may create enough interference to cause disagreement among models.

The question passes the 5-year-old test: any child can spell "one, two, three, four, five" and count letters.
