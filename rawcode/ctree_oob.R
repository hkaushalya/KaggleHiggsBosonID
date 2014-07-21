rm(list=ls())
getwd()
df <- read.csv('data/training.csv')
str(df)
col.names <- names(df)
der.vars <- col.names[grep('DER_', col.names)]
pri.vars <- col.names[grep('PRI_', col.names)]
target <- 'Label'
sb.weight <- 'Weight'
hist(df$DER_mass_MMC)
hist(df$DER_mass_vis)
#boxplot(df[,pri.vars])
#plot(df[,pri.vars])
library(party)
df.prim.only <- df.prim.only[is.na]
df.prim.only <- data.frame(cbind(df[,pri.vars], df$Label))

ct <- ctree(df.prim.only$df.Label ~ ., data = df.prim.only)
plot(ct)
