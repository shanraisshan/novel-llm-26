# Research Iteration 41: Phonetic/Rhyming Questions

## Executive Summary

This iteration explores whether LLMs can correctly answer questions about how words SOUND rather than how they LOOK. Unlike previous iterations that tested text processing capabilities, this targets a fundamental limitation: LLMs process text tokens, not audio, and must infer pronunciation from orthography - a notoriously unreliable mapping in English.

## External Research Conducted

### 1. PhonologyBench (ACL 2024) - Primary Source

**Source**: Suvarna, Khandelwal, & Peng - "PhonologyBench: Evaluating Phonological Skills of Large Language Models" (ACL Workshop 2024)

**Key Findings**:
- **17% gap** between humans and LLMs on rhyme word generation
- **45% gap** between humans and LLMs on syllable counting
- LLMs perform worse on **low-frequency words** where pronunciation patterns are less memorized
- **Tokenization destroys phonological structure** - split-word tokens perform worse than whole-word tokens
- GPT-4 achieved only 57.6% success rate on rhyme generation vs 86.4% human baseline
- No single model consistently outperforms others across all phonological tasks

**Quote from paper**: "LLMs may leverage the learnt associations between written and spoken forms to accomplish these tasks. However, due to the lack of deep phonological understanding, they fail to perform phonological reasoning tasks in open-world scenarios."

### 2. Reddit: r/slatestarcodex - "Why can't LLMs use slant rhymes?"

**Source**: https://www.reddit.com/r/slatestarcodex/comments/1ibnflm/why_cant_llms_use_slant_rhymes/

**Key Findings**:
- LLMs consistently fail at **slant rhymes** (near-rhymes like "hang" vs "range")
- Top comment (55 upvotes): "tokenized LLMs learn rhymes primarily through memorization and the space of slant-rhymes is too large to easily memorize"
- Another insight: "they don't have any inkling of what tokens actually sound like phonetically"
- LLMs "just keep spitting out straight rhymes and arguing that they actually constitute slant rhymes"

### 3. English Spelling Irregularity - The "-ough" Problem

**Source**: Aeon Essays, Merriam-Webster, The Spelling Society

The infamous "-ough" letter combination has at least 6 different pronunciations:
- **THOUGH** = /ðoʊ/ (long O, silent GH)
- **THROUGH** = /θruː/ (OO sound, silent GH)
- **COUGH** = /kɔf/ (OFF sound, GH = F)
- **ROUGH** = /rʌf/ (UFF sound, GH = F)
- **BOUGH** = /baʊ/ (OW as in "now")
- **THOUGHT** = /θɔːt/ (AW sound, silent GH)

This creates a natural trap: words that LOOK similar may sound completely different, and vice versa.

### 4. Hacker News Discussion on Tokenization and Phonetics

**Source**: https://news.ycombinator.com/item?id=37824400

**Key insight**: "The encoding would translate the questioning to the manifold representation using the correct spelling. The decoding then convert the representation into the answer. If the representation relates the logic of the question to the phonetics of it being spoken, then this would account for spelling confusions."

**User observation**: "The answers supplied are often the number of verbalised presences of the sounds, eg in strawberry you 'hear' 2 r's"

## The Phonetic Blindness Hypothesis

LLMs process text as tokens, not sounds. When asked about pronunciation or rhyming, they must:
1. Recognize the word
2. Retrieve its pronunciation from memorized associations
3. Compare pronunciations

This fails when:
- Words have irregular spelling-to-pronunciation mappings
- The specific pronunciation pair wasn't well-represented in training data
- Multiple valid pronunciations exist (heteronyms)

## Candidate Questions Explored

### Candidate 1: "Does COUGH rhyme with THOUGH?"
- **Answer**: No
- **COUGH** = /kɔf/ (rhymes with "off")
- **THOUGH** = /ðoʊ/ (rhymes with "go")
- **Human intuition**: Humans know these sounds different because we've HEARD them
- **LLM trap**: Same "-ough" ending, high spelling similarity score
- **Risk**: May be in training data due to "-ough" being a famous example

### Candidate 2: "Does ROUGH rhyme with BOUGH?"
- **Answer**: No
- **ROUGH** = /rʌf/ (rhymes with "stuff")
- **BOUGH** = /baʊ/ (rhymes with "now")
- **Human intuition**: Obvious - different sounds
- **LLM trap**: Both end in "-ough", visually identical suffixes
- **Risk**: Same famous example concern

### Candidate 3: "Does LEAD (the metal) rhyme with READ (past tense)?"
- **Answer**: Yes
- **LEAD** (metal) = /lɛd/
- **READ** (past tense) = /rɛd/
- **Human intuition**: We know both sound like "red" with different first letters
- **LLM trap**: Different spellings, no visual rhyme indicators
- **Risk**: Heteronyms may confuse the question - need disambiguation

### Candidate 4: "Does PINT rhyme with MINT?"
- **Answer**: No
- **PINT** = /paɪnt/ (rhymes with "giant")
- **MINT** = /mɪnt/ (rhymes with "hint")
- **Human intuition**: Obviously different - "pie-nt" vs "mi-nt"
- **LLM trap**: Identical endings "-int", same structure, one letter difference
- **Strength**: Less famous than -ough examples, strong visual similarity

