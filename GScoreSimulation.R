library(data.table)
library(sciplot)
remove(Scores)
GenesList<- read.table("~/Desktop/LynchLab/Sam_Muri/Ref_Genomes/E_coli/Simulation/EcoliProteinGenesforSim.txt", sep= "\t", header=TRUE)
Scores<-vector()
Scores<-NULL
for (i in 1:1000){
#Replace "5371 with number of Nonsynonymous Mutations  
  MySample<- GenesList[sample(1:nrow(GenesList),5371,replace=TRUE),]
#Replace "5371 with number of Nonsynonymous Mutations    
  MySample$Ei=MySample$Length*(5371/4131944)
  MySample=as.data.table(MySample)[, Number := length(unique(Genes)), by = Genes][]
  MySample$Number = 1
  GeneVectorSample = by(MySample$Number, MySample$Genes, sum)
  MySampletmp = as.data.frame(names(GeneVectorSample))
  colnames(MySampletmp)[1] = "name"
  MySampletmp$Count = GeneVectorSample
  MySampletm = merge(MySample, MySampletmp, by.x="Genes", by.y="name", sort=F)
  MySampletm$Gi=2*MySampletm$Count*log(MySampletm$Count/MySampletm$Ei)
  UniqueSamples<-unique(MySampletm[,1:6])
  GScore<-sum(UniqueSamples$Gi)
  Scores<-append(Scores,GScore)
}
mean(Scores)
sd(Scores)
