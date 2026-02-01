## Reasoning

I need to count how many times the digit 9 appears when writing all numbers from 1 to 100.

Let me organize this by looking at where 9 can appear:

**9 in the units place (ones digit):**
- 9, 19, 29, 39, 49, 59, 69, 79, 89, 99
- That's 10 occurrences

**9 in the tens place:**
- 90, 91, 92, 93, 94, 95, 96, 97, 98, 99
- That's 10 occurrences

**Checking for overlap:**
- The number 99 contains two 9s (one in tens place, one in units place)
- I've already counted both of these separately above

**Total count:**
- Units place: 10 nines
- Tens place: 10 nines
- Total: 10 + 10 = 20 nines

**Verification:**
- Units digit 9: 9, 19, 29, 39, 49, 59, 69, 79, 89, 99 (10 times)
- Tens digit 9: 90, 91, 92, 93, 94, 95, 96, 97, 98, 99 (10 times)
- The number 100 has no 9s

## Final Answer

20
