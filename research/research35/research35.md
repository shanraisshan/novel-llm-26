# Research Documentation for Iteration 35

## External Research Conducted

### Tavily Web Search Findings

1. **Tokenization and Character Counting (arxiv.org, secwest.net, linkedin.com)**
   - LLMs process text as tokens (subwords), not individual characters
   - The "strawberry" problem is well-documented: LLMs see ["str", "aw", "berry"] not individual letters
   - Key finding: "Models concentrate most of their errors when counting letters that have a multiplicity greater than one"
   - Research confirms: "most models being unable to correctly count words in which letters appear more than twice"
   - Double letters within a single token (like "rr" in "berry") are especially problematic

2. **Decimal Comparison Failures (linkedin.com, timesofindia.com, medium.com)**
   - The 9.9 vs 9.11 problem is extensively documented
   - LLMs tokenize "5.11" as "5" + "11" and "5.9" as "5" + "9", then compare 11 > 9
   - This pattern comes from training on version numbers and height notation (5'11" > 5'9")
   - GPT-5 famously failed: 5.9 = x + 5.11, giving x = -0.21 instead of x = 0.79
   - However, this specific example (9.9 vs 9.11) is NOW WELL-KNOWN and likely trained on

3. **Misspelled Words as Novel Test Cases (linkedin.com, substack.com)**
   - Key insight: "strawberry" itself is now memorized due to fame
   - Using misspelled variants like "strawberi" still breaks LLMs
   - The research recommends finding NOVEL words not in training data
   - Double letters ("rr", "ll", "ee", "ss", "oo", "tt") are treated as single units

### Reddit MCP Findings

1. **r/LocalLLaMA discussion**: "No, model x cannot count the number of letters 'r' in the word..."
   - Confirms tokenization as root cause
   - Suggests LLMs may get "strawberry" right now due to training data contamination
   - Recommends novel/uncommon words for testing

2. **r/ChatGPT and r/OpenAI**: Multiple threads documenting 9.11 vs 9.9 failures
   - This is now a FAMOUS test case - likely patched in training
   - Need novel decimal comparisons that haven't been trained on

### Key Insight for Novel Question Design

The research clearly shows:
- **"Strawberry" is contaminated** - too famous, now in training data
- **9.9 vs 9.11 is contaminated** - extensively discussed, likely patched
- **Words with triple repeated letters are hardest** - models fail when letters appear 3+ times
- **Novel/uncommon words work best** - not seen in viral posts or training data

### Candidate Approach: Novel Word with Triple Letters

Looking for common words with:
1. A letter appearing 3+ times
2. Not famous as an LLM test case
3. Easy for any human to count

Words with 3+ repeated letters:
- "assassin" - has 4 s's (a-s-s-a-s-s-i-n)
- "Mississippi" - has 4 s's and 4 i's (famous, likely trained)
- "banana" - has 3 a's (simple, common)
- "tomorrow" - has 3 o's (t-o-m-o-r-r-o-w)
- "possess" - has 4 s's (p-o-s-s-e-s-s)
- "committee" - has 2 m's, 2 t's, 2 e's
- "successful" - has 2 s's, 2 c's

Best candidate: **"assassin"** - has 4 letter 's' but the 'ss' doubles might be tokenized together, and there are two separate 'ss' pairs.

Alternative: **"possess"** - has 4 letter 's' (p-o-s-s-e-s-s)

Let me verify: p-o-s-s-e-s-s = 7 letters total, with 's' appearing at positions 3, 4, 6, 7 = 4 times

Actually, let me reconsider. The research shows that COMMON double letters are problematic. Let me think of words where the letter counting is trivially easy for humans but LLMs will fail due to tokenization.

### Final Selection: "possess"

The word "possess" contains:
- p, o, s, s, e, s, s
- The letter 's' appears 4 times
- Tokenization likely splits this as "poss" + "ess" or similar
- This is NOT a famous LLM test case (unlike strawberry, Mississippi)
- Any 5-year-old can count: p-o-s-s-e-s-s and count the s's on their fingers

---

## The Question

**How many times does the letter 's' appear in the word 'possess'?**

---

## The Correct Answer

**4**

The word "possess" is spelled: p-o-s-s-e-s-s

The letter 's' appears at positions 3, 4, 6, and 7.

---

## Why Humans Get It Right

Humans visually scan the word letter-by-letter:
- p (no)
- o (no)
- s (yes - count 1)
- s (yes - count 2)
- e (no)
- s (yes - count 3)
- s (yes - count 4)

Any child can do this by pointing at each letter and counting on their fingers. It takes about 2 seconds.

---

## Why LLMs Will Fail

1. **Tokenization Blindness**: The word "possess" is likely tokenized as one or two tokens (e.g., "poss" + "ess" or just "possess"). The LLM never "sees" individual letters.

2. **Double-Letter Confusion**: The consecutive "ss" pairs are processed as single units. Research shows LLMs particularly struggle with "letters that have a multiplicity greater than one" within tokens.

3. **Statistical Bias**: Most words in English have letters appearing 0-2 times. LLMs are biased toward answering "2" or "3" because that's statistically common. The answer "4" is unusual.

4. **Pattern Matching to Wrong Answer**: LLMs may recognize "two sets of double-s" and answer "2" (counting the groups) rather than "4" (counting individual letters).

5. **Not in Training Data**: Unlike "strawberry" which has been extensively discussed as an LLM failure, "possess" is not a famous test case and won't have corrective training.

---

## Predicted Wrong Answer

LLMs will likely answer **2** or **3**.

- **2**: Counting the "ss" pairs as two groups (seeing "ss" and "ss")
- **3**: Miscounting by missing one of the middle s's due to token boundaries

The most likely wrong answer is **2** because LLMs may interpret "how many times does 'ss' appear" instead of counting individual 's' letters.

---

## Verification

Let me verify this is a good strawberry-paradigm question:

1. **5-year-old test**: Can a child answer this? YES - just spell and count: p-o-s-s-e-s-s, point at each s.
2. **Unambiguous**: Is there ONE correct answer? YES - exactly 4 s's.
3. **Not philosophical**: Is this a simple factual question? YES - just counting.
4. **Exploits tokenization**: Does this exploit LLM architecture limitations? YES - double letters in tokens.
5. **Novel**: Is this NOT a famous test case? YES - "possess" is not the strawberry/Mississippi of LLM testing.

---

## Alternative Questions Considered

1. "How many e's in 'seventeen'?" - Semantic interference (17) + letter counting
2. "How many s's in 'Mississippi'?" - Too famous, likely trained on
3. "Is 7.9 bigger than 7.12?" - Decimal comparison, but 9.9/9.11 is now famous
4. "How many o's in 'tomorrow'?" - Good candidate (answer: 3)
5. "How many s's in 'assassin'?" - Good candidate (answer: 4)

I chose "possess" because:
- It's a common, everyday word
- It has 4 s's (high multiplicity = high error rate per research)
- It's NOT a famous LLM test case
- The double-s pairs create tokenization confusion
