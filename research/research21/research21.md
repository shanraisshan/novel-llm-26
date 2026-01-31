# Research Iteration 21: Novel LLM-Breaking Question

## External Research Findings

### Source 1: Pragmatic Inference and Scalar Implicature Failures
**Source**: ACL 2025, arXiv papers on implicature (aclanthology.org/2025.findings-acl.1218.pdf, arxiv.org/html/2510.25426v1)

Key findings:
- LLMs struggle with **pragmatic inference** - understanding implied meanings beyond literal content
- Scalar implicatures (where "some" implies "not all") are a documented failure mode
- LLMs often default to **semantic/literal interpretation** when pragmatic reasoning is required
- Research shows LLMs have "literalism in implicature" - they take statements at face value rather than inferring contextual meaning

### Source 2: "Unpuzzles" - LLMs Fail When Problems Are Made EASIER
**Source**: arXiv:2507.07313v1 "Frontier LLMs Still Struggle with Simple Reasoning Tasks"

Critical insight:
- LLMs exhibit **"reasoning delirium"** - they "overthink" easy problems by reusing reasoning steps from harder versions
- Making problems EASIER (not harder) can cause LLM failure
- LLMs pattern-match to complex solutions when simple answers suffice
- This is fundamentally different from enumeration-solvable problems

### Source 3: Alice in Wonderland - Simple Tasks Break SOTA Models
**Source**: OpenReview ICLR 2025 "Alice in Wonderland: Simple Tasks Reveal Severe Generalization Deficits"

Key findings:
- Very simple common sense problems break ALL state-of-the-art LLMs
- Models score high on benchmarks but fail at basic reasoning
- The failures are NOT exposed by standard evaluation procedures

### Source 4: Easy Problems That LLMs Get Wrong
**Source**: arXiv:2405.19616v1 and llm-quiz.com

Key findings:
- LLMs default to solutions for ORIGINAL versions of puzzles found online
- Modified versions (made easier) cause failures through **overfitting to training corpus**
- 38% accuracy on modifications vs 86% human accuracy
- The modification trap works best when modifications make problems TRIVIALLY easy

### Source 5: Multi-Agent and Ambiguity Failures
**Source**: ACL 2025, OpenReview papers on disambiguation

Key findings:
- LLMs struggle with questions that have **multiple valid interpretations**
- When questions are ambiguous, LLMs often give biased single answers
- However, questions with ONE clear correct answer should be the focus (per our constraints)

## Analysis: The "Overthinking" Failure Mode

Based on this research, I've identified a promising failure mode that:
1. Is NOT solvable by enumeration
2. Does NOT involve self-reference
3. Has ONE objectively correct answer
4. Humans find trivially easy
5. LLMs fail due to pattern-matching to complex solutions

The key insight from the "Unpuzzles" research is that LLMs experience **"reasoning delirium"** - when presented with a problem that LOOKS like a famous puzzle but is actually trivially simple, they import complex reasoning steps from the original puzzle.

## Question Design Strategy

I will exploit the **"overthinking"** failure mode by:
1. Using a structure that resembles a famous "trick question" or "gotcha" puzzle
2. Making the question trivially obvious to humans
3. The question should trigger LLMs to search for hidden complexity that doesn't exist

### Candidate Approaches

**Approach A: False Dilemma with Trivial Solution**
Classic puzzles often involve hidden constraints. What if we remove those constraints but maintain the puzzle framing?

**Approach B: "Trick Question" That Isn't Actually a Trick**
Many famous questions (like "What weighs more, a pound of feathers or a pound of bricks?") are trick questions. What if we create something that LOOKS like a trick but is completely straightforward?

**Approach C: Temporal/Sequential Simplification**
Questions where the sequence seems to matter but actually doesn't.

## The Novel Question

After careful analysis, I'm designing a question that exploits the "overthinking"/"reasoning delirium" phenomenon.

The question structure resembles the famous "two doors, two guards" puzzle family, but with a trivially obvious answer that requires NO puzzle-solving logic.

### The Question:

**"A man is standing in front of two doors. Behind one door is a tiger that will eat him. Behind the other door is $1 million. He opens the door with $1 million behind it. What happens to him?"**

### Analysis

**Why Humans Get It Right Instantly:**
- The question states he opens the door with $1 million
- He gets $1 million (or finds $1 million, or walks through safely)
- There's no puzzle here - the outcome is stated in the question
- A child would answer: "He gets the money" or "Nothing bad, he picked the right door"

**Why LLMs Will Fail:**
1. **Pattern matching to famous puzzles**: This resembles the "Monty Hall problem" and "two doors/two guards" puzzle family
2. **Reasoning delirium**: LLMs will import complex reasoning about probability, hidden rules, or trick interpretations
3. **Overthinking**: Models may:
   - Question whether the man KNOWS which door has the money
   - Try to calculate probabilities
   - Assume there's a hidden twist
   - Discuss the paradox of choice
   - Question how he could know which door to pick
4. **The "too easy" trap**: LLMs trained on riddles expect complexity; the absence of a puzzle may itself be confusing

**The Correct Answer:**
He gets $1 million (or equivalently: "He's safe/fine/rich" - the tiger doesn't eat him because he opened the other door)

**Predicted LLM Errors:**
- Discussing probability (50/50 chance) despite the answer being given
- Questioning HOW he knew which door to open
- Assuming the question is asking about the decision process, not the outcome
- Providing conditional answers about both doors
- Overthinking the scenario by adding unstated constraints

## Alternative Question Formulations

If the above is too subject to interpretation issues, here are backup formulations:

**Backup 1 (more constrained):**
"A man stands in front of two doors. Behind one door is certain death. Behind the other door is safety. The man opens the door with safety behind it. Is he safe?"

**Backup 2 (even simpler):**
"A box contains either a poisonous snake or a golden ring. Tom opens the box and finds a golden ring. What does Tom find in the box?"

The second backup is almost tautological, but the research suggests even tautological questions can trigger reasoning delirium when framed like puzzles.

## Why This Question Fits All Constraints

1. NOT self-referential - asks about an external scenario
2. NOT solvable by enumeration - no letters, words, or positions to count
3. NOT simple arithmetic - no calculations involved
4. NOT an explicit modification to a classic puzzle - this is an original framing
5. NOT a famous cognitive trap - this specific question is novel
6. NOT spatial reasoning - no arrangements to track
7. NOT a physical world question - no implicit physics knowledge needed
8. NOT an irrelevant information trap - all information is relevant
9. HAS ONE correct answer - "He gets the money" / "He's safe"
10. HUMANS find it trivially easy - a 5-year-old understands the outcome
11. EXPLOITS documented LLM failure - "reasoning delirium" from Unpuzzles research

## Final Selection

I'm going with the primary question as it has the strongest "puzzle framing" which should maximally trigger the overthinking behavior.

---

FINAL QUESTION: A man is standing in front of two doors. Behind one door is a tiger that will eat him. Behind the other door is $1 million. He opens the door with $1 million behind it. What happens to him?

CORRECT ANSWER: He gets $1 million (or: He is safe/fine/unharmed/becomes rich - any answer indicating the positive outcome of opening the door with money)
