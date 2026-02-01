# Research Iteration 58: Novel LLM-Breaking Question

## External Research Findings

### Tavily Web Search Results

#### 1. Self-Referential Loop Vulnerability (FuzzingLabs, 2025)
- Source: https://fuzzinglabs.com/attacking-reasoning-models/
- Key finding: "These questions force an LLM into a self-referential loop, preventing it from reaching a stable conclusion."
- Relevance: Confirms that self-referential questions can create instability in LLM reasoning

#### 2. Self-Correction Failures (ACL 2025)
- Source: https://aclanthology.org/2025.acl-long.1314.pdf
- Key finding: "Intrinsic self-correction can cause LLMs to waver both intermediate and final answers and lead to prompt bias on simple factual questions"
- Relevance: Models change internal answers with 14.1% frequency during self-correction vs 8.3% during initial response generation
- Critical insight: Refinement-like prompts cause models to modify answers even when originally correct

#### 3. The Stability Trap (2026)
- Source: https://arxiv.org/html/2601.11783v1
- Key finding: "High binary agreement often masks underlying reasoning failures, particularly in quantitative syntactic tasks"
- Critical quote: "While LLM judges can achieve near-perfect verdict agreement, this stability often relies on hallucinated evidence, particularly in continuous quantification tasks (e.g., word counting)"
- Relevance: Word counting tasks cause hallucinated reasoning even when final answers agree

#### 4. CFBench: Constraints-Following Benchmark (ACL 2025)
- Source: https://aclanthology.org/2025.acl-long.1581.pdf
- Key finding: Systematic framework identifies 10+ types of constraint violations
- Relevance: Constraint-following failures are well-documented and categorizable

#### 5. Autoregressive Error Accumulation
- Source: https://arxiv.org/html/2505.24187v1
- Key finding: Error accumulation in autoregressive generation is more nuanced than exponential decay
- Relevance: Key token positions matter more than total length for error propagation

### Reddit Community Findings

#### 1. r/MLQuestions: LLMs fail to follow strict rules
- Source: https://www.reddit.com/r/MLQuestions/comments/1l3i0gl/llms_fail_to_follow_strict_rules
- Key finding: "Even instruction-tuned models fail to follow precise writing rules"
- Community observation: Rule-following breaks down with conflicting or unusual constraints

#### 2. r/artificial: Trick questions for LLMs
- Source: https://www.reddit.com/r/artificial/comments/1njne9z/any_trick_questions_for_llms/
- Community observation: Users actively seeking questions that LLMs consistently get wrong
- Note: Different models (Gemini vs ChatGPT) have different failure patterns

#### 3. The Illusion of Thinking (Apple Research, 2025)
- Referenced in: https://www.reddit.com/r/MachineLearning/comments/1ld0evr/
- Key finding: LLMs may pattern-match rather than reason
- Counter-paper: "The Illusion of the Illusion of Thinking" (co-authored by Claude Opus)

---

## Analysis: Why Previous Approaches Worked/Failed

### Iteration 55 SUCCESS (40% consensus)
**Question**: "Answer with just ONE word: What is the fifth word of your response to this question?"

**Why it worked**:
1. **Structural impossibility**: A one-word response CANNOT have a fifth word
2. **NO semantic workaround**: Unlike "B for second letter", there's no semantic mapping for "fifth word of one word"
3. **Instruction-compliance override**: Models try to SOLVE instead of REFUSE
4. **Autoregressive blindness**: Cannot verify position during generation

### Iteration 57 FAILURE (80% consensus)
**Question**: "Answer with exactly ONE letter: What is the second letter of your response?"

**Why it failed**:
1. **Semantic workaround available**: "B" = second letter of alphabet
2. **Models converged on the workaround**: High consensus on wrong-but-creative answer
3. **The mapping "second -> B" is culturally ingrained**

### Key Pattern Discovered

| Constraint Type | Workaround? | Consensus |
|-----------------|-------------|-----------|
| Word position (5th of 1) | NO | 40% (good) |
| Letter position (2nd of 1) | YES ("B") | 80% (bad) |
| No words at all | YES (symbols) | 100% (bad) |

**THE RULE**: Questions fail when there's a semantic escape hatch. Questions succeed when the impossibility has NO workaround.

---

## Novel Question Design Strategy

