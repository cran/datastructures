## ---- eval=TRUE, include=FALSE-------------------------------------------
  library(datastructures)

## ------------------------------------------------------------------------
  fheap <- fibonacci_heap("numeric", "character")
  bheap <- binomial_heap("numeric", "character")

## ------------------------------------------------------------------------
  keys   <- sample(seq(0, 1, by=.2))
  values <- paste0("V", keys)
  fheap  <- insert(fheap, keys, values)
  
  size(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, -1, letters)
  peek(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, c(-2, -3), matrix(letters, 2))
  peek(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, c(-4, -5), list("a", letters[1:4]))
  peek(fheap)

## ------------------------------------------------------------------------
  peek(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  pop(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  fheap[-10] <- "V-1"
  peek(fheap)

## ------------------------------------------------------------------------
  hash  <- hashmap("character", "integer")
  bimap <- bimap("character", "integer")

## ------------------------------------------------------------------------
  keys   <- paste0("V", 1:5)
  values <- 1:5
  hash   <- insert(hash, keys[1:4], values[1:4])
  bimap  <- insert(bimap, keys[1:4], values[1:4])
  hash[keys[5]]  <- values[5]
  bimap[keys[5]] <- values[5]

## ------------------------------------------------------------------------
  get(hash, keys[1])
  hash[keys[1]]
  
  get(bimap, keys[1], "values")
  get(bimap, values[2], "keys")
  get(bimap, keys[1])

## ------------------------------------------------------------------------
  keys(bimap)
  values(hash)
  head(bimap)

## ------------------------------------------------------------------------
  qu <- queue("numeric")
  st <- stack("numeric")

## ------------------------------------------------------------------------
  keys <- seq(0, 1, by=.2)
  print(keys)
  qu <- insert(qu, keys)
  st <- insert(st, keys)

## ------------------------------------------------------------------------
  peek(qu)
  peek(st)

## ------------------------------------------------------------------------
  st <- insert(st, list(1, rnorm(5)))
  pop(st)
  pop(st)

