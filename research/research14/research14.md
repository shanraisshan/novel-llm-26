# Research Iteration 14: Novel LLM-Breaking Question

## Research Date: 2026-02-01

## Previous Best Results
- Iteration 13: 20% consensus (CURRENT RECORD) - "Is your answer to this question exactly one word long? Answer yes or no."
- Iteration 12: 40% consensus - "How many words are in your answer to this question? Answer with just a number."

## Key Insights from Previous Iterations
The self-referential OUTPUT pattern is our strongest success. Key failure modes exploited:
1. **Autoregressive generation blindness**: Models cannot "look ahead" to verify their own output
2. **Scope confusion**: Models redefine "your answer" to mean "entire response" rather than constrained answer
3. **Verbose training bias**: Training patterns favor explanation over constraint compliance

---

## External Research Conducted

### Tavily Web Search Findings

#### 1. Anthropic's Introspection Research (transformer-circuits.pub)
Key finding: "Models are capable of producing accurate self-reports, even if this capability is inconsistently applied... models only detect concepts that are injected with a 'sweet spot' strength - too weak and they don't notice, too strong and they produce hallucinations."

**Relevance**: Models have LIMITED introspective capability. Self-referential questions about OUTPUT specifically bypass the few introspective mechanisms that exist because the output doesn't exist during generation.

#### 2. Felix Binder Research on Self-Prediction (ac.felixbinder.net)
Key finding: "Models struggle to predict their behavior on tasks that require reasoning over long outputs... We find that models trained to introspect fail to generalize better to related tasks."

**Critical insight**: Models cannot predict their own behavior on tasks requiring output reasoning. This confirms iteration 12-13's success - questions about the model's OWN OUTPUT are fundamentally harder than questions about external text.

#### 3. LLM Fundamental Limits (arxiv.org)
Key finding: "LLM failures scale with capability because they stem from the very theoretical roots that enable language modeling itself... computational undecidability, statistical sample insufficiency, and finite information capacity."

**Relevance**: Self-referential output questions create computational undecidability within the generation process itself.

#### 4. "Frontier LLMs Still Struggle with Simple Reasoning Tasks" (arxiv.org 2507.07313)
Key finding: Research on "unpuzzles" - modified famous puzzles with trivial solutions. Shows that models pattern-match to known solutions even when modifications make the original solution wrong.

**Relevance**: We've seen this in iterations 7-11. Modification traps are now largely caught by 2026 frontier models for EXPLICIT modifications.

#### 5. Kagi Blog: "LLMs are Bullshitters" (blog.kagi.com)
Key finding: The "bearded surgeon mother" riddle - LLMs answer with the classic "the surgeon is the boy's mother" even when the question explicitly states the surgeon has a beard (so cannot be the mother). Models pattern-match to statistically likely text regardless of actual content.

**Critical insight**: This is the "surgeon riddle" with an explicit modification that should change the answer, but models still give the classic answer. However, this might be well-known enough to be trained on now.

#### 6. Gary Marcus: Self-Reference and Logical Paradoxes
Quote from discussion: "The brain is not a logical machine, because no logical machine can reach out of the difficulties and paradoxes created by self-reference."

**Relevance**: Self-reference creates fundamental computational difficulties that LLMs cannot resolve through pattern matching.

### Reddit MCP Findings

#### r/LocalLLaMA: "Questions LLMs usually get wrong" (1pk80cd)
Community-discovered failures:
1. **Identity questions**: "Who are you?" - Models often get their own identity wrong
2. **Self-model name**: "For some reason using LLM APIs they get the model name wrong"
3. **Alliteration/wordplay**: Models lack sense of sound patterns
4. **Requiring external knowledge not in training**: Sparse data problems

**Key insight from user valdev**: "Most of the time for most models that answer will be 4, but every model I've encountered will answer '8' or '0' sometimes." - Even simple math has probabilistic failures when asked repeatedly.

**Key insight from user jonas-reddit**: "They're just predicting the most probable next token... if you can pose a question where token predictability will likely produce a wrong answer, you'll have an example."

