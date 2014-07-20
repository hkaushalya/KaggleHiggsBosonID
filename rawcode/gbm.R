train$response <- ifelse(train$Label == "s", 1, 0)

f <- response ~ DER_mass_MMC + DER_mass_transverse_met_lep + DER_mass_vis + 
  DER_pt_h + DER_deltaeta_jet_jet + DER_mass_jet_jet + DER_prodeta_jet_jet +
  DER_deltar_tau_lep + DER_pt_tot + DER_sum_pt + DER_pt_ratio_lep_tau +       
  DER_met_phi_centrality + DER_lep_eta_centrality + PRI_tau_pt + PRI_tau_eta +
  PRI_tau_phi + PRI_lep_pt + PRI_lep_eta + PRI_lep_phi + PRI_met + 
  PRI_met_phi + PRI_met_sumet + PRI_jet_num + PRI_jet_leading_pt + 
  PRI_jet_leading_eta + PRI_jet_leading_phi + PRI_jet_subleading_pt + 
  PRI_jet_subleading_eta + PRI_jet_subleading_phi + PRI_jet_all_pt  

scale_pos_wts <- with(train, sum(Weight[response == 0]/
                                   sum(Weight[response == 1])))
train$scaled_wt <- train$Weight * 
  ifelse(train$response == 1, scale_pos_wts, 1) * nrow(test)/nrow(train)

set.seed(2015)
m <- gbm(f, data = train, distribution = "bernoulli", interaction.depth = 6,
         weights =scaled_wt, shrinkage = 0.07, n.trees = 800, verbose = TRUE, 
         n.cores = 3, train.fraction = 1, bag.fraction = 0.5, 
         n.minobsinnode = 10)