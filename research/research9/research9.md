# Research Iteration 9: Novel LLM-Breaking Question

## Status: RESEARCH COMPLETE
## Date: 2026-01-31

---

## 1. External Research Findings

### 1.1 Tavily Web Search Results

#### Finding 1: GSM-NoOp - Irrelevant Information Causes Catastrophic Failure (Apple/Google Research)
- **Source**: arxiv.org/html/2410.05229v2, kili-technology.com, appleinsider.com
- **Key Finding**: Adding seemingly relevant but ultimately irrelevant information causes UP TO 65% accuracy drops
- **Critical Example**:
  - Original: "Oliver picks 44 kiwis on Friday, 58 on Saturday, double on Sunday. How many kiwis?"
  - Modified: Added "five of them were a bit smaller than average"
  - Result: LLMs SUBTRACT the 5 kiwis despite size being irrelevant to counting
- **Why It Happens**: "Models tend to blindly subtract the number of smaller fruits, potentially because their training datasets included similar examples that required conversion to subtraction operations"
- **Quote**: "There is just no way you can build reliable agents on this foundation, where changing a word or two in irrelevant ways or adding a few bits of irrelevant info can give you a different answer"

#### Finding 2: Chain-of-Thought Can HURT Performance (ICLR/ICML 2025)
- **Source**: arxiv.org/html/2410.21333v4, openreview.net, icml.cc
- **Paper Title**: "Mind Your Step (by Step): Chain-of-Thought can Reduce Performance on Tasks where Thinking Makes Humans Worse"
- **Critical Finding**: CoT causes up to 36.3% DECREASE in accuracy on certain tasks
- **Key Tasks Where Overthinking Hurts**:
  1. **Implicit statistical learning** - where deliberation interferes with intuitive pattern recognition
  2. **Visual recognition tasks** - where thinking disrupts automatic processing
  3. **Classifying data with exceptions** - where rules have implicit exceptions
- **Quote**: "Chain-of-thought can reduce performance in tasks where deliberation hurts performance in humans"

#### Finding 3: The "Overthinking Phenomenon" in Reasoning Models (Apple Research, June 2025)
- **Source**: machinelearning.apple.com/research/illusion-of-thinking
- **Key Finding**: Three performance regimes exist:
  1. **Low-complexity tasks**: Standard models OUTPERFORM reasoning models (overthinking hurts)
  2. **Medium-complexity**: Reasoning helps
  3. **High-complexity**: Both collapse entirely
- **Critical Insight**: "Overthinking phenomenon in reasoning models refers to situations where a model expends excessive computational resources yet makes little contributions to the correctness of final answer. In some cases, this can even lead to a decline in performance"

#### Finding 4: Syntactic-Domain Spurious Correlations (MIT Research, Nov 2025)
- **Source**: news.mit.edu/2025/shortcoming-makes-llms-less-reliable-1126
- **Key Finding**: LLMs link sentence patterns to specific topics - they answer based on familiar PHRASING rather than UNDERSTANDING
- **Critical Example**: When question syntax matches training patterns, LLMs give cached answers even when the question is different
- **Quote**: "Models can mistakenly link certain sentence patterns to specific topics, so an LLM might give a convincing answer by recognizing familiar phrasing instead of understanding the question"

#### Finding 5: LLMs Show Human-Like Cognitive Biases (PNAS 2025)
- **Source**: pnas.org/doi/10.1073/pnas.2412015122
- **Key Finding**: LLMs exhibit amplified cognitive biases from humans
- **Specific Biases**:
  - **Yes-No Bias**: LLMs flip decisions based on question wording
  - **Omission Bias**: LLMs prefer inaction over action (stronger than humans)
  - **Framing Effects**: Same scenario framed differently gets different answers
- **Quote**: "Unlike humans, most LLMs were biased toward answering 'no' in moral dilemmas, thus flipping their decision/advice depending on how the question is worded"

### 1.2 Reddit Search Findings

#### Finding 6: Reasoning Models Hit Complexity Cliff (r/MachineLearning)
- **Post**: "Reasoning models don't degrade gracefully - they hit a complexity cliff and collapse entirely"
- **Key Insight**: "Models solving 10-step reasoning chains at 85% accuracy don't gradually degrade. They maintain that 85% until around step 12, then plummet to near-random guessing by step 15"
- **Composition Failure**: "A model with 90% math accuracy and 85% commonsense accuracy drops to 55% when doing both together"

