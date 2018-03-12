# datastructures: Implementation of core datastructures for R.
#
# Copyright (C) Simon Dirmeier
#
# This file is part of datastructures.
#
# datastructures is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# datastructures is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with datastructures. If not, see <http://www.gnu.org/licenses/>.


#' @include ds_map_unordered.R


#' @title Multimap class
#'
#' @exportClass multimap
#' @name multimap-class
#' @rdname multimap-class
#'
#' @description Implementation of a multimap data structure, i.e. an unordered
#' collection of key-value pairs:
#' \deqn{f: keys -> values.}
#' Multimaps are able to store several identical keys. For a data structure
#' which unique keys, see \code{\link{hashmap}}.
#' Inserting and accessing is amortized in \emph{O(1)}.
#' \code{hashmap} wraps a C++ \code{unordered_multimap} using Rcpp modules.
#' Also see \code{\linkS4class{bimap}} for mappings in both ways.
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("multimap", contains = "unordered_map")


#' @title Create a new \code{multimap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{multimap}} object,
#'  i.e. an unordered collection of key-value pairs with mapping
#'  \deqn{f: keys -> values}, where multiple identical key-value paors
#'  can be stored.
#'
#' @param key.class  the primitive class type of the keys
#' @param value.class  the primitive class type of the values
#'
#' @return returns a new \code{multimap} object
#'
multimap <- function(
    key.class = c("character", "numeric", "integer"),
    value.class = c("character", "numeric", "integer"))
{
  key.class   <- match.arg(key.class)
  value.class <- match.arg(value.class)

  if (key.class == "character")
  {
    if (value.class == "character")    map <- methods::new(multimap_ss)
    else if (value.class == "integer") map <- methods::new(multimap_si)
    else                               map <- methods::new(multimap_sd)
  }
  else if (key.class == "numeric")
  {
    if (value.class == "character")    map <- methods::new(multimap_ds)
    else if (value.class == "integer") map <- methods::new(multimap_di)
    else                               map <- methods::new(multimap_dd)
  }
  else
  {
    if (value.class == "character")    map <- methods::new(multimap_is)
    else if (value.class == "integer") map <- methods::new(multimap_ii)
    else                               map <- methods::new(multimap_id)
  }

  methods::new("multimap",
               .key.class=key.class,
               .value.class=value.class,
               .map=map)
}