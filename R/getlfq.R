#'Extract LFQ intensity matrix from proteinGroups and put in slot LFQ
#'@param mqo input maxquant object
#'@export getlfq
getlfq <- function(mqo){

  mqList <- mqo@mqresult[["proteinGroups"]]
  lfq <- log2(as.matrix(mqList[,grep("LFQ.intensity",colnames(mqList))]))
  lfq[lfq==-Inf] <- NA
  rownames(lfq) <- mqList[,"Protein.IDs"]
  lfq <- lfq[!grepl("REV_",rownames(lfq)),]
  colnames(lfq) <- substring(colnames(lfq),regexpr("_",colnames(lfq))+1)
  mqo@lfq <- lfq
  mqo
}
df