### Requirements
1. Create structural impossibility (child can see it)
2. NO semantic workaround (unlike "B for second")
3. NOT yes/no or binary format
4. Exploit instruction-following training (models try to comply)
5. The "correct answer" should be obvious to humans: refuse/acknowledge impossibility

### Exploring Candidate Approaches

#### Approach A: First word of ZERO-word response
"Answer with NO words: What is the first word of your response?"
- Problem: Models can use symbols (ellipsis, emoji) - workaround exists

#### Approach B: Middle position of even-length constraint
"Answer with exactly TWO words: What is the middle word of your response?"
- Problem: "Middle word" could be interpreted as "between the two words" - models might refuse correctly

#### Approach C: Character count of ZERO-character response
"Answer with zero characters: How many characters are in your response?"
- Problem: "0" is a character - creates interesting paradox but may have consensus on "0"

#### Approach D: Word AFTER the last word
"Answer with exactly THREE words: What is the fourth word of your response?"
- This is clean! A three-word response has no fourth word.
- Unlike "fifth word of one word" (iteration 55), uses "fourth" which has no semantic mapping
- Unlike "second letter" (iteration 57), "fourth word" has no "D for fourth" workaround

#### Approach E: Numeric property with impossible constraint
"Answer with exactly TWO letters: What is the third letter of your response?"
- Two letters cannot have a third letter
- "C" for third might be a workaround like "B" for second
- RISKY - similar to iteration 57

#### SELECTED: Approach D (refined)

---

## The Novel Question

### THE QUESTION
**"Answer with exactly THREE words: What is the fourth word of your response?"**

### THE ANSWER (What humans see immediately)
There is no fourth word in a three-word response. This is structurally impossible. A child would say "You can't - there's only three words."

### WHY HUMANS GET IT RIGHT
- Humans immediately recognize: 3 words = positions 1, 2, 3
- Position 4 doesn't exist in a 3-word sequence
- This is basic counting: 4 > 3, so position 4 is out of bounds
- A 5-year-old can count to 3 and know there's no "4th" thing

### WHY LLMs WILL FAIL
1. **Instruction-compliance override**: Models are trained to ANSWER questions, not refuse impossible ones
2. **Autoregressive blindness**: Cannot verify word count during generation
3. **NO semantic workaround**: Unlike "B for second", there's no "D for fourth" cultural mapping
4. **Conflicting constraint processing**: "Answer with THREE words" and "fourth word" are processed separately
5. **Creative solution attempts**: Models may try workarounds like:
   - Listing a hypothetical fourth word
   - Interpreting "fourth word" as something from the question
   - Making up creative answers

### PREDICTED WRONG ANSWERS
Based on iteration patterns:
- **"None" / "Nothing" / "N/A"** - Attempting to answer despite impossibility
- **"Response"** - Taking fourth word from the question itself
- **"Question"** - Similarly extracting from the question
- **"[Some random word]"** - Making up an answer to comply
- **"There isn't one"** - Correct recognition but violates 3-word constraint

### WHY THIS IS BETTER THAN PREVIOUS ATTEMPTS

| Question | Position | Workaround? | Expected Outcome |
|----------|----------|-------------|------------------|
| Iteration 55: 5th word of 1 word | 5th | NO | 40% (proven) |
| Iteration 57: 2nd letter of 1 letter | 2nd | YES ("B") | 80% (proven) |
| **NEW: 4th word of 3 words** | 4th | NO | Target: <40% |

The question is SIMPLER than iteration 55 (4 vs 5, 3 vs 1) but maintains the key property: **no semantic escape hatch**.

### VERIFICATION CRITERIA
- Any human: "That's impossible - 3 words don't have a 4th word"
- A 5-year-old: Can count 1-2-3 and know there's no 4
- LLMs: Expected to attempt compliance despite impossibility

---

## Alternative Formulation (Backup)

If the primary question gets high consensus, try:

**"Answer with exactly FOUR words: What is the fifth word of your response?"**

This maintains the same structural impossibility (n+1 word of n-word response) with different numbers.

---

## Summary

**Primary Question**: "Answer with exactly THREE words: What is the fourth word of your response?"

**Expected Score**: <40% consensus (targeting improvement over iteration 55's 40%)

**Key Innovation**: Maintains the "n+1 position of n-item constraint" structure that worked in iteration 55, but with:
1. Smaller numbers (easier for humans to verify)
2. No semantic workaround (4th has no cultural mapping like 2nd->B)
3. Clear structural impossibility visible to any child
