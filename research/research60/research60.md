# Research Iteration 60: Cognitive Reflection Test (CRT) Style Question

## Executive Summary

This iteration explores **Cognitive Reflection Test (CRT) style questions** - a class of problems with strong research backing showing humans often give intuitive-wrong answers, but the correct answer is trivially verifiable once pointed out. The key insight from external research is that while modern LLMs have been trained extensively on the FAMOUS CRT questions (bat/ball, lily pad, widgets), they may still fall for NOVEL variations that exploit the same cognitive trap but with different surface features.

The research approach is to create a **fresh CRT-style question** that:
1. Has an intuitive-but-wrong answer that "feels right"
2. Has a simple, mathematically correct answer verifiable by any child with basic arithmetic
3. Uses novel surface features not in training data

---

## External Research Conducted

### Source 1: arXiv - "Illusions of reflection: open-ended task reveals systematic failures in LLMs"

Key findings:
- LLMs were tested on generating valid CRT items (trick questions with intuitive-wrong answers)
- **85.36% of the time**, when LLMs failed and were given a chance to reflect, they **repeated the same mistake**
- The bat/ball problem is specifically cited: intuitive answer is "10 cents" but correct answer is "5 cents"
- LLMs show "system 1" like behavior - defaulting to intuitive responses without proper verification

### Source 2: Nature - "Human-like intuitive behavior and reasoning biases"

Key findings:
- LLMs exhibit **human-like cognitive biases** including intuitive reasoning traps
- "LLMs' intuitive responses can only stem from a system-1-like process" - they lack the architecture for deliberate System 2 reasoning
- The lily pad doubling problem is cited: if it takes 48 days to cover a lake, how long to cover half? Intuitive: 24, Correct: 47

### Source 3: arXiv - "Easy Problems That LLMs Get Wrong"

Key findings:
- LLMs frequently **overfit to famous puzzle versions** in training data
- When puzzles are **modified**, LLMs often solve the original version instead
- "Popular science" type questions with intuitive traps show consistent failures

### Source 4: LessWrong - "Surprising LLM reasoning failures"

Key findings:
- Even tasks LLMs "should" solve based on their other capabilities often fail
- Simple variations on known problems can reveal blind spots
- The failure mode is NOT insufficient math ability, but pattern matching to wrong templates

### Source 5: ICLR 2026 - "Vision-Language Models Can't Even Count to 20"

Key findings:
- Even multimodal models fail at simple counting tasks
- **44.4% accuracy gap** between best models and adult humans on simple perceptual tasks
- "Most frontier MLLMs perform below the level of an average 3-year-old child"

---

## The Question

**A farmer has a field that produces 100 bushels of wheat per year. Each year, she plants seeds that double her yield for the next year. After 5 years of planting these seeds, how many bushels does she get in year 5?**

Wait - this is too complex and potentially ambiguous. Let me design something simpler.

---

## Revised Question Design

Looking at the CRT research, the most effective questions have:
1. **Clear, simple setup** a child understands
2. **Obvious intuitive answer** that's mathematically wrong
3. **Simple arithmetic** to verify correct answer

### The Winning Question

**"A farmer has 10 sheep. All but 9 run away. How many sheep does the farmer have left?"**

---

## The Question

**A farmer has 10 sheep. All but 9 run away. How many sheep does the farmer have left?**

---

## The Answer

**9 sheep**

---

## Why Humans Get It Right

Humans process this question in two ways:

1. **Literal parsing**: "All but 9" means "all except 9" - so 9 sheep remain
2. **Quick verification**: If 9 sheep remain, then only 1 ran away (10 - 1 = 9). This checks out.

A 5-year-old can understand this:
- "All but 9 run away" = "9 didn't run away"
- "How many left?" = "9"

The question is phrased as a classic riddle that children encounter regularly, making it culturally familiar and intuitive to parse correctly for humans.

---

## Why LLMs Will Fail

### Primary Failure Mode: Arithmetic Pattern Matching

LLMs may pattern-match to the structure:
- "has 10 sheep"
- "X run away"
- "how many left?" = 10 - X

The phrase "all but 9" creates ambiguity in parsing:
1. **Correct interpretation**: "all but 9" = "all except 9" = 9 remain
2. **Wrong interpretation**: "all but 9" triggers subtraction pattern = 10 - 9 = 1

### Why This Is Different from Previous Iterations

Unlike iterations 1-59 which tested:
- Character counting (solved by enumeration)
- Self-referential output (philosophical)
- Spatial reasoning (solved by position math)
- Numeric comparisons (solved by alignment)

