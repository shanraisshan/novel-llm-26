# Previous Research Summary for Iteration 72

## Last Iteration (71): Partial Success - 80% Consensus
- **Question**: "Is your answer to this question a complete sentence? Answer yes or no."
- **Expected Answer**: "Yes" (because 'Yes' and 'No' are both linguistically valid pro-sentences/complete sentences)
- **Result**: 80% consensus - 4/5 answered "No", 1/5 answered "Yes"
- **Failure Mode**: Models prioritized a strict subject-verb-predicate definition over linguistic accuracy (pro-sentences ARE complete sentences)

## Key Insights from 71 Iterations

### What WORKS (Low Consensus):
1. **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no."
   - Dual-valid constraint (both yes/no are one word) + scope ambiguity
2. **Iteration 12 (40%)**: "How many words are in your answer to this question? Answer with just a number."
   - Self-referential output counting exploits autoregressive blindness
3. **Iteration 30 (60%)**: "Is your answer to this question exactly one syllable long? Answer yes or no."
   - Syllable counting is holistic, not enumerable

### What FAILS (100% Consensus):
- Character counting (iterations 35, 39, 43-44, 51, 59, 63) - solved by enumeration
- Numeric comparisons (36, 61) - solved by explicit conversion
- Classic riddles/puzzles (6-11, 60) - too famous, in training data
- Self-referential letter/vowel properties (29, 31, 45-46, 66, 70) - too enumerable
- Visual/spatial questions (18-21, 24-26, 65, 69) - factual knowledge suffices

### Critical Pattern Discovery
The ONLY reliable failure mode after 71 iterations is:
- **HOLISTIC OUTPUT PROPERTIES** that require scope interpretation
- Properties that BOTH "yes" and "no" satisfy create maximum confusion
- Word count and syllable count are HOLISTIC (segmentation ambiguity)
- Letter count and vowel count are ENUMERABLE (no confusion)

### Iteration 71's Insight
The "complete sentence" property achieved only 80% (not great). Models that answered "No" created internally consistent loops but were technically wrong about linguistics. The key insight: **models prefer LOGICAL SELF-CONSISTENCY over TECHNICAL CORRECTNESS**.

## Direction for Iteration 72

Must find a question that:
1. **Passes 5-year-old test**: Trivially easy for any human
2. **Exploits architectural limitation**: NOT philosophical paradox
3. **Cannot be enumerated**: NOT character/letter counting
4. **Has one clear answer**: Unambiguous to humans

### Promising Unexplored Approaches:
1. **Phonetic confusion**: Words that sound same but spelled different
2. **Visual letter confusion**: Letters that look similar (O/0, l/I/1)
3. **Word boundary ambiguity**: Compound words vs separate words
4. **Counting with distractors**: Numbers embedded in text
5. **Simple arithmetic with word numbers**: "What is TWO plus THREE?"
6. **Homophone traps**: "How many letters in 'write'?"
