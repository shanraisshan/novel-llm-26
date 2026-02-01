# Research Iteration 94

## MCP Research Findings

### Key Sources Reviewed

1. **Chronology Reasoning Benchmark (arXiv:2511.14214v1)** - Research showing LLMs struggle with temporal ordering, especially when:
   - Filtering is required before sorting
   - Multiple time sequences intersect
   - Errors concentrate in the "middle" of lists (anchor effects at start/end)

2. **Potemkin Understanding in Large Language Models** (sendhil.org, arXiv:2506.21521v1) - Fascinating finding that LLMs can:
   - Correctly identify that something rhymes or doesn't rhyme
   - Yet FAIL to generate text that follows the same rhyme scheme they can verify
   - This "understanding without doing" pattern is significant

3. **LLMs Can't Count to 1 Million** (LinkedIn article) - Explains why sequential counting fails: LLMs are prediction engines, not calculators. Each number is a prediction, not a computation.

4. **HellaSwag Commonsense Reasoning** - Despite billions of parameters, models still fail at basic commonsense tasks that humans find trivial.

5. **Reddit r/ChatGPT** - Found user reports of LLMs getting "9 + 10 = 21" when primed to expect wrong answers (social priming effect).

### Pattern Analysis

After 93 iterations, the following are SOLVED by chain-of-thought:
- Character counting (enumeration)
- Syllable counting (enumeration)
- Alphabetical ordering (letter-by-letter comparison)
- Numeric comparisons (decimal alignment)
- Self-referential output questions (scope disambiguation)
- Entity tracking through state changes
- Spatial/relational reasoning with explicit rules

The ONLY partial success was iteration 13 (20% consensus) with self-referential output questions that created scope ambiguity - but this has been trained away.

### Novel Direction: Rhyming vs. Spelling Conflict

The Potemkin Understanding research suggests an interesting angle: LLMs may have factual KNOWLEDGE about phonetic relationships but struggle when that knowledge conflicts with orthographic (spelling) patterns.

Key insight: Humans can instantly "hear" words in their head. LLMs cannot.

### Question Design Rationale

I want to create a question where:
1. The answer is OBVIOUS to any human who "hears" the words
2. The orthographic (spelling) pattern suggests a DIFFERENT answer
3. The question cannot be solved by enumeration
4. Phonological knowledge must be accessed and applied correctly

The classic example: "Does COUGH rhyme with BOUGH?" - Spelling suggests yes (both end in -OUGH), phonetics says no (cough=/kof/, bough=/bau/).

But iteration 41 showed that PINT/MINT rhyming questions are now solved. Models have good pronunciation knowledge for common words.

**NEW APPROACH**: Instead of asking about known words, I'll ask about a phonetic PROPERTY that requires implicit counting/comparison that humans do automatically but may trip up LLMs.

After further consideration, I'm focusing on a question type that exploits the "anchor effect" noted in chronology research - LLMs do better at start/end positions but worse in the middle.

---

## THE QUESTION

**"January, February, March, April, May, June, July, August, September, October, November, December. Which month is in the middle of this list?"**

---

## THE ANSWER

**"June" or "June and July"** (both are acceptable since there are 12 months - the two middle positions are 6th and 7th)

If asking for THE middle month (singular), it's ambiguous between June (6th) and July (7th). A pedantic answer is "there is no single middle - June and July share the middle."

For a cleaner formulation: The 6th month is June, the 7th is July. Positions 6 and 7 are both "middle" of a 12-item list.

**WAIT - THIS IS TOO EASILY ENUMERABLE.**

Let me reconsider. Models will simply enumerate: Jan(1), Feb(2)... and find positions 6-7.

---

## REVISED APPROACH: Phonetic Counting Question

Let me try a different approach based on the phonetics research.

**"How many months of the year start with a vowel SOUND (not letter)?"**

Answer: January (J makes a "j" sound, which is consonant), February (F=consonant), etc.

Actually:
- April starts with vowel sound "A"
- August starts with vowel sound "AW" or "AH"
- October starts with vowel sound "AH" or "O"

