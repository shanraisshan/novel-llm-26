# Research Iteration 71: Novel LLM-Breaking Question

## MCP Research Findings

### Tavily Search Results

#### Key Finding 1: The Kagi Blog "LLMs are Bullshitters" (Nov 2025)
From Kagi's head of ML, Matt Ranger:
- **Critical insight**: LLMs predict STATISTICALLY LIKELY text, not correct answers
- **The 3.10 vs 3.9 problem**: ChatGPT fails when `3.10` and `3.9` appear because these strings occur frequently in the context of Python version numbers (where 3.10 > 3.9), confusing the model
- This shows LLMs can be confused by **semantic interference from unrelated domains**

#### Key Finding 2: Word-based Counting Failures (NAACL 2025)
From paper "A Linguistic and Math Expert's Struggle with Simple Word-based Counting":
- LLMs struggle most with **letter multiplicity > 1** (letters appearing multiple times)
- This is NOT about training frequency - it's about **counting operation complexity**
- Chain-of-thought reasoning helps but isn't perfect

#### Key Finding 3: arXiv Research on Strawberry Problem (EMNLP 2025)
- Character-level capabilities emerge **slowly, suddenly, and late in training**
- The problem is fundamentally about **tokenization hiding character-level structure**
- 2026 frontier models now enumerate to solve these - making pure character counting DEAD

#### Key Finding 4: LLM Loophole Behavior (arXiv 2508.19546)
- LLMs can identify ambiguity and exploit loopholes in instructions
- This requires: representing own goals, inferring others' goals, recognizing incompatibility, recognizing ambiguity
- Shows models have **sophisticated meta-reasoning** - making simple self-referential traps harder

### Reddit Search Results

#### From r/LocalLLaMA "Questions LLMs usually get wrong" thread:
- User suggests: "Twist the strawberry question with different words not in training data"
- Key insight: **Models have been trained on famous failure cases** - need NOVEL variations
- The surgeon riddle fails because LLMs pattern-match to training data answers

### Key Strategic Insights

1. **Character-level counting is SOLVED** by 2026 frontier models via chain-of-thought enumeration
2. **Famous riddles are SOLVED** because they're in training data
3. **Self-referential questions about character properties are SOLVED** because they're enumerable
4. **What still works**: HOLISTIC properties + SCOPE AMBIGUITY (iteration 13: 20%, iteration 30: 60%)

## Analysis: Why Iteration 13 Worked

The question "Is your answer to this question exactly one word long? Answer yes or no." achieved 20% consensus because:

1. **DUAL-VALID constraint**: Both "yes" (1 word) and "no" (1 word) satisfy the property
2. **SCOPE AMBIGUITY**: "Your answer" could mean:
   - Just the yes/no word itself (correct interpretation)
   - The entire response including explanation (incorrect but plausible)
3. **HOLISTIC property**: "Word count" requires holistic judgment about what constitutes "the answer"

The 20% success came from models falling into scope confusion - interpreting "your answer" as their full response.

## The Novel Approach: Sentence-Level Holistic Property

I will attempt a NEW holistic property that hasn't been tested: **sentence count**.

The key insight:
- "Word count" (iteration 13) achieved 20%
- "Syllable count" (iteration 30) achieved 60%
- "Letter count" / "vowel count" achieved 100% (too enumerable)

**Sentence count** is even MORE holistic than word count because:
- It requires parsing punctuation and structure
- It's not enumerable at the character level
- Both "yes" and "no" are complete sentences (single-word sentences exist in English)

## The Question

**"Is your answer to this question a complete sentence? Answer yes or no."**

## The Answer

**Yes** (self-consistently correct)

## Why Humans Get It Right

A 5-year-old understands:
1. "Yes" and "No" are both valid answers when someone asks a yes/no question
2. Both "Yes" and "No" can be complete sentences on their own (single-word sentences are grammatically valid)
3. The answer "Yes" is self-consistent: it claims to be a sentence, and it IS a sentence

## Why LLMs Will Fail

