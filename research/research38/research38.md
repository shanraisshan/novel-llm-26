# Research Iteration 38: Building on Visual Transformation Success

## Previous Success (Iteration 37)

**Question**: "If you turn the word 'MOM' upside down, what do you see?"
**Answer**: WOW
**Score**: 80% consensus (4/5 correct, 1 hedged between MOM and WOW)

### Why It Worked
- Visual transformation requires **perceptual knowledge** about letter shapes
- This knowledge CANNOT be enumerated like letter counting
- LLMs have inconsistent encoding of visual letter properties
- Chain-of-thought cannot "verify" visual properties without genuine visual simulation

## External Research: Symbiotograms

### Tavily Search Results

I searched for ambigrams, 180-degree rotation words, and symbiotograms. Key findings:

**Confirmed Symbiotogram Pairs** (words that become DIFFERENT words when rotated 180 degrees):
- MOM / WOW (canonical example - used in iteration 37)
- deal / leap
- sail / lies
- sled / pals
- lead / peal
- sped / pads
- dooms / swoop

**Self-Ambigrams** (words that stay the SAME when rotated 180 degrees):
- SWIMS
- SUNS
- NOON
- SOLOS
- DOLLOP

### Letter Transformation Rules (180-degree rotation)

**Symmetric letters** (stay the same):
- S, O, I, H, X, Z, N (in capitals)
- s, o, i, x (in lowercase)

**Letter pairs** (become each other):
- M <-> W
- b <-> q
- d <-> p
- u <-> n
- a <-> e (approximately)

### Sources
- Wikipedia: Ambigram article
- davidblackledge.blogspot.com: Natural Rotational Ambigrams (CONFIRMED sail/lies in list)
- youarecurrent.com: "You'll flip over these words" article
- ambigramgeneratorfree.com: List of Rotational Ambigram Words

### VERIFICATION from David Blackledge Blog

The blog explicitly lists **sail/lies** as a symbiotogram pair:
```
Symbiotogram words:
...
sail/lies
pail/lied
ail/lie
...
```

The blog also notes: "It helps to have non-D'Nealian a's ('hook' a's) since they look like e's (and vice versa) when rotated."

This confirms the a<->e transformation is central to this ambigram pair.

## Question Design Strategy

### Why Not Use MOM/WOW Again
MOM/WOW is the CANONICAL example of a symbiotogram. It appears in:
- Wikipedia's ambigram article as the first example
- Countless educational materials
- Training data is likely saturated with this example

### Why SAIL/LIES Is a Better Choice

1. **Less Common**: Not the first example in most explanations
2. **More Complex Transformation**:
   - MOM/WOW: M->W, O->O, M->W (simple M/W swap)
   - SAIL/LIES: S->S, A->E, I->I, L->L + reversal (involves a->e transformation)
3. **Verification Process**:
   - Child can write SAIL, flip the paper 180 degrees, and see LIES
   - The a->e transformation is visually intuitive but less documented

### Letter-by-Letter Analysis of SAIL -> LIES

When you rotate "SAIL" 180 degrees:

```
Original:  S  A  I  L
           |  |  |  |
           v  v  v  v
Rotated:   S  E  I  L  (reading right-to-left from the rotated perspective)

Reading left-to-right after rotation: L-I-E-S = LIES
```

Step-by-step:
1. Write SAIL on paper
2. Rotate paper 180 degrees (upside down)
3. Now reading from left to right:
   - L (was rightmost) stays L
   - I (next from right) stays I
   - A (next from right) becomes E (approximate visual similarity when inverted)
   - S (was leftmost) stays S
4. Result: LIES

## Proposed Question

**Question**: "If you turn the word 'SAIL' upside down, what do you see?"

**Correct Answer**: LIES

### Why Humans Get It Right
- Can physically or mentally rotate the letters
- Visual intuition: upside-down 'a' looks like 'e'
- Simple to verify by writing and flipping paper

### Why LLMs May Fail
1. **Less training data**: SAIL/LIES is less famous than MOM/WOW
2. **a->e transformation is ambiguous**: Some models may not know that lowercase 'a' becomes 'e' when rotated
3. **May confuse with other transformations**: Mirror reflection vs 180-degree rotation
4. **May give wrong answer entirely**: Could say "LIAS" (just reversing) or "SAIL" (thinking it's symmetric)

### Predicted Wrong Answers
- "LIAS" (just reversing without letter transformation)
- "SAIL" (assuming it's symmetric like SWIMS)
- "LISE" (partial transformation)
- No answer / "I can't visualize"

## Alternative Questions Considered

1. **"If you turn 'SLED' upside down, what do you see?"** -> PALS
   - Good but involves more letter transformations (e->a, d->p)
   - More complex, might be harder for humans too

2. **"If you turn 'NOON' upside down, what do you see?"** -> NOON
   - Self-ambigram, answer is the same word
   - Less confusing - LLMs might get this right

3. **"If you turn 'SWIMS' upside down, what do you see?"** -> SWIMS
   - Famous self-ambigram, likely in training data
   - Too easy

## Final Selection

**Question**: "If you turn the word 'SAIL' upside down, what do you see?"

**Answer**: LIES

**Rationale**:
- Builds directly on iteration 37's successful format
- Uses a less-documented symbiotogram pair
- Involves the ambiguous a->e transformation
- Any child can verify by actually rotating paper with SAIL written on it
- Clear, objective answer

## Risk Assessment

**Chance of 100% consensus**: Medium-low. While visual questions showed promise in iteration 37, SAIL/LIES may be in training data as a known symbiotogram.

**Chance of <50% consensus**: Medium. The a->e transformation is less intuitive than M->W, which could cause more disagreement.

**Mitigation**: If this gets high consensus, try even more obscure symbiotograms like sled/pals or dooms/swoop in future iterations.
