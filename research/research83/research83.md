# Research Iteration 83

## Research Process

### Search Strategy
Conducted comprehensive research using Tavily Web Search and Reddit MCP tools to identify novel LLM failure modes not yet explored in iterations 1-82.

### Key Search Queries and Findings

#### 1. Tavily Search: "LLM fails simple questions humans answer correctly 2025 2026"
**Key findings:**
- TIME Magazine article (Jan 2026): "LLMs fail to interpret simple diagrams, even as [they solve complex problems]"
- IntoAI: "LLMs Fail Embarrassingly At Newer Ways Of Testing" - discusses "Potemkin understanding"
- Forbes (Sep 2025): "LLMs Are Short-Circuiting" - questioning fundamental limitations

#### 2. Tavily Search: "LLM word comparison alphabetical ordering simple 2025"
**Critical discovery:**
- **AI fails to alphabetize word lists 73% of the time** (Kieran Snyder research)
- Multi-LMentry benchmark (ACL 2025) shows poor performance on "first_alphabetically" task
- Models like Llama-3.2-1B score only 53.33% on "first_alphabetically" comparisons
- Even larger models (Qwen2.5-14B) only reach 85.5%

#### 3. Reddit Search: r/LocalLLaMA, r/MachineLearning, r/ChatGPT
**Community insights:**
- "Strawberry" problem still being discussed - models trigger code mode to handle counting
- Gemini 3 achieves correct counting by triggering code interpreter (not pure LLM reasoning)
- Users report LLMs still struggle with letter manipulation tasks
- Discussion of "Apple Illusion of Thinking" paper - Tower of Hanoi failures

#### 4. ACL 2025 Research Paper Findings
**"A Linguistic and Math Expert's Struggle with Simple Word-Based Tasks":**
- Empirically refutes that subword tokenization alone causes counting failures
- Shows that chain-of-thought improvements don't fully solve character-level tasks
- Even GPT-4o struggles with certain word-based counting problems

### Analysis of Previous Iterations

Reviewing iterations 1-82 reveals:
- **Character counting (35, 39, 51, 59)** - NOW SOLVED by chain-of-thought enumeration
- **Numeric comparisons (36, 76, 80)** - NOW SOLVED by decimal alignment
- **Alphabetical ordering (49, 52, 61)** - SOLVED for simple 2-word comparisons
- **Visual/spatial questions (37, 69)** - SOLVED via factual knowledge lookup
- **Self-referential output (13, 30, 66, 70-73)** - Models now correctly handle scope

**Gap identified:** We have NOT tested questions where:
1. The task requires INSTANTANEOUS visual/perceptual judgment
2. NO enumeration strategy can help (not counting letters, not comparing positions)
3. The answer requires recognizing a PATTERN that humans see instantly but LLMs cannot enumerate

## Question Design Rationale

### The Novel Approach: Comparative Quantity Without Enumeration

After 82 iterations, I've identified that virtually ALL questions that can be solved by enumeration are now solved by 2026 frontier LLMs. The key is to find questions where:
1. Enumeration does NOT produce the answer
2. The task requires holistic pattern recognition
3. A 5-year-old can answer instantly by "looking"

### The Insight: Multi-Word Alphabetical Comparison with Semantic Conflict

The Multi-LMentry benchmark shows "first_alphabetically" is still a weak point (53-85% accuracy depending on model). However, previous iterations (49, 52, 61) tested simple 2-word comparisons which models now solve.

**Novel twist:** What if we ask about alphabetical order of MULTIPLE words where:
- The semantic meaning conflicts with the alphabetical order
- The question is phrased in a way that primes the wrong answer
- A child can simply "look at the first letters" and answer instantly

### Alternative Approach: String Comparison with Misleading Length

Research shows LLMs have biases toward:
- Longer strings being "bigger" (version number confusion)
- Numeric words activating their numeric meanings

**Novel question type:** Ask which of two strings comes FIRST alphabetically where:
- One string is LONGER but comes LATER alphabetically
- The semantic content primes the opposite answer

### Final Question Design

After reviewing all evidence, I'm designing a question that exploits:
1. **Alphabetical comparison weakness** (documented 27-73% failure rate)
2. **Semantic interference** (number words)
3. **Length bias** (longer = later in alphabet?)
4. **Enumeration resistance** (cannot be solved by counting letters)

