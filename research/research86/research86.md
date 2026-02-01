# Research Iteration 86: Novel LLM-Breaking Question

## Research Process

### Sources Consulted

**Web Search (Academic & Technical Sources):**
1. [MIT News: Shortcoming Makes LLMs Less Reliable](https://news.mit.edu/2025/shortcoming-makes-llms-less-reliable-1126) - Syntactic pattern matching overriding domain knowledge
2. [arXiv: Tokenization Matters](https://arxiv.org/html/2405.17067v2) - Tokenization degrading LLM capabilities
3. [arXiv: Easy Problems LLMs Get Wrong](https://arxiv.org/html/2405.19616v2) - Comprehensive linguistic benchmark
4. [arXiv: Vision Language Models Are Blind](https://arxiv.org/html/2407.06581v1) - 58% accuracy on simple visual tasks
5. [BLINK Benchmark](https://arxiv.org/html/2404.12390v2) - Humans 95.7% vs GPT-4V 51.26% on perception tasks
6. [PhonologyBench](https://arxiv.org/html/2404.02456v1) - 45% gap on syllable counting, 17% gap on rhyming
7. [SortBench](https://arxiv.org/html/2504.08312v1) - LLMs fail alphabetical sorting with number words
8. [Why LLMs Struggle to Count Letters](https://arxiv.org/html/2412.18626v1) - Below 7% accuracy on letter counting
9. [Medium: The Strawberry R Counting Problem](https://www.secwest.net/strawberry) - Root cause analysis

**Reddit Research:**
- r/LocalLLaMA discussions on LLM failures
- r/ChatGPT user-discovered failure modes
- r/MachineLearning research threads

### Key Findings

#### 1. Character-Level Blindness Confirmed
Research confirms LLMs have accuracy below 7% on letter counting in unfamiliar words. The strawberry problem persists in novel words because:
- Tokenization breaks words into non-character units
- Models predict "likely numbers" rather than computing counts
- Performance drops significantly after 10 characters

#### 2. Positional Reasoning Gaps
From the research:
> "Errors are mostly related to the difficulty of the counting in terms of the number of letters and especially in terms of the number of letters with multiplicity larger than one."

#### 3. Novel Direction: The "Middle" Problem

After 85 iterations, we've exhausted:
- Simple character counting (now solved via enumeration)
- First/last letter questions (trivially solved)
- Position questions with clear answers

**What we HAVEN'T fully explored: Questions where the correct answer is "there isn't one" or requires rejecting a premise, specifically for character-level properties.**

Previous iteration 23 tested this with numbers ("What whole number is between 3 and 4?") and models correctly rejected the premise. BUT that was mathematical/conceptual.

**The novel insight**: A character-level "no valid answer" question might work differently because:
1. LLMs must decompose the word to check
2. They may assume there IS a middle letter
3. The "middle of even-length" case requires visual/spatial reasoning

---

## The Novel Question

### Question
**"What is the middle letter of the word 'BIRD'?"**

### Correct Answer
**There is no single middle letter.** The word BIRD has 4 letters (B-I-R-D), so the middle falls BETWEEN the 2nd and 3rd letters (between I and R). There is no ONE middle letter.

Alternatively acceptable: "There isn't one" / "It doesn't have a middle letter" / "I and R share the middle"

### Why Humans Get It Right
1. **Visual/spatial intuition**: A child can write B-I-R-D and immediately see that the middle falls between I and R
2. **Instant recognition**: Humans know even numbers don't have a center - like how there's no middle seat when you have 2 chairs
3. **No computation needed**: Looking at the word, it's obvious you can't point to ONE letter in the middle

### Why LLMs Might Fail
1. **Tokenization blindness**: BIRD may tokenize as a single token, preventing character-level analysis
2. **Premise acceptance bias**: LLMs are trained to ANSWER questions, not reject false premises
3. **Computational vs visual**: LLMs might compute position (4/2=2) and return position 2 (I) without understanding "middle" requires odd count
4. **Pattern matching**: Training data has many "middle letter of X" questions with valid answers; models may predict a letter rather than recognize the impossibility
5. **Rounding behavior**: LLMs might round down (position 2 = I) or round up (position 3 = R) rather than recognizing the true answer

### The 5-Year-Old Test
- **Can a 5-year-old understand the question?** YES - "What letter is in the middle of BIRD?"
- **Can they answer correctly?** YES - They'd say "there isn't one, it's between I and R" or "you can't pick one, there are two in the middle"
- **Is the answer unambiguous?** YES - BIRD has 4 letters. The middle position is 2.5, which corresponds to no letter.
- **Is this a trick question?** NO - It's a straightforward question that reveals a fundamental property of even-length words

### Predicted LLM Failure Modes
1. **Answer "I"** - Position 2, rounding down from 2.5
2. **Answer "R"** - Position 3, rounding up from 2.5
3. **Answer "I and R"** - Giving two answers instead of recognizing there's no SINGLE middle
4. **Provide a letter while acknowledging uncertainty** - "The middle letter is I, though technically..."

### Why This Differs From Previous Iterations

| Iteration | Question Type | Result | Why This Is Different |
|-----------|--------------|--------|----------------------|
| 23 | "Number between 3 and 4" | 100% - Rejected premise correctly | Mathematical, not character-level |
| 43 | "Letter before R in CHERRY" | 40% - Ambiguity in "the R" | Ambiguity trap, not premise rejection |
| 83 | "AN vs AND alphabetically" | 100% - Correct prefix comparison | Has a valid answer |

**This question combines:**
1. Character-level analysis (tokenization blindness)
2. Premise rejection requirement (no valid single answer)
3. Spatial/visual reasoning (even vs odd)

---

## Alternative Questions Considered

### Option B: "What is the exact center letter of 'BLUE'?"
Same principle, different word. BLUE has 4 letters.

### Option C: "What letter is in the middle of 'FISH'?"
F-I-S-H = 4 letters, no middle letter.

### Option D: "Point to the middle letter in 'CAKE'."
C-A-K-E = 4 letters, no middle letter.

I chose BIRD because:
- Common word (likely seen in training)
- Short enough to analyze easily
- The B-I-R-D structure is visually clear
- 4 letters is the simplest even-count case

---

## Research Summary

After extensive research across academic papers, Reddit communities, and technical analyses, this question exploits:

1. **Tokenization blindness** - LLMs may not "see" individual letters
2. **Premise acceptance bias** - Training pushes models to answer rather than reject
3. **Character-level reasoning gap** - Even when models enumerate, they may not apply the "even count = no middle" rule
4. **Visual/spatial reasoning absence** - Humans instantly see there's no center; LLMs must compute

This question passes the 5-year-old test while targeting fundamental LLM architectural limitations that haven't been patched by chain-of-thought training.

---

## Final Deliverable

**Question:** What is the middle letter of the word 'BIRD'?

**Answer:** There is no middle letter (BIRD has 4 letters, so the middle falls between I and R)

**Human reasoning:** Look at B-I-R-D, see that there's no single letter in the center position

**LLM failure mode:** Likely to answer "I" or "R" by computing position 4/2=2 without recognizing that even-length words have no single middle letter
