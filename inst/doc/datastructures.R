## ---- message=FALSE, warning=FALSE---------------------------------------
  library(datastructures)

## ------------------------------------------------------------------------
    fheap <- new("fibonacci_heap", "numeric", "character")

## ------------------------------------------------------------------------
  keys   <- sample(seq(0, 1, by=.2))
  values <- paste0("V", keys)
  fheap  <- insert(fheap, keys, values)
  size(fheap)

## ------------------------------------------------------------------------
  peek(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  pop(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  fheap[-1] <- "V-1"
  peek(fheap)

## ------------------------------------------------------------------------
  hash <- new("hashmap", "character", "integer")

## ------------------------------------------------------------------------
  keys    <- paste0("V", 1:5)
  values  <- 1:5
  hash    <- insert(hash, keys[1:4], values[1:4])
  hash[keys[5]] <- values[5]
  size(hash)

## ------------------------------------------------------------------------
  get(hash, keys[1])
  hash[keys[1]]

## ------------------------------------------------------------------------
  qu <- new("queue", "numeric")
  st <- new("stack", "numeric")

## ------------------------------------------------------------------------
  keys <- seq(0, 1, by=.2)
  print(keys)
  insert(qu, keys)
  insert(st, keys)

## ------------------------------------------------------------------------
  peek(qu)
  peek(st)

## ------------------------------------------------------------------------
  size(qu)
  pop(qu)
  size(qu)
