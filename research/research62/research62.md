# Research Iteration 62: Semantic Quantity Priming with Singular/Plural Contradiction

## Executive Summary

This iteration explores a novel failure mode: **semantic quantity contradiction** where a word's grammatical form (singular) contradicts its semantic meaning (multiple). The question asks about a simple grammatical property that any child can identify, but the semantic content creates strong interference for LLMs that process meaning before form.

The question: **"Is the word 'TEETH' singular or plural?"**

This exploits the tension between:
1. **What the word MEANS**: multiple individual teeth (semantic plural)
2. **What the word IS**: a grammatically plural noun (morphological plural)

While humans instantly recognize "TEETH" as plural (it's the plural of "tooth"), LLMs may struggle because:
- The word contains no standard plural markers (-s, -es)
- It requires knowledge of irregular plurals
- The tokenization may not preserve the tooth/teeth relationship
- Strong semantic priming from "teeth" as a collective concept

## External Research Conducted

### Search 1: Tavily - "LLM fails simple questions humans answer easily 2025 2026 tokenization"
**Key Findings:**
- Article from arxiv (2507.07313): "Frontier LLMs Still Struggle with Simple Reasoning Tasks" - confirms character counting, word counting, and family relationship tasks still challenge LLMs
- The "Unpuzzles" dataset shows that easy-for-humans tasks remain hard for LLMs
- Tokenization continues to be a root cause of failures in word-based tasks

### Search 2: Tavily - "questions AI cannot answer simple problems LLMs get wrong"
**Key Findings:**
- arxiv paper 2507.07313 specifically mentions: "surprisingly simple reasoning problems that still confuse even the most advanced LLMs including counting characters in words, comparing numbers"
- Research confirms the gap between human ease and LLM difficulty persists in 2025-2026

### Search 3: Reddit - "LLM fails simple question humans answer correctly"
**Key Findings:**
- r/MachineLearning thread shows "reasoning models don't degrade gracefully - they hit a complexity cliff and collapse entirely"
- Anthropic research shows "giving AI more thinking time can actually make it worse" on certain tasks

### Search 4: Tavily - "unpuzzles dataset LLM benchmark easy problems humans"
**Key Findings:**
- The Unpuzzles dataset "complements procedural evaluations by providing another benchmark that is easy for humans and difficult for LLMs"
- Confirms that good performance on difficult puzzles is partly due to memorization, not problem-solving

### Search 5: Tavily - "LLM phonological awareness rhyming pronunciation failures"
**Key Findings:**
- AI lyric generators struggle with phonemic awareness
- LLMs lack true phonological access despite being trained on text

### Search 6: Tavily - "shape-blind MLLM counting sides geometric reasoning failure"
**Key Findings:**
- ACL 2025 paper: "Multimodal Large Language Models are Shape-Blind"
- MLLMs fail to count sides of both familiar and novel shapes
- "They have neither learned the concept of 'sides' nor effectively apply reasoning"

### Search 7: Tavily - "word puzzle LLM failure anagram letter rearrangement"
**Key Findings:**
- TextGames benchmark shows LLMs struggle with constraint-based reasoning in puzzles
- Pattern recognition and logical reasoning remain weak areas

### Search 8: Tavily - "LLM fails visual reasoning letter shapes simple spatial tasks"
**Key Findings:**
- "Mind the Gap" benchmark (2503.19707) shows LLMs have poor spatial reasoning
- VLMs may "disregard spatial information" according to research

### Search 9: Tavily - "easy for humans difficult for AI simple questions benchmark 2025"
**Key Findings:**
- ARC-AGI-2 focuses on "tasks that are relatively easy for humans, yet hard, or impossible, for AI"
- These tasks "shine a spotlight on capability gaps that do not spontaneously emerge from scaling up"

### Search 10: Tavily - "how many syllables word LLM fails phonological counting"
**Key Findings:**
- Research from PMC (2025) on ChatGPT with nonwords shows LLMs struggle with grapheme-to-phoneme conversion, syllable counting, and rhyming tasks

## The Question Design Process

### Initial Exploration
After reviewing 61 previous iterations and extensive external research, I identified several key patterns:

1. **Character counting is solved** - Models now enumerate letter-by-letter via CoT
2. **Classic riddles are memorized** - Training data includes these
3. **Meta-constraint paradoxes fail the 5-year-old test** - They confuse humans too
4. **Self-referential output questions showed promise** (20-40%) but aren't strawberry-type

### Novel Direction: Grammatical Number Recognition

I identified a gap in previous research: **grammatical number (singular vs plural) recognition for irregular nouns**.

Why this might work:
1. **Not a counting task** - Can't be solved by enumeration
2. **Requires morphological knowledge** - Understanding irregular plurals
3. **Semantic interference** - "TEETH" evokes images of multiple teeth, potentially confusing the task
4. **Simple for humans** - Any child knows "teeth" is plural (multiple teeth)
5. **Potentially hard for LLMs** - Irregular plurals don't follow standard rules

### Testing the Hypothesis

Irregular English plurals include:
- tooth -> teeth
- foot -> feet
- goose -> geese
- mouse -> mice
- child -> children
- person -> people

These words:
- Don't end in -s/-es (standard plural markers)
- Use vowel changes (ablaut plurals)
- May be tokenized as single units without plural/singular information

### Why "TEETH" Specifically

1. **Very common word** - Familiar to all ages
2. **No standard plural marker** - Doesn't end in -s
3. **Strong semantic priming** - "Teeth" immediately evokes multiple items
4. **Clear irregular plural** - Any English speaker knows tooth/teeth
5. **Simple yes/no-style answer** - "Singular or plural" has exactly one correct answer

## The Question

**"Is the word 'TEETH' singular or plural?"**

## The Answer

**Plural**

"TEETH" is the plural form of "TOOTH". The correct and only answer is "plural."

## Why Humans Get It Right

A 5-year-old can answer this correctly because:

1. **Daily experience**: Children brush their teeth every day and hear "brush your teeth" (plural)
2. **Language acquisition**: Children naturally learn "one tooth, many teeth" through exposure
3. **Instant recognition**: The question is about a word's grammatical form, not its meaning
4. **No computation needed**: You either know "teeth" is plural or you don't - and everyone does

**How a child reasons:**
- "TEETH? That's like when mom says 'brush your teeth' - that's more than one!"
- "One tooth, two teeth - teeth is the many one!"

## Why LLMs Will Fail

### Potential Failure Modes:

1. **Tokenization blindness**: "TEETH" may be a single token without explicit singular/plural encoding. The model may not "see" that it's an irregular plural.

2. **Lack of morphological grounding**: LLMs learn statistical patterns but may not have robust representations of irregular plural forms as grammatical categories.

3. **Semantic confusion**: The word "teeth" semantically refers to multiple items, but the question asks about grammatical number. LLMs may conflate these.

4. **Over-reasoning**: Models may overthink - "Is 'teeth' a collective noun? A mass noun? Is it being used as singular here?" - when the answer is simply "plural."

5. **Training data gaps**: Questions about grammatical number of specific words may be rare in training data compared to questions about meaning.

6. **Hedging tendency**: LLMs may try to explain both possibilities instead of giving a direct answer.

### Architectural Limitation Exploited:

- **No explicit grammatical encoding**: Unlike humans who learn grammar explicitly, LLMs learn implicit patterns. Irregular plurals may not be robustly encoded.
- **Tokenization isolates the word**: The tooth/teeth relationship may not be preserved across tokenization boundaries.

## Predicted Wrong Answers

1. **"Both" or "It depends"** - Over-analysis leading to hedging
2. **"Singular"** - Confusion from the word not having -s ending
3. **Extended explanation** - Describing uses instead of answering directly
4. **"TEETH can be used as..."** - Pivoting to usage rather than form
5. **Questioning the premise** - "Well, grammatically it's plural but semantically..."

## The 5-Year-Old Test

### Can a 5-year-old answer this correctly?
**YES** - Any child who has learned basic English knows "teeth" is the plural of "tooth." They hear "brush your teeth" daily. They know "one tooth, many teeth."

### Is the answer unambiguous?
**YES** - "TEETH" is definitively, grammatically plural. There is exactly one correct answer: "plural." This is a linguistic fact, not interpretation.

### Does it exploit LLM architectural limitations?
**YES** - This exploits:
- **Tokenization**: The word may be a single token without grammatical marking
- **Morphological blindness**: Irregular plurals don't follow predictable patterns
- **Semantic-grammatical conflation**: LLMs may confuse what words mean with what they are

## Comparison to Previous Iterations

| Aspect | Previous Best (Iteration 13, 20%) | This Question |
|--------|-----------------------------------|---------------|
| Type | Self-referential output | Grammatical knowledge |
| 5-year-old test | Marginal - scope confusion | Clear pass - basic English |
| Enumerable | No | No |
| Unambiguous | Some scope ambiguity | Fully unambiguous |
| Architectural limit | Meta-cognition | Tokenization + morphology |

## Risk Assessment

**Potential Issues:**
1. **Too easy**: LLMs may have robust irregular plural knowledge
2. **In training data**: "Is teeth singular or plural?" may appear verbatim
3. **Simple question = simple answer**: Models may just know this

**Mitigation:**
- If this fails (100% consensus), it confirms LLMs have good irregular plural handling
- The failure would still provide useful data about what LLMs can do
- Can iterate to harder irregular plurals (alumni? criteria? phenomena?)

## Conclusion

This question represents a return to the strawberry paradigm while exploring a novel failure mode: **grammatical number recognition for irregular plurals**. Unlike previous iterations that tested counting, alphabetical ordering, or meta-cognition, this tests basic morphological knowledge that any human possesses but may not be robustly encoded in LLMs.

The question is:
- **Simple**: One sentence, one word, binary answer
- **Unambiguous**: "TEETH" is plural, period
- **Child-appropriate**: Any 5-year-old knows this
- **Novel**: Not tested in previous 61 iterations
- **Architecturally challenging**: Tests tokenization and morphological encoding

If LLMs achieve 100% consensus on "plural," it confirms they have robust irregular plural knowledge. If they diverge, we've found a new failure mode in basic grammatical encoding.
