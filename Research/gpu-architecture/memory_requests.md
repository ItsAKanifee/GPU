# Memory Requests

## Source

<https://scispace.com/pdf/warppool-sharing-requests-with-inter-warp-coalescing-for-3yqgz2qq0a.pdf>

## Notes

- Goes over the basic structure of how memory is called within an Nvidia Warp

- GPUs use *memory coelelscers* to combine memory requests in the warp to the same cache line
  - L1 cache can only take 1 request at a time, so lane requests must be serialized
