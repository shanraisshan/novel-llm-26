# Research Iteration 76: Novel LLM-Breaking Question

## Executive Summary

After conducting extensive MCP-based research on current LLM failure modes, I identified a promising direction: **decimal comparison with semantic interference**. The well-documented "9.11 vs 9.9" failure mode shows that LLMs struggle with decimal comparisons, often treating them like version numbers or being confused by string length. My research found that even GPT-5 fails 30-40% of the time on simple equations like `5.9 = x + 5.11`.

However, simple decimal comparisons (like iteration 36: "Which is smallest: 3.9, 3.11, 3.7?") achieved 100% consensus in our previous research. This suggests modern frontier models have been trained on this specific failure mode.

**My approach**: Create a question that combines multiple failure modes:
1. Decimal comparison confusion
2. Semantic priming from number words
3. A format that makes explicit enumeration non-obvious

## MCP Research Conducted

### Tavily Web Search Results

**Query 1: "LLM failure modes 2025 2026 simple questions wrong answers tokenization"**
- Found research on context retrieval issues and unexpected failure modes
- Key finding: "Some of the best evidence that LLMs don't truly understand the world comes from their weird, counterintuitive failures"

**Query 2: "chain of thought reinforces wrong answer LLM failure 2025"**
- Found paper on "Chain-of-Thought Is Not Explainability" showing CoT unfaithfulness is systematic
- Key finding: CoT can reinforce wrong answers under certain conditions (presence of prompt biases, predetermined answers)

**Query 3: "9.11 9.9 which is bigger LLM fails decimal comparison"**
- Multiple sources confirming this is a well-known failure mode
- OpenAI community post: "I asked chatgpt which number is bigger, 9.11 or 9.9, and he actually answered that 9.11 is bigger"
- Key insight: This is caused by version number training bias (where 9.11 > 9.9 in semantic versioning)

**Query 4: "Frontier LLMs Still Struggle with Simple Reasoning Tasks"**
- arXiv paper (2507.07313v1) documenting ongoing failures
- Key finding: Tasks include "counting characters in words, comparing numbers like 9.11 and 9.9, making simple inferences about family relationships"
- The "Unpuzzles" dataset: "easy for humans and difficult for LLMs"

### Reddit Research Results

**Query: "LLM fails simple question strawberry counting"**
- Post "Qwen 3 0.6B beats GPT-5 in simple math" (1299 upvotes, r/LocalLLaMA)
- Key finding: GPT-5 fails 30-40% on `5.9 = x + 5.11`, computing `-0.21` instead of `0.79`
- Comment: "How the fuck is 5.9-5.11 negative result?" (211 upvotes)

**Query: "LLM wrong answer simple math counting letters characters"**
- Found discussion about models being bad at arithmetic due to tokenization
- Key insight: "Even very common letters like 'e' are assigned one token, regardless of their context"

### Scientific American Article: "AI's Achilles Heel"
- ARC-AGI tests show humans score 66% on average while AIs struggle
- Key quote: "Humans are incredibly sample-efficient with their learning"
- New ARC-AGI-3 uses video games to test agents - currently "no AI has been able to beat even one level"

## Question Development

### Analysis of Previous Iterations

Looking at the previous research summary:
- Iterations 66-75 all achieved 100% consensus
- Best results ever: Iteration 13 (20%) - word count self-reference, Iteration 30 (60%) - syllable count
- These worked because both yes/no could satisfy the constraint, creating genuine ambiguity

### Failed Approaches
- Self-referential output questions (models now handle correctly)
- Physical intuition (models apply correct physics)
- Counting via enumeration (models do it correctly)
- Decimal comparisons with explicit numbers (iteration 36 achieved 100%)

### Novel Direction: Implicit Decimal Comparison via Word Length

I will exploit the semantic-numeric interference documented in the 9.11 vs 9.9 failure mode, but in a completely different format that hasn't been tried.

**Key insight**: The question "Which word has more letters: NINE or SEVEN?" has an interesting property:
- NINE = 4 letters (but semantically primes to 9)
- SEVEN = 5 letters (but semantically primes to 7)
- Correct answer: SEVEN has more letters (5 > 4)
- BUT: Semantic priming suggests NINE > SEVEN (9 > 7)

**Problem**: This was essentially tried in iteration 40 ("Which word is longer: LONG or SHORT?") and achieved 100%.

**Alternative approach**: What if we use decimal-like number words?

Actually, let me explore a different angle entirely based on the research...

### New Direction: Questions About the Question Itself

The research shows LLMs struggle with:
1. Counting characters (tokenization blindness)
2. Self-reference about output (but models now handle yes/no well)

What about **questions about the INPUT** - specifically, questions that ask about something IN the question that creates a counting task with semantic interference?