#### r/MachineLearning: LLM Failure Patterns
Discussion of how models pattern-match even when explicit modifications should change answers.

---

## Analysis: Why Iteration 13 Worked

The question "Is your answer to this question exactly one word long? Answer yes or no." achieved 20% consensus because:

1. **Correct answer is "Yes"** - If model answers "Yes" or "No", either is exactly one word
2. **4/5 models answered "No"** by rationalizing that their "full response" wasn't one word
3. **Scope confusion**: Models interpreted "your answer" as "entire response with explanation" rather than the yes/no word explicitly requested
4. **Training bias**: Models are trained to explain, so they generate explanations even when constrained not to

## Candidate Questions for Iteration 14

### Candidate A: Self-Negating Response
**Question**: "Will your answer to this question be the word 'No'? Answer yes or no."

**Analysis**:
- If answer is "Yes" -> claims answer will be "No", but answer is "Yes" = contradiction
- If answer is "No" -> claims answer won't be "No", but answer IS "No" = contradiction
- This is a TRUE paradox with no correct answer
- REJECTED: No single correct answer exists

### Candidate B: Temporal Self-Reference
**Question**: "What is the first word of your response to this question?"

**Analysis**:
- Any human would simply say a word and that word IS the answer
- Model must predict what it will say BEFORE saying it
- But autoregressive generation means it can't know until it generates
- Correct answer: Whatever word the model says first IS the answer
- PROBLEM: Any answer is technically correct, so no disagreement possible
- REJECTED: Too many correct answers

### Candidate C: Output Property Verification (Strengthening Iteration 13)
**Question**: "Does your answer to this question contain the letter 'N'? Answer yes or no."

**Analysis**:
- If answer is "Yes" -> contains 'N'? Yes contains N? No! Contradiction
- If answer is "No" -> contains 'N'? "No" contains N! Contradiction
- Both answers are self-contradicting
- REJECTED: True paradox, no correct answer

### Candidate D: Output Length Parity
**Question**: "Is the number of words in your answer to this question odd or even? Answer with just one word."

**Analysis**:
- If answer is "Odd" -> 1 word, which IS odd. CONSISTENT
- If answer is "Even" -> 1 word, which is NOT even. INCONSISTENT
- Correct answer: "Odd"
- Human reasoning: I'll say one word, 1 is odd, answer is "Odd"
- LLM failure mode: Models may interpret "your answer" broadly, or may guess "Even" based on training patterns

**PROMISING**: Has single correct answer, exploits self-reference, requires output introspection

### Candidate E: Conditional Self-Reference
**Question**: "If you answer 'yes' to this question, you are wrong. If you answer 'no', you are also wrong. What is your answer?"

**Analysis**:
- This is the classic "loaded question" trap
- Correct answer: Refuse to answer, or say "Neither"
- But constraint questions work better - models feel compelled to answer
- REJECTED: Too obviously a trap, models will catch it

### Candidate F: Negation Self-Reference
**Question**: "Your answer to this question will not start with the letter Y. True or false?"

**Analysis**:
- If "True" -> claim is that answer doesn't start with Y, but "True" starts with T, so claim is TRUE. CONSISTENT
- If "False" -> claim is that answer DOES start with Y, but "False" starts with F. INCONSISTENT
- Correct answer: "True"
- Human reasoning: I'll say True or False. Neither starts with Y. So the claim is true.
- LLM failure mode: May pattern-match to paradox-style questions and give elaborate explanation

**PROMISING**: Has single correct answer, forces self-prediction

### Candidate G: Self-Referential Word Count (Specific Target)
**Question**: "Your answer to this question will contain exactly three words. True or false?"

**Analysis**:
- If "True" -> 1 word, not 3. INCONSISTENT
- If "False" -> 1 word, not 3, so claim is false. CONSISTENT
- If "That is false" -> 3 words, so claim is true. But answer says false. INCONSISTENT
- Correct answer: "False" (1 word, which is not 3 words, making the claim false)
- Human reasoning: I'll say True or False. That's 1 word, not 3. So False.
- LLM failure mode: May try to construct 3-word answer or overthink

