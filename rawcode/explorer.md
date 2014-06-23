Exploratary Analysis
=======================================================


```r
getwd()
```

```
## [1] "/Users/samantha/Documents/Personal/Samantha/GITSandbox/KaggleHiggsBosonID/rawcode"
```

```r
train <- read.csv('../data/training.csv',header=T)
head(train)
```

```
##   EventId DER_mass_MMC DER_mass_transverse_met_lep DER_mass_vis DER_pt_h
## 1  100000       138.47                       51.66        97.83   27.980
## 2  100001       160.94                       68.77       103.23   48.146
## 3  100002      -999.00                      162.17       125.95   35.635
## 4  100003       143.91                       81.42        80.94    0.414
## 5  100004       175.86                       16.91       134.81   16.405
## 6  100005        89.74                       13.55        59.15  116.344
##   DER_deltaeta_jet_jet DER_mass_jet_jet DER_prodeta_jet_jet
## 1                0.910            124.7               2.666
## 2             -999.000           -999.0            -999.000
## 3             -999.000           -999.0            -999.000
## 4             -999.000           -999.0            -999.000
## 5             -999.000           -999.0            -999.000
## 6                2.636            284.6              -0.540
##   DER_deltar_tau_lep DER_pt_tot DER_sum_pt DER_pt_ratio_lep_tau
## 1              3.064     41.928     197.76                1.582
## 2              3.473      2.078     125.16                0.879
## 3              3.148      9.336     197.81                3.776
## 4              3.310      0.414      75.97                2.354
## 5              3.891     16.405      57.98                1.056
## 6              1.362     61.619     278.88                0.588
##   DER_met_phi_centrality DER_lep_eta_centrality PRI_tau_pt PRI_tau_eta
## 1                  1.396                  0.200      32.64       1.017
## 2                  1.414               -999.000      42.01       2.039
## 3                  1.414               -999.000      32.15      -0.705
## 4                 -1.285               -999.000      22.65      -1.655
## 5                 -1.385               -999.000      28.21      -2.197
## 6                  0.479                  0.975      53.65       0.371
##   PRI_tau_phi PRI_lep_pt PRI_lep_eta PRI_lep_phi PRI_met PRI_met_phi
## 1       0.381      51.63       2.273      -2.414  16.824      -0.277
## 2      -3.011      36.92       0.501       0.103  44.704      -1.916
## 3      -2.093     121.41      -0.953       1.052  54.283      -2.186
## 4       0.010      53.32      -0.522      -3.100  31.082       0.060
## 5      -2.231      29.77       0.798       1.569   2.723      -0.871
## 6       1.329      31.57      -0.884       1.857  40.735       2.237
##   PRI_met_sumet PRI_jet_num PRI_jet_leading_pt PRI_jet_leading_eta
## 1        258.73           2              67.44               2.150
## 2        164.55           1              46.23               0.725
## 3        260.41           1              44.25               2.053
## 4         86.06           0            -999.00            -999.000
## 5         53.13           0            -999.00            -999.000
## 6        282.85           3              90.55              -2.412
##   PRI_jet_leading_phi PRI_jet_subleading_pt PRI_jet_subleading_eta
## 1               0.444                 46.06                  1.240
## 2               1.158               -999.00               -999.000
## 3              -2.028               -999.00               -999.000
## 4            -999.000               -999.00               -999.000
## 5            -999.000               -999.00               -999.000
## 6              -0.653                 56.16                  0.224
##   PRI_jet_subleading_phi PRI_jet_all_pt   Weight Label
## 1                 -2.475         113.50 0.002653     s
## 2               -999.000          46.23 2.233584     b
## 3               -999.000          44.25 2.347389     b
## 4               -999.000           0.00 5.446378     b
## 5               -999.000           0.00 6.245333     b
## 6                  3.106         193.66 0.083414     b
```

```r
str(train)
```

```
## 'data.frame':	250000 obs. of  33 variables:
##  $ EventId                    : int  100000 100001 100002 100003 100004 100005 100006 100007 100008 100009 ...
##  $ DER_mass_MMC               : num  138 161 -999 144 176 ...
##  $ DER_mass_transverse_met_lep: num  51.7 68.8 162.2 81.4 16.9 ...
##  $ DER_mass_vis               : num  97.8 103.2 126 80.9 134.8 ...
##  $ DER_pt_h                   : num  27.98 48.146 35.635 0.414 16.405 ...
##  $ DER_deltaeta_jet_jet       : num  0.91 -999 -999 -999 -999 ...
##  $ DER_mass_jet_jet           : num  125 -999 -999 -999 -999 ...
##  $ DER_prodeta_jet_jet        : num  2.67 -999 -999 -999 -999 ...
##  $ DER_deltar_tau_lep         : num  3.06 3.47 3.15 3.31 3.89 ...
##  $ DER_pt_tot                 : num  41.928 2.078 9.336 0.414 16.405 ...
##  $ DER_sum_pt                 : num  198 125 198 76 58 ...
##  $ DER_pt_ratio_lep_tau       : num  1.582 0.879 3.776 2.354 1.056 ...
##  $ DER_met_phi_centrality     : num  1.4 1.41 1.41 -1.28 -1.39 ...
##  $ DER_lep_eta_centrality     : num  0.2 -999 -999 -999 -999 0.975 0.791 -999 -999 -999 ...
##  $ PRI_tau_pt                 : num  32.6 42 32.2 22.6 28.2 ...
##  $ PRI_tau_eta                : num  1.017 2.039 -0.705 -1.655 -2.197 ...
##  $ PRI_tau_phi                : num  0.381 -3.011 -2.093 0.01 -2.231 ...
##  $ PRI_lep_pt                 : num  51.6 36.9 121.4 53.3 29.8 ...
##  $ PRI_lep_eta                : num  2.273 0.501 -0.953 -0.522 0.798 ...
##  $ PRI_lep_phi                : num  -2.414 0.103 1.052 -3.1 1.569 ...
##  $ PRI_met                    : num  16.82 44.7 54.28 31.08 2.72 ...
##  $ PRI_met_phi                : num  -0.277 -1.916 -2.186 0.06 -0.871 ...
##  $ PRI_met_sumet              : num  258.7 164.5 260.4 86.1 53.1 ...
##  $ PRI_jet_num                : int  2 1 1 0 0 3 2 1 0 1 ...
##  $ PRI_jet_leading_pt         : num  67.4 46.2 44.3 -999 -999 ...
##  $ PRI_jet_leading_eta        : num  2.15 0.725 2.053 -999 -999 ...
##  $ PRI_jet_leading_phi        : num  0.444 1.158 -2.028 -999 -999 ...
##  $ PRI_jet_subleading_pt      : num  46.1 -999 -999 -999 -999 ...
##  $ PRI_jet_subleading_eta     : num  1.24 -999 -999 -999 -999 0.224 0.131 -999 -999 -999 ...
##  $ PRI_jet_subleading_phi     : num  -2.48 -999 -999 -999 -999 ...
##  $ PRI_jet_all_pt             : num  113.5 46.2 44.3 0 0 ...
##  $ Weight                     : num  0.00265 2.23358 2.34739 5.44638 6.24533 ...
##  $ Label                      : Factor w/ 2 levels "b","s": 2 1 1 1 1 1 2 2 1 2 ...
```

You can also embed plots, for example:


```r
#plot(cars)
```

