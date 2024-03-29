% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/condSelect.R
\name{prepDataContainer}
\alias{prepDataContainer}
\title{prepDataContainer}
\usage{
prepDataContainer(data = NULL, counter = NULL, input = NULL, meta = NULL)
}
\arguments{
\item{data, }{loaded dataset}

\item{counter, }{the number of comparisons}

\item{input, }{input parameters}

\item{meta, }{loaded metadata}
}
\value{
data
}
\description{
Prepares the data container that stores values used within DESeq.
}
\examples{
    x <- prepDataContainer()

}