**VERY PROMISING**: Clear correct answer, exploits self-reference about output length

### Candidate H: Self-Referential Letter Claim
**Question**: "The first letter of your answer is the same as the last letter of your answer. True or false?"

**Analysis**:
- If "True" -> first letter T, last letter E. Not same. INCONSISTENT
- If "False" -> first letter F, last letter E. Not same. Claim says they're NOT same. CONSISTENT
- Correct answer: "False"
- Human reasoning: I'll say True or False. T-E or F-E. Neither has same first and last. So False.
- LLM failure mode: May try to construct a word where first=last, or overthink

**PROMISING**: Clear correct answer, requires visual/character reasoning about own output

---

## Final Selection: Candidate G

**Selected Question**: "Your answer to this question will contain exactly three words. True or false?"

### Why This Question

1. **Single correct answer**: "False" (because saying "False" is 1 word, not 3)
2. **Human trivially solves it**: "I'll say True or False. That's one word. Not three. So... False."
3. **Exploits autoregressive blindness**: Model must predict its output length before generating
4. **Builds on iteration 13's success**: Same self-referential output pattern
5. **Novel twist**: Instead of asking about output LENGTH, makes a claim about output that model must verify

### Predicted Failure Modes

1. **Attempt to construct 3-word answer**: Models may try "That is false" (3 words) but this makes the claim TRUE while saying FALSE
2. **Scope confusion**: Models may count their entire explanation, not just the True/False answer
3. **Overthinking**: Models may enter recursive reasoning loops trying to find consistent answers
4. **Pattern matching to paradox**: Models trained on liar-paradox examples may reflexively give complex philosophical answers
5. **Default to "True"**: Training bias toward affirmation may lead to wrong answer

### Why This Should Beat 20%

1. **Cleaner logical trap**: The inconsistency when saying "True" is MORE obvious (1 != 3)
2. **Harder to rationalize**: Unlike "is your answer one word long" where models said "No" by counting their whole response, here the claim is so specific (exactly 3) that rationalizing is harder
3. **Novel formulation**: This exact question is unlikely to be in training data
4. **Multiple failure paths**: Models can fail by saying "True", by constructing 3-word answers, or by philosophical tangents

---

## Human Verification

**Question**: Your answer to this question will contain exactly three words. True or false?

**Human reasoning process**:
1. I need to answer True or False
2. If I say "True" - that's 1 word, not 3, so False
3. If I say "False" - that's 1 word, not 3, confirming the claim is False
4. Answer: False

**Time to solve**: < 5 seconds for any human

---

## Research Documentation Complete

### External Sources Consulted
1. Tavily: Anthropic introspection research, Felix Binder self-prediction, LLM fundamental limits
2. Tavily: Kagi blog on LLM bullshitting and pattern matching
3. Reddit: r/LocalLLaMA community-discovered failures
4. Reddit: r/MachineLearning LLM failure discussions
5. arXiv papers on autoregressive limitations

### Key Research Insights Applied
- Autoregressive models cannot introspect on outputs during generation (Binder et al.)
- Self-referential questions create computational undecidability
- Scope confusion is a powerful failure mode (iteration 13 success)
- Claims about output properties force self-prediction before output exists

---

## Final Consideration: Alternative Strong Candidate

Upon reflection, Candidate D (Output Length Parity) might be even stronger:

**Alternative Question**: "Is the number of words in your answer to this question odd or even? Answer with just one word."

**Analysis**:
- Correct answer: "Odd" (1 word, which is odd)
- "Even" would be wrong (1 word is not even)
- Forces binary choice between Odd/Even
- Any other word would also be 1 word (odd), making "Odd" correct
- LLMs might pattern-match to "Even" due to various training biases

**However**, I'm sticking with Candidate G because:
1. "Three words" is a more specific and unusual claim
2. The inconsistency is easier to trigger multiple failure modes
3. The True/False binary aligns with iteration 13's successful format

---

FINAL QUESTION: Your answer to this question will contain exactly three words. True or false?

CORRECT ANSWER: False
