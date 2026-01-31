# Research Iteration 8: Novel LLM-Breaking Question

## 1. External Research Findings

### Tavily Search Findings

#### Finding 1: "The Illusion of Thinking" - Complexity Cliff (Apple Research, June 2025)
- **Source**: Apple Machine Learning Research, NeurIPS 2025
- **Key Insight**: Large Reasoning Models (LRMs) exhibit a "reasoning cliff" - they maintain high performance until a specific complexity threshold, then collapse ENTIRELY to near-random guessing
- **Critical Detail**: "The model's inability to perfectly maintain state and exhaust a complex search space autoregressively leads it to mistake its own executional limitations for fundamental impossibilities of the puzzle itself"
- **Implication**: LLMs don't degrade gracefully - they hit a threshold and collapse

#### Finding 2: LLM Omission Bias and Yes-No Bias (PNAS 2025)
- **Source**: pnas.org/doi/10.1073/pnas.2412015122
- **Key Insight**: LLMs have systematic biases:
  1. **Yes-No Bias**: LLMs are biased toward answering "no" in moral dilemmas, flipping their decision based on question wording
  2. **Omission Bias**: LLMs strongly prefer inaction over action (stronger than humans)
- **Critical Quote**: "Unlike humans, most LLMs were biased toward answering 'no' in moral dilemmas, thus flipping their decision/advice depending on how the question is worded"
- **Implication**: Questions can be designed where the wording triggers systematic wrong answers

#### Finding 3: Chain-of-Thought Can HURT Performance
- **Source**: Reddit r/MachineLearning analysis of 18 papers
- **Key Insight**: "In medical diagnosis tasks, 86.3% of models performed *worse* with CoT prompting. They talk themselves out of correct answers"
- **Implication**: Questions where MORE thinking leads to WORSE answers are ideal targets

#### Finding 4: The Candle Test - Pattern Matching Override
- **Source**: Reddit r/LocalLLaMA post with 253 upvotes
- **Test Sequence**:
  1. "Are candles getting taller or shorter when they burn?" (Models answer correctly: shorter)
  2. "Are you sure?" (Models confirm)
  3. "What's tall when young, and taller when old?" (Many models answer "candle" despite just confirming candles get SHORTER)
- **Key Insight**: Pattern matching to riddle templates overrides explicit prior knowledge
- **Implication**: Frame questions as familiar patterns that trigger wrong cached answers

#### Finding 5: Self-Correction Introduces Cognitive Bias (ACL 2025)
- **Source**: aclanthology.org/2025.acl-long.1314.pdf
- **Key Insight**: "Intrinsic self-correction can cause LLMs to waver both intermediate and final answers and lead to prompt bias on simple factual questions"
- **Implication**: Questions that seem like they need "correction" can trigger wrong answers

### Reddit MCP Findings

#### Finding 6: GPT-5 Fails Simple Math (r/LocalLLaMA)
- **Post**: "Qwen 3 0.6B beats GPT-5 in simple math"
- **Key Example**: Solving 5.9 = x + 5.11, GPT-5 without thinking failed
- **Insight**: Floating point and decimal operations remain fragile

#### Finding 7: Reasoning Models Hit Complexity Cliff
- **Post**: "Reasoning models don't degrade gracefully - they hit a complexity cliff and collapse entirely"
- **Key Quote**: "Models solving 10-step reasoning chains at 85% accuracy don't gradually degrade. They maintain that 85% until around step 12, then plummet to near-random guessing by step 15"
- **Comment insight**: "Composition breaks catastrophically - A model with 90% math accuracy and 85% commonsense accuracy drops to 55% when doing both together"

---

## 2. Analysis: What These Findings Mean for Question Design

### Critical Insight 1: Pattern Matching Overrides Explicit Knowledge
The Candle Test is GOLD. Despite models just confirming that candles get shorter, they answer "candle" to the riddle "tall when young, taller when old". This is EXACTLY the failure mode we need.

**Design Principle**: Create questions where a familiar pattern (riddle, puzzle template) triggers a cached wrong answer that contradicts obvious facts.

### Critical Insight 2: Question Wording Flips Answers
The Yes-No bias research shows LLMs can give opposite answers based on how a question is framed. This is NOT about ambiguity - it's about systematic bias.

**Design Principle**: Frame questions in ways that trigger systematic biases.

### Critical Insight 3: CoT Can Make Things WORSE
When models "think harder" about certain questions, they talk themselves OUT of correct answers. This is the opposite of what we've been fighting against.

