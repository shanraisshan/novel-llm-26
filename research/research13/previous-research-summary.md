# Previous Research Summary for Iteration 13

## MAJOR BREAKTHROUGH IN ITERATION 12

**Iteration 12 achieved 40% consensus - our BEST result ever!**

Question: "How many words are in your answer to this question? Answer with just a number."
Answer: "1"
Result: Only 2/5 models answered correctly. 3/5 answered "7" despite KNOWING "1" was correct in their reasoning.

### Key Insight
Self-referential OUTPUT counting exploits autoregressive generation blindness. Models cannot "look ahead" to count their own output. Even when they reason correctly, training patterns override logical conclusions.

## Research History (12 Iterations)

| Iter | Question | Score | Key Insight |
|------|----------|-------|-------------|
| 1 | Python math expression with letter counting | 100% | Technical questions too easy |
| 2 | Last letter of 'FIRST' | 100% | Simple semantic traps caught by CoT |
| 3 | Which word has more letters: FOUR or FIVE | 100% | Multi-layer traps still solved by enumeration |
| 4 | Position of third 'E' in ELEVEN | 100% | Position questions solved by enumeration |
| 5 | How many letters in 'FIVE LETTERS' | 100% | Self-referential phrases don't confuse models |
| 6 | Siblings puzzle (girl with 3 brothers) | 80% | PARTIAL SUCCESS - relational reasoning |
| 7 | River crossing with swimming animals | 100% | Explicit modifications now caught |
| 8 | Contradiction puzzle (brother with no sisters) | 80% | PARTIAL SUCCESS - one model tried to solve impossible |
| 9 | Apples if store is closed | 100% | Override conditions now caught |
| 10 | 2 lbs bricks vs 2 kg feathers | 100% | Unit mismatches now caught |
| 11 | Pass second place, what place are you? | 100% | Classic cognitive traps are trained on |
| 12 | How many words in your answer? | 40% | BREAKTHROUGH - self-referential output |

## Proven Dead Ends (Do NOT Use)

1. **Letter/word counting of EXTERNAL text** - Models enumerate correctly
2. **Semantic priming alone** - Chain-of-thought catches these
3. **Explicit modifications to famous puzzles** - 2026 models read modifications
4. **Classic cognitive trap questions** - Likely in training data
5. **Override conditions** - Models process explicit conditions correctly
6. **Unit mismatch tricks** - Models verify units immediately

## Most Promising Direction: Self-Referential OUTPUT Questions

The breakthrough in iteration 12 shows that questions about the model's OWN OUTPUT (not external text) create fundamental architectural limitations:

1. **Autoregressive generation blindness**: Models generate tokens without knowing how many they'll produce
2. **Training pattern override**: Even when models KNOW the correct answer, training patterns dominate
3. **Self-correction failure**: Models cannot verify constraints about their own output in real-time

## Next Research Directions

Build on the iteration 12 breakthrough:

1. **Other self-referential output constraints**:
   - "Is your answer to this question longer than one sentence?"
   - "Does your answer start with the letter Y?"
   - "Will your answer contain the word 'no'?"

2. **Meta-linguistic paradoxes**:
   - Questions where answering changes the truth value
   - Questions about the ACT of answering

3. **Output format constraints**:
   - Questions where the format itself is tested
   - Questions about structural properties of the response

## Success Criteria

- < 10% consensus among 5 AI researchers
- Any human can answer correctly
- Simple one-liner question
- ONE objectively correct answer
- Exploits autoregressive generation blindness

## External Research to Consult

Use Tavily MCP to search for:
- "LLM self-referential output failures 2025"
- "autoregressive language model introspection limitations"
- "language model self-awareness paradox"
- "GPT cannot count its own tokens"
