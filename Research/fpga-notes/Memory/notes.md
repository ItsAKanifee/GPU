# Memory Notes

## Overview

This document is a place where I right down my progress and ideas as I proceed with the project.

## Notes + Log

- **8/14/26:** Ok, so I realized that memory retrieval is a lot more complivcated than I was anticipating, and now I need to think out how exactly a GPU makes a call to memory in the first place. First, going over what I know:
  - Heirarchy:
    - There are multiple caches to allow for quick retrieval of memory, while also being for select modules within the system depending on level. L1 is specific to the SM, while L2 is shared between SMs
  
  - Timing:
    - The biggest complication with memory retrieval comes from the fact that multiple lanes would request memory at the same time, and that would cause lanes to wait for memory retrieval of there respective segment of memory or another lane

- **8/19/26:** I am making the base plan for the LSU, as that is a very important aspect to have this up and running. I am thinking of taking further inspiration from the 240 model, and to adapt an MDR and MAR into the block diagram to allow for calls to memory addresses and data. The difference is that the MDR will be a vector register that can read / write vectors to / from memory, and the MAR will still act as a single call to begin for experimental purposes
