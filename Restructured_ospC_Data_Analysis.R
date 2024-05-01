setwd("C:/Users/14085/Desktop/Swei Lab/Bacterial Load")

ospC<-read.csv("Restructured_ospc.csv")

#Compare average bacterial load depending on genotype, human invasive status, site, year, county
#ANOVA?

############################################################################################################################################################################################################################################################
#One-way ANOVA Analyses

#Genotype
genotype_aov<-aov(BB_LOAD~GENOTYPE, data=ospC)
summary(genotype_aov)

#Df   Sum Sq Mean Sq F value Pr(>F)
#GENOTYPE      4  1468929  367232   1.003  0.408
#Residuals   172 62983024  366180               


#Human Invasive Status
human_inv_aov<-aov(BB_LOAD~HUMAN, data=ospC)
summary(human_inv_aov)

#Df   Sum Sq Mean Sq F value Pr(>F)  
#HUMAN         1  1209608 1209608   3.347  0.069 .
#Residuals   175 63242344  361385                 

#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


#Site
site_aov<-aov(BB_LOAD~SITE,data=ospC)
summary(site_aov)

#Df   Sum Sq Mean Sq F value Pr(>F)
#SITE          5   881327  176265   0.474  0.795
#Residuals   171 63570626  371758


#Year
year_aov<-aov(BB_LOAD~YEAR, data=ospC)
summary(year_aov)

#Df   Sum Sq Mean Sq F value Pr(>F)
#YEAR          1    14377   14377   0.039  0.844
#Residuals   175 64437576  368215 


#County
county_aov<-aov(BB_LOAD~COUNTY,data=ospC)
summary(county_aov)

#Df   Sum Sq Mean Sq F value Pr(>F)
#COUNTY        2    85407   42703   0.115  0.891
#Residuals   174 64366546  369923 

#############################################################################################################################################################################################################################################################
#Boxplot Visualization

genotype_boxplot<-ggplot(data=ospC, aes(x=GENOTYPE,y=BB_LOAD,fill=GENOTYPE))+labs(x="ospC Genotype",y="Bacterial Load", title="Bacterial Load Based on ospC Genotype")+geom_boxplot()+theme_classic()
genotype_boxplot

genotype_boxplot2<-ggplot(data=ospC, aes(x=GENOTYPE,y=BB_LOAD,fill=GENOTYPE))+facet_wrap(~SITE)+labs(x="ospC Genotype",y="Bacterial Load", title="Bacterial Load Based on ospC Genotype")+geom_boxplot()+theme_classic()
genotype_boxplot2

human_boxplot<-ggplot(data=ospC, aes(x=HUMAN,y=BB_LOAD,fill=GENOTYPE))+labs(x="Human Invasive Status",y="Bacterial Load", title="Bacterial Load Based on Human Invasive Status")+geom_boxplot()+theme_classic()
human_boxplot

human_boxplot2<-ggplot(data=ospC, aes(x=HUMAN,y=BB_LOAD,fill=HUMAN))+labs(x="Human Invasive Status",y="Bacterial Load", title="Bacterial Load Based on Human Invasive Status")+geom_boxplot()+theme_classic()
human_boxplot2

human_boxplot3<-ggplot(data=ospC, aes(x=HUMAN,y=BB_LOAD,fill=HUMAN))+facet_wrap(~SITE)+labs(x="Human Invasive Status",y="Bacterial Load", title="Bacterial Load Based on Human Invasive Status")+geom_boxplot()+theme_classic()
human_boxplot3

site_boxplot<-ggplot(data=ospC, aes(x=SITE,y=BB_LOAD,fill=SITE))+labs(x="Site",y="Bacterial Load", title="Bacterial Load at Each Site")+geom_boxplot()+theme_classic()
site_boxplot

site_boxplot2<-ggplot(data=ospC, aes(x=SITE,y=BB_LOAD,fill=SITE))+facet_wrap(~YEAR)+labs(x="Site",y="Bacterial Load", title="Bacterial Load at Each Site")+geom_boxplot()+theme_classic()
site_boxplot2

year_boxplot<-ggplot(data=ospC, aes(x=YEAR,y=BB_LOAD,fill=YEAR))+labs(x="Site",y="Bacterial Load", title="Bacterial Load Each Year")+geom_boxplot()+theme_classic()
year_boxplot
#Looks weird

