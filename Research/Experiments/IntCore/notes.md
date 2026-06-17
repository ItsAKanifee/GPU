# Int_Core Notes

## Overview

This document is a place where I right down my progress and ideas as I proceed with the project.

## Notes

- 6/11/26: Created a simple lane that stores data and sends it through an ALU, as well as a warp to test 8 lanes simultaneously
  - TODOs: I need the 8 lanes to communicate with the same cache and output to said cache
  - Ideas: 
    - 1. Create a memory block that can read from two entry points (A, B), and write to one (C)
    - 2. Create one bigger block of memory that all lanes can read from
