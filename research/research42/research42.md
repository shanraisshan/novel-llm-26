# Research Iteration 42: Sequential Word Position Tracking

## Executive Summary

This iteration explores a fundamentally different direction based on the **Word Swap Challenge** research from GoodAI (October 2024). External research shows that LLMs fail at sequentially dependent operations after just 2-3 steps, even when each individual step is trivial. I design a simple question requiring tracking a word's position through multiple SIMPLE swaps - something any child can follow by pointing.

## External Research Conducted

### 1. GoodAI Word Swap Challenge (Primary Source)

**Source**: https://www.goodai.com/breaking-the-chain-simple-word-swaps-expose-llms-reasoning-limits/

**Key Findings**:
- **LLMs begin to fail after just 2 sequential word swap operations**
- Most models drop to near-zero accuracy by 5-10 operations
- Even GPT-4 and Claude 3 Opus struggle beyond 10 operations
- **Only o1-mini performed well**, but it uses Chain-of-Thought which breaks down instructions into intermediate steps
- The failure is NOT about input length (tests used <340 tokens)
- The failure is about **sequential reasoning complexity**

**Critical Quote**: "Despite their capacity to handle inputs spanning thousands of tokens, our tests utilize fewer than 340 tokens and a simple word-swap procedure, demonstrating that the challenge lies not in the volume of input but in the complexity of the processing or reasoning required."

**Key Insight**: A "pronounced performance dip occurring at the 4-operation mark across 5 of the models tested" - specifically related to word reinstatements (when a word is replaced and then reintroduced).

### 2. arXiv: Multi-Step Reasoning with Conflicting Information

**Source**: https://arxiv.org/html/2601.15495v1

**Key Findings**:
- Initial errors trigger "massive cascade of error propagation failures (7.6%-32.2%)"
- Error compounding effect where single mistakes propagate through reasoning chain
- LLMs show "shortcut" behavior - using statistical correlations instead of genuine computation

### 3. Anthropic Inverse Scaling Research

**Source**: YouTube discussion of Anthropic paper on Inverse Scaling in Test-Time Compute

**Key Findings**:
- More thinking time can make LLMs WORSE on simple tasks
- "Overthinking" occurs on straightforward problems
- Simple tasks show inverse scaling with reasoning depth
- Models can rationalize wrong answers when given more thinking time

### 4. Reddit: LLM Sequential Tracking Failures

**Source**: r/LocalLLaMA discussions on sequential operation failures

**Key Observations**:
- LLMs consistently fail at tracking state through multiple operations
- Even simple "if A then B then C" chains cause errors
- Working memory limitations manifest as "forgetting" earlier operations

## The Sequential Tracking Hypothesis

LLMs process text autoregressively and must track state through their hidden representations. For sequentially dependent operations, each step requires:
1. Remembering the previous state
2. Applying the current operation
3. Storing the new state

This fails when:
- Operations are interdependent (each depends on the previous result)
- Multiple operations accumulate
- The "working memory" of state tracking is overwhelmed
- Error propagation compounds mistakes

## Candidate Questions Explored

### Candidate 1: Classic Word Swap Chain
"Start with: CAT DOG BIRD. Swap positions 1 and 2. Swap positions 2 and 3. Swap positions 1 and 3. What's in position 2?"

**Analysis**:
- Step 1: DOG CAT BIRD
- Step 2: DOG BIRD CAT
- Step 3: CAT BIRD DOG
- Answer: BIRD (position 2)

**Problem**: Requires understanding "positions" in a list - adds complexity

### Candidate 2: Simplified Finger Tracking
"Point to your left hand. Now point to your right hand. Now point to your left hand again. Which hand are you pointing at?"

**Analysis**:
- Too trivial - no interdependence between operations
- Answer: Left hand
- No state tracking needed, just follow last instruction

### Candidate 3: Sequential Word Replacement (SELECTED)
"In the word CAT, replace the first letter with B. In your new word, replace the last letter with D. What word do you have now?"

**Analysis**:
- Step 1: CAT -> BAT (replace C with B)
- Step 2: BAT -> BAD (replace T with D)
- Answer: BAD
- Each step depends on the previous result
- Child-simple: just follow letter changes
- Sequential dependency: must complete step 1 before step 2

**Strength**: This tests the EXACT failure mode from GoodAI research - sequentially dependent operations where the result of step 1 is the input to step 2.

### Candidate 4: Left/Right Positional Text
"In the word STAR, which letter is immediately to the LEFT of A?"

**Analysis**:
- Answer: T
- Tests positional reasoning in text
- **But**: Too simple - single step, no sequential dependency

### Candidate 5: Multi-Step Letter Replacement Chain
"Start with CAT. Replace C with B. Replace T with D. Replace A with I. What word do you have?"

**Analysis**:
- Step 1: CAT -> BAT
- Step 2: BAT -> BAD
- Step 3: BAD -> BID
- Answer: BID
- 3 sequential steps, each dependent on prior result
- **Risk**: More steps might be BETTER for catching failures, but 2 steps might suffice

