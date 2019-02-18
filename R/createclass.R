#'Read delimited text file into sclass-object
#'@param pathStr input path to MaxQuant results as string
#'@param fileStr input filename of MaxQuant results as string
#'@export createclass
createclass <- function(pathStr,fileStr){

  fileNames <- paste(pathStr,fileStr,sep="")
  mqList <- vector("list",length(fileNames))

  for (i in 1:length(fileNames)) {

    inData <- read.delim(fileNames[i],header=T,sep="\t")
    mqList[[i]] <- inData

  }

  names(mqList) <- sapply(strsplit(fileStr, ".txt"), "[", 1)

  outData <- new("scell",mqresult=mqList)
  outData
}
