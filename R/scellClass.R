#'Class defintion of an scell object
#`
#`The class takes a matrix of values and needs row and column names.
setClass("scell",slots=c(mqresult="list",lfq="matrix",lfqFilter="matrix",pcaMds="list"))
