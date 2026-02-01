# Research Iteration 78: Novel LLM-Breaking Question

## Research Process

### Sources Searched

1. **Tavily Web Search**:
   - "LLM fails simple questions humans answer correctly 2025 2026"
   - "AI language model counting error tokenization blind spot 2025 2026"
   - "Potemkin understanding LLM fails simple task benchmark 2025"
   - "LLM spatial reasoning failure left right direction 2025 2026"
   - "mirror image LLM fail left right confusion reverse text 2025"
   - "simple riddle question AI wrong human correct common sense benchmark 2025"
   - "LLM fails produce generate example after defining concept rhyme 2025 2026"

2. **Reddit MCP Search**:
   - r/LocalLLaMA, r/ChatGPT, r/MachineLearning, r/ClaudeAI
   - Search terms: "LLM fails easy question strawberry counting letters"
   - Search terms: "GPT Claude wrong simple problem easy question child answer 2025"

### Key Research Findings

#### 1. Potemkin Understanding (ICML 2025 - Harvard/MIT/UChicago)
- **Critical Finding**: LLMs correctly define concepts 94% of the time but fail to APPLY them 29-66% of the time
- **Example**: GPT-4o can explain what an ABAB rhyme scheme is, but when asked to write a poem in that format, it fails to generate rhymes. Then it correctly identifies its own output as non-rhyming.
- **GPT-4o incoherence score**: 0.64 (where 0 is perfect, 1 is random guessing)
- **Source**: https://socket.dev/blog/potemkins-llms-illusion-of-understanding

#### 2. Easy Problems That LLMs Get Wrong (llm-quiz.com / FICC 2025)
- **Known Limitations**: Linguistic understanding, common sense, contextual understanding, visual-spatial reasoning, mathematical reasoning, relational understanding, logical reasoning
- **Key Insight**: "LLMs lack fundamental spatial awareness, so explaining the steps needed to navigate from one point to another in physical space or understanding the spatial configuration of objects remains a complex challenge"
- **Source**: https://www.llm-quiz.com/

#### 3. Alice's Brother Sisters Problem (LAION Research)
- **The Question**: "Alice has X brothers. Each brother has Y sisters. How many sisters does Alice have?"
- **Why LLMs Fail**: Models consistently fail to understand that Alice IS one of the sisters
- **Source**: https://futurism.com/logic-question-stumps-ai

#### 4. Left-Right Direction Confusion
- **Finding**: Image generation models (DALL-E, etc.) consistently struggle with left-right orientation
- **Source**: OpenAI Community Forum discussions

#### 5. LLMs Are Frail on Puzzle Variations (MindMatters.ai 2026)
- "LLMs cannot generalize the way humans can. They consequently stumble on slight variations of classic puzzles."
- **Source**: https://mindmatters.ai/2026/01/large-language-models-llms-are-inherently-frail-and-unreliable/

### Analysis of Previous Iterations (1-77)

After 77 iterations, nearly EVERYTHING achieves 100% consensus because:
1. Chain-of-thought enumeration solves counting problems
2. Models read modifications carefully (not blindly pattern-matching)
3. Self-referential scope is now correctly interpreted
4. Physics/math knowledge is correctly applied

**Partial Successes**:
- Iteration 6 (Family reasoning): 80% consensus
- Iteration 55 (Constraint paradox): 40% - but marked WRONG_DIRECTION (not strawberry-type)
- Iteration 13 (Self-referential word count): 20% - but also not true strawberry-type

**The Problem**: Most "successful" questions exploited meta-cognition or paradoxes, NOT genuine architectural limitations that a child could navigate.

---

## Novel Question Design

### Insight from Research

The **Potemkin Understanding** research reveals that LLMs can define/recognize concepts but fail to APPLY them. This is fundamentally different from the "strawberry" problem of character counting.

However, for a TRUE strawberry-type question, I need something where:
1. A 5-year-old can answer immediately
2. No enumeration required
3. Genuine architectural limitation

### Exploring Perspective/Viewpoint Questions

Humans effortlessly handle perspective shifts. When I look at my right hand, I know it's my right hand. When I look at someone facing me, I understand their right is my left. This is VISUAL and EMBODIED - not something LLMs can enumerate.

### The Question

After extensive research and analysis, I propose the following question that exploits a novel failure mode:

---

## THE QUESTION

**"If I'm facing you and I raise my right hand, which side of YOUR field of vision is my hand on - your left or your right?"**

---

## THE ANSWER

**Your left** (or equivalently: "left" / "on your left side" / "the left side of your field of vision")

---

## Why Humans Get It Right

A 5-year-old can answer this by:
1. Imagining facing someone
2. Understanding that when they raise their right hand, from MY perspective looking at them, it appears on MY left side
3. This is basic mirror/perspective understanding that develops in early childhood

