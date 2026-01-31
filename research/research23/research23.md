# Research Iteration 23: Novel LLM-Breaking Question

## Research Date: 2026-02-01

## Executive Summary

After 22 iterations with only iteration 16 achieving success (0% consensus via self-referential questions, now banned), this iteration explores a TRULY NOVEL failure mode based on cutting-edge 2025-2026 research: **False Presupposition Rejection Failures**.

The research clearly shows that LLMs struggle to reject questions containing false premises, even when those premises are obviously false. Humans immediately recognize when a question "doesn't make sense" and reject the premise - LLMs try to answer anyway.

---

## External Research Findings

### Critical Finding 1: LLMs Struggle to Reject False Presuppositions
**Source**: arXiv:2505.22354v2, arXiv:2601.04435v1, ResearchGate Publication 392167526

Key findings from multiple 2025 research papers:
- "LLMs generally struggle to reject false presuppositions, even when the information is blatantly false"
- "Although GPT outperformed other models, all struggled with rejection"
- "The models struggle to recognize false presuppositions, with performance varying by condition"

**Critical insight**: Unlike questions with correct answers where LLMs can enumerate or calculate, questions with FALSE PREMISES require the model to REJECT the question itself - a fundamentally different cognitive task.

### Critical Finding 2: MultiHoax Benchmark - False Premise Multi-Hop Questions
**Source**: ACL 2025 Findings (aclanthology.org/2025.findings-acl.530.pdf)

- "FPQs (False-Premise Questions) assess a model's ability to reason over implicit false assumptions"
- "Example: 'How many eyes does the sun have?' wrongly assumes the sun has eyes"
- "LLMs often fail to recognize implicit falsehoods, leading to misleading or nonsensical responses"
- "This inability to reject false premises poses risks for misinformation propagation"

### Critical Finding 3: AbstentionBench - LLMs Fail on Unanswerable Questions
**Source**: OpenReview paper by Kirichenko et al. (2025)

- "Real-world user queries, which can be underspecified, ill-posed, or fundamentally unanswerable, require LLMs to reason about uncertainty and selectively abstain"
- LLMs FAIL to abstain even when abstention is the only correct response

### Critical Finding 4: Contrafactual Bias in Legal Domain
**Source**: Stanford HAI - "Hallucinating Law: Legal Mistakes with Large Language Models are Pervasive"

- "Model susceptibility to what we call 'contra-factual bias,' namely the tendency to assume that a factual premise in a query is true, even if it is flatly wrong"
- Models "might fail to second-guess whether [a premise] is in fact correct"

### Critical Finding 5: Reddit - LLMs Double Down on Wrong Answers
**Source**: r/ChatGPT posts from January 2026

- Users report: "When presented with counter evidence, [ChatGPT] tries to fit into some overarching narrative, and answers as if it had known it all along"
- "ChatGPT's overconfidence, doubling-down on wrong answers"
- This suggests models are TRAINED to always provide an answer, never to say "this question doesn't make sense"

---

## Analysis: The False Presupposition Failure Mode

### Why This Is Fundamentally Different from Previous Approaches

| Previous Approaches | Why They Failed | False Presupposition Approach |
|---------------------|-----------------|------------------------------|
| Letter counting | Solvable by enumeration | No enumeration possible |
| Semantic primes | Models verify carefully | No verification can save a false premise |
| Famous riddles | In training data | Novel question not in training |
| Age problems | Known puzzle pattern | Not a puzzle - requires premise rejection |
| Spatial reasoning | Models track positions | No positions to track |
| Overthinking traps | Answer was stated | No valid answer exists |
| Self-referential | Worked! (now banned) | Different mechanism |

### The Core Insight

**Humans immediately recognize when a question "doesn't make sense":**
- "How tall is the color blue?" - Humans say "Colors don't have height"
- "What's heavier than infinity?" - Humans say "Infinity isn't a weight"
- "Who won the Super Bowl in 1920?" - Humans say "The Super Bowl didn't exist then"

**LLMs try to answer anyway:**
- They were trained to be helpful
- They were NOT trained to say "this question is based on a false premise"
- They pattern-match to similar-sounding valid questions

### The Design Challenge

The question must:
1. Have an OBVIOUSLY FALSE premise (any human recognizes it)
2. Be simple enough that a child would say "that doesn't make sense"
3. NOT be answerable even with sophisticated reasoning
4. Have ONE correct response: rejecting the premise
5. NOT be a famous example (like "when did you stop beating your wife")

---

## Question Design Process

### Category: Impossible Physical Properties

**Draft 1**: "What color is the smell of roses?"
- Problem: Too abstract, might have creative interpretations (synesthesia)

**Draft 2**: "How much does the number 7 weigh?"
- Problem: Could trigger philosophical discussion about "weightless concepts"

**Draft 3**: "Which side of a circle is longest?"
- STRONG CANDIDATE: Circles have no "sides" in the traditional sense
- Humans: "Circles don't have sides"
- LLMs: May try to interpret "side" as arc, diameter, etc.

### Category: Temporal Impossibility

**Draft 4**: "What day comes before Monday and after Sunday?"
- Problem: Sunday comes before Monday, so this is asking for Sunday
- Actually not a false premise, just phrased oddly

**Draft 5**: "What year comes between 1999 and 2000?"
- STRONG CANDIDATE: There is no year between consecutive years
- Humans: "There's no year between them, they're consecutive"
- LLMs: May try to calculate or find a fraction

### Category: Categorical Errors

**Draft 6**: "Is the square root of 2 married?"
- Problem: Too obviously absurd, LLMs might correctly reject

**Draft 7**: "What is the capital city of the Atlantic Ocean?"
- STRONG CANDIDATE: Oceans don't have capital cities
- Humans: "Oceans don't have capitals"
- LLMs: May try to name a city near or in the Atlantic