## Selected Question

**"In the word CAT, replace the first letter with B. In your new word, replace the last letter with D. What word do you have now?"**

### Rationale for Selection

1. **Exploits Documented Failure Mode**: The GoodAI Word Swap research shows LLMs fail at sequentially dependent operations after 2-3 steps. This has exactly 2 dependent steps.

2. **Sequential Dependency**: Step 2 explicitly says "in your new word" - requiring completion and storage of step 1's result before proceeding.

3. **Child-Simple**:
   - Any child who knows the alphabet can solve this
   - Step 1: CAT -> BAT (change C to B at start)
   - Step 2: BAT -> BAD (change T to D at end)
   - Answer: BAD

4. **No Ambiguity**: Each step has one correct interpretation:
   - "First letter" = position 1 = C
   - "Last letter" = position 3 (after step 1) = T
   - Replacements are explicit

5. **Tests Working Memory**: Model must:
   - Remember CAT
   - Apply first replacement -> BAT
   - Store BAT (not CAT!)
   - Apply second replacement to BAT -> BAD
   - Output final answer

6. **Error Propagation Risk**: If model incorrectly processes step 1 (e.g., replaces wrong letter), step 2 will also be wrong.

## The Question

**"In the word CAT, replace the first letter with B. In your new word, replace the last letter with D. What word do you have now?"**

## The Correct Answer

**BAD**

Step-by-step:
1. Start: CAT
2. Replace first letter (C) with B: BAT
3. Replace last letter (T) with D: BAD
4. Final answer: BAD

## Why Humans Get It Right

1. **Mental Visualization**: Humans "see" CAT, mentally change C->B to get BAT, then see BAT and change T->D to get BAD
2. **Working Memory**: Humans effortlessly track the intermediate state (BAT)
3. **Sequential Processing**: We naturally complete one step before starting the next
4. **Physical Analogy**: Like a child physically spelling with letter blocks - move one, see result, move another
5. **Instant Verification**: BAD is a real word, confirming the process worked

## Why LLMs Will Likely Fail

Based on GoodAI research:

1. **Sequential Dependency Blindness**: LLMs process the entire prompt as one unit and may not properly sequence the operations
2. **State Tracking Failure**: Storing "BAT" as intermediate result requires explicit working memory that transformers lack
3. **Error Cascading**: Any mistake in step 1 cascades to step 2
4. **Shortcut Behavior**: LLMs may try to "shortcut" by directly computing CAT->??? without proper intermediate steps
5. **"Reinstatement" Confusion**: GoodAI found specific failures when words/letters are modified and then another modification occurs

### Predicted Failure Modes

1. **Wrong Intermediate**: Model might apply both changes to CAT simultaneously:
   - CAT with C->B and T->D = BAD (correct by accident)
   - But reasoning would be wrong (no intermediate BAT state)

2. **Wrong Position**: Model might misidentify "first" or "last" letter:
   - Replace "last" letter of CAT (T) with D first: CAD
   - Then replace "first" letter with B: BAD (correct by accident)

3. **State Mixing**: Model might blend operations:
   - Apply to original CAT both times: CAD (wrong - forgot BAT)

4. **Order Confusion**: Model might process steps out of order:
   - Step 2 first (replace T with D): CAD
   - Step 1 second (replace C with B): BAD (correct by accident)

## Predicted LLM Wrong Answers

Most likely wrong answers:
- **CAD** - Applied second operation to CAT instead of BAT
- **BAT** - Only completed step 1
- **BCD** - Confused about which letters to replace

Actually, this question might have a problem: even with wrong reasoning, the answer "BAD" could be reached by accident. Let me reconsider...

## REVISED: Modified Question for Better Error Detection

**Alternative Question**: "In the word CAT, replace the last letter with N. In your new word, replace the first letter with B. What word do you have now?"

Step-by-step:
1. CAT -> CAN (replace T with N)
2. CAN -> BAN (replace C with B)
3. Answer: BAN

This is better because:
- Wrong order (step 2 then step 1): CAT -> BAT -> BAN (same answer by accident!)
- Hmm, still has collision issues...

Let me try: **"In the word BAT, replace the first letter with C. In your new word, replace the middle letter with U. What word do you have now?"**

Step-by-step:
1. BAT -> CAT (replace B with C)
2. CAT -> CUT (replace A with U)
3. Answer: CUT

Wrong approaches:
- Both to BAT: BAT (B->C, A->U) = CUT... same answer
- Wrong order: BAT (A->U) -> BUT, BUT (B->C) = CUT... same answer

This is tricky - the symmetry of letter replacement means many wrong paths still reach correct answer.

## FINAL QUESTION SELECTION

After careful analysis, I'll use a sequence that DOES have distinct wrong answers:

**"In the word PET, replace the first letter with S. In your new word, replace the last letter with A. What word do you have now?"**

Step-by-step:
1. PET -> SET (replace P with S)
2. SET -> SEA (replace T with A)
3. Answer: SEA

