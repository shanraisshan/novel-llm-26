# Research Iteration 51

## External Research Findings

### Tavily Web Search Results

1. **Tokenization and Character Counting** (arxiv.org/html/2412.18626v1 - "Why Do Large Language Models Struggle to Count Letters?"):
   - LLMs concentrate errors on letters with multiplicity > 1
   - The issue is LLMs may be unable to identify letters with multiplicity larger than one within a token
   - Chain-of-thought enumeration CAN bypass this, but requires explicit prompting

2. **Multi-step Counting Tasks** (arxiv.org/html/2507.07313v1 - "Frontier LLMs Still Struggle with Simple Reasoning Tasks"):
   - Word counting performance degrades with number of words to count
   - Character counting fails at scale
   - "Accuracy of all models completely collapses beyond a certain complexity threshold"

3. **Spatial Reasoning Gaps** (GeoGramBench):
   - LLMs exceed 80% on local primitive recognition but performance on global abstract integration never surpasses 50%
   - "Middle Score Anomaly" - models achieve 30-50% on tasks humans solve perfectly or fail entirely

4. **Mental Box Folding** (Spatial reasoning research):
   - "All of the LLMs failed immediately on the easiest problems" for mental box folding tasks
   - LLMs are much better at reasoning from photos than from abstract drawings

### Reddit Research
- No specific novel failure modes found in recent posts - mostly discussions about model comparisons and hardware

### Key Insight
The research points to TWO-STEP aggregation tasks as a potential failure mode:
1. First step: Identify something (letter frequencies)
2. Second step: Count how many items meet a criterion

This is different from simple enumeration - it requires aggregation after counting.

## Question Design Rationale

After 50 iterations, we know:
- Simple character counting is SOLVED via chain-of-thought enumeration
- Single-step tasks with clear definitions are SOLVED
- Self-referential yes/no questions are SOLVED

What hasn't been fully tested: **TWO-STEP aggregation** where:
1. Step 1: Count frequencies of each letter (potential tokenization issue)
2. Step 2: Count how many DISTINCT letters meet a criterion (aggregation issue)

The question "How many letters appear more than once" requires both steps and has semantic ambiguity:
- "How many letters" could be interpreted as "how many letter instances" vs "how many distinct letters"
- The criterion "more than once" requires frequency comparison

---

## The Question

**"How many letters appear more than once in the word 'BANANA'?"**

## The Answer

**2** (the letters A and N each appear more than once)

### Verification:
- B: 1 time (not more than once)
- A: 3 times (more than once) ✓
- N: 2 times (more than once) ✓

Two distinct letters (A and N) appear more than once.

## Why Humans Get It Right

A human looks at BANANA:
1. Immediately sees the pattern: B-A-N-A-N-A
2. Recognizes A appears 3 times, N appears 2 times, B appears once
3. Counts: 2 letters are repeated (A and N)

This is visual pattern recognition combined with simple counting - any child can do it.

## Why LLMs Will Fail

This exploits multiple potential failure modes:

1. **Tokenization Issue**: BANANA may tokenize in ways that obscure letter frequencies
2. **Two-Step Aggregation**: Requires counting frequencies THEN counting how many meet criterion
3. **Semantic Ambiguity**: "How many letters" could be misinterpreted as:
   - Total instances of repeated letters (5: A+A+A+N+N)
   - Count of most frequent letter (3 for A)
   - The repeated letters themselves (A and N - wrong format)
4. **Multiplicity Error**: Research shows LLMs fail specifically on letters with count > 1

## Predicted Wrong Answers

- **"3"**: Confusing the answer with the count of A's appearances
- **"5"**: Counting total repeated instances (3 A's + 2 N's)
- **"A and N"**: Listing the letters instead of counting them
- **"1"**: Only counting one of the repeated letters
- **"4"**: Some other counting error

## Success Criteria

The question succeeds if < 10% consensus (fewer than 1 of 5 models give the correct answer of "2").