county_boxplot<-ggplot(data=ospC, aes(x=COUNTY, y=BB_LOAD,fill=COUNTY))+labs(x="Site",y="Bacterial Load", title="Bacterial Load by County")+geom_boxplot()+theme_classic()
county_boxplot

#############################################################################################################################################################################################################################################################

############################################################################################################################################################################################################################################################
#2-way ANOVA

#Genotype + Human
geno_human<-aov(BB_LOAD~GENOTYPE + HUMAN + GENOTYPE*HUMAN,data=ospC)
summary (geno_human)
#Df   Sum Sq Mean Sq F value Pr(>F)
#GENOTYPE      4  1468894  367224   1.003  0.408
#Residuals   172 62982389  366177 


#Genotype + Site
geno_site<-aov(BB_LOAD~GENOTYPE + SITE + GENOTYPE*SITE,data=ospC)
summary (geno_site)
#Df   Sum Sq Mean Sq F value  Pr(>F)    
#GENOTYPE        4  1468894  367224   1.058 0.37900    
#SITE            5  1318759  263752   0.760 0.57986    
#GENOTYPE:SITE   1  4057642 4057642  11.693 0.00079 ***
#  Residuals     166 57605988  347024                    

#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1                


#Genotype + Year
geno_year<-aov(BB_LOAD~GENOTYPE + YEAR + GENOTYPE*YEAR,data=ospC)
summary (geno_year)
#Df   Sum Sq Mean Sq F value Pr(>F)
#GENOTYPE        4  1468894  367224   0.994  0.413
#YEAR            1    31148   31148   0.084  0.772
#GENOTYPE:YEAR   3   866078  288693   0.781  0.506
#Residuals     168 62085163  369555  


#Genotype + County
geno_county<-aov(BB_LOAD~GENOTYPE + COUNTY + GENOTYPE*COUNTY,data=ospC)
summary (geno_county)
#Df   Sum Sq Mean Sq F value  Pr(>F)   
#GENOTYPE          4  1468894  367224   1.052 0.38197   
#COUNTY            2   711327  355664   1.019 0.36314   
#GENOTYPE:COUNTY   2  3640146 1820073   5.215 0.00635 **
#  Residuals       168 58630916  348994                   
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 


#Human + Site
human_site<-aov(BB_LOAD~HUMAN + SITE + HUMAN*SITE,data=ospC)
summary(human_site)
#Df   Sum Sq Mean Sq F value   Pr(>F)    
#HUMAN         1  1209525 1209525   3.515 0.062534 .  
#SITE          5   772590  154518   0.449 0.813542    
#HUMAN:SITE    1  4318837 4318837  12.552 0.000512 ***
#  Residuals   169 58150332  344085                     
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Human + Year
human_year<-aov(BB_LOAD~HUMAN + YEAR + HUMAN*YEAR,data=ospC)
summary(human_year)
#Df   Sum Sq Mean Sq F value Pr(>F)  
#HUMAN         1  1209525 1209525   3.316 0.0704 .
#YEAR          1    97009   97009   0.266 0.6067  
#HUMAN:YEAR    1    34769   34769   0.095 0.7579  
#Residuals   173 63109981  364798 


#Human + County
human_county<-aov(BB_LOAD~HUMAN + COUNTY + HUMAN*COUNTY,data=ospC)
summary(human_county)
#Df   Sum Sq Mean Sq F value  Pr(>F)   
#HUMAN          1  1209525 1209525   3.489 0.06350 . 
#COUNTY         2   342637  171318   0.494 0.61096   
#HUMAN:COUNTY   2  3613616 1806808   5.211 0.00635 **
#  Residuals    171 59285506  346699   


#Site + Year
site_year<-aov(BB_LOAD~SITE + YEAR + SITE*YEAR,data = ospC)
summary(site_year)
#Df   Sum Sq Mean Sq F value   Pr(>F)    
#SITE          5   881341  176268   0.553  0.73594    
#YEAR          1  3270000 3270000  10.257  0.00163 ** 
#  SITE:YEAR     2  6741195 3370597  10.573 4.73e-05 ***
#  Residuals   168 53558747  318802    


#Site + County
site_county<-aov(BB_LOAD~SITE + COUNTY + SITE*COUNTY,data = ospC)
summary(site_county)
#Df   Sum Sq Mean Sq F value Pr(>F)
#SITE          5   881341  176268   0.474  0.795
#Residuals   171 63569942  371754 


