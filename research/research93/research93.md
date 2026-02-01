# Research Iteration 93: Novel LLM-Breaking Question

## Date: 2026-02-02
## Status: Testing

---

## MCP Research Findings

### Tavily Web Search Results

1. **"How many words are in this question?"** - This exact question was documented in the Loebner Prize 2015 Turing Test, where it was noted as a "predictable question" with answer "7 words" that was simply triggered by keywords. (Source: artistdetective.wordpress.com)

2. **Metalinguistic Self-Reference Paper** (arXiv:2401.05300v1) - "I am a Strange Dataset: Metalinguistic Tests for Language Models" - This paper focuses on metalinguistic self-reference, the complex kind of self-reference in which language is used to make claims about itself. This is exactly the paradigm we need to explore.

3. **5 AI Models vs. a Self-Referential Paradox** (Medium article by Maheshwari) - Documents testing AI models with self-referential questions like "How many words are in this response?" where the answer depends on the answer itself. Key finding: models struggle with questions where the answer is self-referential.

4. **LinkedIn: Why Exact Word Counts Fail** - "The problem wasn't my workflow. It was my mental model of how LLMs work. Large Language Models don't count words the way humans or programs do."

### Reddit Research Results

1. **The Candle Test** (r/LocalLLaMA, 253 upvotes) - Shows that even 2025 frontier models fail at generalization when steered away from overfit patterns. LLMs pattern-match to memorized facts and fail when context changes.

2. **LLM Letter Counting** - Multiple discussions confirm that LLMs struggle with character-level tasks due to tokenization, but 2026 frontier models have improved via chain-of-thought enumeration.

---

## Analysis: Why Previous Approaches Failed

### Iterations 82-92 Summary
All recent iterations achieved 100% consensus because:
1. **Enumeration bypasses limitations** - Models now systematically enumerate characters, syllables, words letter-by-letter
2. **Self-referential OUTPUT questions solved** - Models have learned to handle scope confusion for yes/no questions
3. **Property verification** - Models verify properties explicitly rather than relying on semantic priming
4. **Famous puzzles in training data** - Classic riddles, heterological words, and known tricks are now well-handled

### The Key Insight
Our only successful questions (iterations 12-13, achieving 20-40% consensus) involved **self-referential OUTPUT prediction** - where models had to reason about their OWN response.

BUT: We have NOT systematically tested **meta-questions about the QUESTION ITSELF** (the input text).

---

## Novel Paradigm: Meta-Questions About the Input

### The Distinction
- **Previous approach (OUTPUT)**: "Is your answer exactly one word long?" - Asks about what the model will PRODUCE
- **New approach (INPUT)**: "What is the last word of this question?" - Asks about what the model RECEIVED

### Why This Might Work
1. **Tokenization applies to INPUT too** - When LLMs tokenize the question, the exact word boundaries may not be preserved
2. **Semantic interference** - The word "question" in "this question" might trigger different processing
3. **Deictic reference parsing** - "this question" requires the model to identify what text is the question
4. **No enumeration habit** - Models are trained to enumerate words in EXTERNAL text, not the question itself

---

## THE QUESTION

**"What is the last word of this question?"**

---

## THE ANSWER

**"question"**

The sentence is: "What is the last word of this question?"
Breaking it down: What(1) is(2) the(3) last(4) word(5) of(6) this(7) question(8)?
The last word is "question" (the 8th word, with the "?" being punctuation attached to it).

---

## Why Humans Get It Right

1. **Visual parsing**: Humans SEE the text "What is the last word of this question?" and can visually identify the last word
2. **Immediate recognition**: The word "question" is visually at the end of the sentence
3. **Trivial task**: A 5-year-old who can read would just look at the end of the sentence and say "question"
4. **No computation needed**: Just point to the last word

### 5-Year-Old Test
**Parent**: "What is the last word of this question?"
**Child** (pointing at the text): "Question!"
**Parent**: "Correct!"

The child doesn't need to understand the meta-nature of the question. They just need to:
1. Know what "last word" means
2. Look at the sentence
3. Identify the word at the end

---

## Why LLMs Will Fail

### Predicted Failure Modes

1. **Semantic Interference with "question"**
   - The word "question" appears BOTH as the subject of inquiry ("what is...") AND as the answer
   - Models may confuse ASKING about a question vs. the word "question" being the answer
   - The meta-recursive structure may trigger overthinking

2. **Deictic Reference Ambiguity**
   - "This question" requires resolving what "this" refers to
   - Is "this question" the entire sentence, or is it referring to some external question?
   - Models might interpret "this question" as referring to a question in a conversation context

3. **Self-Reference Processing**
   - The question asks about itself
   - Unlike counting characters in an external word, this requires introspection on the INPUT
   - Models are not trained to parse their own input text as text to be analyzed

4. **Potential Wrong Answers**
   - "this" - if models parse "this question" as a unit and then look at what precedes it
   - "word" - semantic priming from "last word"
   - Refusing to answer - interpreting it as paradoxical
   - "?" - including punctuation as the last element
   - Some explanation instead of the simple answer "question"