### Candidate 5: "Does LOVE rhyme with MOVE?"
- **Answer**: No
- **LOVE** = /lʌv/ (rhymes with "dove", "above")
- **MOVE** = /muːv/ (rhymes with "groove", "prove")
- **Human intuition**: Common words, pronunciation well-known
- **LLM trap**: Same "-ove" ending, strong visual pattern match
- **Strength**: Common words, but inconsistent pronunciation

## Selected Question

**"Does PINT rhyme with MINT?"**

### Rationale for Selection

1. **Less Famous Than -OUGH**: The -ough pronunciation variations are so famous they're likely well-represented in training data. PINT/MINT is less documented as a pronunciation trap.

2. **Maximum Visual Similarity**:
   - Same length (4 letters)
   - Same ending (-INT)
   - Only one letter different (P vs M)
   - LLMs using visual/token pattern matching would strongly predict "yes"

3. **Clear Human Answer**: Any English speaker immediately knows:
   - PINT = /paɪnt/ (as in "a pint of beer")
   - MINT = /mɪnt/ (as in "peppermint")
   - These do NOT rhyme

4. **Objectively Verifiable**: Dictionary pronunciations confirm they don't rhyme:
   - PINT rhymes with: feint, taint, faint, paint
   - MINT rhymes with: hint, lint, stint, print

5. **Exploits Tokenization**: The "-INT" suffix is likely a common token, and both words may be processed as [P][INT] and [M][INT], hiding the vowel sound difference.

## The Question

**"Does PINT rhyme with MINT?"**

## The Correct Answer

**No**

PINT (/paɪnt/) has a long "i" diphthong (as in "pie" or "my"), while MINT (/mɪnt/) has a short "i" vowel (as in "pin" or "sit"). Despite their identical spellings except for the first letter, they have completely different vowel sounds and do not rhyme.

## Why Humans Get It Right

1. **Phonetic Memory**: Humans have heard both words spoken thousands of times
2. **Instant Recognition**: We don't "compute" pronunciation - we KNOW it
3. **No Visual Confusion**: Seeing the spelling doesn't override our phonetic knowledge
4. **Common Usage**: "A pint of beer" and "peppermint" are everyday phrases

## Why LLMs Will Likely Fail

1. **Token-Based Processing**: LLMs see [P][INT] and [M][INT] or similar token patterns
2. **Visual Pattern Matching**: Identical endings (-INT) strongly suggest rhyming
3. **Memorization Limits**: Pronunciation exceptions require explicit memorization
4. **No Phonetic Grounding**: LLMs have no audio experience - they can't "hear" the difference
5. **PhonologyBench Evidence**: 17% gap between LLM and human performance on rhyme tasks

## Predicted LLM Wrong Answer

**"Yes"** - LLMs will likely say PINT and MINT rhyme because:
- They both end in "-int"
- Rhyming is often associated with matching endings
- The visual similarity is overwhelming
- The question seems obviously "yes" based on spelling

## Alternative Questions Considered But Not Selected

1. **"Does COUGH rhyme with DOUGH?"** - Too famous, likely in training data
2. **"Does LOVE rhyme with MOVE?"** - Good candidate, but "love/dove" rhyme is famous
3. **"Does WIND (breeze) rhyme with FIND?"** - Requires disambiguation, less clean
4. **"Does GONE rhyme with BONE?"** - Another strong candidate for future testing
5. **"Does SWORD rhyme with WORD?"** - Also strong but less common vocabulary

## Experimental Design

The question is a simple yes/no that:
- Requires phonetic knowledge
- Cannot be solved by visual pattern matching
- Has one objectively correct answer
- Any human English speaker answers correctly in < 1 second

## Success Criteria

The question succeeds if:
- 5 independent AI researchers give DIFFERENT answers
- Consensus score < 10%
- The correct answer is verifiable via any dictionary

## Confidence Assessment

**Medium-High Confidence** this will cause LLM disagreement because:
- PhonologyBench research shows 17% gap on rhyme tasks
- PINT/MINT has strong visual similarity (pattern matching trap)
- Less famous than -ough examples (less likely to be explicitly memorized)
- Tokenization likely obscures the vowel difference

**Risk Factors**:
- Modern frontier models may have improved phonological skills since PhonologyBench (2024)
- PINT pronunciation may be well-memorized due to "pint of beer" frequency
- Models might explicitly enumerate known pronunciations

---

## Appendix: Full PhonologyBench Performance Table

| Model | Rhyme Generation (Common) | Rhyme Generation (Rare) |
|-------|--------------------------|-------------------------|
| GPT-4 | 69.1% | 46.1% |
| Claude-3-Sonnet | 62.4% | 39.6% |
| GPT-3.5-Turbo | 66.5% | 42.7% |
| Mixtral-8X7B | 38.4% | 17.5% |
| Mistral-7B | 25.1% | 8.3% |
| LLaMA-2-13B | 32.4% | 15.6% |
| **Human Baseline** | **86.4%** | **60.4%** |

The gap between humans and GPT-4 is ~17% on common words and ~14% on rare words. This demonstrates a systematic weakness in LLM phonological reasoning.