#Year + County
year_county<-aov(BB_LOAD~YEAR + COUNTY + YEAR*COUNTY,data = ospC)
summary(year_county)
#Df   Sum Sq Mean Sq F value   Pr(>F)    
#YEAR          1    14360   14360   0.044    0.834    
#COUNTY        2    73761   36881   0.112    0.894    
#YEAR:COUNTY   2  8295280 4147640  12.650 7.53e-06 ***
#  Residuals   171 56067882  327882  

#############################################################################################################################################################################################################################################################
#ANOVAS with errors

model1<-aov(BB_LOAD~GENOTYPE+Error(TICK_ID),data=ospC)
summary(model1)

#Error: TICK_ID
#Df   Sum Sq Mean Sq F value Pr(>F)
#GENOTYPE   4  1468894  367224   0.318  0.865
#Residuals 54 62304095 1153780               

#Error: Within
#Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 118 678294    5748 

model2<-aov(BB_LOAD~HUMAN+Error(TICK_ID),data=ospC)
summary(model2)
#Error: TICK_ID
#Df   Sum Sq Mean Sq F value Pr(>F)
#HUMAN      1  1209525 1209525   1.102  0.298
#Residuals 57 62563465 1097605               

#Error: Within
#Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 118 678294    5748

model3<-aov(BB_LOAD~SITE+Error(TICK_ID),data=ospC)
summary(model3)
#Error: TICK_ID
#Df   Sum Sq Mean Sq F value Pr(>F)
#SITE       5   881341  176268   0.149   0.98
#Residuals 53 62891648 1186635               

#Error: Within
#Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 118 678294    5748  

model4<-aov(BB_LOAD~YEAR+Error(TICK_ID),data=ospC)
summary(model4)
#Error: TICK_ID
#Df   Sum Sq Mean Sq F value Pr(>F)
#YEAR       1    14360   14360   0.013   0.91
#Residuals 57 63758629 1118572               

#Error: Within
#Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 118 678294    5748 

model5<-aov(BB_LOAD~COUNTY+Error(TICK_ID),data=ospC)
summary(model5)
#Error: TICK_ID
#Df   Sum Sq Mean Sq F value Pr(>F)
#COUNTY     2    85419   42709   0.038  0.963
#Residuals 56 63687571 1137278               

#Error: Within
#Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 118 678294    5748 

#############################################################################################################################################################################################################################################################

#GLMM Analysis
#GLMM Site and Year and tick ID as random effects

library(glmmTMB)
hist(ospC$BB_LOAD) #negative binomial distribution, try other data families and compare AIC scores
#poisson, gamma

#Genotype
geno_glmm<-glmmTMB(BB_LOAD~GENOTYPE, family=nbinom2, data= ospC)
summary(geno_glmm)

#Family: nbinom2  ( log )
#Formula:          BB_LOAD ~ GENOTYPE
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2368.4   2387.5  -1178.2   2356.4      171 


#Dispersion parameter for nbinom2 family (): 0.576 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)   6.2120     0.2198  28.267   <2e-16 ***
#  GENOTYPEDb   -0.5117     0.2908  -1.760   0.0784 .  
#GENOTYPEE3   -0.7811     0.3109  -2.512   0.0120 *  
#  GENOTYPEFa   -0.2860     0.4396  -0.651   0.5154    
#GENOTYPEHb   -0.4512     0.2949  -1.530   0.1260    

geno_gamma_glmm<-glmmTMB(BB_LOAD~GENOTYPE, family=Gamma(), data= ospC)
summary(geno_gamma_glmm)

#Family: Gamma  ( inverse )
#Formula:          BB_LOAD ~ GENOTYPE
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2366.9   2385.9  -1177.4   2354.9      171 


#Dispersion estimate for Gamma family (sigma^2): 1.74 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept) 0.0020052  0.0003819   5.250 1.52e-07 ***
#  GENOTYPEDb  0.0013397  0.0007174   1.867   0.0619 .  
#GENOTYPEE3  0.0023738  0.0010116   2.347   0.0189 *  
#  GENOTYPEFa  0.0006638  0.0010162   0.653   0.5136    
#GENOTYPEHb  0.0011434  0.0007001   1.633   0.1024


#Human
human_glmm<-glmmTMB(BB_LOAD~HUMAN, family=nbinom2, data= ospC)
summary(human_glmm)
#Family: nbinom2  ( log )
#Formula:          BB_LOAD ~ HUMAN
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2364.2   2373.8  -1179.1   2358.2      174 


