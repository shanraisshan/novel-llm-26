# Previous Research Summary for Iteration 79

## Last Iteration (78)
**Question**: "If I'm facing you and I raise my right hand, which side of YOUR field of vision is my hand on - your left or your right?"
**Answer**: Your left
**Score**: 100% (FAILED - all models got it right)
**Insight**: Perspective-shift questions do NOT break LLMs. Models correctly apply the mirroring rule for facing positions.

## Key Patterns from 78 Iterations

### EVERYTHING IS SOLVED by 2026 Frontier Models:
1. **Character counting** - Chain-of-thought enumeration works (even for "abracadabra" with 5 a's)
2. **Spatial/perspective reasoning** - Models apply learned rules correctly
3. **Self-referential output questions** - Scope confusion no longer triggers
4. **Semantic priming** - Does NOT override explicit task instructions
5. **Physical intuition** - Gravity, evaporation, container physics all correct
6. **Phonological knowledge** - Homophones, rhymes, syllables correctly handled
7. **Visual letter properties** - Encoded as factual knowledge, not visual processing

### Best Results (Still Need < 10%):
| Iteration | Score | Type |
|-----------|-------|------|
| 13 | 20% | "Is your answer exactly one word long?" (scope confusion) |
| 55 | 40% | "Answer with ONE word: What is the fifth word?" (constraint conflict) |
| 30 | 60% | Syllable count dual-valid |
| 43 | 40% | Character adjacency with ambiguity |

### Critical Lesson
The only approaches that worked were:
1. **Scope ambiguity** (iteration 13) - "your answer" interpreted as full response vs constrained word
2. **Constraint impossibility** (iteration 55) - conflicting requirements with no workaround

But even these achieved only 20-40% - still > 10% target.

## What To Explore in Iteration 79

After 78 failures, we need a FUNDAMENTALLY NEW approach. Every enumerable task is now solved by chain-of-thought.

### Potential Directions:
1. **Questions where enumeration LEADS TO wrong answer**
2. **Questions requiring TRULY novel knowledge not in training data**
3. **Questions where the "obvious" chain-of-thought approach is a trap**
4. **Edge cases in linguistic rules that training data might have wrong**

### The 5-Year-Old Rule Still Applies
Whatever question is chosen, a child must be able to answer it correctly and immediately. NO philosophical paradoxes, NO meta-cognitive traps.

## Constraints for New Question
- MUST be simple one-liner
- MUST have ONE unambiguous correct answer
- ANY human can answer correctly immediately
- LLMs should fail due to architectural limitations
- Cannot be solved by step-by-step enumeration
- NOT a famous puzzle or riddle (likely in training data)