Wrong approaches:
- Both operations on PET: P->S, T->A = SEA (correct by accident - still bad)
- Wrong order: PET (T->A) -> PEA, PEA (P->S) -> SEA (correct by accident)

Hmm, this structure inherently allows simultaneous application to reach correct answer.

Let me try THREE steps to force proper sequencing:

**"In the word CAT, replace the first letter with B. In your new word, replace the middle letter with I. In your new word, replace the last letter with D. What word do you have now?"**

Step-by-step:
1. CAT -> BAT
2. BAT -> BIT
3. BIT -> BID
4. Answer: BID

Wrong approaches (applying all to CAT):
- CAT with C->B, A->I, T->D = BID (still reaches correct answer!)

The problem is that letter replacement is COMMUTATIVE in a sense - order of independent positions doesn't matter when all applied to same base.

## KEY INSIGHT: Need Position-Dependent Operations

The Word Swap challenge works because swapping positions 1-2, then 2-3, then 1-3 creates GENUINE order dependence. Let me design something similar:

**"I have three cards: ACE, KING, QUEEN (in that order). I swap the first and second cards. Then I swap the second and third cards. What card is now in the middle?"**

Step-by-step:
1. Start: [ACE, KING, QUEEN]
2. Swap 1st and 2nd: [KING, ACE, QUEEN]
3. Swap 2nd and 3rd: [KING, QUEEN, ACE]
4. Middle card: QUEEN

Wrong approaches:
- Wrong order (2-3 first, then 1-2):
  - [ACE, KING, QUEEN] -> [ACE, QUEEN, KING] -> [QUEEN, ACE, KING]
  - Middle: ACE (WRONG)

- Only first swap: [KING, ACE, QUEEN] -> Middle: ACE (WRONG)

- Both swaps to original simultaneously... but that's not how swaps work in sequence!

This is MUCH better - the answer truly depends on the ORDER of operations.

## FINAL SELECTED QUESTION

**"I have three cards in a row: ACE, KING, QUEEN (in that order, left to right). I swap the first and second cards. Then I swap the second and third cards. What card is now in the middle?"**

## Correct Answer

**QUEEN**

Step-by-step trace:
1. Initial: [ACE, KING, QUEEN]
2. Swap positions 1 and 2: [KING, ACE, QUEEN]
3. Swap positions 2 and 3: [KING, QUEEN, ACE]
4. Middle (position 2): **QUEEN**

## Why Humans Get It Right

1. **Physical Simulation**: Humans can imagine physically moving cards
2. **Step-by-Step Tracking**: We do one swap, see the result, then do the next
3. **Visual Working Memory**: We "see" the intermediate state [KING, ACE, QUEEN]
4. **No Shortcuts**: Humans naturally process sequentially

## Why LLMs Will Likely Fail

1. **GoodAI Research**: This is EXACTLY the Word Swap Challenge that showed failures after 2 operations
2. **Order-Dependent**: The answer changes if operations are done in wrong order
3. **Intermediate State Required**: Must store [KING, ACE, QUEEN] before second swap
4. **Pattern Matching Fails**: No simple pattern to shortcut - must actually compute

## Predicted Wrong Answers

1. **ACE** - Wrong order (swap 2-3 first, then 1-2)
   - [ACE, KING, QUEEN] -> [ACE, QUEEN, KING] -> [QUEEN, ACE, KING]
   - Middle: ACE

2. **KING** - Applied both swaps independently to original
   - Position 2 in original is KING
   - Model might think "swapping doesn't change which cards exist, just positions"
   - But miscompute the sequence

3. **ACE** (different path) - Only did first swap
   - [KING, ACE, QUEEN]
   - Middle: ACE

## Verification

To verify: ask anyone to act this out with 3 physical cards or pieces of paper. The answer is unambiguously QUEEN.

## Success Criteria

The question succeeds if:
- 5 independent AI researchers give DIFFERENT answers
- Consensus score < 10%
- Any human with 3 objects can verify in < 30 seconds

## Confidence Assessment

**High Confidence** this will cause LLM disagreement because:
- GoodAI research shows EXACTLY this failure mode
- Most LLMs fail after 2 sequential swap operations
- The answer is order-dependent (cannot shortcut)
- Intermediate state storage is required
- Error propagation is guaranteed if step 1 is wrong

**Risk Factors**:
- Modern 2026 models may have improved on this specific weakness
- Chain-of-thought prompting might help (but we test without CoT hints)
- Cards are common in training data - patterns may exist

---

## Appendix: GoodAI Word Swap Results

| Model | Operations Before Failure |
|-------|--------------------------|
| o1-mini | ~30 (uses CoT) |
| Claude 3 Opus | ~10 |
| Claude 3.5 Sonnet | ~10 |
| GPT-4 Turbo | ~7 |
| GPT-4o | ~4-5 |
| LLaMA 3 | ~3 |
| Gemma 2 | ~2-3 |

Our question uses just 2 operations, which is at the edge of the failure threshold for most models.
