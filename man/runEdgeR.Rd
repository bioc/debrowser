% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprogs.R
\name{runEdgeR}
\alias{runEdgeR}
\title{runEdgeR}
\usage{
runEdgeR(
  data = NULL,
  metadata = NULL,
  columns = NULL,
  conds = NULL,
  params = NULL
)
}
\arguments{
\item{data, }{A matrix that includes all the expression raw counts,
rownames has to be the gene, isoform or region names/IDs}

\item{metadata, }{metadata of the matrix of expression raw counts}

\item{columns, }{is a vector that includes the columns that are going
to be analyzed. These columns has to match with the given data.}

\item{conds, }{experimental conditions. The order has to match
with the column order}

\item{params, }{normfact: Calculate normalization factors to scale the raw 
    library sizes. Values can be "TMM","RLE","upperquartile","none".
dispersion: either a numeric vector of dispersions or a character 
    string indicating that dispersions should be taken from the data 
    object. If a numeric vector, then can be either of length one or 
    of length equal to the number of genes. Allowable character 
    values are "common", "trended", "tagwise" or "auto". 
    Default behavior ("auto" is to use most complex dispersions 
    found in data object.
testType: exactTest or glmLRT. exactTest: Computes p-values for differential 
    abundance for each gene between two digital libraries, conditioning 
    on the total count for each gene. The counts in each group as a 
    proportion of the whole are assumed to follow a binomial distribution. 
    glmLRT: Fit a negative binomial generalized log-linear model to the read 
    counts for each gene. Conduct genewise statistical tests for a given 
    coefficient or coefficient contrast.}
}
\value{
edgeR results
}
\description{
Run EdgeR algorithm on the selected conditions.  Output is
to be used for the interactive display.
}
\examples{
    x <- runEdgeR()

}
