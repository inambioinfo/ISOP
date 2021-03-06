% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotHistModels.R
\name{plotHistModels}
\alias{plotHistModels}
\title{Plot the model of an isoform pair}
\usage{
plotHistModels(deltaVal, dmix, plot.title = NULL, cex.main.size = NULL,
  fit.line = FALSE, group.color = c("darkgreen", "darkorange",
  "darkmagenta", "darkorchid"), lwd = 1)
}
\arguments{
\item{deltaVal}{A vector of difference between two isoforms of the isoform pair}

\item{dmix}{A mixture model from doGaussianMixtureModel function}

\item{plot.title}{Title of the plot}

\item{cex.main.size}{Font size of the plot}

\item{fit.line}{An option for plotting the fitting line of distribution}

\item{group.color}{A vector of colors for the cell groups}

\item{lwd}{The thickness of lines}
}
\value{
None
}
\description{
Plot the model of an isoform pair
}
\examples{
data(isoformDataSample)
#preprocessing
isoformDataSample=ifelse(isoformDataSample <= 3,0,isoformDataSample)
isoformDataSample=isoformDataSample[which(rowSums(isoformDataSample)>0),]
#tranform read count dataset to log scale
isoformDataSample=ifelse(isoformDataSample==0,0,log2(isoformDataSample))
#now data is ready
tbreak=round(sqrt(ncol(isoformDataSample)))
x0=isoformDataSample[1,]
x1=isoformDataSample[2,]
model.res=doMixtureModelIsoformPair(x0,x1,tbreak=tbreak)
dmix=model.res$dmix.list[[model.res$AIC.min.Id]];
deltaVal=x0-x1
plotHistModels(deltaVal=deltaVal,dmix=dmix)
}
