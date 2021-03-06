% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makepca.R
\name{makepca}
\alias{makepca}
\title{Performs Principal component analysis and multidimensional scaling of LFQ data}
\usage{
makepca(mqo, pcs, pcaSel, nTopProts)
}
\arguments{
\item{mqo}{input maxquant object}

\item{pcs}{input, principal components to plot, like pcs <- c(1,2) for PC1 and PC2}

\item{pcaSel}{input, selected method for the principal component analysis, like singular value decomposition ("svd")}

\item{nTopProts}{input, top n protein groups to be used for the MDS plot}
}
\description{
Performs Principal component analysis and multidimensional scaling of LFQ data
}