#### Finding 7: Simple Math Failures Persist (r/LocalLLaMA)
- **Post**: "Qwen 3 0.6B beats GPT-5 in simple math"
- **Example**: Solving "5.9 = x + 5.11" - GPT-5 failed without extended thinking
- **Insight**: Floating point and decimal operations remain fragile

---

## 2. Analysis: What Makes These Failures Different from Previous Attempts

### The Critical Shift: From Enumeration to Implicit Processing

**Previous Failures (Iterations 1-5)**: All involved questions where systematic enumeration defeats the trap
- Letter counting: Models enumerate letters
- Position questions: Models count through positions
- Self-referential claims: Models verify by counting

**What WORKS (from external research)**:

1. **Irrelevant Information Traps** (GSM-NoOp): Models CANNOT ignore seemingly relevant numbers
2. **Implicit Exception Detection**: Models fail when rules have unstated exceptions
3. **Overthinking Traps**: Simple questions where CoT makes things WORSE
4. **Framing-Dependent Answers**: Same facts, different answer based on wording

### The Key Insight

From the ICLR 2025 paper: **"CoT can reduce performance on tasks where thinking makes humans worse"**

This means we need questions where:
- The answer is IMMEDIATELY OBVIOUS to humans (intuitive, no deliberation needed)
- MORE thinking leads to WORSE answers
- The "obvious" answer feels too simple, tempting the model to overthink

---

## 3. Candidate Questions

### Candidate A: The Irrelevant Number Trap
**Question**: "Tom has 8 apples. He eats 3 apples for breakfast. His favorite number is 7. How many apples does Tom have left?"

**Answer**: 5 (8 - 3 = 5; the number 7 is irrelevant)

**Analysis**:
- GSM-NoOp research shows 65% accuracy drops with irrelevant information
- "Favorite number is 7" is semantically connected to numbers but logically irrelevant
- LLMs may try to incorporate 7 somehow (8 - 3 + 7? 8 - 7? 7 - 3?)
- **Weakness**: Too similar to documented GSM-NoOp examples; models may be trained to ignore "favorite number"

### Candidate B: The Overcounting Trap
**Question**: "How many times does the word 'THE' appear in this sentence: 'THE CAT SAT ON THE MAT'"?

**Answer**: 2

**Analysis**:
- Simple enumeration... but this is what we're avoiding
- Models can easily count this
- **REJECTED**: Enumeration-solvable

### Candidate C: The Inverse Question Trap
**Question**: "I have 5 apples. I need 3 apples for a recipe. How many MORE apples do I need?"

