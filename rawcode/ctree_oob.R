rm(list=ls())
getwd()
df <- read.csv('data/training.csv', header=T)
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

ct <- ctree(Label ~ DER_mass_MMC+DER_mass_vis+Weight, data = df)
#ct <- ctree(Label ~ df$der.vars, data = df)
plot(ct)


form.der <- formula(paste0(target, " ~ ", sb.weight,'+', paste(der.vars, collapse="+")))  #target (Signal?Background?)
form2.der    <- formula(paste0(target, " ~ ", sb.weight, 
                "+DER_mass_MMC+DER_deltaeta_jet_jet+DER_deltar_tau_lep+DER_sum_pt"))

#### NOT very useful
df$Label <- as.numeric(df$Label)  # lm cannot do factors
lm.model <- lm(formula=form.der,data=df)
summary(lm.model)
#DER_mass_vis only least significant variable when Weigh is used as a feature.

lm.model2 <- lm(formula=form2.der,data=df)
summary(lm.model2)

#### END lm model test