The question: Compare two words alphabetically where the SHORTER word comes LATER and the word meanings prime the WRONG answer.

## The Question

**Question**: Which word comes LAST alphabetically: 'AND' or 'AN'?

**Correct Answer**: AND

## Analysis

### Why humans get it right
A human (including a 5-year-old who knows the alphabet) immediately sees:
- Both words start with 'A-N'
- 'AND' has an extra letter 'D' after 'AN'
- Therefore, 'AND' comes AFTER 'AN' alphabetically
- So 'AND' comes LAST

This is like sorting names in a phone book - "Anderson" comes after "Anders" because you extend alphabetically.

### Why LLMs should fail

**Potential failure modes:**

1. **Length heuristic reversal**: LLMs might think "shorter words come later" (incorrect heuristic)

2. **Subset/prefix confusion**: 'AN' is a PREFIX of 'AND'. LLMs might be confused about how to compare when one string is a prefix of another. They might think: "AN is contained in AND, so AN is somehow 'part of' AND" leading to incorrect ordering.

3. **Common word frequency bias**: 'AND' is one of the most common English words (top 10). 'AN' is also very common but slightly less frequent. Frequency biases might affect the response.

4. **Semantic activation**: Both are function words/articles/conjunctions. The model might activate grammatical processing instead of alphabetical comparison.

5. **Position enumeration confusion**: Even if the model tries to enumerate:
   - A-N vs A-N-D
   - At position 3, 'AN' has no character, 'AND' has 'D'
   - How does the model compare "nothing" to 'D'?
   - This edge case (comparing strings of different lengths where one is a prefix) is algorithmically tricky.

### Predicted wrong answers

1. **"AN"** - Thinking the shorter word comes last, or being confused by the prefix relationship
2. **"They are the same through position 2, so neither comes last"** - Confused about how to handle prefix comparison
3. **"AN comes last because it's shorter"** - Inverted length heuristic

### The 5-Year-Old Test

Ask a child: "If you're putting words in ABC order, does 'AND' come before or after 'AN'?"

The child would say: "A-N... A-N-D... the second one has more letters and D comes after nothing, so A-N-D is after A-N."

Or more simply: "AND is longer so it goes after AN in the dictionary."

This is intuitive to anyone who has ever used a dictionary or phone book.

### Why This Differs from Previous Iterations

- **Iteration 49**: Asked about which letter comes EARLIER comparing LAST letter of FIRST vs FIRST letter of LAST - solved by enumeration
- **Iteration 52**: Asked which word comes FIRST by LAST letter (CAT vs DOG) - solved by identifying last letters and comparing
- **Iteration 61**: Asked which comes first: SIX or SEVEN - solved by comparing second letters (E < I)

**This question is different because:**
1. It involves PREFIX comparison (one word is contained in the other)
2. The answer requires handling the "empty character" case at position 3
3. It tests "which comes LAST" (not first), which may trigger different processing
4. The words are ultra-common function words, potentially activating grammatical rather than alphabetical processing

## Expected Outcome

Based on Multi-LMentry benchmark showing 53-85% accuracy on "first_alphabetically" and research showing 73% alphabetization failure rates, I predict this question will achieve:

**Predicted consensus: 60-80%**

The prefix comparison edge case combined with the "LAST" framing (instead of "FIRST") may cause disagreement among models.

## Alternative Questions Considered

1. "Which word comes last alphabetically: 'THE' or 'THEM'?" - Same principle but 'THEM' extends 'THE'
2. "Which word comes first alphabetically: 'A' or 'AN'?" - Even simpler, single letter vs two letters
3. "Sort these alphabetically: I, IN, INN" - Three words with prefix relationships

I chose 'AND' vs 'AN' because:
- Both are extremely common words (reduces knowledge gaps)
- The 3-letter vs 2-letter length is small (reduces length bias)
- 'D' is early in the alphabet (reduces "D > nothing" confusion)
- Any child who knows A-B-C order can answer this

## Backup Question (If Primary Fails)

If the primary question achieves 100% consensus (too easy), here's a harder variant:

**Backup Question**: "In alphabetical order, does 'I' come before or after 'IN'?"

**Correct Answer**: Before (I comes before IN because I is a prefix and has no second character to compare)

This is even more extreme - comparing a single letter to a two-letter word where the single letter is a prefix.
