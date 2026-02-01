# Reddit MCP Research Findings for Iteration 53

## Search 1: r/LocalLLaMA, r/ChatGPT, r/artificial - "LLM fails simple question"

### Notable Posts:

1. **r/LocalLLaMA - Production Service Failures**
   - User documenting real-world LLM failures when building production services
   - ChatGPT-5 and Claude Haiku 4.5 still have issues with simple tasks

2. **r/ChatGPT - "Why ChatGPT Struggles to Count the r's in Strawberry"**
   - Post explaining tokenization blindness
   - Note: This is now well-documented and models have improved

3. **r/ChatGPT - M.D.'s Observations**
   - High engagement post (5200 upvotes) about ChatGPT limitations in medical contexts
   - Shows LLMs can miss obvious things experts catch

4. **r/LocalLLaMA - "Why can't locally run LLMs answer this simple math question?"**
   - Asks about scheme morphisms to Spec(Z)
   - Technical question, not strawberry-type

## Search 2: r/LocalLLaMA, r/ChatGPT - "simple question LLM wrong answer counting"

### Notable Findings:

1. **r/ChatGPT - "6-finger test" failures**
   - Post by Echo_OS discussing why GPT-5.2 fails on visual finger counting
   - Argues this is not purely a vision test but a judgment/reasoning issue

2. **r/LocalLLaMA - "Prompt Engineering to Reduce Chance of LLM Confidently Stating Wrong Answers"**
   - Community discussion on LLMs giving wrong answers with complete confidence
   - More prevalent on local LLMs than cloud LLMs

3. **r/ChatGPT - Testing Agent Features**
   - User tested new agent features extensively
   - Found it "can't shop, book, or reserve anything"

## r/LLMDevs Post Details - "Give me stupid simple questions that ALL LLMs can't answer"

### Top Community Suggestions:

1. **"This is a moving target"** (top comment) - acknowledges difficulty of the task

2. **ARC Prize** - Link to arcprize.org/play as a source of challenging puzzles

3. **"How many r's in Strawberry?"** - Classic tokenization question

4. **"How many Sundays was there in 2017?"** - Calendar calculation (answer: 53, not 52)

5. **"Is banana bigger than its peel?"** - Physical/spatial relationship question

6. **"Do cockroaches walk lying or crawl standing?"** - Ambiguous/philosophical question

7. **Context window** mentioned as limiting factor, not simple reasoning

### Key Insight from Community:

The Reddit community recognizes that:
- Simple questions that break LLMs are becoming harder to find
- Tokenization questions (like strawberry) are well-known
- Calendar/date calculations can trip up models
- Physical/spatial relationship questions still have potential
- The "target is moving" - models are constantly improving

## Synthesis

Reddit findings suggest:
1. Pure character counting questions (strawberry-type) are now widely known
2. Calendar calculations (e.g., "How many Sundays in 2017?") might still work
3. Physical relationship questions (banana vs peel) explore novel territory
4. The community acknowledges this is increasingly difficult as models improve

The "How many Sundays in 2017?" question is interesting because:
- Answer is 53 (2017 started on Sunday)
- Most years have 52 Sundays, but leap behavior varies
- This requires calendar knowledge, not pure reasoning
- A human could look at a calendar and count

However, this is more trivia/lookup than strawberry-type (simple visual/counting question).