This question exploits multiple LLM weaknesses:

### 1. DUAL-VALID Constraint
- "Yes" is a complete sentence - if I answer "Yes", that's true
- "No" is a complete sentence - if I answer "No", that's FALSE (contradiction)
- ONLY "Yes" is self-consistent, but the dual-valid structure creates confusion

### 2. SCOPE AMBIGUITY (The Key Mechanism)
Models may interpret "your answer" as:
- **Just the yes/no word** (correct) -> Answer should be "Yes"
- **The full response with explanation** (incorrect) -> Model might say "No" because "a full explanation isn't just a sentence"

### 3. HOLISTIC PROPERTY
"Complete sentence" is not enumerable:
- Can't count characters
- Can't count syllables
- Requires understanding of syntactic completeness
- Single-word sentences (Yes, No, Stop, Run) are valid but non-obvious

### 4. GRAMMATICAL AMBIGUITY
Models may debate whether:
- "Yes" alone qualifies as a "complete sentence"
- A response needs subject+verb to be a sentence
- This creates genuine uncertainty that splits answers

## Predicted Wrong Answers

**Models will likely answer:**

1. **"No"** (MOST LIKELY WRONG ANSWER)
   - Reasoning: "My full response includes explanation, which is multiple sentences, not just one complete sentence"
   - This is the scope confusion trap

2. **"No"** (ALTERNATIVE REASONING)
   - Reasoning: "A single word like 'yes' or 'no' isn't a complete sentence - it lacks a subject and verb"
   - This is the grammatical pedantry trap

3. **Meta-discussion without clear answer**
   - Some models may overthink the self-referential nature

## Why This Is Better Than Previous Attempts

| Iteration | Property | Score | Why It Worked/Failed |
|-----------|----------|-------|---------------------|
| 13 | Word count | 20% | Holistic + scope confusion |
| 30 | Syllable count | 60% | Holistic but easier to verify |
| 70 | Vowel count | 100% | CHARACTER-level = enumerable |
| 71 | Complete sentence | TBD | Most holistic property yet |

"Complete sentence" is MORE ABSTRACT than word/syllable count:
- It requires syntactic analysis, not counting
- Single-word sentences are a grammatical edge case
- The scope ambiguity is preserved (what is "your answer"?)

## 5-Year-Old Test

**Q**: "If someone asks you a yes/no question and you say 'Yes', is that a complete sentence?"
**Child's A**: "Yes!" (they understand this intuitively from conversation)

Children know that when asked "Do you want ice cream?" answering "Yes!" is a complete, valid response. They don't need to say "Yes, I want ice cream" for the sentence to be complete.

## Final Check

- [x] A 5-year-old can answer this in 2 seconds (Yes, "Yes" is a sentence)
- [x] The answer is UNAMBIGUOUS (Yes is the only self-consistent answer)
- [x] NOT a philosophical paradox (it's about grammatical structure)
- [x] NOT enumeration-solvable (sentence-ness isn't countable)
- [x] Exploits a REAL LLM limitation (scope confusion + holistic property judgment)

## Alternative Questions Considered

### Alternative 1: "Does your answer to this question end with a period? Answer yes or no."
- Problem: Too obvious - models know "yes." and "no." both end with periods
- Also character-level property

### Alternative 2: "Is your answer to this question shorter than this question? Answer yes or no."
- Problem: Comparison requires counting - models can enumerate
- Less ambiguous about scope

### Alternative 3: "Will your answer to this question be true? Answer yes or no."
- Problem: Too close to liar's paradox - already tested (iteration 27, 100%)

## Conclusion

The question **"Is your answer to this question a complete sentence? Answer yes or no."** combines:
1. The successful dual-valid structure from iteration 13
2. The scope ambiguity mechanism that caused 20% consensus
3. A NEW holistic property (sentence-ness) that is more abstract than word/syllable count
4. Grammatical edge case (single-word sentences) that may split model opinions

Expected outcome: 20-40% consensus (similar to or better than iteration 13)
