## Reasoning

I need to count how many times the digit sequence '11' appears in the number 11111.

The number 11111 has 5 digits: 1 1 1 1 1 (at positions 1, 2, 3, 4, 5)

I'll check each consecutive pair of digits to see if they form '11':
- Positions 1-2: '11' - YES
- Positions 2-3: '11' - YES
- Positions 3-4: '11' - YES
- Positions 4-5: '11' - YES

Since the sequence '11' can overlap with itself, I count each starting position where '11' begins. With 5 digits, there are 4 possible starting positions for a 2-digit sequence, and all of them are '11'.

## Final Answer

4
