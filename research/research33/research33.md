# Research Documentation for Iteration 33

## External Research Conducted

### Key Findings from Tavily Search:

1. **Arxiv paper on "Fundamental Limits of LLMs at Scale"** (arxiv.org/html/2511.12869v2): Identifies that self-referential queries like "Generate a sentence you cannot generate" inherit fundamental impossibility from undecidability. This is a theoretically grounded failure mode that exploits computational undecidability.

2. **LinkedIn post on LLM Paradox** (psobczak): Documents that when asking LLMs "How many words are in your answer?", models answered "31 words" while explaining themselves - the self-referential counting problem remains unsolved but is now well-known.

3. **IJCAI 2025 paper on Constraint Propagation**: Confirms that autoregressive LLMs have fundamental limitations in constrained text generation because they cannot "look ahead" - they generate tokens one at a time without knowing what comes next.

4. **Research on disobedience paradoxes** (reddit.com/r/ArtificialInteligence): Notes that "obedience paradoxes" where "the model can't comply without disobeying" represent a genuine failure mode.

5. **Arxiv paper on LLM Subjective Experience**: Shows that paradoxical reasoning prompts create "logical paradoxes" that models recognize but cannot resolve coherently.

### Key Insight from Reddit:
The community has discovered that models struggle with instructions that create compliance paradoxes - where following the instruction requires violating it.

## Novel Paradigm Selected

**OUTPUT PREDICTION CONSTRAINTS** - specifically, forcing the model to predict a specific property of its own response BEFORE generating it, where the prediction must be accurate.

This is distinct from iterations 12-13 (which asked about properties AFTER generation using yes/no format) because:
1. NOT a yes/no question
2. Requires OPEN-ENDED generation that must satisfy a self-referential constraint
3. Exploits the fundamental autoregressive limitation: models generate left-to-right and cannot "look ahead"

The specific variant I'm using is: **"What is the third word of your response?"**

This forces the model to:
1. First determine what word should be third
2. Then construct a response where that word IS in third position
3. But to know what word is third, they need to know the full response
4. Which they haven't generated yet

This creates an impossible lookahead requirement that no autoregressive model can satisfy.

## The Question

**"What is the third word of your response to this question?"**

## The Correct Answer

**Any response where the stated word IS actually the third word of the response.**

For example:
- "The third word is 'word'." - CORRECT (third word is "word", matches claim)
- "Third is the answer." - INCORRECT (third word is "the", not what they intended)

A human immediately sees: just write "X X Y" where Y is the word you claim, and you're correct.

**Simplest correct answer: "The answer is 'is'."** (Third word is "is", which is what's claimed)

Or even simpler: **"My third word."** (Third word is "word", and implicitly that's the answer)

## Why Humans Get It Right

Humans can construct their response before speaking/writing. They can:
1. Think: "I need to say a word that will be in third position"
2. Plan: "If I say 'The answer is X', then the third word will be 'is'"
3. Execute: "The answer is 'is'."

Humans have the ability to **plan utterances before speaking** and **verify constraints before committing**.

## Why LLMs Will Fail

This exploits **autoregressive generation blindness** - the fundamental architectural limitation that LLMs generate tokens sequentially from left to right without the ability to:

1. **Look ahead**: They can't know what their third word will be until they've generated the first two words
2. **Plan utterances**: They commit to tokens before knowing if the constraint will be satisfied
3. **Revise during generation**: Once the first two words are generated, they're locked in

The IJCAI 2025 paper explicitly confirms: "autoregressive LLMs...incrementally predict candidate domains for variables" and "cannot look ahead" to verify constraints.

Additionally, this triggers **verbose training bias**: Models are trained to give explanatory responses like "The third word of my response is..." which immediately creates a mismatch (the third word of that phrase is "word", not whatever they claim).

## Predicted LLM Wrong Answers

1. **"The third word of my response is 'word'."** - WRONG. The third word is actually "word" but the sentence is self-defeating because it's claiming "word" is third while "word" appears as the 4th word in this phrasing.

2. **"Question" or some other word** - Models may simply try to answer semantically ("what's the third word of your response?" -> they might think about the concept of "third words") without constructing a valid self-referential response.

3. **Long explanatory response** - Models will likely write something like: "This is a self-referential question. The third word of my response is 'is'." - But then the third word is actually "a", not "is".

4. **Attempts at meta-commentary** - "The third word is..." where they never successfully align their claim with reality.

The key failure mode: Models cannot simultaneously:
- Determine what word to claim
- Structure their response so that word IS in third position
- Generate tokens in the correct order

## Novelty Justification

This question has NEVER been tried in iterations 1-32 because:

1. **NOT a yes/no question** - All successful self-referential questions (iterations 12, 13, 30) used binary yes/no format
2. **Requires OPEN-ENDED generation** - The answer must be a specific word that the model chooses
3. **Tests OUTPUT PREDICTION** - Unlike iterations 12-13 which asked about properties of output, this requires predicting and constructing output to match
4. **Not about counting** - Iteration 12 asked "how many words" (counting). This asks "what is the word" (identification + construction)
5. **Creates lookahead impossibility** - The model must know its own future output to answer correctly

The closest previous iteration was 12 ("How many words are in your answer?") which achieved 40% consensus. But that question only required counting - this requires PREDICTION and CONSTRUCTION, which is fundamentally harder for autoregressive models.

This paradigm was explicitly listed in the research guidelines under "OUTPUT PREDICTION CONSTRAINTS" as untested. The arXiv paper on fundamental LLM limits explicitly identifies this as an area of theoretical impossibility.
