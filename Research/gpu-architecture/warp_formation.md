# Warp Formatiion

## Source

<https://dl.acm.org/doi/10.1109/MICRO.2007.12>

(You will need an account to read this. If you have access to access the CMU Libraries, then you should be able to sign in with that)

## Notes

- This article goes over how to work with branching paths in cocurrent threads. Considering SIMT is by design using the same instruction for all threads, this is very important for edge cases in which the branch conditions are fulfilled in one lane, but not others

- Article does go into detail of how 'standard GPUs' (this is 2007) used round-robin scheduling for their path traversal
  - "When a shader thread is blocked by a memory request, the corresponding shader core simply removes that thread from the pool of “ready” threads and thereby allows other shader threads to proceed while the memory system processes its request."
    - Look more into this and see if this could be implementable
    - This also helps with understanding the mask