This question exploits:
1. **Idiomatic phrase parsing**: "all but X" is an English idiom meaning "all except X"
2. **Arithmetic pattern priming**: The setup (10 sheep, X run away, how many left) primes subtraction
3. **Conflicting signals**: The idiom says "9 stay" but the math pattern says "subtract"

### Research Support

From the Nature paper: "LLMs exhibit human-like cognitive biases" but lack deliberate verification. The "all but 9" phrase is an **idiomatic expression** that may be tokenized and processed differently than the literal mathematical meaning.

From arXiv "Easy Problems": LLMs default to "solutions corresponding to the original versions of these puzzles found online" - they may pattern-match to a generic "sheep running away" template.

---

## Predicted Wrong Answers

### Most Likely Wrong Answer: **1 sheep**

Reasoning path that leads here:
1. Parse "all but 9 run away"
2. Interpret as "9 run away" (misreading "all but 9" as the QUANTITY that ran away)
3. Calculate: 10 - 9 = 1

### Alternative Wrong Answer: **10 sheep**

Reasoning path:
1. Get confused by the phrasing
2. Assume it's a trick question
3. Answer "still 10" (none actually ran away)

### Why "1" Is Most Likely

The phrase "all but 9" is unusual. More common phrasings would be:
- "All except 9 run away" (clearer)
- "1 sheep runs away" (direct)
- "9 sheep remain" (result-oriented)

The unusual "all but X" construction, combined with the subtraction-primed setup, creates maximum confusion.

---

## The 5-Year-Old Test

**Can a 5-year-old answer this correctly?**

YES - This is a classic children's riddle. When you tell a child "all but 9 run away," they immediately understand that 9 sheep are left. The phrase "all but" is commonly used in children's language ("I ate all but one cookie" = "I have one cookie left").

**Is the answer unambiguous?**

YES - "All but 9" has exactly one meaning in English: "all except 9" = 9 remain.

**Does it exploit LLM architectural limitations?**

YES - It exploits:
1. Tokenization of idiomatic phrases
2. Pattern matching to arithmetic templates
3. Lack of true semantic understanding of English idioms

---

## Comparison to Best Previous Results

| Iteration | Question Type | Score | Why It Worked/Failed |
|-----------|--------------|-------|---------------------|
| 13 | Self-referential output | 20% | Scope ambiguity in "your answer" |
| 55 | Constraint impossibility | 40% | Meta-constraint paradox (wrong direction) |
| 30 | Self-referential syllable | 60% | Dual-valid property |
| 59 | Character counting | 100% | CoT enumeration solves it |

**This question (60)** targets a completely different failure mode:
- NOT self-referential
- NOT character counting
- NOT constraint impossibility
- IS idiomatic phrase parsing + arithmetic pattern conflict

---

## Hypothesis

Based on external research showing:
1. LLMs fail 85% of time to correct CRT-style mistakes on reflection
2. "All but X" is an idiomatic phrase that may be processed incorrectly
3. The arithmetic setup (10 sheep, X run away, how many left) primes subtraction

**Predicted consensus**: 40-60%

If models parse "all but 9" correctly as "9 remain", they get it right.
If models parse "all but 9" as "9 ran away" and subtract, they get "1".

The idiomatic nature of "all but" combined with the arithmetic priming should create disagreement.

---

## Alternative Questions Considered

### Option 2: "How many months have 28 days?"
- Answer: All 12 months have at least 28 days
- Problem: Too well-known, likely in training data

### Option 3: "A doctor gives you 3 pills and says to take one every half hour. How long do the pills last?"
- Answer: 1 hour (take one at 0 min, one at 30 min, one at 60 min)
- Intuitive wrong answer: 1.5 hours
- Problem: Requires time reasoning, may be too complex

### Option 4: "If you have a bowl with 6 apples and you take away 4, how many apples do YOU have?"
- Answer: 4 (you took them)
- Problem: Pronoun reference ambiguity may confuse humans too

The sheep question was selected because:
1. Clearest idiomatic trap ("all but X")
2. Simplest arithmetic (no time reasoning needed)
3. Unambiguous correct answer
4. Classic riddle format familiar to children

---

## Summary

**Question**: A farmer has 10 sheep. All but 9 run away. How many sheep does the farmer have left?

**Answer**: 9 sheep

**Human approach**: Parse "all but 9" as "all except 9" = 9 remain

**LLM failure mode**: Parse "all but 9" as quantity that ran away, calculate 10 - 9 = 1

**Exploited limitation**: Idiomatic phrase processing + arithmetic pattern matching

**5-year-old test**: PASS - classic children's riddle

**Predicted wrong answer**: 1 sheep

**Predicted consensus**: 40-60% (substantial disagreement expected)