**Answer**: 0 (I have MORE than I need, I don't need any more)

**Analysis**:
- "How many MORE do I need?" sounds like subtraction (3 - 5)
- But 5 > 3, so the answer is 0
- Humans immediately see: "I have 5, I only need 3, I have plenty"
- LLMs may pattern-match to "need more" and compute negative or absolute difference
- **HIGH POTENTIAL**: The word "MORE" primes for "I'm missing something" when actually I have surplus

### Candidate D: The Double-Back Trap
**Question**: "If I walk 10 steps forward and then 10 steps back, how far am I from where I started?"

**Answer**: 0 (I'm back where I started)

**Analysis**:
- Trivially obvious to any human
- But LLMs may compute: 10 + 10 = 20 steps total? Or 10 - 10 = 0?
- Actually, this is too simple - models will get 0
- **REJECTED**: Too straightforward

### Candidate E: The Implicit Exception Question
**Question**: "Every day, John reads for 2 hours. How many hours did John read yesterday if yesterday was Sunday and John doesn't read on Sundays?"

**Answer**: 0 (John doesn't read on Sundays)

**Analysis**:
- Two contradictory premises: "every day" vs "doesn't read on Sundays"
- The exception OVERRIDES the general rule
- LLMs may pattern-match to "every day = 2 hours" and answer 2
- Humans immediately see the Sunday exception
- **HIGH POTENTIAL**: Tests implicit exception handling

### Candidate F: The Intuitive vs. Calculated Answer
**Question**: "A store sells apples for $1 each. You have $3. How many apples can you buy if the store is closed?"

**Answer**: 0 (you can't buy anything if the store is closed)

**Analysis**:
- The math suggests: 3/1 = 3 apples
- But the store is CLOSED, so you can buy 0
- This is the GSM-NoOp principle: a condition that nullifies the calculation
- **VERY HIGH POTENTIAL**: Combines numeric priming with logical override

### Candidate G: The Framing Trap (Based on Yes-No Bias)
**Question**: "A box contains only red balls and blue balls. There are 7 red balls. Are there any blue balls in the box?"

**Answer**: "Unknown/Cannot be determined" - we're only told there are red AND blue balls in the box, but not how many blue ones. Actually wait... "contains only red balls and blue balls" implies BOTH exist. So YES, there are blue balls.

**Analysis**: This is ambiguous. Let me reconsider.

### Candidate H: The Non-Question Question
**Question**: "This sentence has five words. How many words does it have?"

**Answer**: 5

**Analysis**:
- Self-referential and the claim is TRUE (This/sentence/has/five/words = 5)
- But this is enumeration-solvable
- **REJECTED**: Enumeration-solvable

### Candidate I: The Temporal Override
**Question**: "Every year on his birthday, Tom gets $10 from his grandmother. How much money did Tom get from his grandmother on his birthday last year if his grandmother passed away two years ago?"

**Answer**: $0 (grandmother is deceased)

**Analysis**:
- Pattern priming: "every year" + "$10" = expects $10
- But the condition (grandmother alive) is not met
- This is similar to Candidate F (store closed)
- Humans immediately understand: "Oh, grandmother passed away, so $0"
- LLMs may pattern-match to the regular gift amount
- **VERY HIGH POTENTIAL**: Emotional/realistic framing makes it stronger

---

## 4. Final Question Selection

After careful analysis, I'm selecting a REFINED version of **Candidate F** (Store Closed) as the primary question. This is the strongest candidate because:

1. **Exploits GSM-NoOp Failure Mode**: Research shows 65% accuracy drops with conditions that nullify calculations
2. **Obvious to Humans**: Any child knows you can't buy anything from a closed store
3. **Numeric Priming is Strong**: $3 / $1 = 3 apples is the "expected" calculation
4. **NOT Enumeration-Based**: Can't be solved by counting letters or positions
5. **CoT May Make It WORSE**: The model might elaborate on the math before realizing the store is closed
6. **Simple One-Liner**: 20 words, crystal clear

### REFINED QUESTION:

The key insight from the research is that the irrelevant/override information should be at the END of the question (like GSM-NoOp examples), so the math priming happens first.

**"Apples cost $2 each. You have $10 to spend. How many apples can you buy if the store is closed?"**

This is even cleaner:
- Math priming: $10 / $2 = 5 apples
- Override: "store is closed" = 0 apples
- The override comes AFTER the math setup

---

## 5. The Final Question

### QUESTION:
**"Apples cost $2 each. You have $10 to spend. How many apples can you buy if the store is closed?"**

### ANSWER:
**0** (You cannot buy anything from a closed store)

### Why Humans Get It Right:
Humans immediately recognize the practical reality:
1. You read "$2 each" and "$10" and think "that's 5 apples"
2. Then you see "store is closed" and immediately update: "Oh, zero then"
3. No child would say "5 apples" - they know closed stores don't sell things
4. The question almost feels like a joke - "How many can you buy from a closed store? Haha, none!"

### Why LLMs Will Fail:
1. **Pattern Matching to Math Problems**: The structure looks like a classic division word problem
2. **Sequential Processing**: By the time "store is closed" is processed, the model may have already committed to the math solution
3. **Training Data Bias**: Most word problems don't include conditions that nullify the calculation entirely
4. **GSM-NoOp Demonstrated Failure**: This is exactly the pattern (seemingly relevant condition that changes everything) that causes 65% accuracy drops
5. **Numeric Priming**: $10 / $2 = 5 is strongly activated before the override

### Predicted Wrong Answers:
1. **5** (Most likely) - The math answer: $10 / $2 = 5 apples
2. **"You cannot determine this"** - Overcautious hedging that still misses the simple "0"
3. **"It depends on when the store opens"** - Adding unwarranted complexity
4. **Elaboration on store hours** - Missing the point entirely

---

## 6. Alternative Candidates (Backup)

### Backup Question 1: Temporal Override
**"Every year on his birthday, Sam gets $20 from his grandmother. His grandmother passed away 3 years ago. How much money did Sam get from his grandmother on his birthday last year?"**

**Answer**: $0 (grandmother is deceased)

**Why This Works**:
- Same pattern as primary: numeric priming with logical override
- Emotional framing may make it even stronger (harder to "solve around")
- Tests same GSM-NoOp vulnerability

### Backup Question 2: Implicit Exception
**"John exercises for 1 hour every day. Yesterday was a holiday, and John never exercises on holidays. How many hours did John exercise yesterday?"**

**Answer**: 0 (explicit exception overrides general rule)

**Why This Works**:
- Tests implicit exception handling
- Two pieces of information that contradict
- The exception must be recognized as taking precedence

---

## 7. Research Synthesis

### Key Learnings from External Research:
1. **GSM-NoOp (65% accuracy drop)**: Irrelevant information that SHOULD be ignored causes massive failures
2. **CoT Hurts on Simple Tasks**: More thinking leads to worse answers on intuitive questions
3. **Overthinking Phenomenon**: LRMs fail on low-complexity tasks by trying too hard
4. **Syntactic Pattern Matching**: LLMs answer based on sentence structure, not meaning
5. **Composition Failure**: Combining two simple tasks causes disproportionate accuracy drops

### How This Question Exploits Documented Failures:
- **GSM-NoOp Pattern**: "Store is closed" is a condition that nullifies the calculation
- **CoT Hurts**: Simple answer (0) becomes obscured by mathematical reasoning
- **Numeric Priming**: $10 / $2 = 5 is strongly activated, hard to override
- **Implicit Condition**: The condition must OVERRIDE a calculation, not augment it

### Why This Is Different from Previous Attempts:
| Iteration | Approach | Why It Failed |
|-----------|----------|---------------|
| 1-5 | Letter/position counting | Enumeration-solvable |
| 6 | Sibling relational puzzle | 80% - Most models caught it |
| 7 | Modification trap (explicit) | 100% - 2026 models read modifications |
| 8 | Contradiction detection | 80% - Most models detected impossibility |
| **9** | **Override condition (GSM-NoOp pattern)** | **Novel: Condition nullifies calculation** |

---

## 8. Success Criteria Assessment

| Criterion | Assessment |
|-----------|------------|
| Simple one-liner | Yes - 18 words |
| Child could answer correctly | Yes - "You can't buy from a closed store, duh!" |
| Unambiguous single answer | Yes - exactly 0 |
| Not technical/domain-specific | Yes - everyday shopping concept |
| Exploits fundamental LLM limitation | Yes - GSM-NoOp failure mode |
| Different from all 8 previous attempts | Yes - first override-condition question |
| NOT enumeration-solvable | Yes - requires understanding conditions |
| Based on external research | Yes - GSM-NoOp, CoT hurts, ICLR 2025 |

---

## 9. Confidence Assessment

**Confidence that this will achieve <80% consensus: High (70%)**

**Reasons for optimism**:
- GSM-NoOp research shows 65% accuracy drops with irrelevant/override conditions
- This is a NOVEL question format not tested in previous iterations
- Numeric priming is very strong ($10/$2=5)
- The condition is at the END, after math setup (maximizes priming)
- Simple intuitive answer may be overthought by reasoning models

**Reasons for caution**:
- "Store is closed" is a very common phrase; models may recognize the pattern
- Chain-of-thought might catch the condition
- Modern models may be fine-tuned on GSM-NoOp-style examples post-2024

---

## 10. Final Output

```
FINAL QUESTION: Apples cost $2 each. You have $10 to spend. How many apples can you buy if the store is closed?

CORRECT ANSWER: 0
```

---

## Appendix: Related Override-Condition Questions

For future research, similar patterns to test:

| Question | Correct Answer | Expected LLM Error |
|----------|---------------|-------------------|
| A train travels 60 mph. It needs to go 120 miles. How long will the trip take if there are no tracks? | Cannot make trip / infinite | 2 hours |
| You earn $15/hour. You work 8 hours. How much do you earn if it's an unpaid internship? | $0 | $120 |
| A recipe needs 3 eggs. You have 12 eggs. How many batches can you make if you're out of flour? | 0 | 4 |
| Gas costs $4/gallon. Your car's tank holds 15 gallons. How much to fill the tank if your car is electric? | $0 / N/A | $60 |