#Dispersion parameter for nbinom2 family (): 0.572 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)   5.6813     0.1115   50.96   <2e-16 ***
#  HUMANY        0.5307     0.2471    2.15   0.0318 * 

human_gamma_glmm<-glmmTMB(BB_LOAD~HUMAN, family=Gamma(), data= ospC)
summary(human_gamma_glmm)
#Family: Gamma  ( inverse )
#Formula:          BB_LOAD ~ HUMAN
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2362.7   2372.2  -1178.3   2356.7      174 

#Dispersion estimate for Gamma family (sigma^2): 1.75 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)  0.0034092  0.0003632   9.387  < 2e-16 ***
#  HUMANY      -0.0014039  0.0005280  -2.659  0.00784 ** 


#Site
site_glmm<-glmmTMB(BB_LOAD~SITE, family=nbinom2, data= ospC)
summary(site_glmm)
#Family: nbinom2  ( log )
#Formula:          BB_LOAD ~ SITE
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2372.9   2395.2  -1179.5   2358.9      170 


#Dispersion parameter for nbinom2 family (): 0.57 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)   4.5072     0.7671   5.876  4.2e-09 ***
#  SITECCSP      1.3291     0.7770   1.710   0.0872 .  
#SITEJLSP      1.2157     0.8400   1.447   0.1478    
#SITEMMWD      1.1406     1.0836   1.053   0.2925    
#SITESLRP      1.9787     0.9386   2.108   0.0350 *  
#  SITEWH        1.1799     0.7982   1.478   0.1394 

site_gamma_glmm<-glmmTMB(BB_LOAD~SITE, family=Gamma(), data= ospC)
summary(site_gamma_glmm)
#Family: Gamma  ( inverse )
#Formula:          BB_LOAD ~ SITE
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2371.4   2393.6  -1178.7   2357.4      170 


#Dispersion estimate for Gamma family (sigma^2): 1.76 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)
#(Intercept)  0.011029   0.008402   1.313    0.189
#SITECCSP    -0.008110   0.008408  -0.965    0.335
#SITEJLSP    -0.007759   0.008469  -0.916    0.360
#SITEMMWD    -0.007504   0.008790  -0.854    0.393
#SITESLRP    -0.009505   0.008425  -1.128    0.259
#SITEWH      -0.007640   0.008432  -0.906    0.365


#County
county_glmm<-glmmTMB(BB_LOAD~COUNTY, family=nbinom2, data= ospC)
summary(county_glmm)
#Family: nbinom2  ( log )
#Formula:          BB_LOAD ~ COUNTY
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2370.8   2383.5  -1181.4   2362.8      173 


#Dispersion parameter for nbinom2 family (): 0.561 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)      5.83188    0.12350   47.22   <2e-16 ***
#  COUNTYSan Mateo -0.14481    0.25463   -0.57     0.57    
#COUNTYSonoma     0.07189    0.29933    0.24     0.81 

county_gamma_glmm<-glmmTMB(BB_LOAD~COUNTY, family=Gamma(), data= ospC)
summary(county_gamma_glmm)
#Family: Gamma  ( inverse )
#Formula:          BB_LOAD ~ COUNTY
#Data: ospC

#AIC      BIC   logLik deviance df.resid 
#2369.3   2382.0  -1180.6   2361.3      173 


#Dispersion estimate for Gamma family (sigma^2): 1.78 

#Conditional model:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)      0.0029326  0.0003403   8.618   <2e-16 ***
#  COUNTYSan Mateo  0.0004570  0.0007969   0.573    0.566    
#COUNTYSonoma    -0.0002034  0.0007711  -0.264    0.792 


#Year
year_glmm<-glmmTMB(BB_LOAD~YEAR, family=nbinom2, data= ospC)
summary(year_glmm)
#No sig

year_gamma_glmm<-glmmTMB(BB_LOAD~YEAR, family=Gamma(), data= ospC)
summary(year_gamma_glmm)
#No sig


#############################################################################################################################################################################################################################################################
model1<-glmmTMB(BB_LOAD~GENOTYPE+(1|SITE)+(1|TICK_ID), family=nbinom2, data=ospC)

install.packages("MuMIn")
library(MuMIn)
options(na.action="na.fail")
DREDGEdotap<-dredge(model1,rank=AICc,trace=2)