#'Removes protein groups with a certain number of missing values
#'@param mqo input maxquant object
#'@param maxTotNA input, maximum number of missing values in each lfq row
#'@export filterlfq
filterlfq <- function(mqo,maxTotNA){

  naSum <- rowSums(is.na(mqo@lfq))
  mqo@lfqFilter <- mqo@lfq[naSum<=maxTotNA,]
  print("hello")
  mqo
}