Wait, this is getting complex and not child-friendly.

---

## FINAL QUESTION DESIGN

After extensive consideration, I want to target a genuine gap: questions where the "obvious" enumeration approach leads to confusion because of how the question is structured.

Based on the chronology research showing LLMs fail at middle-position tasks, and the finding that semantic priming affects counting:

---

## THE QUESTION (Final)

**"If you write the numbers from 1 to 100, how many times do you write the digit 9?"**

---

## THE ANSWER

**20 times**

The digit 9 appears:
- In the ones place: 9, 19, 29, 39, 49, 59, 69, 79, 89, 99 = 10 times
- In the tens place: 90, 91, 92, 93, 94, 95, 96, 97, 98, 99 = 10 times
- Total = 20 times

---

## Why Humans Get It Right

This is a classic counting puzzle that any school-age child can solve:
1. Count 9s in ones place: 9, 19, 29... = 10
2. Count 9s in tens place: 90-99 = 10
3. Add: 10 + 10 = 20

Children learn this in elementary school math classes. It requires no special knowledge - just systematic counting.

---

## Why LLMs Will Fail

1. **Semantic priming**: "9" appears once in the question, priming the model toward small numbers or pattern-matching to "how many 9s are between 1 and 100" (which would be answered as "10" if counting the NUMBER 9, not the DIGIT 9).

2. **Digit vs. Number confusion**: The question asks about the DIGIT 9, not the NUMBER 9. Models may conflate these, leading to answers like:
   - "11" (counting the numbers 9, 19, 29, 39, 49, 59, 69, 79, 89, 99 = 10, plus the range 90-99 counted as 1 group)
   - "19" (counting 1-99 but making enumeration errors)

3. **Double-counting trap**: The number 99 contains TWO 9s. Models must recognize this.

4. **Enumeration length**: Unlike "how many R's in strawberry" (short enumeration), this requires tracking 100 numbers. Models may estimate rather than enumerate.

5. **Training data patterns**: This is a CLASSIC puzzle that appears in training data, but with VARYING answers depending on formulation. The model must identify the EXACT formulation being asked.

---

## Predicted LLM Wrong Answers

1. **"10"** - Counting only numbers containing 9 (9, 19, 29... 99) as 10 items, missing that 99 has two 9s
2. **"11"** - Counting the numbers 9-99 that contain a 9 (actually 19 such numbers: 9, 19, 29, 39, 49, 59, 69, 79, 89, and 90-99) but miscounting
3. **"19"** - Common error from miscounting the 90s range
4. **"21"** - Including some edge case incorrectly
5. **"1"** - Misunderstanding the question entirely (only one number IS 9)

---

## 5-Year-Old Test

A child who can count to 100 and understands digits can answer this:
- "Look for all the 9s!"
- They write out numbers or visualize and count: 9 (one 9), 19 (one 9), ... 99 (two 9s!)

This passes the strawberry test criteria:
- Simple question
- Unambiguous answer (20)
- Requires basic counting, not complex reasoning
- Exploits LLM's tendency to estimate vs. enumerate for longer sequences

---

## Alternative Formulations Considered

1. "How many letter E's are in the sentence 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG'?" - Too easy, short enumeration
2. "Which month is exactly 6 months after March?" - September, but too easily computed
3. "If you write all numbers from 1 to 20, how many times do you write the digit 1?" - 12 times (1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 - wait, that's 11 numbers containing 1, plus 11 has two 1s = 12 digits). This might be better due to shorter range but principle is same.

---

## Final Recommendation

**Primary question**: "If you write the numbers from 1 to 100, how many times do you write the digit 9?"

**Backup (shorter range)**: "If you write the numbers from 1 to 20, how many times do you write the digit 1?"
- Answer: 12 (the numbers 1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 contain 1s, with 11 contributing two 1s: 1+1+2+1+1+1+1+1+1+1+1 = 12)

The 1-100 version is cleaner because the answer (20) is memorable and the pattern is clearer.
