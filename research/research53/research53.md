# Research Iteration 53: Novel LLM-Breaking Question

## Executive Summary

After extensive research using Tavily and Reddit MCP tools, this iteration proposes a question targeting **asymmetric relational reasoning** - a documented failure mode in the "Alice in Wonderland" research that still affects 2026 frontier models, but with a novel framing that should not be in training data.

## External Research Findings

### Tavily Findings Summary

1. **Temple University (July 2025)**: 3-year-old children outperform AI on visual object recognition. "AI models make mistakes that no human would."

2. **Alice in Wonderland Paper (ICLR 2025)**: Simple sibling counting problem ("Alice has N brothers and M sisters. How many sisters does Alice's brother have?") breaks GPT-4, Claude 3 Opus, and all SOTA models. Correct answer M+1 (including Alice), but models do arbitrary arithmetic.

3. **ICML 2025 "Bongard in Wonderland"**: Even elementary visual concepts like spirals pose significant challenges. Gap between human and AI visual reasoning remains large.

4. **GSM-NoOp Dataset**: LLMs consistently incorporate irrelevant numerical information into calculations - fail to distinguish crucial from distractor information.

5. **BBC Study (Oct 2025)**: 45% of AI queries produce erroneous answers, often with high confidence.

### Reddit Findings Summary

1. **r/LLMDevs**: Community acknowledges finding LLM-breaking simple questions is a "moving target"

2. **Calendar calculations**: "How many Sundays in 2017?" (53, not 52) still trips up models

3. **Physical relationships**: Questions like "Is banana bigger than its peel?" explore spatial/physical reasoning

4. **Consensus**: Tokenization questions (strawberry) are now well-known; need novel approaches

## Question Design Rationale

### The Alice in Wonderland Insight

The key finding from the AIW research is that models fail at **relational reasoning where the questioner asks about a relationship from a DIFFERENT perspective than the statement**.

In "Alice has N brothers and M sisters. How many sisters does Alice's brother have?":
- Statement is from Alice's perspective
- Question is from Alice's BROTHER's perspective
- The key insight: Alice IS one of the sisters from the brother's perspective

### Novel Application: Directional/Positional Perspective Shift

I will apply the same principle to a different domain: **positional relationships in a queue/line**.

**Key mechanism**: When someone is described as being in front of/behind another person, asking about the reverse relationship requires a perspective shift that models may fail to execute correctly.

## The Question

**Question:**
"Tom is standing directly behind Sarah in a line. Who is standing directly in front of Tom?"

**Answer:**
Sarah

## Analysis

### Why Humans Get It Right (Instantly)

1. **Immediate visualization**: Humans picture a line with Sarah, then Tom behind her
2. **Symmetric understanding**: "Tom behind Sarah" = "Sarah in front of Tom" is intuitively obvious
3. **No calculation needed**: It's a direct logical equivalence, not arithmetic
4. **Physical experience**: We've all stood in lines and understand these relationships

A 5-year-old can answer this because:
- They've stood in lines at school, stores, etc.
- The relationship is visually obvious when imagined
- No counting or math is required
- The answer is literally stated in the question (rephrased)

### Why LLMs May Fail

1. **Perspective Shift Required**: The statement is about Tom's position relative to Sarah, but the question asks about Sarah's position relative to Tom - requiring a mental "flip"

2. **Pattern Matching to "Who is in front" Questions**: Training data likely has many questions like "Who is in front?" that expect a DIFFERENT answer than the person mentioned (looking for someone NEW)

3. **Possible Confusions**:
   - Models might interpret "in front of Tom" as asking who is FURTHER in front in the line
   - Models might think there must be someone ELSE in front of Tom
   - Models might hallucinate a third person
   - Models might say "no one" (if Tom is last in line - but the question implies someone IS in front)

4. **Alice in Wonderland Parallel**: Just as models fail to realize Alice IS one of the sisters from the brother's perspective, models may fail to realize Sarah IS the person in front of Tom (not someone else)

5. **Semantic Priming**: The word "directly" might trigger models to look for spatial precision rather than recognizing the simple inverse relationship

### Predicted Wrong Answers

1. **"We cannot determine"** - Model may claim insufficient information
2. **"No one"** - Model may assume Tom is at the front
3. **"Unknown"** or **"The person in front"** - Vague non-answers
4. **Hallucinated name** - Model invents a third person
5. **"Sarah is behind Tom"** - Model reverses the relationship incorrectly

## Verification of Strawberry Criteria

| Criterion | Assessment |
|-----------|------------|
| Simple one-liner? | Yes - single sentence |
| 5-year-old can answer? | Yes - basic spatial relationship from daily experience |
| Requires enumeration? | No - pure logical equivalence |
| Can be solved by CoT? | Possibly - but perspective shift may still cause errors |
| Novel (not in training data)? | This specific framing is likely rare |
| Unambiguous answer? | Yes - "Sarah" is the only correct answer |

## Alternative Formulations (If Primary Fails)

If models consistently get the above correct, consider these variations:

1. **Multiple people version**: "In a line, Tom is behind Sarah, and Sarah is behind Mike. Who is directly in front of Tom?"
   - Answer: Sarah (not Mike)
   - Adds distractor (Mike) while maintaining same principle

2. **Reverse framing**: "Sarah is standing directly in front of Tom in a line. Who is standing directly behind Sarah?"
   - Answer: Tom
   - Same relationship, different direction

3. **Compound relationship**: "Tom is standing directly behind Sarah. Sarah is standing directly behind no one. Who is in front of Tom?"
   - Answer: Sarah
   - Adds explicit information that Sarah is first, making it clearer

## Connection to Previous Research

This question builds on:
- **Iteration 6 (80%)**: Sibling relationship questions showed partial success
- **Iteration 8 (80%)**: Contradiction detection worked partially
- **Iteration 43 (40%)**: Positional questions with ambiguity caused disagreement

Unlike iteration 43 (which used character positions in words), this question:
- Cannot be solved by enumeration
- Requires understanding inverse spatial relationships
- Has exactly ONE unambiguous correct answer
- Tests the same "perspective shift" weakness documented in Alice in Wonderland research

## Conclusion

This question targets a documented failure mode (relational reasoning with perspective shifts) using a novel domain (physical queue positions) that:
1. Any human immediately understands from physical experience
2. Requires no counting, calculation, or enumeration
3. Has a single unambiguous correct answer
4. May trigger models to over-complicate or pattern-match incorrectly

The question is: **"Tom is standing directly behind Sarah in a line. Who is standing directly in front of Tom?"**

The answer is: **Sarah**