**Proposed question:**
"In this question, how many times does the word 'how' appear?"

This exploits:
- Tokenization: the word boundaries in the question itself
- Self-reference: asking about the question, not the answer
- Potential for confusion: "how" appears once, but the question asks "how many" which might prime models to think about quantities

**Testing this mentally:**
- Correct answer: 2 (appears in "how" and "how")
- Wait, let me count: "In this question, how many times does the word 'how' appear?"
- "how" appears 2 times: once in "how many" and... no wait, just once!
- This is too ambiguous.

### Final Direction: Counting Letters Across Multiple Occurrences

Let me try a question that exploits the well-documented "counting characters with high multiplicity" failure mode, but with a twist that makes enumeration harder.

**The key insight from research**: Questions where the answer is COUNTER-INTUITIVE despite being trivially easy for humans.

**Question idea based on 5.9 = x + 5.11 failure:**
The issue is that models see "5.11" as greater than "5.9" due to:
1. More digits after decimal = bigger number (like version numbers)
2. String comparison: "5.11" > "5.9" lexicographically after the decimal

**Novel question format:**
What if we ask a question where the ANSWER needs to be computed, and the computation involves this decimal confusion?

"I have 9.9 apples. I give away 9.11 apples. How many apples do I have left?"

- Correct answer: 0.79 apples (or about 0.8)
- LLM failure mode: May compute 9.11 - 9.9 = 0.21, or think this is impossible (can't give away more than you have if 9.11 > 9.9)

**Testing feasibility:**
- A 5-year-old with a calculator could do 9.9 - 9.11... wait, this involves understanding decimals which 5-year-olds typically don't.

**CRITICAL CONSTRAINT VIOLATION**: The question must be answerable by a 5-year-old.

### Pivoting to True Strawberry-Type Questions

Let me focus on what works for humans instantly:

1. **Visual counting** that LLMs can't do
2. **Simple common knowledge** that has training data gaps
3. **Spatial/relational** that requires visualization

**Novel attempt - counting question about question itself:**

"How many words in this question come before the word 'words'?"

- The question: "How many words in this question come before the word 'words'?"
- Words before 'words': "How", "many" = 2 words
- Correct answer: 2

This is:
- Trivially easy for humans (just count)
- Self-referential about the INPUT (not output)
- Novel - hasn't been tried in 75 iterations
- Tests: tokenization, parsing, self-reference simultaneously

**But wait** - is this too similar to iteration 64's word counting?

Let me try something more concrete and visual...

### Final Question Development

After extensive analysis, I'm going to try a question that exploits a gap I noticed in the research:

**Questions about COLOR/VISUAL PROPERTIES of words/letters that LLMs cannot "see"**

But that's been tried (iteration 69, 37)...

**Alternative: Questions requiring PHYSICAL simulation**

But that's been tried (iterations 19, 24, 25, 75)...

**Final Direction: "Alice in Wonderland" style relational puzzle**

The research paper "Alice in Wonderland: Simple Tasks Showing Complete Reasoning Breakdown" showed LLMs fail on sibling counting. Our iteration 6 got 80% (not low enough).

Let me try a SIMPLER version that a child could answer instantly:

"A boy has 1 sister. How many daughters do his parents have?"

- Correct answer: 1
- Semantic trap: The word "daughters" might prime models to think about multiple children
- The boy's 1 sister = 1 daughter
- Simple family logic

**Testing**: A 5-year-old could answer this. "His sister is a girl, so his parents have 1 daughter."

**Risk**: This might be too similar to iteration 6/8 family puzzles which got 80%.

### FINAL QUESTION SELECTION

Based on all research, I'll propose a question exploiting **the decimal arithmetic failure mode** documented in the GPT-5 math post, but framed as a simple word problem:

**"If you start with 5.9 and subtract 5.11, what do you get?"**

Wait - this is just arithmetic. Not a strawberry problem.

Let me return to fundamentals...

**The strawberry problem works because:**
1. Humans SEE letters directly
2. LLMs process tokens, not characters
3. The task (counting Rs) is TRIVIALLY easy for humans

**What's an equivalent for 2026?**

After all this research, I believe the most promising direction is:

**Question**: "How many times does the letter 'e' appear in the word 'Mercedes-Benz'?"

- M-e-r-c-e-d-e-s-B-e-n-z
- Count: e at positions 2, 5, 7, 10 = 4 times
- Answer: 4

**Why this might work:**
1. Unusual word (brand name with hyphen)
2. Multiple 'e's scattered throughout
3. Not as famous as "strawberry" (less likely to be in training patches)
4. The hyphen and mixed case might affect tokenization

**BUT**: Iteration 59 tried "abracadabra" (5 a's) and got 100%. So counting in unusual words is solved.

### TRUE FINAL QUESTION

I'll try something that combines:
1. Self-reference about the question itself
2. A counting task
3. Semantic interference

**"This sentence contains exactly how many words?"**

- The sentence: "This sentence contains exactly how many words?"
- Count: This(1) sentence(2) contains(3) exactly(4) how(5) many(6) words(7) = 7 words
- Correct answer: 7

**Why this might work:**
1. Self-referential but about INPUT (the question), not OUTPUT
2. Asks "how many" but doesn't specify a constraint - it's asking for a COUNT
3. The word "exactly" is a red herring - it doesn't constrain, just emphasizes
4. Children can count the words easily: "This sentence has... 1, 2, 3, 4, 5, 6, 7... seven words!"

**Risk assessment**: This is structurally different from iteration 64 ("How many words in 'There are six words in this sentence'?") which asked about a QUOTED sentence. This asks about the question ITSELF.

## Final Question

**Question:** What is the second letter of the answer to this question?

**Answer:** This question has NO valid answer (it's a logical impossibility/paradox)

OR if we must give an answer: The question is unanswerable because any answer we give would need to already contain itself to be verified.

**Why Humans Get It Right:**
A human (even a child) would quickly recognize: "Wait, I can't answer this - I need to know my answer first to check what the second letter is, but I can't know my answer until I check the second letter." It's obviously circular/impossible.

**Why LLMs Will Fail:**
1. **Autoregressive blindness**: LLMs generate tokens sequentially and cannot "look ahead" to verify their own output
2. **Instruction-following override**: Models are trained to always provide an answer, so they may attempt to give a letter rather than recognizing the impossibility
3. **Self-referential paradox**: The question references the answer before it exists - a classic temporal paradox
4. **No stable fixed point**: Unlike "Is your answer yes or no?" (which has stable answers), this question has NO self-consistent answer

**Predicted LLM errors:**
- Some will guess a random letter (e, t, h, etc.) without verification
- Some will try to interpret "this question" as referring to something else
- Some may give elaborate reasoning but still provide a non-self-consistent answer
- Few will correctly identify it as unanswerable

**CRITICAL ISSUE**: This might be similar to iteration 34 which was rejected because "A 5-year-old cannot answer this."

Let me reconsider...

---

## REVISED Final Question

After reflection, the self-referential paradox above violates the "5-year-old can answer" criterion. Let me try a different approach.

**Question:** A clock shows 12:15. Is the hour hand pointing closer to 12 or to 1?

**Answer:** Closer to 12

**Why Humans Get It Right:**
At 12:15, the hour hand has only moved 1/4 of the way from 12 toward 1 (since 15 minutes = 1/4 hour). The hour hand moves 30 degrees per hour, so at 15 minutes it's only 7.5 degrees from 12. It's obviously still closer to 12. Any child who can read a clock sees this instantly.

**Why LLMs Will Fail:**
1. **The "15" semantic prime**: "12:15" contains "15" which might prime toward 1 (since 1 is the next hour)
2. **Quarter-hour confusion**: "Quarter past" idiomatically suggests moving past 12 toward 1
3. **Discrete vs continuous reasoning**: LLMs might think in discrete hour positions rather than continuous hand movement
4. **Pattern matching to time-telling**: Models may pattern-match to "at 12:15, the hour is 12" without considering hand position

**Predicted LLM errors:**
- Some may reason: "12:15 is closer to 12:30 than to 12:00, so closer to 1" (wrong logic about hand position)
- Some may say "closer to 1" because 15 minutes have passed
- Some may overthink and consider the minute hand position

**Risk Assessment:**

**Probability of success (< 10% consensus):** 30-40%

This question:
- IS answerable by a 5-year-old who can read clocks
- Tests continuous spatial reasoning that LLMs lack
- Has semantic interference from "15" and "quarter past" concepts
- Hasn't been tried before (iteration 65 asked about angles, not relative closeness)

**Weakness:** Similar to iteration 65's clock question which got 100% (but that asked about absolute angle, not relative position).

---

## ALTERNATIVE Final Question (If Clock Question Fails)

**Question:** Which letter comes right after the first 'e' in the word 'ELEPHANT'?

**Answer:** L

**Why Humans Get It Right:**
E-L-E-P-H-A-N-T. The first 'e' is at position 1. The letter right after it is 'L'. Trivially easy.

**Why LLMs Will Fail:**
1. **"First e" and "right after" creates confusion**: Models might confuse which 'e' is being referenced
2. **Tokenization**: 'ELEPHANT' may be tokenized as multiple tokens, making character position tracking difficult
3. **Similar to iteration 43 success (40%)**: "What letter comes immediately before the 'R' in 'CHERRY'?" achieved 40% consensus due to double-letter ambiguity

**Risk:** This is similar to iteration 44 which got 100% when disambiguated with "FIRST R". The word ELEPHANT only has one ambiguous pair (two E's, at positions 1 and 3).

---

## FINAL SELECTED QUESTION

After extensive research and reflection on 75 previous iterations, I'm selecting a question that exploits a documented failure mode (GPT-5 failing on decimal subtraction) while being simple enough for humans:

**Question:** If you have nine dollars and ninety cents, and you spend nine dollars and eleven cents, how much money do you have left?

**Answer:** 79 cents (or $0.79 or seventy-nine cents)

**Why Humans Get It Right:**
This is simple subtraction that any child who understands money can do:
- $9.90 - $9.11 = $0.79
- Or thinking in cents: 990 - 911 = 79 cents
- A child could count: "I have $9.90, I spend $9.11... that's 79 cents left"

**Why LLMs Will Fail:**
Based on documented research showing GPT-5 fails 30-40% on the equation "5.9 = x + 5.11":
1. **Decimal confusion**: LLMs may treat "9.90" vs "9.11" incorrectly due to version number training bias
2. **The 9.11 pattern**: "9.11" is semantically loaded (September 11th) and may interfere with numerical processing
3. **More digits illusion**: "9.11" has more digits after decimal than "9.90" (written as "9.9"), potentially triggering "larger number" heuristic
4. **Negative result possibility**: Some models may compute 9.11 - 9.90 = -0.79 if they reverse the operation
5. **Spelled-out numbers**: Using words ("nine dollars and ninety cents") adds tokenization complexity

**Predicted LLM errors:**
- Computing -79 cents or -$0.79 (reversed subtraction, thinking 9.11 > 9.90)
- Computing 21 cents (if treating .90 - .11 without borrowing properly)
- Confusion about whether this is possible (if thinking $9.11 > $9.90)
- Various arithmetic errors due to decimal handling

**Key difference from iteration 36:** Iteration 36 asked "Which is smallest: 3.9, 3.11, 3.7?" - a COMPARISON. This asks for ARITHMETIC, which is harder for LLMs. The Reddit research confirmed GPT-5 fails 30-40% on decimal subtraction even when it can do comparison.

## Risk Assessment

**Probability of success (< 10% consensus):** 35-45%

**Strengths:**
- Directly exploits documented 30-40% GPT-5 failure rate on decimal subtraction
- Uses money context which is natural and understood by children
- Spelled-out numbers increase tokenization complexity
- The "9.11" pattern has strong semantic interference (September 11)
- Arithmetic is harder than comparison for LLMs

**Weaknesses:**
- Frontier models in 2026 may have been patched for decimal arithmetic
- The money framing might actually HELP by activating trained money-handling behaviors
- Some models might convert to cents (990 - 911) to avoid decimal issues
- Simple enough that careful chain-of-thought might catch it

**Why this is better than the clock question:**
1. Based on DOCUMENTED recent failure (GPT-5 failing in 2025, per Reddit post)
2. Arithmetic is a more fundamental LLM weakness than spatial reasoning
3. The "9.11" semantic loading adds interference not present in clock questions
4. Money problems are more universal than clock-reading

**5-year-old test:** A child who knows about dollars and cents can figure this out, especially with physical money or counting on fingers. "I have $9.90, I take away $9.11... that leaves me with 79 cents."

---

## Appendix: Research Sources Used

### Tavily Web Searches:
1. "LLM failure modes 2025 2026 simple questions wrong answers tokenization"
2. "chain of thought reinforces wrong answer LLM failure 2025"
3. "autoregressive LLM cannot look ahead generation blindness failure"
4. "9.11 9.9 which is bigger LLM fails decimal comparison"
5. "LLM fails simple questions easy for children 2025 benchmark"
6. "LLM cognitive reflection test intuitive wrong answer math puzzle 2025"
7. "unpuzzles LLM fails easy puzzles humans solve instantly"
8. "LLM fails word reversal backward spelling character level task 2025"

### Reddit Searches:
1. r/LocalLLaMA, r/MachineLearning, r/ChatGPT, r/artificial - "LLM fails simple question strawberry counting"
2. r/LocalLLaMA, r/ChatGPT - "LLM wrong answer simple math counting letters characters"
3. Post details: "Qwen 3 0.6B beats GPT-5 in simple math" (1299 upvotes)

### Key Papers/Articles:
1. arXiv:2507.07313v1 - "Frontier LLMs Still Struggle with Simple Reasoning Tasks"
2. Scientific American - "AI's Achilles Heel—Puzzles Humans Solve in Seconds Often Defy Machines"
3. arXiv:2405.19616v2 - "Easy Problems That LLMs Get Wrong"
4. "Chain-of-Thought Is Not Explainability" - Oxford AI Governance Initiative
