# Previous Research Summary for Iteration 60

## Last Completed: Research 59

**Question**: How many times does the letter 'a' appear in 'abracadabra'?
**Answer**: 5
**Score**: 100% (all models correct)
**Status**: need_more_research

**Insight**: Despite having 5 occurrences of 'a' (highest multiplicity tested), all 5 models correctly enumerated and counted. The chain-of-thought approach of spelling out a-b-r-a-c-a-d-a-b-r-a worked reliably for all frontier models.

---

## Key Historical Findings (What Works/Fails)

### BEST RESULTS (Low Consensus = Success)
- **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no." - Self-referential output property with dual-valid constraint
- **Iteration 55 (40%)**: "Answer with just ONE word: What is the fifth word of your response?" - Impossibility constraint
- **Iteration 30 (60%)**: "Is your answer to this question exactly one syllable long?" - Dual-valid property (both yes/no are one syllable)
- **Iteration 33 (60%)**: "What is the third word of your response?" - Open-ended output prediction

### FAILURES (100% Consensus - Models Solve Easily)
- Simple character counting (strawberry, possess, abracadabra) - CoT enumeration solves
- Numeric comparisons - models normalize decimals
- Spatial reasoning - models convert to position math
- Age riddles - models recognize constant age gaps
- Classic puzzles with modifications - models READ modifications carefully
- False presuppositions - models reject impossible constraints

### WRONG DIRECTION (Iteration 58 Warning)
Constraint impossibility paradoxes (e.g., "Answer with exactly THREE words: What is the fourth word?") were flagged as NOT meeting strawberry criteria - they're not easy for humans either.

---

## What We've Learned

### Self-Referential Output Questions Work Best When:
1. **Dual-valid constraint**: Both yes/no satisfy the property (e.g., both are one word, both are one syllable)
2. **Scope ambiguity**: "Your answer" can be interpreted as either the yes/no word OR the full response with explanation
3. **Training bias conflict**: Models are trained to explain, but the property only applies to the constrained answer

### Character Counting Doesn't Work Because:
- 2026 frontier models use chain-of-thought enumeration
- They spell out words character by character
- Even high-multiplicity words (5 a's in abracadabra) are counted correctly

---

## Categories Still Unexplored

1. **Ambiguous reference questions** (which thing is being asked about?)
2. **Counting under distraction** (question embeds misleading numbers)
3. **Cross-property questions** (e.g., comparing letters between two words)
4. **Order/sequence counting** (e.g., which comes first alphabetically by last letter?)

---

## Mission Reminder

**STRAWBERRY CRITERIA**:
- Simple one-liner a child could understand
- Unambiguous correct answer
- Exploits LLM architectural limitations (tokenization, autoregression)
- NOT philosophical paradoxes or constraint impossibilities

**TARGET**: < 10% consensus among 5 independent AI researchers