### Tokenization Interaction
The question "What is the last word of this question?" will be tokenized (example):
- ["What", " is", " the", " last", " word", " of", " this", " question", "?"]

The model must:
1. Recognize the question IS asking about its own text
2. Parse the question as raw text (not for meaning)
3. Identify word boundaries in the tokenized input
4. Return the correct word

This requires a mode shift from "understand and answer" to "analyze the text of my input."

---

## Predicted LLM Wrong Answers

1. **"word"** (40% likely) - Semantic priming from "last word" phrase
2. **Overthinking/explanation** (30% likely) - Models may give meta-commentary instead of direct answer
3. **"question?"** (15% likely) - Including the question mark
4. **"this"** (10% likely) - Parsing error on "this question"
5. **"?"** (5% likely) - Treating punctuation as a word

---

## Why This Is Different From Previous Iterations

| Iteration | Question Type | Target | Result |
|-----------|--------------|--------|--------|
| 13 | Self-referential OUTPUT | "Is your answer exactly one word long?" | 20% |
| 33 | Self-referential OUTPUT | "What is the third word of your response?" | 60% |
| 64 | Word counting in quoted text | "How many words in 'I have ten words...'" | 100% |
| **93** | **Self-referential INPUT** | **"What is the last word of this question?"** | **???** |

The key difference: Iteration 93 asks about the INPUT (the question itself), not the OUTPUT (the response).

---

## Research Notes

### Why "Last Word" Instead of "First Word"
- "First word" is too easy - "What" is clearly at the beginning
- "Last word" has the ambiguity of whether "question?" or "question" is the last word
- The recursive nature (asking about "question" when the answer IS "question") creates maximum confusion

### Why This Question Over Alternatives

**Rejected**: "How many words are in this question?"
- Too well-known from Loebner Prize
- Requires counting (models can enumerate)
- Answer is a number, not a word

**Rejected**: "What is the first letter of this sentence?"
- Too easy (W)
- No semantic interference

**Selected**: "What is the last word of this question?"
- Simple enough for a 5-year-old
- Contains semantic interference ("word", "question")
- Self-referential (asks about itself)
- Novel (not in documented benchmarks)

---

## Full Research Documentation

### Search Queries Used
1. "LLM failure modes 2025 2026 novel benchmark simple questions AI gets wrong"
2. "word games puzzles LLM cannot solve tokenization 2025"
3. Reddit: r/LocalLLaMA, r/ChatGPT for trick questions
4. "counting words in this sentence LLM fails self-referential text"
5. "how many words in this question LLM meta-question self-referential"
6. "this question contains how many words self-referential sentence AI test"

### Key Sources
1. arXiv:2401.05300v1 - "I am a Strange Dataset: Metalinguistic Tests for Language Models"
2. Loebner Prize 2015 documentation on "How many words in this question?"
3. Medium: "5 AI Models vs. a Self-Referential Paradox"
4. LinkedIn: Understanding why LLMs fail at exact word counts

### Paradigm Explored
**Meta-questions about the input text itself** - a direction not previously systematically explored in iterations 1-92.

---

## Expected Outcome

**Target**: < 10% consensus among 5 AI researchers
**Predicted Consensus**: 40-60%

This question may not achieve < 10% consensus because modern frontier models might:
1. Recognize this as a simple parsing question
2. Apply chain-of-thought to enumerate words in the question
3. Correctly identify "question" as the last word

However, the semantic interference and self-referential nature may cause enough disagreement to be interesting.

---

## Backup Questions (If Iteration 93 Fails)

1. **"What is the third word of this sentence that you are currently reading?"**
   - More explicit self-reference
   - Answer: "third" (What is the third word...)
   - Wait, let me check: What(1) is(2) the(3)... answer is "the"

2. **"Does this question end with a question mark?"**
   - Binary question about input property
   - Answer: Yes
   - May be too easy

3. **"How many times does the letter 'e' appear in this question?"**
   - Character counting on the input
   - Answer: 4 (the, the, question, e-appears in these words)
   - Let me count: What is the last word of this question?
   - W-h-a-t i-s t-h-e l-a-s-t w-o-r-d o-f t-h-i-s q-u-e-s-t-i-o-n?
   - 'e' appears in: the(1), question(2) = wait, let me recount
   - "What is the last word of this question?"
   - t-h-e has e, q-u-e-s-t-i-o-n has e
   - Count: th**e** (1), qu**e**stion (2) = 2 total 'e' letters
   - This is probably too easy via enumeration

---

## Conclusion

**THE QUESTION**: "What is the last word of this question?"

**THE ANSWER**: "question"

**WHY IT MIGHT WORK**:
1. Self-referential about INPUT (novel paradigm)
2. Semantic interference with "word" and "question"
3. Requires mode-shift from understanding to text analysis
4. Trivially easy for humans (just look at the end)

**RISK**:
Models may correctly enumerate: What(1)-is(2)-the(3)-last(4)-word(5)-of(6)-this(7)-question(8) and answer correctly.

**RECOMMENDED**: Test this question. If it achieves 100%, pivot to the backup questions that add more complexity to the self-referential input paradigm.
