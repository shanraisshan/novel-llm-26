# Tavily Web Search Findings — Iteration 105

## Goal

Find a universally famous riddle with a single dominant canonical answer that:
1. Can be modified by flipping one detail to invalidate the canonical answer
2. Leaves a trivially obvious correct answer for any 5-year-old
3. Has NOT been used as a documented LLM test case

## Search Queries Used

### Query 1: `famous "what am I" riddles list classic answer echo sponge towel`
**Key sources:**
- https://www.rd.com/list/what-am-i-riddles/ — Reader's Digest canonical list
- https://www.today.com/life/inspiration/riddles-rcna125339 — Today Show 120 riddles
- https://www.aol.com/50-tricky-am-riddles-kids-101000756.html — AOL 50 riddles

**Insight:** The "full of holes / holds water" (sponge), "neck but no head" (bottle), "wetter when drying" (towel), "eye but can't see" (needle), and "hands but no arms" (clock) are the top-5 most universally documented canonical riddles in English training data.

### Query 2: `MisguidedAttention benchmark LLM riddle test cases list`
**Key sources:**
- https://github.com/cpldcpu/MisguidedAttention — the primary LLM riddle benchmark
- https://github.com/cpldcpu/MisguidedAttention/issues/4 — "New riddles" issue
- https://github.com/cpldcpu/MisguidedAttention/issues/11 — "some more riddles" issue

**CRITICAL INSIGHT:** The MisguidedAttention Issue #4 explicitly contains: **"I'm tall when I'm young, and I'm taller when I'm old. What am I? Definitely not a candle."** This is essentially the same structure as iteration 104, explaining why that iteration only achieved 40% (not 0%) — the candle inversion is publicly documented as an LLM test case and may be in training data. MUST AVOID candle-type modifications.

### Query 3: `"more you take the more you leave behind" riddle footsteps famous`
Confirmed: footsteps is the canonical answer, heavily documented.

### Query 4: `"I speak without a mouth" echo riddle variations`
Confirmed: echo is the canonical answer, heavily documented.

### Query 5: `"riddle of the sphinx" answer man walks four legs three legs`
Confirmed: man is the canonical answer. Sphinx riddle is universal.

### Query 6: `classic riddles "full of holes" sponge colander "holds water"`
**Key sources:**
- https://www.facebook.com/100066853944033/posts/ — "Full of holes but still hold water" polled A/B/C/D with "sponge" as the dominant answer
- https://www.tiktok.com/@zachandhailee/video/7504788715248553247 — TikTok viral instance
- https://www.instagram.com/p/DJdW47wSjWy/ — Instagram viral explanation

**Insight:** The sponge riddle is one of the most documented canonical riddles across all platforms. Pattern-match pull is extremely strong.

### Query 7: `"what has hands but no arms" clock riddle famous variations`
Confirmed: clock is canonical.

### Query 8: `"I have cities but no houses" map famous riddle variations`
Confirmed: map is canonical. But the correct answer to an inverted version is hard to give a 5-year-old.

### Query 9: `"what gets wetter the more it dries" towel riddle famous`
Confirmed: towel is canonical.

### Query 10: `"what has a neck but no head" bottle riddle variations famous classic`
Confirmed: bottle is canonical. Variant with "two arms" → shirt.

### Query 11: `"I am always in front of you but cannot be seen" future riddle`
Confirmed: future is canonical.

### Query 12: `MisguidedAttention github complete list all prompts bottle stamp map`
**Key sources:** GitHub issues #4 and #11 list explicit riddles used to test LLMs. Confirmed coverage of:
- Trolley problem variants
- Monty Hall variants
- Tall/short when young/old (candle-type)
- Lotus flower pond (doubling)
- Solid bridge river-crossing variants

**Insight:** The "full of holes but doesn't hold water" inversion is NOT in this list.

### Query 13: `"modified riddles" LLM trick pattern matching 2025 famous`
**Key sources:**
- https://huggingface.co/datasets/marcodsn/altered-riddles — **The Altered Riddles benchmark**

**CRITICAL INSIGHT:** There IS a published HuggingFace benchmark (marcodsn/altered-riddles) that measures "Conditioned Override Rate (COR)" — exactly the attack mechanism we're using. It includes 700 public riddles + 300 private. Need to ensure our chosen inversion is distinct from that public set.

### Query 14: `altered-riddles huggingface marcodsn dataset specific examples list`
Reviewed the public dataset README and found one example: "Adding 'I am made of colors' eliminates 'bridge' as the answer. A rainbow appears as an arc (a 'way') over water or landscape, exists above the water..."

The altered-riddles dataset example uses DIFFERENT riddles (bridge / rainbow) than our chosen sponge riddle. The specific "full of holes but doesn't hold water" flip does NOT appear in search results for this benchmark.

### Query 15: `"full of holes" "cannot hold water" sieve riddle LLM test GPT`
No results found for the specific inversion "cannot hold water" being used as an LLM test. Clear path.

### Query 16: `"full of holes but" sieve colander strainer riddle variation`
Top results all still default to the canonical sponge answer. The specific inversion "doesn't hold water" does not appear as a documented riddle form.

### Query 17: `"cannot hold water" riddle "full of holes" modified LLM GPT test pattern`
All search results return to the CANONICAL form "holds water" — no hits on the modified form. Confirms this inversion has not been publicly documented as an LLM test.

## Summary of Insights

1. **Top-5 most universal riddle pattern-matches in training data:** sponge, bottle, towel, clock, needle.
2. **Candle inversion is already published** on MisguidedAttention — avoid.
3. **A formal benchmark exists** (altered-riddles) measuring Conditioned Override Rate for exactly this attack vector, but uses different source riddles than the sponge.
4. **The sponge-riddle inversion** ("full of holes but doesn't hold water") appears fresh and undocumented as an LLM test.
5. **The correct answer (sieve/colander/strainer/net)** is known to every child who has been in a kitchen or sandbox — passes the 5-year-old test.

## Conclusion

Selected question: **"I'm full of holes, but I don't hold any water. What am I?"**

This applies the iteration-103 success pattern (famous riddle + one-detail flip) to a different, extremely famous canonical riddle (sponge). The inversion cleanly invalidates the canonical answer, leaves a child-obvious correct answer, and does not appear in published LLM test suites.
