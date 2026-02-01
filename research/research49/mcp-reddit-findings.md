# Reddit Research Findings

## Subreddits Searched

- r/LocalLLaMA
- r/MachineLearning
- r/ChatGPT
- r/artificial
- r/OpenAI

## Key Posts Found

### r/LocalLLaMA

1. **"The Candle Test - most LLMs fail to generalise at this simple task"**
   - URL: https://reddit.com/r/LocalLLaMA/comments/1jpr1nk/
   - Score: 252
   - Summary: Discusses how frontier models are becoming overfit to benchmarks, resulting in decreased generalization. Simple tests can expose this problem.

2. **"How do LLMs actually do this?"**
   - URL: https://reddit.com/r/LocalLLaMA/comments/1io5o9a/
   - Score: 813
   - Summary: Discussion about how LLMs can't actually "see" or count carefully - they pattern-match based on context rather than performing actual operations.

### r/OpenAI

3. **"Can someone explain exactly why LLM's fail at counting letters in words?"**
   - URL: https://www.reddit.com/r/OpenAI/comments/1haxhjk/
   - Summary: "Because a LLM is a language model, and language models predict the next tokens in a sequence given previous tokens. They don't think. They don't count."

### r/MachineLearning

4. **"Some thoughts about an elephant in the room"**
   - URL: https://reddit.com/r/MachineLearning/comments/1qo6sai/
   - Score: 438
   - Summary: Discussion about systematic failures in ML research and LLM evaluation.

## Insights Extracted

### Key Patterns Observed

1. **Token Prediction vs. Reasoning**: The community widely understands that LLMs don't actually "think" - they predict token sequences. This means tasks requiring true computation or counting are fundamentally challenging.

2. **Generalization Failures**: Multiple discussions highlight that models perform well on benchmarks but fail on slight variations or novel combinations of known tasks.

3. **Pattern Matching Limitations**: When asked to "look closer" or "count carefully," models don't actually change their processing - they just adjust their output pattern based on the new context.

### How Reddit Findings Influenced Question Design

The Reddit discussions confirmed that:

1. **Novel combinations work best**: Questions that combine known failure modes in new ways are more likely to cause disagreement than single-dimension challenges.

2. **Semantic content matters**: The words used in questions influence LLM outputs through pattern-matching, not through understanding.

3. **Simple ≠ Easy for LLMs**: The simpler a task appears to humans, the more likely it exposes fundamental architectural limitations.

The designed question leverages these insights by:
- Combining semantic interference with alphabet comparison (novel combination)
- Using "first" and "last" in ways that create maximum semantic conflict
- Being trivially simple for humans (just needs ABC knowledge)
