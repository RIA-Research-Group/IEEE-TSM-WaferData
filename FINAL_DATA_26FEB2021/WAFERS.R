###############################################################################
##########********* CODE TO VISUALIZE ALL WAFER MAPS  ###########**************
###############################################################################

## Wafer maps are downloaded from the full dataset available at Prof. Roger Jang's public repository: 
## http://mirlab.org/dataSet/public/ 
## and described in detail in: Wu et al., "Wafer map failure pattern recognition and similarity ranking for large-scale data sets," 
## IEEE Transactions on Semiconductor Manufacturing, vol. 28, no. 1, pp. 1-12, 2014. 
 
## The code below is written by Ahmed Aziz Ezzat (aziz.ezzat@rutgers.edu) -- Last edited in FEB 2021
## Used in the following paper: Ezzat et al., "A Graph-Theoretic Approach for Spatial Filtering
## and Its Impact on Mixed-type Spatial Pattern Recognition in Wafer Bin Maps,"
## IEEE Transactions on Semiconductor Manufacturing, To appear, 2021.  

## Setting working directory and importing libraries
library(fields)
library(igraph)

colleg = c('white','green','red','blue','black','orange','purple','magenta')

for(jj in 1:12){
#jj = 1
rawdata <- read.table(paste('WBM',jj,'.txt',sep=""),header=F)

WBM_observed = matrix(-1,nrow=dim(rawdata)[1],ncol=dim(rawdata)[2])
for(j in 1:dim(rawdata)[2]){
  WBM_observed[,j] = rev(as.numeric(as.vector(rawdata[,j])))
}
WBM_observed = t(WBM_observed)
bb = seq(-0.5,max(WBM_observed)+0.5,1)

par(mar=c(1,1,1,1))
image(seq(1,dim(rawdata)[2],1),seq(1,dim(rawdata)[1],1),WBM_observed,breaks = bb,
      col=colleg[1:(length(bb)-1)],axes=F,xlab="",ylab="",cex.lab=1.25,cex.axis=1.25)

}


