## ---- eval=TRUE, include=FALSE-------------------------------------------
  library(datastructures)
  library(purrr)

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
  fheap  <- insert(fheap, c(-4, -5, -6), list("a", letters[1:4], "hello"))
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
  values(fheap)

## ------------------------------------------------------------------------
  decrease_key(fheap, from=-10, to=-11)
  peek(fheap)

## ------------------------------------------------------------------------
  decrease_key(fheap, from=c(-5, -4), to=c(-15, -15))
  peek(fheap)

## ------------------------------------------------------------------------
  handle(fheap, -15)

## ------------------------------------------------------------------------
  hand <- handle(fheap, -15)  
  decrease_key(fheap, -15, -20, hand[[1]]$handle)
  peek(fheap)

## ------------------------------------------------------------------------
  fheap <- insert(fheap, 10, "V-10")
  fheap <- insert(fheap, 10, "V-10")
  h <- handle(fheap, value="V-10")
  h
  decrease_key(fheap, 10, -100, h[[1]]$handle)
  peek(fheap)

## ------------------------------------------------------------------------
  library('purrr')
  bheap <- binomial_heap("character", "integer")
  bheap <- insert(bheap, letters[c(2:6, 5, 5)], c(2:6, 5L, 7L))
  bheap <- insert(bheap, "x", 1:3)
  bheap <- insert(bheap, "z", 1:3)
  peek(bheap)
  vector.keys <- handle(bheap, value = 1:3) %>%
    purrr::map_chr(.f = function(x) x$key)
  vector.keys
  decrease_key(bheap, from=vector.keys, to=c("a", "b"))
  peek(bheap)
  hand <- handle(bheap, key = "b")
  hand
  decrease_key(bheap, from="b", to="a", handle=hand[[2]]$handle)
  pop(bheap)
  pop(bheap)

## ------------------------------------------------------------------------
  hash  <- hashmap("character", "integer")
  bimap <- bimap("character", "integer")
  mm    <- multimap("character", "integer")

## ------------------------------------------------------------------------
  keys   <- paste0("V", 1:5)
  values <- 1:5
  hash   <- insert(hash, keys[1:4], values[1:4])
  bimap  <- insert(bimap, keys[1:4], values[1:4])
  mm     <- insert(mm, keys[1:4], values[1:4])
  hash[keys[5]]  <- values[5]
  bimap[keys[5]] <- values[5]
  mm[keys[5]]    <- values[5]
  mm[keys[5]]    <- values[1:5]

## ------------------------------------------------------------------------
  get(hash, keys[1])
  hash[keys[1]]

  get(bimap, keys[1], "values")
  get(bimap, values[2], "keys")
  get(bimap, keys[1])
  
  get(mm, keys[5])
  mm[keys[5]]

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