**Design Principle**: Create questions where the "obvious" answer is correct, but overthinking leads to wrong answers.

### Critical Insight 4: Compositional Reasoning Breaks
When you combine two capabilities (math + commonsense), accuracy drops dramatically. This is the "complexity cliff" in action.

**Design Principle**: Create questions that require simple reasoning across two domains simultaneously.

---

## 3. Candidate Questions

### Candidate A: The Reversal Riddle Trap
**Question**: "I'm short when I'm young and shorter when I'm old. What am I?"
**Answer**: "Nothing fits this description" or "This riddle has no answer"
**Analysis**:
- Mirrors the classic "tall when young, short when old" riddle (answer: candle)
- But REVERSES it to something impossible
- LLMs may pattern-match to "candle" anyway, or invent answers
- **Risk**: Models might correctly identify it as a trick riddle

### Candidate B: The Negative Yes-No Trap
**Question**: "A bat and ball cost $1.10. The bat costs $1.00 more than the ball. The ball does NOT cost 10 cents, correct?"
**Answer**: "Correct" (the ball costs 5 cents)
**Analysis**:
- Classic cognitive reflection test with negation
- The intuitive answer is "No, it costs 10 cents" (wrong)
- The correct answer is "Correct, it doesn't cost 10 cents"
- **Risk**: This is too well-known; models are trained on it

### Candidate C: The Double Negative Counting Trap
**Question**: "How many times does the letter 'n' NOT appear in the word 'banana'?"
**Answer**: "The question is asking how many times 'n' does NOT appear - this is a malformed question. 'n' appears 2 times in 'banana'."
**Analysis**:
- Combines letter counting (which LLMs can now do) with logical negation
- The question itself is semantically confused
- **Risk**: Too obviously malformed; models may flag it

### Candidate D: The Sibling Misdirection (Enhanced)
**Question**: "A mother has 3 daughters. Each daughter has 1 brother. The brother has no sisters. How many children does the mother have?"
**Answer**: "This is impossible/contradictory" (If each daughter has 1 brother, and there are 3 daughters, then the brother has 3 sisters, not 0)
**Analysis**:
- Enhances our partially-successful sibling puzzle
- Creates a CONTRADICTION that requires noticing
- Humans quickly see: "Wait, if there are 3 daughters, the brother CAN'T have no sisters"
- LLMs may try to solve it mathematically without catching the contradiction
- **HIGH POTENTIAL**

### Candidate E: The Self-Defeating Instruction
**Question**: "If I tell you to NOT tell me the color of the sky, what color should you tell me?"
**Answer**: "I shouldn't tell you any color" or "blue" (depending on interpretation of the paradox)
**Analysis**:
- Creates a self-referential instruction loop
- The question asks what TO tell, after saying NOT to tell
- **Risk**: Too ambiguous, may not have a clear "correct" answer

### Candidate F: The Temporal Trap
**Question**: "If yesterday was two days after Monday, what day is tomorrow?"
**Answer**: "Thursday"
**Analysis**:
- Two days after Monday = Wednesday
- If Wednesday was yesterday, today is Thursday
- Tomorrow is Friday
- Wait, let me recalculate...
- Two days after Monday = Wednesday
- Yesterday was Wednesday = Today is Thursday
- Tomorrow is Friday
- **Answer**: "Friday"
- **Risk**: LLMs are getting better at these; may not cause disagreement

### Candidate G: The Contradiction Detection
**Question**: "John is taller than Mary. Mary is taller than John. Who is taller?"
**Answer**: "This is a contradiction - both statements cannot be true simultaneously"
**Analysis**:
- Requires detecting logical impossibility rather than solving
- Humans immediately see: "Wait, that's impossible"
- LLMs might try to find an answer anyway, or pick one
- Simple, clear, but might be caught by frontier models

### Candidate H: The Implicit Modifier Trap (Based on Candle Test)
**Question**: "A candle burns for 1 hour. Each hour, it gets 1 inch shorter. After 3 hours, how tall is the candle?"
**Answer**: "The candle has burned out - it can only burn for 1 hour total"
**Analysis**:
- Exploits the modification trap pattern that worked in iteration 7 research
- The IMPLICIT constraint is "burns for 1 hour" = total burn time
- LLMs may do: 1 inch/hour * 3 hours = 3 inches shorter
- But the candle can only burn 1 hour total!
- **HIGH POTENTIAL** - implicit modification

