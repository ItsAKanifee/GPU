# What is a FLOP

## Source

<https://drilian.com/posts/2023.01.10-floating-point-numbers-and-rounding/>

## Summary

### How floating-point numbers work (concise)

- Representation (IEEE 754, normalized numbers):
  - Value = (-1)^{sign} *(1 + mantissa / 2^{mantissa_bits})* 2^{exponent - bias}
  - Single precision (32-bit): sign=1 bit, exponent=8 bits (bias=127), mantissa=23 bits
  - Double precision (64-bit): sign=1 bit, exponent=11 bits (bias=1023), mantissa=52 bits

- Components:
  - Sign bit: 1 bit (0 = positive, 1 = negative)
  - Exponent: biased integer that scales the significand by powers of two
  - Mantissa (fraction / significand): fractional part; normalized numbers have an implicit leading 1

- Special values / edge cases:
  - Exponent = 0: zero or subnormal (denormal) numbers (reduced precision)
  - Exponent = all 1s: infinity or NaN

- Rounding and precision:
  - Mantissa bit-width limits precision; arithmetic is rounded to the representable nearest value (commonly round-to-nearest-even)
  - Subnormals and rounding modes affect tiny values and numerical stability

### FLOP / FMA (practical)

- FLOP: a floating-point operation (e.g., add, multiply).
- FMA (fused multiply-add): computes A * B + C with a single rounding step. Hardware executes FMA as one fused instruction, but reporting conventions vary: some count FMA as one operation, others as two (multiply + add) — confirm the convention when quoting FLOPS.

### Practical takeaways

- Numerical stability: reorderings and associative assumptions are not exact for floating-point math; prefer numerically stable algorithms.
- Precision vs performance: double reduces rounding error but costs throughput and memory; choose precision according to correctness requirements.
- On modern hardware (CPUs/GPUs) FMA throughput is high; benchmarking should document whether FMAs are counted as 1 or 2 FLOPs.
