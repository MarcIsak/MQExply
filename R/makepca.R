#'Performs Principal component analysis and multidimensional scaling of LFQ data
#'@param mqo input maxquant object
#'@param pcs input, principal components to plot, like pcs <- c(1,2) for PC1 and PC2
#'@param pcaSel input, selected method for the principal component analysis, like singular value decomposition ("svd")
#'@param nTopProts input, top n protein groups to be used for the MDS plot
#'@export makepca
makepca <- function(mqo,pcs,pcaSel,nTopProts){

  library("limma", lib.loc="C:/Users/marc/Dropbox (Human Neural Develop)/Marc/MISTR/R/win-library/3.5")
  library("pcaMethods", lib.loc="C:/Users/marc/Dropbox (Human Neural Develop)/Marc/MISTR/R/win-library/3.5")

  pcaProt <- pca(t(mqo@lfqFilter),method=pcaSel,nPcs=length(pcs))
  scores <- scores(pcaProt)

  varPC1 <- paste("(",toString(pcaProt@R2[1]*100)," %",")",sep="")
  varPC2 <- paste("(",toString(pcaProt@R2[2]*100)," %",")",sep="")
  labPC1 <- paste(colnames(scores)[1],varPC1,sep = " ")
  labPC2 <- paste(colnames(scores)[2],varPC2,sep = " ")

  par(mfrow=c(1,2))

  plot(scores,type="n",xlab=labPC1,ylab=labPC2)
  text(scores,labels=row.names(scores))

  mds <- plotMDS(mqo@lfqFilter,top=nTopProts,dim.plot = pcs,gene.selection="pairwise")

  mqo@pcaMds <- list(PCA = pcaProt, MDS = mds)
  mqo
}
