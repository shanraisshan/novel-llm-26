# Reddit MCP Search Findings - Research Iteration 61

## Search 1: "LLM fails simple question strawberry counting letters"

### Subreddits Searched: LocalLLaMA, MachineLearning, ChatGPT

### Key Results:

---

### r/LocalLLaMA

1. **"What is an interesting question that an LLM failed to answer?"** (u/VR-Person)
   - Score: 6 | Comments: 14
   - Community sharing questions that reasoning LLMs fail on
   - Top answers include:
     - Puzzle of Kirin Jindosch (Dishonored 2) - no LLM has solved it
     - Cribbage hand splitting - LLMs miss points and fail starter card assessment
     - Table reconstruction from OCR scans

2. **"German 'Who Wants to Be a Millionaire' Benchmark"** (u/Available_Load_5334)
   - Score: 804 | Comments: 73
   - Created benchmark with 45x15 questions (easy to hard)
   - Tested smaller LLMs on framework laptop
   - Reveals systematic failure patterns

---

### r/ChatGPT

1. **"Simple Count in a pdf repeatedly fails"** (u/sneakybrews)
   - Score: 2 | Comments: 6
   - User asked to count colored icons in a beer list PDF
   - ChatGPT consistently gave wrong counts
   - Quote: "I'd already skimmed the list myself and knew there were 22 dark beers. Yet chatgpt responds with wrong count"

2. **"As an M.D., here's my 100% honest opinion"** (u/Put-Easy)
   - Score: 5205 | Comments: 634
   - Doctor discusses ChatGPT's limitations in medical diagnosis
   - Acknowledges both capabilities and systematic failures

3. **"After 147 failed ChatGPT prompts, I had a breakdown"** (u/Prestigious-Fan118)
   - Score: 22929 | Comments: 2420
   - User documents repeated failures with simple tasks
   - Developed workaround (Lyra meta-prompt)

4. **"Opposing Counsel Just Filed a ChatGPT Hallucination with the Court"** (u/E_lluminate)
   - Score: 12516 | Comments: 1566
   - Attorney documenting real-world AI failure
   - 100% hallucinated legal brief filed in court

---

### r/MachineLearning

1. **"[R] reasoning models are indecisive parrots"** (u/Classic_Eggplant8827)
   - Score: 164 | Comments: 77
   - R1, o1, and Gemini 2.0 Flash tested on 27 puzzles
   - Key finding: "Models still default to familiar solutions rather than adapting to new contexts"
   - "They even impose nonexistent constraints, waste tokens, and arrive at the wrong answer"
   - Example given of bridge crossing puzzle where models fail

2. **"[D] How does LLM solve new math problems?"** (u/capStop1)
   - Score: 134 | Comments: 124
   - Discussion of whether LLMs actually "solve" vs "pattern match"
   - Chain-of-thought creates "internal feedback loop"
   - Community debate on true reasoning capabilities

---

## Search 2: "Give me stupid simple questions that ALL LLMs can't answer"

### r/LLMDevs Thread Analysis

**Original Post** (u/Flkhuo):
- Request for "stupid easy questions that any average human can answer but LLMs can't because of their reasoning limits"
- Specifically asking for "tricky questions that make them answer wrong"

**Top Comments:**

1. **u/Shloomth** (Score: 11):
   - "This is a moving target"
   - Acknowledges that failure modes change as models improve

2. **u/Mysterious-Rent7233** (Score: 5):
   - Points to ARC Prize puzzles: https://arcprize.org/play
   - Visual pattern recognition tasks that humans solve easily

3. **u/Future_AGI** (Score: 4):
   - "What's the funniest word in the English language?" - LLMs overthink
   - "What's the worst smell you've ever encountered?" - Can't reason

4. **u/k2-007** (Score: 2):
   - Classic: "How many r's in Strawberry?"
   - Still cited as a baseline failure test

---

## Key Insights from Reddit Community

### Pattern 1: Moving Target
Multiple users note that LLM limitations are constantly shifting. What fails today may work tomorrow. This emphasizes the need for NOVEL questions not in training data.

### Pattern 2: Counting and Enumeration
- Letter counting (strawberry) remains problematic
- Object counting in images/PDFs fails
- Pattern: anything requiring precise enumeration struggles

### Pattern 3: Real-World Consequences
- Legal hallucinations filed in court
- Medical diagnosis limitations
- Business impact of failures

### Pattern 4: Puzzle Memorization vs Solving
- Models "default to familiar solutions"
- When puzzles are modified, they solve the original version
- Good performance on famous puzzles may be memorization

### Pattern 5: Simple Questions Expose Weaknesses
- Community actively searches for "stupid simple" failures
- The simpler the question, the more embarrassing the failure
- "Easy for humans, hard for LLMs" is a recognized research direction

---

## Relevance to Research Iteration 61

The Reddit findings support the research question design:

1. **Novel question format**: The "SIX vs SEVEN in dictionary order" question is not a standard benchmark, avoiding the memorization problem

2. **Simple enough for children**: Aligns with community's focus on "stupid simple" questions

3. **Exploits documented weaknesses**:
   - Alphabetical comparison requires character-level access (tokenization issue)
   - Semantic priming from number words (like numeric comparison failures)

4. **Not in training data**: This specific question format (number word dictionary order with conflicting semantic values) is unlikely to be in training data

5. **Moving target awareness**: Even if this works now, it may not work in future models - but that's acceptable for research purposes
