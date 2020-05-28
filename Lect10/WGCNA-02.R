datExpr0 = as.data.frame(t(femData[, -c(1:8)]));
names(datExpr0) = femData$substanceBXH;
rownames(datExpr0) = names(femData)[-c(1:8)];
gsg = goodSamplesGenes(datExpr0, verbose = 3);
gsg$allOK

if (!gsg$allOK)
{
        # Optionally, print the gene and sample names that were removed:
        if (sum(!gsg$goodGenes)>0) 
                printFlush(paste("Removing genes:", paste(names(datExpr0)[!gsg$goodGenes], collapse = ", ")));
        if (sum(!gsg$goodSamples)>0) 
                printFlush(paste("Removing samples:", paste(rownames(datExpr0)[!gsg$goodSamples], collapse = ", ")));
        # Remove the offending genes and samples from the data:
        datExpr0 = datExpr0[gsg$goodSamples, gsg$goodGenes]
}