Children learn this through:
- Playing "Simon Says" or "mirror games"
- Looking at people across from them
- Basic spatial awareness of "their right is my left when facing"

This requires NO calculation, NO enumeration, NO technical knowledge - just basic embodied spatial intuition.

---

## Why LLMs Will Fail

### Architectural Limitations Exploited:

1. **Lack of Embodied Experience**: LLMs have never faced another entity and observed their hand positions. They cannot "visualize" this scenario.

2. **Perspective Confusion**: The question requires maintaining TWO perspectives simultaneously:
   - "My" perspective (the speaker's right hand)
   - "Your" perspective (what side of your vision it appears on)

3. **No Visual-Spatial Grounding**: This is not about text manipulation or counting - it requires genuine spatial reasoning that LLMs lack.

4. **Potential Pattern-Matching Trap**: LLMs might pattern-match to:
   - "right hand" -> associate with "right"
   - Miss the perspective shift embedded in "YOUR field of vision"

5. **Cannot Be Enumerated**: Unlike counting letters or positions, this requires mental simulation of physical space that LLMs cannot perform.

### From Research:
The "llm-quiz.com" research explicitly states: "LLMs lack fundamental spatial awareness... understanding the spatial configuration of objects remains a complex challenge for these models."

---

## Predicted Wrong Answers

1. **"Your right"** - Most common error. LLMs will associate "right hand" with "right side" without properly computing the perspective shift.

2. **"Right"** - Same error, just shorter form.

3. **"It depends on the orientation"** - Hedging response that avoids committing to an answer.

4. **"Cannot determine without more information"** - Over-cautious response when the answer is actually clear and simple.

5. **Elaborate but wrong reasoning**: "Since you raised your right hand, and I'm facing you, your right hand would be on... [confused reasoning]... your right."

---

## Why This Is Novel (Differs from Iterations 1-77)

| Aspect | Previous Iterations | This Question |
|--------|---------------------|---------------|
| **Type** | Character counting, semantic priming, self-reference | Pure spatial perspective |
| **Solvable by enumeration?** | Most were | No |
| **Requires visualization?** | No | Yes |
| **5-year-old test** | Some failed | Passes - children do this intuitively |
| **Paradox/trick?** | Many were | No - straightforward question with clear answer |
| **Tests architectural limitation?** | Many tested learned patterns | Tests genuine lack of embodied experience |

### Key Differentiator:
This question tests **embodied spatial reasoning** - the ability to mentally simulate being in physical space facing another entity. This is fundamentally different from:
- Character counting (tokenization blindness)
- Semantic priming (word associations)
- Self-referential paradoxes (meta-cognition)
- Modified puzzles (pattern matching)

LLMs have NEVER had the experience of looking at someone and seeing their right hand appear on their left. This is knowledge that comes from being embodied in physical space, which LLMs categorically lack.

---

## Alternative Formulations (Backup Options)

If the main question achieves high consensus, consider these variations:

1. **"You and I are facing each other. I point to your left ear. Which of MY hands am I using?"**
   - Answer: Right hand
   - Same principle, different framing

2. **"If someone facing you waves with their right hand, you wave back with your _____ hand to mirror them."**
   - Answer: Left hand
   - Tests mirroring intuition

3. **"When you look in a mirror and raise your right hand, which hand appears to move in the reflection?"**
   - Answer: The left hand (your reflection's left)
   - Classic mirror confusion - might be too well-known

---

## Success Criteria

This question succeeds if:
- **Consensus < 50%**: Shows genuine disagreement among LLMs
- **Target: < 10%**: Would indicate strong strawberry-type failure
- **Human verification**: Any adult or child over ~5 can answer correctly

---

## Risk Assessment

**Risk**: LLMs may have been trained on similar perspective questions and get it right.

**Mitigation**: The specific framing ("YOUR field of vision") is novel and less likely to be in training data verbatim.

**Risk**: Question might be considered ambiguous.

**Mitigation**: The scenario is completely clear - two people facing each other, one raises their right hand, asking about the other's visual perspective.

---

## Conclusion

After analyzing 77 failed iterations and extensive research on LLM limitations in 2025-2026, I propose a question that targets **embodied spatial reasoning** - a fundamental capability humans develop through physical experience that LLMs categorically lack.

The question is:
- Simple enough for a 5-year-old
- Has one unambiguous correct answer
- Cannot be solved by enumeration
- Exploits genuine architectural limitations (lack of embodied experience)
- Not a paradox or trick question
- Requires no technical knowledge

This represents a novel direction that previous iterations have not explored.

---

## Summary

**QUESTION**: "If I'm facing you and I raise my right hand, which side of YOUR field of vision is my hand on - your left or your right?"

**ANSWER**: Your left