---

## 4. Final Question Selection

After analyzing all candidates, **Candidate D (Enhanced Sibling Contradiction)** is most promising because:

1. **It builds on iteration 6's partial success** (80% consensus on sibling puzzle)
2. **It requires contradiction detection**, not just computation
3. **Chain-of-thought may make it WORSE** - models will try to solve instead of noticing the impossibility
4. **It's simple enough for any child** - "Wait, if the brother has no sisters but there are 3 daughters... that doesn't work!"
5. **It exploits compositional reasoning failure** - math + logic combined

However, let me also consider **Candidate H (Candle Duration Trap)** which uses IMPLICIT modification that research shows still works.

**DECISION**: I'll go with a refined version of Candidate D because:
- Previous sibling puzzles showed promise (80%)
- Adding an EXPLICIT CONTRADICTION forces detection, not computation
- The Candle Test showed pattern-matching overrides - this could trigger similar "solve mode" instead of "verify mode"

### QUESTION:
"A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters. How many children does the mother have?"

### ANSWER:
"This scenario is impossible/contradictory. If each daughter has 1 brother, and there are 4 daughters, then the brother has 4 sisters, not 0 sisters."

### Why Humans Get It Right:
Humans immediately notice the contradiction through common sense:
- "Each daughter has 1 brother" implies there's a brother
- "4 daughters" means the brother has 4 sisters
- "The brother has no sisters" directly contradicts having 4 sisters
- A child would say: "That doesn't make sense! If there are daughters, the brother HAS sisters!"

### Why LLMs Will Fail:
1. **Pattern Matching to Sibling Puzzles**: LLMs have seen many "siblings" puzzles and are trained to SOLVE them, not detect contradictions
2. **Computational Mode Over Verification Mode**: LLMs will try to calculate (4 daughters + 1 brother = 5 children) without checking if the premises are consistent
3. **Chain-of-Thought Reinforces Error**: More thinking = more attempts to reconcile the irreconcilable
4. **The "No Sisters" Phrase is Processed as a Constraint**: Instead of being detected as contradictory, it may be treated as additional information to work with
5. **Yes-No Bias**: If asked "Is this possible?", LLMs may tend toward "yes" answers

### Predicted Wrong Answers:
- **"5 children"** - Computing 4 daughters + 1 brother without detecting contradiction
- **"4 children"** - Trying to reconcile by saying the brother is one of the daughters (which is absurd)
- **"The brother has 4 sisters"** - Correcting the statement but not calling it impossible
- Attempting to describe various family configurations that don't match all constraints

---

## 5. Alternative Strong Candidate (Backup)

If the contradiction question gets 100% (all models detect it), here's the backup:

### BACKUP QUESTION:
"A candle is 10 inches tall and burns down 2 inches per hour. It can only burn for 3 hours before going out. How tall is the candle after 5 hours?"

### BACKUP ANSWER:
"The candle is 4 inches tall. It can only burn for 3 hours, so it loses 6 inches (2 * 3 = 6), leaving 4 inches, then stops burning."

This exploits:
- **Implicit modification** (the "3 hour limit" constrains the calculation)
- **Pattern matching** to simple rate problems
- **LLMs will likely compute**: 10 - (2 * 5) = 0 inches or "burned out"
- **But the correct answer** respects the constraint that it can ONLY burn 3 hours

---

## 6. Research Synthesis

### Key Learnings from External Research:
1. Apple's "Illusion of Thinking" paper confirms LLMs hit complexity cliffs
2. Yes-No bias is a documented, systematic failure mode
3. Chain-of-thought can actively HURT performance on certain tasks
4. The Candle Test shows pattern matching overrides explicit knowledge
5. Compositional reasoning (combining two simple tasks) causes dramatic accuracy drops

### How This Question Exploits Documented Failures:
- **Compositional reasoning failure**: Combines counting, family relations, AND contradiction detection
- **Pattern matching**: Triggers "sibling puzzle solve mode" instead of "logic verification mode"
- **CoT may hurt**: More thinking = more attempts to reconcile instead of rejecting
- **Complexity cliff**: The contradiction detection is a step beyond simple computation

---

```
FINAL QUESTION: A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters. How many children does the mother have?

CORRECT ANSWER: This scenario is impossible/contradictory. If there are 4 daughters and each has 1 brother, then the brother has 4 sisters, not 0 sisters.
```