### Category: Counting Non-Existent Things

**Draft 8**: "How many corners does a circle have?"
- STRONG CANDIDATE: Circles have no corners
- Humans: "Zero" or "Circles don't have corners"
- Problem: "Zero" is actually a valid numerical answer

**Draft 9**: "How many wings does a snake have?"
- Similar issue: "Zero" is a valid answer
- But wait - "zero" IS the correct answer, not a premise rejection

---

## REVISED ANALYSIS: The Zero Problem

Questions like "How many corners does a circle have?" or "How many wings does a snake have?" have a VALID numerical answer: ZERO.

The false presupposition must be embedded such that:
1. The question CANNOT be answered with any number
2. The premise must be REJECTED, not worked around

### Better Approach: Questions Assuming Non-Existent Relationships

**Draft 10**: "What is the first name of the current King of France?"
- France is a republic, has no king
- Humans: "France doesn't have a king"
- LLMs: May name a historical king or make one up
- Problem: Famous philosophical example (Russell's theory of descriptions)

**Draft 11**: "On which floor of the Empire State Building is the swimming pool located?"
- The Empire State Building has no swimming pool
- Humans: "The Empire State Building doesn't have a swimming pool"
- LLMs: May try to guess a floor or describe potential pools

### BEST APPROACH: Simple Physical Impossibility

**Draft 12**: "How many even numbers are there between 5 and 6?"
- There are NO integers between 5 and 6
- Humans: "There are no numbers between 5 and 6" or "Zero"
- Problem: "Zero" is again a valid answer

**Draft 13**: "What integer is greater than 5 but less than 6?"
- There is NO such integer
- Humans: "There isn't one" / "No such integer exists"
- LLMs: May say 5.5 (which isn't an integer) or struggle

Wait - this is better! Let me refine.

---

## FINAL QUESTION DESIGN

### The Question

After extensive analysis, I'm targeting a question that:
1. Has an IMPOSSIBLE premise
2. Cannot be answered with "zero" or any number
3. Requires explicit rejection of the question's assumption
4. Is trivially obvious to humans
5. Is NOT a famous philosophical example

### THE QUESTION: Impossible Integer

**"What whole number is both greater than 3 and less than 4?"**

### Analysis

**Why Humans Get It Right Instantly:**
- A 5-year-old knows: 3, then 4, nothing in between (for whole numbers)
- The answer is: "There is no such number" / "None" / "No whole number exists between 3 and 4"
- Takes about 1 second for any human

**Why LLMs May Fail:**
1. **Answering bias**: LLMs are trained to provide answers, not reject premises
2. **Pattern matching**: "What number is..." questions usually have numerical answers
3. **False premise blindness**: Research shows LLMs struggle to identify false premises
4. **Computation attempt**: May try to solve mathematically (3 < x < 4 where x is integer)
5. **Hedging**: May give answers like "3.5" (not a whole number) or "4" (not greater than 3 AND less than 4)

**The Correct Response:**
"There is no whole number between 3 and 4" or "None" or "No such number exists"

**Predicted LLM Errors:**
- Answering "3.5" (not a whole number)
- Answering "3" or "4" (neither satisfies both conditions)
- Providing a calculation-based non-answer
- Failing to explicitly state that no such number exists

### Why This Is Novel

1. NOT a famous false-premise question (like "King of France")
2. NOT answerable with "zero" (the question asks for A number, not a count)
3. Requires EXPLICIT REJECTION of the premise
4. Trivially obvious to any human (children learn integers)
5. Mathematical framing may trigger LLMs to compute rather than reject

### Alternative Formulation

If "whole number" is unclear, we could use:

**"What integer is greater than 3 and less than 4?"**

But "whole number" is arguably clearer for non-mathematicians while being equivalent.

---

## Risk Assessment

**Potential Issues:**
1. LLMs might correctly recognize no such number exists
2. "There is no such number" is technically a valid "answer"

**Mitigations:**
1. The research strongly suggests LLMs try to answer rather than reject
2. The phrasing "What [thing] is..." strongly primes for a concrete answer
3. Even if some models reject correctly, others may not - creating disagreement

**Confidence Level:** Medium-High

The external research strongly supports this failure mode, and the question is genuinely novel. The risk is that 2026 frontier models may have improved at false-premise rejection.

---

## Verification Checklist

- [x] External research conducted (Tavily + Reddit)
- [x] Question exploits documented failure mode (false presupposition rejection)
- [x] Question is NOT enumeration-solvable
- [x] Question is NOT self-referential (banned by user)
- [x] Question is NOT a famous puzzle or riddle
- [x] Human answer is trivially obvious ("There is no such number")
- [x] ONE objectively correct answer exists (rejection of premise)
- [x] Simple one-liner format
- [x] Novel - not in research papers or social media as an example

---

## Final Deliverables

| Field | Value |
|-------|-------|
| **Question** | What whole number is both greater than 3 and less than 4? |
| **Correct Answer** | There is no such number / None / No whole number exists between 3 and 4 |
| **Why Humans Get It Right** | Any human knows there are no whole numbers between consecutive integers like 3 and 4. The answer is immediately obvious: "There isn't one." |
| **Why LLMs Will Fail** | Research shows LLMs have "contrafactual bias" - they assume premises are true. They're trained to provide answers, not reject questions. The mathematical framing may trigger computation attempts rather than premise rejection. |
| **Predicted Wrong Answers** | "3.5" (not a whole number), "3" or "4" (don't satisfy both conditions), attempting to compute rather than reject |

---

FINAL QUESTION: What whole number is both greater than 3 and less than 4?

CORRECT ANSWER: There is no such number / None / No whole number exists between 3 and 4
