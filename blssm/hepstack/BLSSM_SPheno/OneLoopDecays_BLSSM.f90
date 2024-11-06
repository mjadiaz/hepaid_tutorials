! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:12 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecays_BLSSM 
Use Couplings_BLSSM 
Use CouplingsCT_BLSSM 
Use Model_Data_BLSSM 
Use LoopCouplings_BLSSM 
Use LoopMasses_BLSSM 
Use RGEs_BLSSM 
Use Tadpoles_BLSSM 
Use Kinematics 
Use CouplingsForDecays_BLSSM 
 
Use Wrapper_OneLoopDecay_Sd_BLSSM 
Use Wrapper_OneLoopDecay_Su_BLSSM 
Use Wrapper_OneLoopDecay_Se_BLSSM 
Use Wrapper_OneLoopDecay_SvRe_BLSSM 
Use Wrapper_OneLoopDecay_SvIm_BLSSM 
Use Wrapper_OneLoopDecay_hh_BLSSM 
Use Wrapper_OneLoopDecay_Ah_BLSSM 
Use Wrapper_OneLoopDecay_Hpm_BLSSM 
Use Wrapper_OneLoopDecay_Glu_BLSSM 
Use Wrapper_OneLoopDecay_Cha_BLSSM 
Use Wrapper_OneLoopDecay_Chi_BLSSM 
Use Wrapper_OneLoopDecay_Fu_BLSSM 
Use Wrapper_OneLoopDecay_Fv_BLSSM 

 
Contains 
 
Subroutine getZCouplings(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,ZP,Mu,Yd,Td,             & 
& ZD,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,Tv,ZVI,ZVR,g3,TW,TWp,UM,UP,ZN,ZDL,ZDR,               & 
& ZEL,ZER,ZUL,ZUR,UV,pG,cplAhAhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplAhAhAhAh,      & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,     & 
& cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhHpmcHpm,cplAhhhSvImSvIm,cplAhhhSvImSvRe,        & 
& cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,          & 
& cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,               & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,     & 
& cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,  & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,       & 
& cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,            & 
& cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,     & 
& cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,          & 
& cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,   & 
& cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSeSvImcVWm,               & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,     & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZVZp,          & 
& cplAhAhVZpVZp,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,cplAhHpmcVWmVZp,cplAhcHpmVPVWm,            & 
& cplAhcHpmVWmVZ,cplAhcHpmVWmVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWmVWm,    & 
& cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhHpmcVWmVZp,  & 
& cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplhhcHpmVWmVZp,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,           & 
& cplHpmcHpmVPVZp,cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ,cplHpmcHpmVZVZp,cplHpmcHpmVZpVZp,     & 
& cplSdcSdVGVG,cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSdVGVZp,cplSdcSucVWmVG,cplSdcSdVPVP,      & 
& cplSdcSdVPVZ,cplSdcSdVPVZp,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSdVZVZp,  & 
& cplSdcSucVWmVZ,cplSdcSdVZpVZp,cplSdcSucVWmVZp,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,         & 
& cplSeSvImcVWmVZp,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSeSvRecVWmVZp,cplSecSeVPVP,        & 
& cplSecSeVPVZ,cplSecSeVPVZp,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZVZp,cplSecSeVZpVZp,  & 
& cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVGVZp,cplSucSuVPVP,       & 
& cplSucSdVPVWm,cplSucSuVPVZ,cplSucSuVPVZp,cplSucSdVWmVZ,cplSucSdVWmVZp,cplSucSucVWmVWm, & 
& cplSucSuVZVZ,cplSucSuVZVZp,cplSucSuVZpVZp,cplSvImSvImVPVP,cplSvImSvImVPVZ,             & 
& cplSvImSvImVPVZp,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZVZp,cplSvImSvImVZpVZp,& 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvImcSeVWmVZp,cplSvReSvReVPVP,cplSvReSvReVPVZ,      & 
& cplSvReSvReVPVZp,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZVZp,cplSvReSvReVZpVZp,& 
& cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplSvRecSeVWmVZp,cplVGVGVG,cplcVWmVPVWm,               & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,           & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,     & 
& cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcgGgGVG,     & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgAgWmcVWm,     & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,               & 
& cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,cplcgWpCgZcVWm,             & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgZpgAhh,      & 
& cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,  & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcHpm,ZRUZD,ZRUZU,ZRUZE,              & 
& ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,          & 
& ZRUZDR,ZRUZUL,ZRUZUR,ZcplAhAhhh,ZcplAhHpmcHpm,ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,     & 
& ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhSdcSd,     & 
& ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvImSvIm,ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSucSd,     & 
& ZcplHpmSvImcSe,ZcplHpmSvRecSe,ZcplSdcHpmcSu,ZcplSeSvImcHpm,ZcplSeSvRecHpm,             & 
& ZcplAhAhAhAh,ZcplAhAhhhhh,ZcplAhAhHpmcHpm,ZcplAhAhSdcSd,ZcplAhAhSecSe,ZcplAhAhSucSu,   & 
& ZcplAhAhSvImSvIm,ZcplAhAhSvImSvRe,ZcplAhAhSvReSvRe,ZcplAhhhHpmcHpm,ZcplAhhhSvImSvIm,   & 
& ZcplAhhhSvImSvRe,ZcplAhhhSvReSvRe,ZcplAhHpmSucSd,ZcplAhHpmSvImcSe,ZcplAhHpmSvRecSe,    & 
& ZcplAhSdcHpmcSu,ZcplAhSeSvImcHpm,ZcplAhSeSvRecHpm,Zcplhhhhhhhh,ZcplhhhhHpmcHpm,        & 
& ZcplhhhhSdcSd,ZcplhhhhSecSe,ZcplhhhhSucSu,ZcplhhhhSvImSvIm,ZcplhhhhSvImSvRe,           & 
& ZcplhhhhSvReSvRe,ZcplhhHpmSucSd,ZcplhhHpmSvImcSe,ZcplhhHpmSvRecSe,ZcplhhSdcHpmcSu,     & 
& ZcplhhSeSvImcHpm,ZcplhhSeSvRecHpm,ZcplHpmHpmcHpmcHpm,ZcplHpmSdcHpmcSd,ZcplHpmSecHpmcSe,& 
& ZcplHpmSucHpmcSu,ZcplHpmSvImSvImcHpm,ZcplHpmSvImSvRecHpm,ZcplHpmSvReSvRecHpm,          & 
& ZcplSdSdcSdcSd,ZcplSdSecSdcSe,ZcplSdSucSdcSu,ZcplSdSvImSvImcSd,ZcplSdSvImcSecSu,       & 
& ZcplSdSvReSvRecSd,ZcplSdSvRecSecSu,ZcplSeSecSecSe,ZcplSeSuSvImcSd,ZcplSeSuSvRecSd,     & 
& ZcplSeSucSecSu,ZcplSeSvImSvImcSe,ZcplSeSvImSvRecSe,ZcplSeSvReSvRecSe,ZcplSuSucSucSu,   & 
& ZcplSuSvImSvImcSu,ZcplSuSvImSvRecSu,ZcplSuSvReSvRecSu,ZcplSvImSvImSvImSvIm,            & 
& ZcplSvImSvImSvImSvRe,ZcplSvImSvImSvReSvRe,ZcplSvImSvReSvReSvRe,ZcplSvReSvReSvReSvRe,   & 
& ZcplAhhhVP,ZcplAhhhVZ,ZcplAhhhVZp,ZcplAhHpmcVWm,ZcplAhcHpmVWm,ZcplhhHpmcVWm,           & 
& ZcplhhcHpmVWm,ZcplHpmcHpmVP,ZcplHpmcHpmVZ,ZcplHpmcHpmVZp,ZcplSdcSdVG,ZcplSdcSdVP,      & 
& ZcplSdcSdVZ,ZcplSdcSdVZp,ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSecSeVP,      & 
& ZcplSecSeVZ,ZcplSecSeVZp,ZcplSucSuVG,ZcplSucSuVP,ZcplSucSdVWm,ZcplSucSuVZ,             & 
& ZcplSucSuVZp,ZcplSvImSvReVP,ZcplSvImSvReVZ,ZcplSvImSvReVZp,ZcplSvImcSeVWm,             & 
& ZcplSvRecSeVWm,ZcplhhVPVZ,ZcplhhVPVZp,ZcplhhcVWmVWm,ZcplhhVZVZ,ZcplhhVZVZp,            & 
& ZcplhhVZpVZp,ZcplHpmcVWmVP,ZcplHpmcVWmVZ,ZcplHpmcVWmVZp,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,   & 
& ZcplcHpmVWmVZp,ZcplAhAhVPVP,ZcplAhAhVPVZ,ZcplAhAhVPVZp,ZcplAhAhcVWmVWm,ZcplAhAhVZVZ,   & 
& ZcplAhAhVZVZp,ZcplAhAhVZpVZp,ZcplAhHpmcVWmVP,ZcplAhHpmcVWmVZ,ZcplAhHpmcVWmVZp,         & 
& ZcplAhcHpmVPVWm,ZcplAhcHpmVWmVZ,ZcplAhcHpmVWmVZp,ZcplhhhhVPVP,ZcplhhhhVPVZ,            & 
& ZcplhhhhVPVZp,ZcplhhhhcVWmVWm,ZcplhhhhVZVZ,ZcplhhhhVZVZp,ZcplhhhhVZpVZp,               & 
& ZcplhhHpmcVWmVP,ZcplhhHpmcVWmVZ,ZcplhhHpmcVWmVZp,ZcplhhcHpmVPVWm,ZcplhhcHpmVWmVZ,      & 
& ZcplhhcHpmVWmVZp,ZcplHpmcHpmVPVP,ZcplHpmcHpmVPVZ,ZcplHpmcHpmVPVZp,ZcplHpmcHpmcVWmVWm,  & 
& ZcplHpmcHpmVZVZ,ZcplHpmcHpmVZVZp,ZcplHpmcHpmVZpVZp,ZcplSdcSdVGVG,ZcplSdcSdVGVP,        & 
& ZcplSdcSdVGVZ,ZcplSdcSdVGVZp,ZcplSdcSucVWmVG,ZcplSdcSdVPVP,ZcplSdcSdVPVZ,              & 
& ZcplSdcSdVPVZp,ZcplSdcSucVWmVP,ZcplSdcSdcVWmVWm,ZcplSdcSdVZVZ,ZcplSdcSdVZVZp,          & 
& ZcplSdcSucVWmVZ,ZcplSdcSdVZpVZp,ZcplSdcSucVWmVZp,ZcplSeSvImcVWmVP,ZcplSeSvImcVWmVZ,    & 
& ZcplSeSvImcVWmVZp,ZcplSeSvRecVWmVP,ZcplSeSvRecVWmVZ,ZcplSeSvRecVWmVZp,ZcplSecSeVPVP,   & 
& ZcplSecSeVPVZ,ZcplSecSeVPVZp,ZcplSecSecVWmVWm,ZcplSecSeVZVZ,ZcplSecSeVZVZp,            & 
& ZcplSecSeVZpVZp,ZcplSucSuVGVG,ZcplSucSuVGVP,ZcplSucSdVGVWm,ZcplSucSuVGVZ,              & 
& ZcplSucSuVGVZp,ZcplSucSuVPVP,ZcplSucSdVPVWm,ZcplSucSuVPVZ,ZcplSucSuVPVZp,              & 
& ZcplSucSdVWmVZ,ZcplSucSdVWmVZp,ZcplSucSucVWmVWm,ZcplSucSuVZVZ,ZcplSucSuVZVZp,          & 
& ZcplSucSuVZpVZp,ZcplSvImSvImVPVP,ZcplSvImSvImVPVZ,ZcplSvImSvImVPVZp,ZcplSvImSvImcVWmVWm,& 
& ZcplSvImSvImVZVZ,ZcplSvImSvImVZVZp,ZcplSvImSvImVZpVZp,ZcplSvImcSeVPVWm,ZcplSvImcSeVWmVZ,& 
& ZcplSvImcSeVWmVZp,ZcplSvReSvReVPVP,ZcplSvReSvReVPVZ,ZcplSvReSvReVPVZp,ZcplSvReSvRecVWmVWm,& 
& ZcplSvReSvReVZVZ,ZcplSvReSvReVZVZp,ZcplSvReSvReVZpVZp,ZcplSvRecSeVPVWm,ZcplSvRecSeVWmVZ,& 
& ZcplSvRecSeVWmVZp,ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,               & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,   & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,           & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,             & 
& ZcplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,               & 
& ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplChiChihhL,         & 
& ZcplChiChihhR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,   & 
& ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,             & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,             & 
& ZcplcFeChiSeR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,              & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR, & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,ZcplcFdFuHpmL,ZcplcFdFuHpmR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvHpmL,        & 
& ZcplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,   & 
& ZcplcFuGluSuR,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplChiChacVWmL,ZcplChiChacVWmR,           & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChaVZpL,           & 
& ZcplcChaChaVZpR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiChiVZL,ZcplChiChiVZR,               & 
& ZcplChiChiVZpL,ZcplChiChiVZpR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVGL,            & 
& ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,        & 
& ZcplcFdFdVZpR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,ZcplFvFecVWmL,ZcplFvFecVWmR,               & 
& ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,       & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFuVWmL,ZcplcFdFuVWmR,       & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplFvFvVPL,ZcplFvFvVPR,         & 
& ZcplFvFvVZL,ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,         & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmVPVWmVZp1,ZcplcVWmVPVWmVZp2,ZcplcVWmVPVWmVZp3,ZcplcVWmcVWmVWmVWm1,             & 
& ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,ZcplcVWmVWmVZVZ2,             & 
& ZcplcVWmVWmVZVZ3,ZcplcVWmVWmVZVZp1,ZcplcVWmVWmVZVZp2,ZcplcVWmVWmVZVZp3,ZcplcVWmVWmVZpVZp1,& 
& ZcplcVWmVWmVZpVZp2,ZcplcVWmVWmVZpVZp3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,       & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgWmgWmVZp,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,              & 
& ZcplcgZpgWmcVWm,ZcplcgWpCgWpCVP,ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgZpgWpCVWm,         & 
& ZcplcgWpCgWpCVZ,ZcplcgWpCgWpCVZp,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,ZcplcgWmgZpVWm,         & 
& ZcplcgWpCgZpcVWm,ZcplcgWmgWmAh,ZcplcgWpCgWpCAh,ZcplcgZgAhh,ZcplcgZpgAhh,               & 
& ZcplcgWmgAHpm,ZcplcgWpCgAcHpm,ZcplcgWmgWmhh,ZcplcgZgWmcHpm,ZcplcgZpgWmcHpm,            & 
& ZcplcgWpCgWpChh,ZcplcgZgWpCHpm,ZcplcgZpgWpCHpm,ZcplcgZgZhh,ZcplcgZpgZhh,               & 
& ZcplcgWmgZHpm,ZcplcgWpCgZcHpm,ZcplcgZgZphh,ZcplcgZpgZphh,ZcplcgWmgZpHpm,               & 
& ZcplcgWpCgZpcHpm)

Implicit None

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),ZA(4,4),ZP(2,2),g3,TW,TWp

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),ZD(6,6),Ye(3,3),Te(3,3),ZE(6,6),Yu(3,3),Tu(3,3),ZU(6,6),           & 
& MuP,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),ZVR(6,6),UM(2,2),UP(2,2),ZN(7,7),         & 
& ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),UV(6,6),pG

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhHpmcHpm(4,2,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),      & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),              & 
& cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplAhAhAhAh(4,4,4,4),cplAhAhhhhh(4,4,4,4),   & 
& cplAhAhHpmcHpm(4,4,2,2),cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),& 
& cplAhAhSvImSvIm(4,4,6,6),cplAhAhSvImSvRe(4,4,6,6),cplAhAhSvReSvRe(4,4,6,6),            & 
& cplAhhhHpmcHpm(4,4,2,2),cplAhhhSvImSvIm(4,4,6,6),cplAhhhSvImSvRe(4,4,6,6),             & 
& cplAhhhSvReSvRe(4,4,6,6),cplAhHpmSucSd(4,2,6,6),cplAhHpmSvImcSe(4,2,6,6),              & 
& cplAhHpmSvRecSe(4,2,6,6),cplAhSdcHpmcSu(4,6,2,6),cplAhSeSvImcHpm(4,6,6,2),             & 
& cplAhSeSvRecHpm(4,6,6,2),cplhhhhhhhh(4,4,4,4),cplhhhhHpmcHpm(4,4,2,2),cplhhhhSdcSd(4,4,6,6),& 
& cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvImSvRe(4,4,6,6),& 
& cplhhhhSvReSvRe(4,4,6,6),cplhhHpmSucSd(4,2,6,6),cplhhHpmSvImcSe(4,2,6,6),              & 
& cplhhHpmSvRecSe(4,2,6,6),cplhhSdcHpmcSu(4,6,2,6),cplhhSeSvImcHpm(4,6,6,2),             & 
& cplhhSeSvRecHpm(4,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),          & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),        & 
& cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),               & 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcVWm(4,2),cplAhcHpmVWm(4,2),     & 
& cplhhHpmcVWm(4,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),     & 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),& 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcVWmVWm(4),      & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),             & 
& cplHpmcVWmVZp(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplAhAhVPVP(4,4),    & 
& cplAhAhVPVZ(4,4),cplAhAhVPVZp(4,4),cplAhAhcVWmVWm(4,4),cplAhAhVZVZ(4,4),               & 
& cplAhAhVZVZp(4,4),cplAhAhVZpVZp(4,4),cplAhHpmcVWmVP(4,2),cplAhHpmcVWmVZ(4,2),          & 
& cplAhHpmcVWmVZp(4,2),cplAhcHpmVPVWm(4,2),cplAhcHpmVWmVZ(4,2),cplAhcHpmVWmVZp(4,2)

Complex(dp), Intent(in) :: cplhhhhVPVP(4,4),cplhhhhVPVZ(4,4),cplhhhhVPVZp(4,4),cplhhhhcVWmVWm(4,4),               & 
& cplhhhhVZVZ(4,4),cplhhhhVZVZp(4,4),cplhhhhVZpVZp(4,4),cplhhHpmcVWmVP(4,2),             & 
& cplhhHpmcVWmVZ(4,2),cplhhHpmcVWmVZp(4,2),cplhhcHpmVPVWm(4,2),cplhhcHpmVWmVZ(4,2),      & 
& cplhhcHpmVWmVZp(4,2),cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmVPVZp(2,2),     & 
& cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),cplHpmcHpmVZVZp(2,2),cplHpmcHpmVZpVZp(2,2), & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSdVGVZp(6,6),              & 
& cplSdcSucVWmVG(6,6),cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSdVPVZp(6,6),            & 
& cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),cplSdcSdVZVZ(6,6),cplSdcSdVZVZp(6,6),         & 
& cplSdcSucVWmVZ(6,6),cplSdcSdVZpVZp(6,6),cplSdcSucVWmVZp(6,6),cplSeSvImcVWmVP(6,6),     & 
& cplSeSvImcVWmVZ(6,6),cplSeSvImcVWmVZp(6,6),cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),  & 
& cplSeSvRecVWmVZp(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVPVZp(6,6),          & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSecSeVZVZp(6,6),cplSecSeVZpVZp(6,6),         & 
& cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),              & 
& cplSucSuVGVZp(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),cplSucSuVPVZ(6,6),             & 
& cplSucSuVPVZp(6,6),cplSucSdVWmVZ(6,6),cplSucSdVWmVZp(6,6),cplSucSucVWmVWm(6,6),        & 
& cplSucSuVZVZ(6,6),cplSucSuVZVZp(6,6),cplSucSuVZpVZp(6,6),cplSvImSvImVPVP(6,6),         & 
& cplSvImSvImVPVZ(6,6),cplSvImSvImVPVZp(6,6),cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),& 
& cplSvImSvImVZVZp(6,6),cplSvImSvImVZpVZp(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvImcSeVWmVZp(6,6),cplSvReSvReVPVP(6,6),cplSvReSvReVPVZ(6,6),cplSvReSvReVPVZp(6,6), & 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvReSvReVZVZp(6,6),cplSvReSvReVZpVZp(6,6),& 
& cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),cplSvRecSeVWmVZp(6,6),cplVGVGVG,             & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),     & 
& cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),           & 
& cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),       & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Complex(dp), Intent(in) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3), & 
& cplcFdFdVZpR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),             & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),& 
& cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6), & 
& cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,      & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,& 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,& 
& cplcgGgGVG,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,               & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,              & 
& cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh(4),cplcgWpCgWpCAh(4),        & 
& cplcgZgAhh(4),cplcgZpgAhh(4),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),cplcgWmgWmhh(4),        & 
& cplcgZgWmcHpm(2),cplcgZpgWmcHpm(2),cplcgWpCgWpChh(4),cplcgZgWpCHpm(2),cplcgZpgWpCHpm(2),& 
& cplcgZgZhh(4),cplcgZpgZhh(4),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),cplcgZgZphh(4),         & 
& cplcgZpgZphh(4),cplcgWmgZpHpm(2),cplcgWpCgZpcHpm(2)

Complex(dp), Intent(in) :: ZRUZD(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZH(4,4),ZRUZA(4,4),       & 
& ZRUZP(2,2),ZRUZN(7,7),ZRUUM(2,2),ZRUUP(2,2),ZRUUV(6,6),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Integer :: gt1, gt2
Complex(dp) :: TempcplAhAhhh(4,4,4),TempcplAhHpmcHpm(4,2,2),TempcplAhSdcSd(4,6,6),TempcplAhSecSe(4,6,6),& 
& TempcplAhSucSu(4,6,6),TempcplAhSvImSvIm(4,6,6),TempcplAhSvImSvRe(4,6,6),               & 
& TempcplAhSvReSvRe(4,6,6),Tempcplhhhhhh(4,4,4),TempcplhhHpmcHpm(4,2,2),TempcplhhSdcSd(4,6,6),& 
& TempcplhhSecSe(4,6,6),TempcplhhSucSu(4,6,6),TempcplhhSvImSvIm(4,6,6),TempcplhhSvImSvRe(4,6,6),& 
& TempcplhhSvReSvRe(4,6,6),TempcplHpmSucSd(2,6,6),TempcplHpmSvImcSe(2,6,6),              & 
& TempcplHpmSvRecSe(2,6,6),TempcplSdcHpmcSu(6,2,6),TempcplSeSvImcHpm(6,6,2),             & 
& TempcplSeSvRecHpm(6,6,2),TempcplAhAhAhAh(4,4,4,4),TempcplAhAhhhhh(4,4,4,4),            & 
& TempcplAhAhHpmcHpm(4,4,2,2),TempcplAhAhSdcSd(4,4,6,6),TempcplAhAhSecSe(4,4,6,6),       & 
& TempcplAhAhSucSu(4,4,6,6),TempcplAhAhSvImSvIm(4,4,6,6),TempcplAhAhSvImSvRe(4,4,6,6),   & 
& TempcplAhAhSvReSvRe(4,4,6,6),TempcplAhhhHpmcHpm(4,4,2,2),TempcplAhhhSvImSvIm(4,4,6,6), & 
& TempcplAhhhSvImSvRe(4,4,6,6),TempcplAhhhSvReSvRe(4,4,6,6),TempcplAhHpmSucSd(4,2,6,6),  & 
& TempcplAhHpmSvImcSe(4,2,6,6),TempcplAhHpmSvRecSe(4,2,6,6),TempcplAhSdcHpmcSu(4,6,2,6), & 
& TempcplAhSeSvImcHpm(4,6,6,2),TempcplAhSeSvRecHpm(4,6,6,2),Tempcplhhhhhhhh(4,4,4,4),    & 
& TempcplhhhhHpmcHpm(4,4,2,2),TempcplhhhhSdcSd(4,4,6,6),TempcplhhhhSecSe(4,4,6,6),       & 
& TempcplhhhhSucSu(4,4,6,6),TempcplhhhhSvImSvIm(4,4,6,6),TempcplhhhhSvImSvRe(4,4,6,6),   & 
& TempcplhhhhSvReSvRe(4,4,6,6),TempcplhhHpmSucSd(4,2,6,6),TempcplhhHpmSvImcSe(4,2,6,6),  & 
& TempcplhhHpmSvRecSe(4,2,6,6),TempcplhhSdcHpmcSu(4,6,2,6),TempcplhhSeSvImcHpm(4,6,6,2), & 
& TempcplhhSeSvRecHpm(4,6,6,2),TempcplHpmHpmcHpmcHpm(2,2,2,2),TempcplHpmSdcHpmcSd(2,6,2,6),& 
& TempcplHpmSecHpmcSe(2,6,2,6),TempcplHpmSucHpmcSu(2,6,2,6),TempcplHpmSvImSvImcHpm(2,6,6,2),& 
& TempcplHpmSvImSvRecHpm(2,6,6,2),TempcplHpmSvReSvRecHpm(2,6,6,2),TempcplSdSdcSdcSd(6,6,6,6),& 
& TempcplSdSecSdcSe(6,6,6,6),TempcplSdSucSdcSu(6,6,6,6),TempcplSdSvImSvImcSd(6,6,6,6),   & 
& TempcplSdSvImcSecSu(6,6,6,6),TempcplSdSvReSvRecSd(6,6,6,6),TempcplSdSvRecSecSu(6,6,6,6),& 
& TempcplSeSecSecSe(6,6,6,6),TempcplSeSuSvImcSd(6,6,6,6),TempcplSeSuSvRecSd(6,6,6,6),    & 
& TempcplSeSucSecSu(6,6,6,6),TempcplSeSvImSvImcSe(6,6,6,6),TempcplSeSvImSvRecSe(6,6,6,6),& 
& TempcplSeSvReSvRecSe(6,6,6,6),TempcplSuSucSucSu(6,6,6,6),TempcplSuSvImSvImcSu(6,6,6,6),& 
& TempcplSuSvImSvRecSu(6,6,6,6),TempcplSuSvReSvRecSu(6,6,6,6),TempcplSvImSvImSvImSvIm(6,6,6,6),& 
& TempcplSvImSvImSvImSvRe(6,6,6,6),TempcplSvImSvImSvReSvRe(6,6,6,6),TempcplSvImSvReSvReSvRe(6,6,6,6),& 
& TempcplSvReSvReSvReSvRe(6,6,6,6),TempcplAhhhVP(4,4),TempcplAhhhVZ(4,4),TempcplAhhhVZp(4,4),& 
& TempcplAhHpmcVWm(4,2),TempcplAhcHpmVWm(4,2),TempcplhhHpmcVWm(4,2),TempcplhhcHpmVWm(4,2),& 
& TempcplHpmcHpmVP(2,2),TempcplHpmcHpmVZ(2,2),TempcplHpmcHpmVZp(2,2),TempcplSdcSdVG(6,6),& 
& TempcplSdcSdVP(6,6),TempcplSdcSdVZ(6,6),TempcplSdcSdVZp(6,6),TempcplSdcSucVWm(6,6),    & 
& TempcplSeSvImcVWm(6,6),TempcplSeSvRecVWm(6,6),TempcplSecSeVP(6,6),TempcplSecSeVZ(6,6), & 
& TempcplSecSeVZp(6,6),TempcplSucSuVG(6,6),TempcplSucSuVP(6,6),TempcplSucSdVWm(6,6),     & 
& TempcplSucSuVZ(6,6),TempcplSucSuVZp(6,6),TempcplSvImSvReVP(6,6),TempcplSvImSvReVZ(6,6),& 
& TempcplSvImSvReVZp(6,6),TempcplSvImcSeVWm(6,6),TempcplSvRecSeVWm(6,6),TempcplhhVPVZ(4),& 
& TempcplhhVPVZp(4),TempcplhhcVWmVWm(4),TempcplhhVZVZ(4),TempcplhhVZVZp(4),              & 
& TempcplhhVZpVZp(4),TempcplHpmcVWmVP(2),TempcplHpmcVWmVZ(2),TempcplHpmcVWmVZp(2)

Complex(dp) :: TempcplcHpmVPVWm(2),TempcplcHpmVWmVZ(2),TempcplcHpmVWmVZp(2),TempcplAhAhVPVP(4,4),     & 
& TempcplAhAhVPVZ(4,4),TempcplAhAhVPVZp(4,4),TempcplAhAhcVWmVWm(4,4),TempcplAhAhVZVZ(4,4),& 
& TempcplAhAhVZVZp(4,4),TempcplAhAhVZpVZp(4,4),TempcplAhHpmcVWmVP(4,2),TempcplAhHpmcVWmVZ(4,2),& 
& TempcplAhHpmcVWmVZp(4,2),TempcplAhcHpmVPVWm(4,2),TempcplAhcHpmVWmVZ(4,2),              & 
& TempcplAhcHpmVWmVZp(4,2),TempcplhhhhVPVP(4,4),TempcplhhhhVPVZ(4,4),TempcplhhhhVPVZp(4,4),& 
& TempcplhhhhcVWmVWm(4,4),TempcplhhhhVZVZ(4,4),TempcplhhhhVZVZp(4,4),TempcplhhhhVZpVZp(4,4),& 
& TempcplhhHpmcVWmVP(4,2),TempcplhhHpmcVWmVZ(4,2),TempcplhhHpmcVWmVZp(4,2),              & 
& TempcplhhcHpmVPVWm(4,2),TempcplhhcHpmVWmVZ(4,2),TempcplhhcHpmVWmVZp(4,2),              & 
& TempcplHpmcHpmVPVP(2,2),TempcplHpmcHpmVPVZ(2,2),TempcplHpmcHpmVPVZp(2,2),              & 
& TempcplHpmcHpmcVWmVWm(2,2),TempcplHpmcHpmVZVZ(2,2),TempcplHpmcHpmVZVZp(2,2),           & 
& TempcplHpmcHpmVZpVZp(2,2),TempcplSdcSdVGVG(6,6),TempcplSdcSdVGVP(6,6),TempcplSdcSdVGVZ(6,6),& 
& TempcplSdcSdVGVZp(6,6),TempcplSdcSucVWmVG(6,6),TempcplSdcSdVPVP(6,6),TempcplSdcSdVPVZ(6,6),& 
& TempcplSdcSdVPVZp(6,6),TempcplSdcSucVWmVP(6,6),TempcplSdcSdcVWmVWm(6,6),               & 
& TempcplSdcSdVZVZ(6,6),TempcplSdcSdVZVZp(6,6),TempcplSdcSucVWmVZ(6,6),TempcplSdcSdVZpVZp(6,6),& 
& TempcplSdcSucVWmVZp(6,6),TempcplSeSvImcVWmVP(6,6),TempcplSeSvImcVWmVZ(6,6),            & 
& TempcplSeSvImcVWmVZp(6,6),TempcplSeSvRecVWmVP(6,6),TempcplSeSvRecVWmVZ(6,6),           & 
& TempcplSeSvRecVWmVZp(6,6),TempcplSecSeVPVP(6,6),TempcplSecSeVPVZ(6,6),TempcplSecSeVPVZp(6,6),& 
& TempcplSecSecVWmVWm(6,6),TempcplSecSeVZVZ(6,6),TempcplSecSeVZVZp(6,6),TempcplSecSeVZpVZp(6,6),& 
& TempcplSucSuVGVG(6,6),TempcplSucSuVGVP(6,6),TempcplSucSdVGVWm(6,6),TempcplSucSuVGVZ(6,6),& 
& TempcplSucSuVGVZp(6,6),TempcplSucSuVPVP(6,6),TempcplSucSdVPVWm(6,6),TempcplSucSuVPVZ(6,6),& 
& TempcplSucSuVPVZp(6,6),TempcplSucSdVWmVZ(6,6),TempcplSucSdVWmVZp(6,6),TempcplSucSucVWmVWm(6,6),& 
& TempcplSucSuVZVZ(6,6),TempcplSucSuVZVZp(6,6),TempcplSucSuVZpVZp(6,6),TempcplSvImSvImVPVP(6,6),& 
& TempcplSvImSvImVPVZ(6,6),TempcplSvImSvImVPVZp(6,6),TempcplSvImSvImcVWmVWm(6,6),        & 
& TempcplSvImSvImVZVZ(6,6),TempcplSvImSvImVZVZp(6,6),TempcplSvImSvImVZpVZp(6,6),         & 
& TempcplSvImcSeVPVWm(6,6),TempcplSvImcSeVWmVZ(6,6),TempcplSvImcSeVWmVZp(6,6),           & 
& TempcplSvReSvReVPVP(6,6),TempcplSvReSvReVPVZ(6,6),TempcplSvReSvReVPVZp(6,6),           & 
& TempcplSvReSvRecVWmVWm(6,6),TempcplSvReSvReVZVZ(6,6),TempcplSvReSvReVZVZp(6,6),        & 
& TempcplSvReSvReVZpVZp(6,6),TempcplSvRecSeVPVWm(6,6),TempcplSvRecSeVWmVZ(6,6),          & 
& TempcplSvRecSeVWmVZp(6,6),TempcplVGVGVG,TempcplcVWmVPVWm,TempcplcVWmVWmVZ,             & 
& TempcplcVWmVWmVZp,TempcplcChaChaAhL(2,2,4),TempcplcChaChaAhR(2,2,4),TempcplChiChiAhL(7,7,4),& 
& TempcplChiChiAhR(7,7,4),TempcplcFdFdAhL(3,3,4),TempcplcFdFdAhR(3,3,4),TempcplcFeFeAhL(3,3,4),& 
& TempcplcFeFeAhR(3,3,4),TempcplcFuFuAhL(3,3,4),TempcplcFuFuAhR(3,3,4),TempcplFvFvAhL(6,6,4),& 
& TempcplFvFvAhR(6,6,4),TempcplChiChacHpmL(7,2,2),TempcplChiChacHpmR(7,2,2),             & 
& TempcplChaFucSdL(2,3,6),TempcplChaFucSdR(2,3,6),TempcplFvChacSeL(6,2,6),               & 
& TempcplFvChacSeR(6,2,6),TempcplcChaChahhL(2,2,4),TempcplcChaChahhR(2,2,4),             & 
& TempcplcFdChaSuL(3,2,6),TempcplcFdChaSuR(3,2,6),TempcplcFeChaSvImL(3,2,6),             & 
& TempcplcFeChaSvImR(3,2,6),TempcplcFeChaSvReL(3,2,6),TempcplcFeChaSvReR(3,2,6)

Complex(dp) :: TempcplChiChihhL(7,7,4),TempcplChiChihhR(7,7,4),TempcplChiFdcSdL(7,3,6),               & 
& TempcplChiFdcSdR(7,3,6),TempcplChiFecSeL(7,3,6),TempcplChiFecSeR(7,3,6),               & 
& TempcplChiFucSuL(7,3,6),TempcplChiFucSuR(7,3,6),TempcplChiFvSvImL(7,6,6),              & 
& TempcplChiFvSvImR(7,6,6),TempcplChiFvSvReL(7,6,6),TempcplChiFvSvReR(7,6,6),            & 
& TempcplcChaChiHpmL(2,7,2),TempcplcChaChiHpmR(2,7,2),TempcplcFdChiSdL(3,7,6),           & 
& TempcplcFdChiSdR(3,7,6),TempcplcFeChiSeL(3,7,6),TempcplcFeChiSeR(3,7,6),               & 
& TempcplcFuChiSuL(3,7,6),TempcplcFuChiSuR(3,7,6),TempcplGluFdcSdL(3,6),TempcplGluFdcSdR(3,6),& 
& TempcplcFdFdhhL(3,3,4),TempcplcFdFdhhR(3,3,4),TempcplcChaFdcSuL(2,3,6),TempcplcChaFdcSuR(2,3,6),& 
& TempcplcFuFdcHpmL(3,3,2),TempcplcFuFdcHpmR(3,3,2),TempcplFvFecHpmL(6,3,2),             & 
& TempcplFvFecHpmR(6,3,2),TempcplcFeFehhL(3,3,4),TempcplcFeFehhR(3,3,4),TempcplcChaFeSvImL(2,3,6),& 
& TempcplcChaFeSvImR(2,3,6),TempcplcChaFeSvReL(2,3,6),TempcplcChaFeSvReR(2,3,6),         & 
& TempcplGluFucSuL(3,6),TempcplGluFucSuR(3,6),TempcplcFuFuhhL(3,3,4),TempcplcFuFuhhR(3,3,4),& 
& TempcplcFdFuHpmL(3,3,2),TempcplcFdFuHpmR(3,3,2),TempcplFvFvhhL(6,6,4),TempcplFvFvhhR(6,6,4),& 
& TempcplcFeFvHpmL(3,6,2),TempcplcFeFvHpmR(3,6,2),TempcplcChaFvSeL(2,6,6),               & 
& TempcplcChaFvSeR(2,6,6),TempcplcFdGluSdL(3,6),TempcplcFdGluSdR(3,6),TempcplcFuGluSuL(3,6),& 
& TempcplcFuGluSuR(3,6),TempcplcChacFuSdL(2,3,6),TempcplcChacFuSdR(2,3,6),               & 
& TempcplChiChacVWmL(7,2),TempcplChiChacVWmR(7,2),TempcplcChaChaVPL(2,2),TempcplcChaChaVPR(2,2),& 
& TempcplcChaChaVZL(2,2),TempcplcChaChaVZR(2,2),TempcplcChaChaVZpL(2,2),TempcplcChaChaVZpR(2,2),& 
& TempcplChiChiVPL(7,7),TempcplChiChiVPR(7,7),TempcplChiChiVZL(7,7),TempcplChiChiVZR(7,7),& 
& TempcplChiChiVZpL(7,7),TempcplChiChiVZpR(7,7),TempcplcChaChiVWmL(2,7),TempcplcChaChiVWmR(2,7),& 
& TempcplcFdFdVGL(3,3),TempcplcFdFdVGR(3,3),TempcplcFdFdVPL(3,3),TempcplcFdFdVPR(3,3),   & 
& TempcplcFdFdVZL(3,3),TempcplcFdFdVZR(3,3),TempcplcFdFdVZpL(3,3),TempcplcFdFdVZpR(3,3), & 
& TempcplcFuFdcVWmL(3,3),TempcplcFuFdcVWmR(3,3),TempcplFvFecVWmL(6,3),TempcplFvFecVWmR(6,3),& 
& TempcplcFeFeVPL(3,3),TempcplcFeFeVPR(3,3),TempcplcFeFeVZL(3,3),TempcplcFeFeVZR(3,3),   & 
& TempcplcFeFeVZpL(3,3),TempcplcFeFeVZpR(3,3),TempcplcFuFuVGL(3,3),TempcplcFuFuVGR(3,3), & 
& TempcplcFuFuVPL(3,3),TempcplcFuFuVPR(3,3),TempcplcFdFuVWmL(3,3),TempcplcFdFuVWmR(3,3), & 
& TempcplcFuFuVZL(3,3),TempcplcFuFuVZR(3,3),TempcplcFuFuVZpL(3,3),TempcplcFuFuVZpR(3,3), & 
& TempcplFvFvVPL(6,6),TempcplFvFvVPR(6,6),TempcplFvFvVZL(6,6),TempcplFvFvVZR(6,6),       & 
& TempcplFvFvVZpL(6,6),TempcplFvFvVZpR(6,6),TempcplcFeFvVWmL(3,6),TempcplcFeFvVWmR(3,6), & 
& TempcplGluGluVGL,TempcplGluGluVGR,TempcplVGVGVGVG1,TempcplVGVGVGVG2,TempcplVGVGVGVG3,  & 
& TempcplcVWmVPVPVWm1,TempcplcVWmVPVPVWm2,TempcplcVWmVPVPVWm3,TempcplcVWmVPVWmVZ1,       & 
& TempcplcVWmVPVWmVZ2,TempcplcVWmVPVWmVZ3,TempcplcVWmVPVWmVZp1,TempcplcVWmVPVWmVZp2,     & 
& TempcplcVWmVPVWmVZp3,TempcplcVWmcVWmVWmVWm1,TempcplcVWmcVWmVWmVWm2,TempcplcVWmcVWmVWmVWm3,& 
& TempcplcVWmVWmVZVZ1,TempcplcVWmVWmVZVZ2,TempcplcVWmVWmVZVZ3,TempcplcVWmVWmVZVZp1,      & 
& TempcplcVWmVWmVZVZp2,TempcplcVWmVWmVZVZp3,TempcplcVWmVWmVZpVZp1,TempcplcVWmVWmVZpVZp2, & 
& TempcplcVWmVWmVZpVZp3,TempcplcgGgGVG,TempcplcgWmgAVWm,TempcplcgWpCgAcVWm,              & 
& TempcplcgWmgWmVP,TempcplcgWmgWmVZ,TempcplcgWmgWmVZp,TempcplcgAgWmcVWm,TempcplcgZgWmcVWm

Complex(dp) :: TempcplcgZpgWmcVWm,TempcplcgWpCgWpCVP,TempcplcgAgWpCVWm,TempcplcgZgWpCVWm,             & 
& TempcplcgZpgWpCVWm,TempcplcgWpCgWpCVZ,TempcplcgWpCgWpCVZp,TempcplcgWmgZVWm,            & 
& TempcplcgWpCgZcVWm,TempcplcgWmgZpVWm,TempcplcgWpCgZpcVWm,TempcplcgWmgWmAh(4),          & 
& TempcplcgWpCgWpCAh(4),TempcplcgZgAhh(4),TempcplcgZpgAhh(4),TempcplcgWmgAHpm(2),        & 
& TempcplcgWpCgAcHpm(2),TempcplcgWmgWmhh(4),TempcplcgZgWmcHpm(2),TempcplcgZpgWmcHpm(2),  & 
& TempcplcgWpCgWpChh(4),TempcplcgZgWpCHpm(2),TempcplcgZpgWpCHpm(2),TempcplcgZgZhh(4),    & 
& TempcplcgZpgZhh(4),TempcplcgWmgZHpm(2),TempcplcgWpCgZcHpm(2),TempcplcgZgZphh(4),       & 
& TempcplcgZpgZphh(4),TempcplcgWmgZpHpm(2),TempcplcgWpCgZpcHpm(2)

Complex(dp), Intent(out) :: ZcplAhAhhh(4,4,4),ZcplAhHpmcHpm(4,2,2),ZcplAhSdcSd(4,6,6),ZcplAhSecSe(4,6,6),         & 
& ZcplAhSucSu(4,6,6),ZcplAhSvImSvIm(4,6,6),ZcplAhSvImSvRe(4,6,6),ZcplAhSvReSvRe(4,6,6),  & 
& Zcplhhhhhh(4,4,4),ZcplhhHpmcHpm(4,2,2),ZcplhhSdcSd(4,6,6),ZcplhhSecSe(4,6,6),          & 
& ZcplhhSucSu(4,6,6),ZcplhhSvImSvIm(4,6,6),ZcplhhSvImSvRe(4,6,6),ZcplhhSvReSvRe(4,6,6),  & 
& ZcplHpmSucSd(2,6,6),ZcplHpmSvImcSe(2,6,6),ZcplHpmSvRecSe(2,6,6),ZcplSdcHpmcSu(6,2,6),  & 
& ZcplSeSvImcHpm(6,6,2),ZcplSeSvRecHpm(6,6,2),ZcplAhAhAhAh(4,4,4,4),ZcplAhAhhhhh(4,4,4,4),& 
& ZcplAhAhHpmcHpm(4,4,2,2),ZcplAhAhSdcSd(4,4,6,6),ZcplAhAhSecSe(4,4,6,6),ZcplAhAhSucSu(4,4,6,6),& 
& ZcplAhAhSvImSvIm(4,4,6,6),ZcplAhAhSvImSvRe(4,4,6,6),ZcplAhAhSvReSvRe(4,4,6,6),         & 
& ZcplAhhhHpmcHpm(4,4,2,2),ZcplAhhhSvImSvIm(4,4,6,6),ZcplAhhhSvImSvRe(4,4,6,6),          & 
& ZcplAhhhSvReSvRe(4,4,6,6),ZcplAhHpmSucSd(4,2,6,6),ZcplAhHpmSvImcSe(4,2,6,6),           & 
& ZcplAhHpmSvRecSe(4,2,6,6),ZcplAhSdcHpmcSu(4,6,2,6),ZcplAhSeSvImcHpm(4,6,6,2),          & 
& ZcplAhSeSvRecHpm(4,6,6,2),Zcplhhhhhhhh(4,4,4,4),ZcplhhhhHpmcHpm(4,4,2,2),              & 
& ZcplhhhhSdcSd(4,4,6,6),ZcplhhhhSecSe(4,4,6,6),ZcplhhhhSucSu(4,4,6,6),ZcplhhhhSvImSvIm(4,4,6,6),& 
& ZcplhhhhSvImSvRe(4,4,6,6),ZcplhhhhSvReSvRe(4,4,6,6),ZcplhhHpmSucSd(4,2,6,6),           & 
& ZcplhhHpmSvImcSe(4,2,6,6),ZcplhhHpmSvRecSe(4,2,6,6),ZcplhhSdcHpmcSu(4,6,2,6),          & 
& ZcplhhSeSvImcHpm(4,6,6,2),ZcplhhSeSvRecHpm(4,6,6,2),ZcplHpmHpmcHpmcHpm(2,2,2,2),       & 
& ZcplHpmSdcHpmcSd(2,6,2,6),ZcplHpmSecHpmcSe(2,6,2,6),ZcplHpmSucHpmcSu(2,6,2,6),         & 
& ZcplHpmSvImSvImcHpm(2,6,6,2),ZcplHpmSvImSvRecHpm(2,6,6,2),ZcplHpmSvReSvRecHpm(2,6,6,2),& 
& ZcplSdSdcSdcSd(6,6,6,6),ZcplSdSecSdcSe(6,6,6,6),ZcplSdSucSdcSu(6,6,6,6),               & 
& ZcplSdSvImSvImcSd(6,6,6,6),ZcplSdSvImcSecSu(6,6,6,6),ZcplSdSvReSvRecSd(6,6,6,6),       & 
& ZcplSdSvRecSecSu(6,6,6,6),ZcplSeSecSecSe(6,6,6,6),ZcplSeSuSvImcSd(6,6,6,6),            & 
& ZcplSeSuSvRecSd(6,6,6,6),ZcplSeSucSecSu(6,6,6,6),ZcplSeSvImSvImcSe(6,6,6,6),           & 
& ZcplSeSvImSvRecSe(6,6,6,6),ZcplSeSvReSvRecSe(6,6,6,6),ZcplSuSucSucSu(6,6,6,6),         & 
& ZcplSuSvImSvImcSu(6,6,6,6),ZcplSuSvImSvRecSu(6,6,6,6),ZcplSuSvReSvRecSu(6,6,6,6),      & 
& ZcplSvImSvImSvImSvIm(6,6,6,6),ZcplSvImSvImSvImSvRe(6,6,6,6),ZcplSvImSvImSvReSvRe(6,6,6,6),& 
& ZcplSvImSvReSvReSvRe(6,6,6,6),ZcplSvReSvReSvReSvRe(6,6,6,6),ZcplAhhhVP(4,4),           & 
& ZcplAhhhVZ(4,4),ZcplAhhhVZp(4,4),ZcplAhHpmcVWm(4,2),ZcplAhcHpmVWm(4,2),ZcplhhHpmcVWm(4,2),& 
& ZcplhhcHpmVWm(4,2),ZcplHpmcHpmVP(2,2),ZcplHpmcHpmVZ(2,2),ZcplHpmcHpmVZp(2,2),          & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSdcSdVZ(6,6),ZcplSdcSdVZp(6,6),ZcplSdcSucVWm(6,6),& 
& ZcplSeSvImcVWm(6,6),ZcplSeSvRecVWm(6,6),ZcplSecSeVP(6,6),ZcplSecSeVZ(6,6),             & 
& ZcplSecSeVZp(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6),ZcplSucSdVWm(6,6),ZcplSucSuVZ(6,6),& 
& ZcplSucSuVZp(6,6),ZcplSvImSvReVP(6,6),ZcplSvImSvReVZ(6,6),ZcplSvImSvReVZp(6,6),        & 
& ZcplSvImcSeVWm(6,6),ZcplSvRecSeVWm(6,6),ZcplhhVPVZ(4),ZcplhhVPVZp(4),ZcplhhcVWmVWm(4), & 
& ZcplhhVZVZ(4),ZcplhhVZVZp(4),ZcplhhVZpVZp(4),ZcplHpmcVWmVP(2),ZcplHpmcVWmVZ(2),        & 
& ZcplHpmcVWmVZp(2),ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),ZcplcHpmVWmVZp(2),ZcplAhAhVPVP(4,4),& 
& ZcplAhAhVPVZ(4,4),ZcplAhAhVPVZp(4,4),ZcplAhAhcVWmVWm(4,4),ZcplAhAhVZVZ(4,4),           & 
& ZcplAhAhVZVZp(4,4),ZcplAhAhVZpVZp(4,4),ZcplAhHpmcVWmVP(4,2),ZcplAhHpmcVWmVZ(4,2)

Complex(dp), Intent(out) :: ZcplAhHpmcVWmVZp(4,2),ZcplAhcHpmVPVWm(4,2),ZcplAhcHpmVWmVZ(4,2),ZcplAhcHpmVWmVZp(4,2), & 
& ZcplhhhhVPVP(4,4),ZcplhhhhVPVZ(4,4),ZcplhhhhVPVZp(4,4),ZcplhhhhcVWmVWm(4,4),           & 
& ZcplhhhhVZVZ(4,4),ZcplhhhhVZVZp(4,4),ZcplhhhhVZpVZp(4,4),ZcplhhHpmcVWmVP(4,2),         & 
& ZcplhhHpmcVWmVZ(4,2),ZcplhhHpmcVWmVZp(4,2),ZcplhhcHpmVPVWm(4,2),ZcplhhcHpmVWmVZ(4,2),  & 
& ZcplhhcHpmVWmVZp(4,2),ZcplHpmcHpmVPVP(2,2),ZcplHpmcHpmVPVZ(2,2),ZcplHpmcHpmVPVZp(2,2), & 
& ZcplHpmcHpmcVWmVWm(2,2),ZcplHpmcHpmVZVZ(2,2),ZcplHpmcHpmVZVZp(2,2),ZcplHpmcHpmVZpVZp(2,2),& 
& ZcplSdcSdVGVG(6,6),ZcplSdcSdVGVP(6,6),ZcplSdcSdVGVZ(6,6),ZcplSdcSdVGVZp(6,6),          & 
& ZcplSdcSucVWmVG(6,6),ZcplSdcSdVPVP(6,6),ZcplSdcSdVPVZ(6,6),ZcplSdcSdVPVZp(6,6),        & 
& ZcplSdcSucVWmVP(6,6),ZcplSdcSdcVWmVWm(6,6),ZcplSdcSdVZVZ(6,6),ZcplSdcSdVZVZp(6,6),     & 
& ZcplSdcSucVWmVZ(6,6),ZcplSdcSdVZpVZp(6,6),ZcplSdcSucVWmVZp(6,6),ZcplSeSvImcVWmVP(6,6), & 
& ZcplSeSvImcVWmVZ(6,6),ZcplSeSvImcVWmVZp(6,6),ZcplSeSvRecVWmVP(6,6),ZcplSeSvRecVWmVZ(6,6),& 
& ZcplSeSvRecVWmVZp(6,6),ZcplSecSeVPVP(6,6),ZcplSecSeVPVZ(6,6),ZcplSecSeVPVZp(6,6),      & 
& ZcplSecSecVWmVWm(6,6),ZcplSecSeVZVZ(6,6),ZcplSecSeVZVZp(6,6),ZcplSecSeVZpVZp(6,6),     & 
& ZcplSucSuVGVG(6,6),ZcplSucSuVGVP(6,6),ZcplSucSdVGVWm(6,6),ZcplSucSuVGVZ(6,6),          & 
& ZcplSucSuVGVZp(6,6),ZcplSucSuVPVP(6,6),ZcplSucSdVPVWm(6,6),ZcplSucSuVPVZ(6,6),         & 
& ZcplSucSuVPVZp(6,6),ZcplSucSdVWmVZ(6,6),ZcplSucSdVWmVZp(6,6),ZcplSucSucVWmVWm(6,6),    & 
& ZcplSucSuVZVZ(6,6),ZcplSucSuVZVZp(6,6),ZcplSucSuVZpVZp(6,6),ZcplSvImSvImVPVP(6,6),     & 
& ZcplSvImSvImVPVZ(6,6),ZcplSvImSvImVPVZp(6,6),ZcplSvImSvImcVWmVWm(6,6),ZcplSvImSvImVZVZ(6,6),& 
& ZcplSvImSvImVZVZp(6,6),ZcplSvImSvImVZpVZp(6,6),ZcplSvImcSeVPVWm(6,6),ZcplSvImcSeVWmVZ(6,6),& 
& ZcplSvImcSeVWmVZp(6,6),ZcplSvReSvReVPVP(6,6),ZcplSvReSvReVPVZ(6,6),ZcplSvReSvReVPVZp(6,6),& 
& ZcplSvReSvRecVWmVWm(6,6),ZcplSvReSvReVZVZ(6,6),ZcplSvReSvReVZVZp(6,6),ZcplSvReSvReVZpVZp(6,6),& 
& ZcplSvRecSeVPVWm(6,6),ZcplSvRecSeVWmVZ(6,6),ZcplSvRecSeVWmVZp(6,6),ZcplVGVGVG,         & 
& ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,ZcplcChaChaAhL(2,2,4),ZcplcChaChaAhR(2,2,4),& 
& ZcplChiChiAhL(7,7,4),ZcplChiChiAhR(7,7,4),ZcplcFdFdAhL(3,3,4),ZcplcFdFdAhR(3,3,4),     & 
& ZcplcFeFeAhL(3,3,4),ZcplcFeFeAhR(3,3,4),ZcplcFuFuAhL(3,3,4),ZcplcFuFuAhR(3,3,4),       & 
& ZcplFvFvAhL(6,6,4),ZcplFvFvAhR(6,6,4),ZcplChiChacHpmL(7,2,2),ZcplChiChacHpmR(7,2,2),   & 
& ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),   & 
& ZcplcChaChahhL(2,2,4),ZcplcChaChahhR(2,2,4),ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6), & 
& ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),& 
& ZcplChiChihhL(7,7,4),ZcplChiChihhR(7,7,4),ZcplChiFdcSdL(7,3,6),ZcplChiFdcSdR(7,3,6),   & 
& ZcplChiFecSeL(7,3,6),ZcplChiFecSeR(7,3,6),ZcplChiFucSuL(7,3,6),ZcplChiFucSuR(7,3,6),   & 
& ZcplChiFvSvImL(7,6,6),ZcplChiFvSvImR(7,6,6),ZcplChiFvSvReL(7,6,6),ZcplChiFvSvReR(7,6,6),& 
& ZcplcChaChiHpmL(2,7,2),ZcplcChaChiHpmR(2,7,2),ZcplcFdChiSdL(3,7,6),ZcplcFdChiSdR(3,7,6),& 
& ZcplcFeChiSeL(3,7,6),ZcplcFeChiSeR(3,7,6),ZcplcFuChiSuL(3,7,6),ZcplcFuChiSuR(3,7,6),   & 
& ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),ZcplcFdFdhhL(3,3,4),ZcplcFdFdhhR(3,3,4),         & 
& ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),ZcplcFuFdcHpmL(3,3,2),ZcplcFuFdcHpmR(3,3,2),& 
& ZcplFvFecHpmL(6,3,2),ZcplFvFecHpmR(6,3,2),ZcplcFeFehhL(3,3,4),ZcplcFeFehhR(3,3,4)

Complex(dp), Intent(out) :: ZcplcChaFeSvImL(2,3,6),ZcplcChaFeSvImR(2,3,6),ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),& 
& ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),ZcplcFuFuhhL(3,3,4),ZcplcFuFuhhR(3,3,4),         & 
& ZcplcFdFuHpmL(3,3,2),ZcplcFdFuHpmR(3,3,2),ZcplFvFvhhL(6,6,4),ZcplFvFvhhR(6,6,4),       & 
& ZcplcFeFvHpmL(3,6,2),ZcplcFeFvHpmR(3,6,2),ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),   & 
& ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),           & 
& ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),ZcplChiChacVWmL(7,2),ZcplChiChacVWmR(7,2), & 
& ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),ZcplcChaChaVZL(2,2),ZcplcChaChaVZR(2,2),       & 
& ZcplcChaChaVZpL(2,2),ZcplcChaChaVZpR(2,2),ZcplChiChiVPL(7,7),ZcplChiChiVPR(7,7),       & 
& ZcplChiChiVZL(7,7),ZcplChiChiVZR(7,7),ZcplChiChiVZpL(7,7),ZcplChiChiVZpR(7,7),         & 
& ZcplcChaChiVWmL(2,7),ZcplcChaChiVWmR(2,7),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFdFdVZpL(3,3),ZcplcFdFdVZpR(3,3),ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),         & 
& ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),             & 
& ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),ZcplcFeFeVZpL(3,3),ZcplcFeFeVZpR(3,3),             & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
& ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplcFuFuVZpL(3,3),ZcplcFuFuVZpR(3,3),ZcplFvFvVPL(6,6),ZcplFvFvVPR(6,6),               & 
& ZcplFvFvVZL(6,6),ZcplFvFvVZR(6,6),ZcplFvFvVZpL(6,6),ZcplFvFvVZpR(6,6),ZcplcFeFvVWmL(3,6),& 
& ZcplcFeFvVWmR(3,6),ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,            & 
& ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,     & 
& ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,ZcplcVWmVPVWmVZp1,ZcplcVWmVPVWmVZp2,ZcplcVWmVPVWmVZp3,& 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcVWmVWmVZVZp1,ZcplcVWmVWmVZVZp2,ZcplcVWmVWmVZVZp3,& 
& ZcplcVWmVWmVZpVZp1,ZcplcVWmVWmVZpVZp2,ZcplcVWmVWmVZpVZp3,ZcplcgGgGVG,ZcplcgWmgAVWm,    & 
& ZcplcgWpCgAcVWm,ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgWmgWmVZp,ZcplcgAgWmcVWm,             & 
& ZcplcgZgWmcVWm,ZcplcgZpgWmcVWm,ZcplcgWpCgWpCVP,ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,          & 
& ZcplcgZpgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWpCgWpCVZp,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,        & 
& ZcplcgWmgZpVWm,ZcplcgWpCgZpcVWm,ZcplcgWmgWmAh(4),ZcplcgWpCgWpCAh(4),ZcplcgZgAhh(4),    & 
& ZcplcgZpgAhh(4),ZcplcgWmgAHpm(2),ZcplcgWpCgAcHpm(2),ZcplcgWmgWmhh(4),ZcplcgZgWmcHpm(2),& 
& ZcplcgZpgWmcHpm(2),ZcplcgWpCgWpChh(4),ZcplcgZgWpCHpm(2),ZcplcgZpgWpCHpm(2),            & 
& ZcplcgZgZhh(4),ZcplcgZpgZhh(4),ZcplcgWmgZHpm(2),ZcplcgWpCgZcHpm(2),ZcplcgZgZphh(4),    & 
& ZcplcgZpgZphh(4),ZcplcgWmgZpHpm(2),ZcplcgWpCgZpcHpm(2)

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZEc(6, 6) 
Complex(dp) :: ZRUZVIc(6, 6) 
Complex(dp) :: ZRUZVRc(6, 6) 
Complex(dp) :: ZRUZHc(4, 4) 
Complex(dp) :: ZRUZAc(4, 4) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUZNc(7, 7) 
Complex(dp) :: ZRUUMc(2, 2) 
Complex(dp) :: ZRUUPc(2, 2) 
Complex(dp) :: ZRUUVc(6, 6) 
Complex(dp) :: ZRUZELc(3, 3) 
Complex(dp) :: ZRUZERc(3, 3) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
ZRUZDc = Conjg(ZRUZD)
ZRUZUc = Conjg(ZRUZU)
ZRUZEc = Conjg(ZRUZE)
ZRUZVIc = Conjg(ZRUZVI)
ZRUZVRc = Conjg(ZRUZVR)
ZRUZHc = Conjg(ZRUZH)
ZRUZAc = Conjg(ZRUZA)
ZRUZPc = Conjg(ZRUZP)
ZRUZNc = Conjg(ZRUZN)
ZRUUMc = Conjg(ZRUUM)
ZRUUPc = Conjg(ZRUUP)
ZRUUVc = Conjg(ZRUUV)
ZRUZELc = Conjg(ZRUZEL)
ZRUZERc = Conjg(ZRUZER)
ZRUZDLc = Conjg(ZRUZDL)
ZRUZDRc = Conjg(ZRUZDR)
ZRUZULc = Conjg(ZRUZUL)
ZRUZURc = Conjg(ZRUZUR)


 ! ## ZcplAhAhhh ## 
ZcplAhAhhh = 0._dp 
TempcplAhAhhh = cplAhAhhh 
Do gt1=1,4
  Do gt2=1,4
ZcplAhAhhh(gt2,:,:) = ZcplAhAhhh(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(gt1,:,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhAhhh(:,gt2,:) = ZcplAhAhhh(:,gt2,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(:,gt1,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhAhhh(:,:,gt2) = ZcplAhAhhh(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplAhAhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhHpmcHpm ## 
ZcplAhHpmcHpm = 0._dp 
TempcplAhHpmcHpm = cplAhHpmcHpm 
Do gt1=1,4
  Do gt2=1,4
ZcplAhHpmcHpm(gt2,:,:) = ZcplAhHpmcHpm(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhHpmcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplAhHpmcHpm = ZcplAhHpmcHpm 
ZcplAhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcHpm(:,gt2,:) = ZcplAhHpmcHpm(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplAhHpmcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplAhHpmcHpm = ZcplAhHpmcHpm 
ZcplAhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcHpm(:,:,gt2) = ZcplAhHpmcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplAhHpmcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSdcSd ## 
ZcplAhSdcSd = 0._dp 
TempcplAhSdcSd = cplAhSdcSd 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSdcSd(gt2,:,:) = ZcplAhSdcSd(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSdcSd(gt1,:,:) 
 End Do 
End Do 
TempcplAhSdcSd = ZcplAhSdcSd 
ZcplAhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSdcSd(:,gt2,:) = ZcplAhSdcSd(:,gt2,:) + ZRUZD(gt2,gt1)*TempcplAhSdcSd(:,gt1,:) 
 End Do 
End Do 
TempcplAhSdcSd = ZcplAhSdcSd 
ZcplAhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSdcSd(:,:,gt2) = ZcplAhSdcSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplAhSdcSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSecSe ## 
ZcplAhSecSe = 0._dp 
TempcplAhSecSe = cplAhSecSe 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSecSe(gt2,:,:) = ZcplAhSecSe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSecSe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSecSe = ZcplAhSecSe 
ZcplAhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSecSe(:,gt2,:) = ZcplAhSecSe(:,gt2,:) + ZRUZE(gt2,gt1)*TempcplAhSecSe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSecSe = ZcplAhSecSe 
ZcplAhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSecSe(:,:,gt2) = ZcplAhSecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplAhSecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSucSu ## 
ZcplAhSucSu = 0._dp 
TempcplAhSucSu = cplAhSucSu 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSucSu(gt2,:,:) = ZcplAhSucSu(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSucSu(gt1,:,:) 
 End Do 
End Do 
TempcplAhSucSu = ZcplAhSucSu 
ZcplAhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSucSu(:,gt2,:) = ZcplAhSucSu(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplAhSucSu(:,gt1,:) 
 End Do 
End Do 
TempcplAhSucSu = ZcplAhSucSu 
ZcplAhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSucSu(:,:,gt2) = ZcplAhSucSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplAhSucSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvImSvIm ## 
ZcplAhSvImSvIm = 0._dp 
TempcplAhSvImSvIm = cplAhSvImSvIm 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSvImSvIm(gt2,:,:) = ZcplAhSvImSvIm(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvImSvIm(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvImSvIm = ZcplAhSvImSvIm 
ZcplAhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvIm(:,gt2,:) = ZcplAhSvImSvIm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvIm(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvImSvIm = ZcplAhSvImSvIm 
ZcplAhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvIm(:,:,gt2) = ZcplAhSvImSvIm(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvIm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvImSvRe ## 
ZcplAhSvImSvRe = 0._dp 
TempcplAhSvImSvRe = cplAhSvImSvRe 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSvImSvRe(gt2,:,:) = ZcplAhSvImSvRe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvImSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvImSvRe = ZcplAhSvImSvRe 
ZcplAhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvRe(:,gt2,:) = ZcplAhSvImSvRe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvImSvRe = ZcplAhSvImSvRe 
ZcplAhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvRe(:,:,gt2) = ZcplAhSvImSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplAhSvImSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvReSvRe ## 
ZcplAhSvReSvRe = 0._dp 
TempcplAhSvReSvRe = cplAhSvReSvRe 
Do gt1=1,4
  Do gt2=1,4
ZcplAhSvReSvRe(gt2,:,:) = ZcplAhSvReSvRe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvReSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvReSvRe = ZcplAhSvReSvRe 
ZcplAhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvReSvRe(:,gt2,:) = ZcplAhSvReSvRe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplAhSvReSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvReSvRe = ZcplAhSvReSvRe 
ZcplAhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvReSvRe(:,:,gt2) = ZcplAhSvReSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplAhSvReSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## Zcplhhhhhh ## 
Zcplhhhhhh = 0._dp 
Tempcplhhhhhh = cplhhhhhh 
Do gt1=1,4
  Do gt2=1,4
Zcplhhhhhh(gt2,:,:) = Zcplhhhhhh(gt2,:,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(gt1,:,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
Zcplhhhhhh(:,gt2,:) = Zcplhhhhhh(:,gt2,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,gt1,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
Zcplhhhhhh(:,:,gt2) = Zcplhhhhhh(:,:,gt2) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhHpmcHpm ## 
ZcplhhHpmcHpm = 0._dp 
TempcplhhHpmcHpm = cplhhHpmcHpm 
Do gt1=1,4
  Do gt2=1,4
ZcplhhHpmcHpm(gt2,:,:) = ZcplhhHpmcHpm(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhHpmcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplhhHpmcHpm = ZcplhhHpmcHpm 
ZcplhhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcHpm(:,gt2,:) = ZcplhhHpmcHpm(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplhhHpmcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplhhHpmcHpm = ZcplhhHpmcHpm 
ZcplhhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcHpm(:,:,gt2) = ZcplhhHpmcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHpmcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSdcSd ## 
ZcplhhSdcSd = 0._dp 
TempcplhhSdcSd = cplhhSdcSd 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSdcSd(gt2,:,:) = ZcplhhSdcSd(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSdcSd(gt1,:,:) 
 End Do 
End Do 
TempcplhhSdcSd = ZcplhhSdcSd 
ZcplhhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSdcSd(:,gt2,:) = ZcplhhSdcSd(:,gt2,:) + ZRUZD(gt2,gt1)*TempcplhhSdcSd(:,gt1,:) 
 End Do 
End Do 
TempcplhhSdcSd = ZcplhhSdcSd 
ZcplhhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSdcSd(:,:,gt2) = ZcplhhSdcSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplhhSdcSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSecSe ## 
ZcplhhSecSe = 0._dp 
TempcplhhSecSe = cplhhSecSe 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSecSe(gt2,:,:) = ZcplhhSecSe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSecSe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSecSe = ZcplhhSecSe 
ZcplhhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSecSe(:,gt2,:) = ZcplhhSecSe(:,gt2,:) + ZRUZE(gt2,gt1)*TempcplhhSecSe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSecSe = ZcplhhSecSe 
ZcplhhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSecSe(:,:,gt2) = ZcplhhSecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplhhSecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSucSu ## 
ZcplhhSucSu = 0._dp 
TempcplhhSucSu = cplhhSucSu 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSucSu(gt2,:,:) = ZcplhhSucSu(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSucSu(gt1,:,:) 
 End Do 
End Do 
TempcplhhSucSu = ZcplhhSucSu 
ZcplhhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSucSu(:,gt2,:) = ZcplhhSucSu(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplhhSucSu(:,gt1,:) 
 End Do 
End Do 
TempcplhhSucSu = ZcplhhSucSu 
ZcplhhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSucSu(:,:,gt2) = ZcplhhSucSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplhhSucSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvImSvIm ## 
ZcplhhSvImSvIm = 0._dp 
TempcplhhSvImSvIm = cplhhSvImSvIm 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSvImSvIm(gt2,:,:) = ZcplhhSvImSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvImSvIm(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvImSvIm = ZcplhhSvImSvIm 
ZcplhhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvIm(:,gt2,:) = ZcplhhSvImSvIm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvIm(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvImSvIm = ZcplhhSvImSvIm 
ZcplhhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvIm(:,:,gt2) = ZcplhhSvImSvIm(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvIm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvImSvRe ## 
ZcplhhSvImSvRe = 0._dp 
TempcplhhSvImSvRe = cplhhSvImSvRe 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSvImSvRe(gt2,:,:) = ZcplhhSvImSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvImSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvImSvRe = ZcplhhSvImSvRe 
ZcplhhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvRe(:,gt2,:) = ZcplhhSvImSvRe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvImSvRe = ZcplhhSvImSvRe 
ZcplhhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvRe(:,:,gt2) = ZcplhhSvImSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplhhSvImSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvReSvRe ## 
ZcplhhSvReSvRe = 0._dp 
TempcplhhSvReSvRe = cplhhSvReSvRe 
Do gt1=1,4
  Do gt2=1,4
ZcplhhSvReSvRe(gt2,:,:) = ZcplhhSvReSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvReSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvReSvRe = ZcplhhSvReSvRe 
ZcplhhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvReSvRe(:,gt2,:) = ZcplhhSvReSvRe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplhhSvReSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvReSvRe = ZcplhhSvReSvRe 
ZcplhhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvReSvRe(:,:,gt2) = ZcplhhSvReSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplhhSvReSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSucSd ## 
ZcplHpmSucSd = 0._dp 
TempcplHpmSucSd = cplHpmSucSd 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSucSd(gt2,:,:) = ZcplHpmSucSd(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSucSd(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSucSd = ZcplHpmSucSd 
ZcplHpmSucSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSucSd(:,gt2,:) = ZcplHpmSucSd(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplHpmSucSd(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSucSd = ZcplHpmSucSd 
ZcplHpmSucSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSucSd(:,:,gt2) = ZcplHpmSucSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplHpmSucSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSvImcSe ## 
ZcplHpmSvImcSe = 0._dp 
TempcplHpmSvImcSe = cplHpmSvImcSe 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSvImcSe(gt2,:,:) = ZcplHpmSvImcSe(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSvImcSe(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSvImcSe = ZcplHpmSvImcSe 
ZcplHpmSvImcSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvImcSe(:,gt2,:) = ZcplHpmSvImcSe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplHpmSvImcSe(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSvImcSe = ZcplHpmSvImcSe 
ZcplHpmSvImcSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvImcSe(:,:,gt2) = ZcplHpmSvImcSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplHpmSvImcSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSvRecSe ## 
ZcplHpmSvRecSe = 0._dp 
TempcplHpmSvRecSe = cplHpmSvRecSe 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSvRecSe(gt2,:,:) = ZcplHpmSvRecSe(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSvRecSe(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSvRecSe = ZcplHpmSvRecSe 
ZcplHpmSvRecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvRecSe(:,gt2,:) = ZcplHpmSvRecSe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplHpmSvRecSe(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSvRecSe = ZcplHpmSvRecSe 
ZcplHpmSvRecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvRecSe(:,:,gt2) = ZcplHpmSvRecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplHpmSvRecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSdcHpmcSu ## 
ZcplSdcHpmcSu = 0._dp 
TempcplSdcHpmcSu = cplSdcHpmcSu 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcHpmcSu(gt2,:,:) = ZcplSdcHpmcSu(gt2,:,:) + ZRUZD(gt2,gt1)*TempcplSdcHpmcSu(gt1,:,:) 
 End Do 
End Do 
TempcplSdcHpmcSu = ZcplSdcHpmcSu 
ZcplSdcHpmcSu = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSdcHpmcSu(:,gt2,:) = ZcplSdcHpmcSu(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplSdcHpmcSu(:,gt1,:) 
 End Do 
End Do 
TempcplSdcHpmcSu = ZcplSdcHpmcSu 
ZcplSdcHpmcSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcHpmcSu(:,:,gt2) = ZcplSdcHpmcSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplSdcHpmcSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSeSvImcHpm ## 
ZcplSeSvImcHpm = 0._dp 
TempcplSeSvImcHpm = cplSeSvImcHpm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcHpm(gt2,:,:) = ZcplSeSvImcHpm(gt2,:,:) + ZRUZE(gt2,gt1)*TempcplSeSvImcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplSeSvImcHpm = ZcplSeSvImcHpm 
ZcplSeSvImcHpm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcHpm(:,gt2,:) = ZcplSeSvImcHpm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplSeSvImcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplSeSvImcHpm = ZcplSeSvImcHpm 
ZcplSeSvImcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSeSvImcHpm(:,:,gt2) = ZcplSeSvImcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplSeSvImcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSeSvRecHpm ## 
ZcplSeSvRecHpm = 0._dp 
TempcplSeSvRecHpm = cplSeSvRecHpm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecHpm(gt2,:,:) = ZcplSeSvRecHpm(gt2,:,:) + ZRUZE(gt2,gt1)*TempcplSeSvRecHpm(gt1,:,:) 
 End Do 
End Do 
TempcplSeSvRecHpm = ZcplSeSvRecHpm 
ZcplSeSvRecHpm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecHpm(:,gt2,:) = ZcplSeSvRecHpm(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplSeSvRecHpm(:,gt1,:) 
 End Do 
End Do 
TempcplSeSvRecHpm = ZcplSeSvRecHpm 
ZcplSeSvRecHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSeSvRecHpm(:,:,gt2) = ZcplSeSvRecHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplSeSvRecHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhAhAhAh ## 
ZcplAhAhAhAh = 0._dp 


 ! ## ZcplAhAhhhhh ## 
ZcplAhAhhhhh = 0._dp 


 ! ## ZcplAhAhHpmcHpm ## 
ZcplAhAhHpmcHpm = 0._dp 


 ! ## ZcplAhAhSdcSd ## 
ZcplAhAhSdcSd = 0._dp 


 ! ## ZcplAhAhSecSe ## 
ZcplAhAhSecSe = 0._dp 


 ! ## ZcplAhAhSucSu ## 
ZcplAhAhSucSu = 0._dp 


 ! ## ZcplAhAhSvImSvIm ## 
ZcplAhAhSvImSvIm = 0._dp 


 ! ## ZcplAhAhSvImSvRe ## 
ZcplAhAhSvImSvRe = 0._dp 


 ! ## ZcplAhAhSvReSvRe ## 
ZcplAhAhSvReSvRe = 0._dp 


 ! ## ZcplAhhhHpmcHpm ## 
ZcplAhhhHpmcHpm = 0._dp 


 ! ## ZcplAhhhSvImSvIm ## 
ZcplAhhhSvImSvIm = 0._dp 


 ! ## ZcplAhhhSvImSvRe ## 
ZcplAhhhSvImSvRe = 0._dp 


 ! ## ZcplAhhhSvReSvRe ## 
ZcplAhhhSvReSvRe = 0._dp 


 ! ## ZcplAhHpmSucSd ## 
ZcplAhHpmSucSd = 0._dp 


 ! ## ZcplAhHpmSvImcSe ## 
ZcplAhHpmSvImcSe = 0._dp 


 ! ## ZcplAhHpmSvRecSe ## 
ZcplAhHpmSvRecSe = 0._dp 


 ! ## ZcplAhSdcHpmcSu ## 
ZcplAhSdcHpmcSu = 0._dp 


 ! ## ZcplAhSeSvImcHpm ## 
ZcplAhSeSvImcHpm = 0._dp 


 ! ## ZcplAhSeSvRecHpm ## 
ZcplAhSeSvRecHpm = 0._dp 


 ! ## Zcplhhhhhhhh ## 
Zcplhhhhhhhh = 0._dp 


 ! ## ZcplhhhhHpmcHpm ## 
ZcplhhhhHpmcHpm = 0._dp 


 ! ## ZcplhhhhSdcSd ## 
ZcplhhhhSdcSd = 0._dp 


 ! ## ZcplhhhhSecSe ## 
ZcplhhhhSecSe = 0._dp 


 ! ## ZcplhhhhSucSu ## 
ZcplhhhhSucSu = 0._dp 


 ! ## ZcplhhhhSvImSvIm ## 
ZcplhhhhSvImSvIm = 0._dp 


 ! ## ZcplhhhhSvImSvRe ## 
ZcplhhhhSvImSvRe = 0._dp 


 ! ## ZcplhhhhSvReSvRe ## 
ZcplhhhhSvReSvRe = 0._dp 


 ! ## ZcplhhHpmSucSd ## 
ZcplhhHpmSucSd = 0._dp 


 ! ## ZcplhhHpmSvImcSe ## 
ZcplhhHpmSvImcSe = 0._dp 


 ! ## ZcplhhHpmSvRecSe ## 
ZcplhhHpmSvRecSe = 0._dp 


 ! ## ZcplhhSdcHpmcSu ## 
ZcplhhSdcHpmcSu = 0._dp 


 ! ## ZcplhhSeSvImcHpm ## 
ZcplhhSeSvImcHpm = 0._dp 


 ! ## ZcplhhSeSvRecHpm ## 
ZcplhhSeSvRecHpm = 0._dp 


 ! ## ZcplHpmHpmcHpmcHpm ## 
ZcplHpmHpmcHpmcHpm = 0._dp 


 ! ## ZcplHpmSdcHpmcSd ## 
ZcplHpmSdcHpmcSd = 0._dp 


 ! ## ZcplHpmSecHpmcSe ## 
ZcplHpmSecHpmcSe = 0._dp 


 ! ## ZcplHpmSucHpmcSu ## 
ZcplHpmSucHpmcSu = 0._dp 


 ! ## ZcplHpmSvImSvImcHpm ## 
ZcplHpmSvImSvImcHpm = 0._dp 


 ! ## ZcplHpmSvImSvRecHpm ## 
ZcplHpmSvImSvRecHpm = 0._dp 


 ! ## ZcplHpmSvReSvRecHpm ## 
ZcplHpmSvReSvRecHpm = 0._dp 


 ! ## ZcplSdSdcSdcSd ## 
ZcplSdSdcSdcSd = 0._dp 


 ! ## ZcplSdSecSdcSe ## 
ZcplSdSecSdcSe = 0._dp 


 ! ## ZcplSdSucSdcSu ## 
ZcplSdSucSdcSu = 0._dp 


 ! ## ZcplSdSvImSvImcSd ## 
ZcplSdSvImSvImcSd = 0._dp 


 ! ## ZcplSdSvImcSecSu ## 
ZcplSdSvImcSecSu = 0._dp 


 ! ## ZcplSdSvReSvRecSd ## 
ZcplSdSvReSvRecSd = 0._dp 


 ! ## ZcplSdSvRecSecSu ## 
ZcplSdSvRecSecSu = 0._dp 


 ! ## ZcplSeSecSecSe ## 
ZcplSeSecSecSe = 0._dp 


 ! ## ZcplSeSuSvImcSd ## 
ZcplSeSuSvImcSd = 0._dp 


 ! ## ZcplSeSuSvRecSd ## 
ZcplSeSuSvRecSd = 0._dp 


 ! ## ZcplSeSucSecSu ## 
ZcplSeSucSecSu = 0._dp 


 ! ## ZcplSeSvImSvImcSe ## 
ZcplSeSvImSvImcSe = 0._dp 


 ! ## ZcplSeSvImSvRecSe ## 
ZcplSeSvImSvRecSe = 0._dp 


 ! ## ZcplSeSvReSvRecSe ## 
ZcplSeSvReSvRecSe = 0._dp 


 ! ## ZcplSuSucSucSu ## 
ZcplSuSucSucSu = 0._dp 


 ! ## ZcplSuSvImSvImcSu ## 
ZcplSuSvImSvImcSu = 0._dp 


 ! ## ZcplSuSvImSvRecSu ## 
ZcplSuSvImSvRecSu = 0._dp 


 ! ## ZcplSuSvReSvRecSu ## 
ZcplSuSvReSvRecSu = 0._dp 


 ! ## ZcplSvImSvImSvImSvIm ## 
ZcplSvImSvImSvImSvIm = 0._dp 


 ! ## ZcplSvImSvImSvImSvRe ## 
ZcplSvImSvImSvImSvRe = 0._dp 


 ! ## ZcplSvImSvImSvReSvRe ## 
ZcplSvImSvImSvReSvRe = 0._dp 


 ! ## ZcplSvImSvReSvReSvRe ## 
ZcplSvImSvReSvReSvRe = 0._dp 


 ! ## ZcplSvReSvReSvReSvRe ## 
ZcplSvReSvReSvReSvRe = 0._dp 


 ! ## ZcplAhhhVP ## 
ZcplAhhhVP = 0._dp 
TempcplAhhhVP = cplAhhhVP 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVP(gt2,:) = ZcplAhhhVP(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVP(gt1,:) 
 End Do 
End Do 
TempcplAhhhVP = ZcplAhhhVP 
ZcplAhhhVP = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVP(:,gt2) = ZcplAhhhVP(:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhVP(:,gt1) 
 End Do 
End Do 
TempcplAhhhVP = ZcplAhhhVP 


 ! ## ZcplAhhhVZ ## 
ZcplAhhhVZ = 0._dp 
TempcplAhhhVZ = cplAhhhVZ 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVZ(gt2,:) = ZcplAhhhVZ(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVZ(gt1,:) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 
ZcplAhhhVZ = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVZ(:,gt2) = ZcplAhhhVZ(:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhVZ(:,gt1) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 


 ! ## ZcplAhhhVZp ## 
ZcplAhhhVZp = 0._dp 
TempcplAhhhVZp = cplAhhhVZp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVZp(gt2,:) = ZcplAhhhVZp(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVZp(gt1,:) 
 End Do 
End Do 
TempcplAhhhVZp = ZcplAhhhVZp 
ZcplAhhhVZp = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplAhhhVZp(:,gt2) = ZcplAhhhVZp(:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhVZp(:,gt1) 
 End Do 
End Do 
TempcplAhhhVZp = ZcplAhhhVZp 


 ! ## ZcplAhHpmcVWm ## 
ZcplAhHpmcVWm = 0._dp 
TempcplAhHpmcVWm = cplAhHpmcVWm 
Do gt1=1,4
  Do gt2=1,4
ZcplAhHpmcVWm(gt2,:) = ZcplAhHpmcVWm(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhHpmcVWm(gt1,:) 
 End Do 
End Do 
TempcplAhHpmcVWm = ZcplAhHpmcVWm 
ZcplAhHpmcVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcVWm(:,gt2) = ZcplAhHpmcVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplAhHpmcVWm(:,gt1) 
 End Do 
End Do 
TempcplAhHpmcVWm = ZcplAhHpmcVWm 


 ! ## ZcplAhcHpmVWm ## 
ZcplAhcHpmVWm = 0._dp 
TempcplAhcHpmVWm = cplAhcHpmVWm 
Do gt1=1,4
  Do gt2=1,4
ZcplAhcHpmVWm(gt2,:) = ZcplAhcHpmVWm(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhcHpmVWm(gt1,:) 
 End Do 
End Do 
TempcplAhcHpmVWm = ZcplAhcHpmVWm 
ZcplAhcHpmVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhcHpmVWm(:,gt2) = ZcplAhcHpmVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplAhcHpmVWm(:,gt1) 
 End Do 
End Do 
TempcplAhcHpmVWm = ZcplAhcHpmVWm 


 ! ## ZcplhhHpmcVWm ## 
ZcplhhHpmcVWm = 0._dp 
TempcplhhHpmcVWm = cplhhHpmcVWm 
Do gt1=1,4
  Do gt2=1,4
ZcplhhHpmcVWm(gt2,:) = ZcplhhHpmcVWm(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhHpmcVWm(gt1,:) 
 End Do 
End Do 
TempcplhhHpmcVWm = ZcplhhHpmcVWm 
ZcplhhHpmcVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcVWm(:,gt2) = ZcplhhHpmcVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHpmcVWm(:,gt1) 
 End Do 
End Do 
TempcplhhHpmcVWm = ZcplhhHpmcVWm 


 ! ## ZcplhhcHpmVWm ## 
ZcplhhcHpmVWm = 0._dp 
TempcplhhcHpmVWm = cplhhcHpmVWm 
Do gt1=1,4
  Do gt2=1,4
ZcplhhcHpmVWm(gt2,:) = ZcplhhcHpmVWm(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhcHpmVWm(gt1,:) 
 End Do 
End Do 
TempcplhhcHpmVWm = ZcplhhcHpmVWm 
ZcplhhcHpmVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcHpmVWm(:,gt2) = ZcplhhcHpmVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhcHpmVWm(:,gt1) 
 End Do 
End Do 
TempcplhhcHpmVWm = ZcplhhcHpmVWm 


 ! ## ZcplHpmcHpmVP ## 
ZcplHpmcHpmVP = 0._dp 
TempcplHpmcHpmVP = cplHpmcHpmVP 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVP(gt2,:) = ZcplHpmcHpmVP(gt2,:) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVP(gt1,:) 
 End Do 
End Do 
TempcplHpmcHpmVP = ZcplHpmcHpmVP 
ZcplHpmcHpmVP = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVP(:,gt2) = ZcplHpmcHpmVP(:,gt2) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVP(:,gt1) 
 End Do 
End Do 
TempcplHpmcHpmVP = ZcplHpmcHpmVP 


 ! ## ZcplHpmcHpmVZ ## 
ZcplHpmcHpmVZ = 0._dp 
TempcplHpmcHpmVZ = cplHpmcHpmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZ(gt2,:) = ZcplHpmcHpmVZ(gt2,:) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZ(gt1,:) 
 End Do 
End Do 
TempcplHpmcHpmVZ = ZcplHpmcHpmVZ 
ZcplHpmcHpmVZ = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZ(:,gt2) = ZcplHpmcHpmVZ(:,gt2) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZ(:,gt1) 
 End Do 
End Do 
TempcplHpmcHpmVZ = ZcplHpmcHpmVZ 


 ! ## ZcplHpmcHpmVZp ## 
ZcplHpmcHpmVZp = 0._dp 
TempcplHpmcHpmVZp = cplHpmcHpmVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZp(gt2,:) = ZcplHpmcHpmVZp(gt2,:) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZp(gt1,:) 
 End Do 
End Do 
TempcplHpmcHpmVZp = ZcplHpmcHpmVZp 
ZcplHpmcHpmVZp = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZp(:,gt2) = ZcplHpmcHpmVZp(:,gt2) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZp(:,gt1) 
 End Do 
End Do 
TempcplHpmcHpmVZp = ZcplHpmcHpmVZp 


 ! ## ZcplSdcSdVG ## 
ZcplSdcSdVG = 0._dp 
TempcplSdcSdVG = cplSdcSdVG 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVG(gt2,:) = ZcplSdcSdVG(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVG(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVG = ZcplSdcSdVG 
ZcplSdcSdVG = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVG(:,gt2) = ZcplSdcSdVG(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVG(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVG = ZcplSdcSdVG 


 ! ## ZcplSdcSdVP ## 
ZcplSdcSdVP = 0._dp 
TempcplSdcSdVP = cplSdcSdVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVP(gt2,:) = ZcplSdcSdVP(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVP(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVP = ZcplSdcSdVP 
ZcplSdcSdVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVP(:,gt2) = ZcplSdcSdVP(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVP(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVP = ZcplSdcSdVP 


 ! ## ZcplSdcSdVZ ## 
ZcplSdcSdVZ = 0._dp 
TempcplSdcSdVZ = cplSdcSdVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZ(gt2,:) = ZcplSdcSdVZ(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVZ(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVZ = ZcplSdcSdVZ 
ZcplSdcSdVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZ(:,gt2) = ZcplSdcSdVZ(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVZ(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVZ = ZcplSdcSdVZ 


 ! ## ZcplSdcSdVZp ## 
ZcplSdcSdVZp = 0._dp 
TempcplSdcSdVZp = cplSdcSdVZp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZp(gt2,:) = ZcplSdcSdVZp(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVZp(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVZp = ZcplSdcSdVZp 
ZcplSdcSdVZp = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZp(:,gt2) = ZcplSdcSdVZp(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVZp(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVZp = ZcplSdcSdVZp 


 ! ## ZcplSdcSucVWm ## 
ZcplSdcSucVWm = 0._dp 
TempcplSdcSucVWm = cplSdcSucVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSucVWm(gt2,:) = ZcplSdcSucVWm(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSucVWm(gt1,:) 
 End Do 
End Do 
TempcplSdcSucVWm = ZcplSdcSucVWm 
ZcplSdcSucVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSucVWm(:,gt2) = ZcplSdcSucVWm(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSdcSucVWm(:,gt1) 
 End Do 
End Do 
TempcplSdcSucVWm = ZcplSdcSucVWm 


 ! ## ZcplSeSvImcVWm ## 
ZcplSeSvImcVWm = 0._dp 
TempcplSeSvImcVWm = cplSeSvImcVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcVWm(gt2,:) = ZcplSeSvImcVWm(gt2,:) + ZRUZE(gt2,gt1)*TempcplSeSvImcVWm(gt1,:) 
 End Do 
End Do 
TempcplSeSvImcVWm = ZcplSeSvImcVWm 
ZcplSeSvImcVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcVWm(:,gt2) = ZcplSeSvImcVWm(:,gt2) + ZRUZVI(gt2,gt1)*TempcplSeSvImcVWm(:,gt1) 
 End Do 
End Do 
TempcplSeSvImcVWm = ZcplSeSvImcVWm 


 ! ## ZcplSeSvRecVWm ## 
ZcplSeSvRecVWm = 0._dp 
TempcplSeSvRecVWm = cplSeSvRecVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecVWm(gt2,:) = ZcplSeSvRecVWm(gt2,:) + ZRUZE(gt2,gt1)*TempcplSeSvRecVWm(gt1,:) 
 End Do 
End Do 
TempcplSeSvRecVWm = ZcplSeSvRecVWm 
ZcplSeSvRecVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecVWm(:,gt2) = ZcplSeSvRecVWm(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSeSvRecVWm(:,gt1) 
 End Do 
End Do 
TempcplSeSvRecVWm = ZcplSeSvRecVWm 


 ! ## ZcplSecSeVP ## 
ZcplSecSeVP = 0._dp 
TempcplSecSeVP = cplSecSeVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVP(gt2,:) = ZcplSecSeVP(gt2,:) + ZRUZE(gt2,gt1)*TempcplSecSeVP(gt1,:) 
 End Do 
End Do 
TempcplSecSeVP = ZcplSecSeVP 
ZcplSecSeVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVP(:,gt2) = ZcplSecSeVP(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSecSeVP(:,gt1) 
 End Do 
End Do 
TempcplSecSeVP = ZcplSecSeVP 


 ! ## ZcplSecSeVZ ## 
ZcplSecSeVZ = 0._dp 
TempcplSecSeVZ = cplSecSeVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZ(gt2,:) = ZcplSecSeVZ(gt2,:) + ZRUZE(gt2,gt1)*TempcplSecSeVZ(gt1,:) 
 End Do 
End Do 
TempcplSecSeVZ = ZcplSecSeVZ 
ZcplSecSeVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZ(:,gt2) = ZcplSecSeVZ(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSecSeVZ(:,gt1) 
 End Do 
End Do 
TempcplSecSeVZ = ZcplSecSeVZ 


 ! ## ZcplSecSeVZp ## 
ZcplSecSeVZp = 0._dp 
TempcplSecSeVZp = cplSecSeVZp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZp(gt2,:) = ZcplSecSeVZp(gt2,:) + ZRUZE(gt2,gt1)*TempcplSecSeVZp(gt1,:) 
 End Do 
End Do 
TempcplSecSeVZp = ZcplSecSeVZp 
ZcplSecSeVZp = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZp(:,gt2) = ZcplSecSeVZp(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSecSeVZp(:,gt1) 
 End Do 
End Do 
TempcplSecSeVZp = ZcplSecSeVZp 


 ! ## ZcplSucSuVG ## 
ZcplSucSuVG = 0._dp 
TempcplSucSuVG = cplSucSuVG 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVG(gt2,:) = ZcplSucSuVG(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVG(gt1,:) 
 End Do 
End Do 
TempcplSucSuVG = ZcplSucSuVG 
ZcplSucSuVG = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVG(:,gt2) = ZcplSucSuVG(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVG(:,gt1) 
 End Do 
End Do 
TempcplSucSuVG = ZcplSucSuVG 


 ! ## ZcplSucSuVP ## 
ZcplSucSuVP = 0._dp 
TempcplSucSuVP = cplSucSuVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVP(gt2,:) = ZcplSucSuVP(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVP(gt1,:) 
 End Do 
End Do 
TempcplSucSuVP = ZcplSucSuVP 
ZcplSucSuVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVP(:,gt2) = ZcplSucSuVP(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVP(:,gt1) 
 End Do 
End Do 
TempcplSucSuVP = ZcplSucSuVP 


 ! ## ZcplSucSdVWm ## 
ZcplSucSdVWm = 0._dp 
TempcplSucSdVWm = cplSucSdVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSdVWm(gt2,:) = ZcplSucSdVWm(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSdVWm(gt1,:) 
 End Do 
End Do 
TempcplSucSdVWm = ZcplSucSdVWm 
ZcplSucSdVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSdVWm(:,gt2) = ZcplSucSdVWm(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSucSdVWm(:,gt1) 
 End Do 
End Do 
TempcplSucSdVWm = ZcplSucSdVWm 


 ! ## ZcplSucSuVZ ## 
ZcplSucSuVZ = 0._dp 
TempcplSucSuVZ = cplSucSuVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZ(gt2,:) = ZcplSucSuVZ(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVZ(gt1,:) 
 End Do 
End Do 
TempcplSucSuVZ = ZcplSucSuVZ 
ZcplSucSuVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZ(:,gt2) = ZcplSucSuVZ(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVZ(:,gt1) 
 End Do 
End Do 
TempcplSucSuVZ = ZcplSucSuVZ 


 ! ## ZcplSucSuVZp ## 
ZcplSucSuVZp = 0._dp 
TempcplSucSuVZp = cplSucSuVZp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZp(gt2,:) = ZcplSucSuVZp(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVZp(gt1,:) 
 End Do 
End Do 
TempcplSucSuVZp = ZcplSucSuVZp 
ZcplSucSuVZp = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZp(:,gt2) = ZcplSucSuVZp(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVZp(:,gt1) 
 End Do 
End Do 
TempcplSucSuVZp = ZcplSucSuVZp 


 ! ## ZcplSvImSvReVP ## 
ZcplSvImSvReVP = 0._dp 
TempcplSvImSvReVP = cplSvImSvReVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVP(gt2,:) = ZcplSvImSvReVP(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImSvReVP(gt1,:) 
 End Do 
End Do 
TempcplSvImSvReVP = ZcplSvImSvReVP 
ZcplSvImSvReVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVP(:,gt2) = ZcplSvImSvReVP(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSvImSvReVP(:,gt1) 
 End Do 
End Do 
TempcplSvImSvReVP = ZcplSvImSvReVP 


 ! ## ZcplSvImSvReVZ ## 
ZcplSvImSvReVZ = 0._dp 
TempcplSvImSvReVZ = cplSvImSvReVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZ(gt2,:) = ZcplSvImSvReVZ(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImSvReVZ(gt1,:) 
 End Do 
End Do 
TempcplSvImSvReVZ = ZcplSvImSvReVZ 
ZcplSvImSvReVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZ(:,gt2) = ZcplSvImSvReVZ(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSvImSvReVZ(:,gt1) 
 End Do 
End Do 
TempcplSvImSvReVZ = ZcplSvImSvReVZ 


 ! ## ZcplSvImSvReVZp ## 
ZcplSvImSvReVZp = 0._dp 
TempcplSvImSvReVZp = cplSvImSvReVZp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZp(gt2,:) = ZcplSvImSvReVZp(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImSvReVZp(gt1,:) 
 End Do 
End Do 
TempcplSvImSvReVZp = ZcplSvImSvReVZp 
ZcplSvImSvReVZp = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZp(:,gt2) = ZcplSvImSvReVZp(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSvImSvReVZp(:,gt1) 
 End Do 
End Do 
TempcplSvImSvReVZp = ZcplSvImSvReVZp 


 ! ## ZcplSvImcSeVWm ## 
ZcplSvImcSeVWm = 0._dp 
TempcplSvImcSeVWm = cplSvImcSeVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImcSeVWm(gt2,:) = ZcplSvImcSeVWm(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImcSeVWm(gt1,:) 
 End Do 
End Do 
TempcplSvImcSeVWm = ZcplSvImcSeVWm 
ZcplSvImcSeVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImcSeVWm(:,gt2) = ZcplSvImcSeVWm(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSvImcSeVWm(:,gt1) 
 End Do 
End Do 
TempcplSvImcSeVWm = ZcplSvImcSeVWm 


 ! ## ZcplSvRecSeVWm ## 
ZcplSvRecSeVWm = 0._dp 
TempcplSvRecSeVWm = cplSvRecSeVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSvRecSeVWm(gt2,:) = ZcplSvRecSeVWm(gt2,:) + ZRUZVR(gt2,gt1)*TempcplSvRecSeVWm(gt1,:) 
 End Do 
End Do 
TempcplSvRecSeVWm = ZcplSvRecSeVWm 
ZcplSvRecSeVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvRecSeVWm(:,gt2) = ZcplSvRecSeVWm(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSvRecSeVWm(:,gt1) 
 End Do 
End Do 
TempcplSvRecSeVWm = ZcplSvRecSeVWm 


 ! ## ZcplhhVPVZ ## 
ZcplhhVPVZ = 0._dp 
TempcplhhVPVZ = cplhhVPVZ 
Do gt1=1,4
  Do gt2=1,4
ZcplhhVPVZ(gt2) = ZcplhhVPVZ(gt2) + ZRUZH(gt2,gt1)*TempcplhhVPVZ(gt1) 
 End Do 
End Do 
TempcplhhVPVZ = ZcplhhVPVZ 


 ! ## ZcplhhVPVZp ## 
ZcplhhVPVZp = 0._dp 
TempcplhhVPVZp = cplhhVPVZp 
Do gt1=1,4
  Do gt2=1,4
ZcplhhVPVZp(gt2) = ZcplhhVPVZp(gt2) + ZRUZH(gt2,gt1)*TempcplhhVPVZp(gt1) 
 End Do 
End Do 
TempcplhhVPVZp = ZcplhhVPVZp 


 ! ## ZcplhhcVWmVWm ## 
ZcplhhcVWmVWm = 0._dp 
TempcplhhcVWmVWm = cplhhcVWmVWm 
Do gt1=1,4
  Do gt2=1,4
ZcplhhcVWmVWm(gt2) = ZcplhhcVWmVWm(gt2) + ZRUZH(gt2,gt1)*TempcplhhcVWmVWm(gt1) 
 End Do 
End Do 
TempcplhhcVWmVWm = ZcplhhcVWmVWm 


 ! ## ZcplhhVZVZ ## 
ZcplhhVZVZ = 0._dp 
TempcplhhVZVZ = cplhhVZVZ 
Do gt1=1,4
  Do gt2=1,4
ZcplhhVZVZ(gt2) = ZcplhhVZVZ(gt2) + ZRUZH(gt2,gt1)*TempcplhhVZVZ(gt1) 
 End Do 
End Do 
TempcplhhVZVZ = ZcplhhVZVZ 


 ! ## ZcplhhVZVZp ## 
ZcplhhVZVZp = 0._dp 
TempcplhhVZVZp = cplhhVZVZp 
Do gt1=1,4
  Do gt2=1,4
ZcplhhVZVZp(gt2) = ZcplhhVZVZp(gt2) + ZRUZH(gt2,gt1)*TempcplhhVZVZp(gt1) 
 End Do 
End Do 
TempcplhhVZVZp = ZcplhhVZVZp 


 ! ## ZcplhhVZpVZp ## 
ZcplhhVZpVZp = 0._dp 
TempcplhhVZpVZp = cplhhVZpVZp 
Do gt1=1,4
  Do gt2=1,4
ZcplhhVZpVZp(gt2) = ZcplhhVZpVZp(gt2) + ZRUZH(gt2,gt1)*TempcplhhVZpVZp(gt1) 
 End Do 
End Do 
TempcplhhVZpVZp = ZcplhhVZpVZp 


 ! ## ZcplHpmcVWmVP ## 
ZcplHpmcVWmVP = 0._dp 
TempcplHpmcVWmVP = cplHpmcVWmVP 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcVWmVP(gt2) = ZcplHpmcVWmVP(gt2) + ZRUZP(gt2,gt1)*TempcplHpmcVWmVP(gt1) 
 End Do 
End Do 
TempcplHpmcVWmVP = ZcplHpmcVWmVP 


 ! ## ZcplHpmcVWmVZ ## 
ZcplHpmcVWmVZ = 0._dp 
TempcplHpmcVWmVZ = cplHpmcVWmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcVWmVZ(gt2) = ZcplHpmcVWmVZ(gt2) + ZRUZP(gt2,gt1)*TempcplHpmcVWmVZ(gt1) 
 End Do 
End Do 
TempcplHpmcVWmVZ = ZcplHpmcVWmVZ 


 ! ## ZcplHpmcVWmVZp ## 
ZcplHpmcVWmVZp = 0._dp 
TempcplHpmcVWmVZp = cplHpmcVWmVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcVWmVZp(gt2) = ZcplHpmcVWmVZp(gt2) + ZRUZP(gt2,gt1)*TempcplHpmcVWmVZp(gt1) 
 End Do 
End Do 
TempcplHpmcVWmVZp = ZcplHpmcVWmVZp 


 ! ## ZcplcHpmVPVWm ## 
ZcplcHpmVPVWm = 0._dp 
TempcplcHpmVPVWm = cplcHpmVPVWm 
Do gt1=1,2
  Do gt2=1,2
ZcplcHpmVPVWm(gt2) = ZcplcHpmVPVWm(gt2) + ZRUZP(gt2,gt1)*TempcplcHpmVPVWm(gt1) 
 End Do 
End Do 
TempcplcHpmVPVWm = ZcplcHpmVPVWm 


 ! ## ZcplcHpmVWmVZ ## 
ZcplcHpmVWmVZ = 0._dp 
TempcplcHpmVWmVZ = cplcHpmVWmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplcHpmVWmVZ(gt2) = ZcplcHpmVWmVZ(gt2) + ZRUZP(gt2,gt1)*TempcplcHpmVWmVZ(gt1) 
 End Do 
End Do 
TempcplcHpmVWmVZ = ZcplcHpmVWmVZ 


 ! ## ZcplcHpmVWmVZp ## 
ZcplcHpmVWmVZp = 0._dp 
TempcplcHpmVWmVZp = cplcHpmVWmVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplcHpmVWmVZp(gt2) = ZcplcHpmVWmVZp(gt2) + ZRUZP(gt2,gt1)*TempcplcHpmVWmVZp(gt1) 
 End Do 
End Do 
TempcplcHpmVWmVZp = ZcplcHpmVWmVZp 


 ! ## ZcplAhAhVPVP ## 
ZcplAhAhVPVP = 0._dp 


 ! ## ZcplAhAhVPVZ ## 
ZcplAhAhVPVZ = 0._dp 


 ! ## ZcplAhAhVPVZp ## 
ZcplAhAhVPVZp = 0._dp 


 ! ## ZcplAhAhcVWmVWm ## 
ZcplAhAhcVWmVWm = 0._dp 


 ! ## ZcplAhAhVZVZ ## 
ZcplAhAhVZVZ = 0._dp 


 ! ## ZcplAhAhVZVZp ## 
ZcplAhAhVZVZp = 0._dp 


 ! ## ZcplAhAhVZpVZp ## 
ZcplAhAhVZpVZp = 0._dp 


 ! ## ZcplAhHpmcVWmVP ## 
ZcplAhHpmcVWmVP = 0._dp 


 ! ## ZcplAhHpmcVWmVZ ## 
ZcplAhHpmcVWmVZ = 0._dp 


 ! ## ZcplAhHpmcVWmVZp ## 
ZcplAhHpmcVWmVZp = 0._dp 


 ! ## ZcplAhcHpmVPVWm ## 
ZcplAhcHpmVPVWm = 0._dp 


 ! ## ZcplAhcHpmVWmVZ ## 
ZcplAhcHpmVWmVZ = 0._dp 


 ! ## ZcplAhcHpmVWmVZp ## 
ZcplAhcHpmVWmVZp = 0._dp 


 ! ## ZcplhhhhVPVP ## 
ZcplhhhhVPVP = 0._dp 


 ! ## ZcplhhhhVPVZ ## 
ZcplhhhhVPVZ = 0._dp 


 ! ## ZcplhhhhVPVZp ## 
ZcplhhhhVPVZp = 0._dp 


 ! ## ZcplhhhhcVWmVWm ## 
ZcplhhhhcVWmVWm = 0._dp 


 ! ## ZcplhhhhVZVZ ## 
ZcplhhhhVZVZ = 0._dp 


 ! ## ZcplhhhhVZVZp ## 
ZcplhhhhVZVZp = 0._dp 


 ! ## ZcplhhhhVZpVZp ## 
ZcplhhhhVZpVZp = 0._dp 


 ! ## ZcplhhHpmcVWmVP ## 
ZcplhhHpmcVWmVP = 0._dp 


 ! ## ZcplhhHpmcVWmVZ ## 
ZcplhhHpmcVWmVZ = 0._dp 


 ! ## ZcplhhHpmcVWmVZp ## 
ZcplhhHpmcVWmVZp = 0._dp 


 ! ## ZcplhhcHpmVPVWm ## 
ZcplhhcHpmVPVWm = 0._dp 


 ! ## ZcplhhcHpmVWmVZ ## 
ZcplhhcHpmVWmVZ = 0._dp 


 ! ## ZcplhhcHpmVWmVZp ## 
ZcplhhcHpmVWmVZp = 0._dp 


 ! ## ZcplHpmcHpmVPVP ## 
ZcplHpmcHpmVPVP = 0._dp 


 ! ## ZcplHpmcHpmVPVZ ## 
ZcplHpmcHpmVPVZ = 0._dp 


 ! ## ZcplHpmcHpmVPVZp ## 
ZcplHpmcHpmVPVZp = 0._dp 


 ! ## ZcplHpmcHpmcVWmVWm ## 
ZcplHpmcHpmcVWmVWm = 0._dp 


 ! ## ZcplHpmcHpmVZVZ ## 
ZcplHpmcHpmVZVZ = 0._dp 


 ! ## ZcplHpmcHpmVZVZp ## 
ZcplHpmcHpmVZVZp = 0._dp 


 ! ## ZcplHpmcHpmVZpVZp ## 
ZcplHpmcHpmVZpVZp = 0._dp 


 ! ## ZcplSdcSdVGVG ## 
ZcplSdcSdVGVG = 0._dp 


 ! ## ZcplSdcSdVGVP ## 
ZcplSdcSdVGVP = 0._dp 


 ! ## ZcplSdcSdVGVZ ## 
ZcplSdcSdVGVZ = 0._dp 


 ! ## ZcplSdcSdVGVZp ## 
ZcplSdcSdVGVZp = 0._dp 


 ! ## ZcplSdcSucVWmVG ## 
ZcplSdcSucVWmVG = 0._dp 


 ! ## ZcplSdcSdVPVP ## 
ZcplSdcSdVPVP = 0._dp 


 ! ## ZcplSdcSdVPVZ ## 
ZcplSdcSdVPVZ = 0._dp 


 ! ## ZcplSdcSdVPVZp ## 
ZcplSdcSdVPVZp = 0._dp 


 ! ## ZcplSdcSucVWmVP ## 
ZcplSdcSucVWmVP = 0._dp 


 ! ## ZcplSdcSdcVWmVWm ## 
ZcplSdcSdcVWmVWm = 0._dp 


 ! ## ZcplSdcSdVZVZ ## 
ZcplSdcSdVZVZ = 0._dp 


 ! ## ZcplSdcSdVZVZp ## 
ZcplSdcSdVZVZp = 0._dp 


 ! ## ZcplSdcSucVWmVZ ## 
ZcplSdcSucVWmVZ = 0._dp 


 ! ## ZcplSdcSdVZpVZp ## 
ZcplSdcSdVZpVZp = 0._dp 


 ! ## ZcplSdcSucVWmVZp ## 
ZcplSdcSucVWmVZp = 0._dp 


 ! ## ZcplSeSvImcVWmVP ## 
ZcplSeSvImcVWmVP = 0._dp 


 ! ## ZcplSeSvImcVWmVZ ## 
ZcplSeSvImcVWmVZ = 0._dp 


 ! ## ZcplSeSvImcVWmVZp ## 
ZcplSeSvImcVWmVZp = 0._dp 


 ! ## ZcplSeSvRecVWmVP ## 
ZcplSeSvRecVWmVP = 0._dp 


 ! ## ZcplSeSvRecVWmVZ ## 
ZcplSeSvRecVWmVZ = 0._dp 


 ! ## ZcplSeSvRecVWmVZp ## 
ZcplSeSvRecVWmVZp = 0._dp 


 ! ## ZcplSecSeVPVP ## 
ZcplSecSeVPVP = 0._dp 


 ! ## ZcplSecSeVPVZ ## 
ZcplSecSeVPVZ = 0._dp 


 ! ## ZcplSecSeVPVZp ## 
ZcplSecSeVPVZp = 0._dp 


 ! ## ZcplSecSecVWmVWm ## 
ZcplSecSecVWmVWm = 0._dp 


 ! ## ZcplSecSeVZVZ ## 
ZcplSecSeVZVZ = 0._dp 


 ! ## ZcplSecSeVZVZp ## 
ZcplSecSeVZVZp = 0._dp 


 ! ## ZcplSecSeVZpVZp ## 
ZcplSecSeVZpVZp = 0._dp 


 ! ## ZcplSucSuVGVG ## 
ZcplSucSuVGVG = 0._dp 


 ! ## ZcplSucSuVGVP ## 
ZcplSucSuVGVP = 0._dp 


 ! ## ZcplSucSdVGVWm ## 
ZcplSucSdVGVWm = 0._dp 


 ! ## ZcplSucSuVGVZ ## 
ZcplSucSuVGVZ = 0._dp 


 ! ## ZcplSucSuVGVZp ## 
ZcplSucSuVGVZp = 0._dp 


 ! ## ZcplSucSuVPVP ## 
ZcplSucSuVPVP = 0._dp 


 ! ## ZcplSucSdVPVWm ## 
ZcplSucSdVPVWm = 0._dp 


 ! ## ZcplSucSuVPVZ ## 
ZcplSucSuVPVZ = 0._dp 


 ! ## ZcplSucSuVPVZp ## 
ZcplSucSuVPVZp = 0._dp 


 ! ## ZcplSucSdVWmVZ ## 
ZcplSucSdVWmVZ = 0._dp 


 ! ## ZcplSucSdVWmVZp ## 
ZcplSucSdVWmVZp = 0._dp 


 ! ## ZcplSucSucVWmVWm ## 
ZcplSucSucVWmVWm = 0._dp 


 ! ## ZcplSucSuVZVZ ## 
ZcplSucSuVZVZ = 0._dp 


 ! ## ZcplSucSuVZVZp ## 
ZcplSucSuVZVZp = 0._dp 


 ! ## ZcplSucSuVZpVZp ## 
ZcplSucSuVZpVZp = 0._dp 


 ! ## ZcplSvImSvImVPVP ## 
ZcplSvImSvImVPVP = 0._dp 


 ! ## ZcplSvImSvImVPVZ ## 
ZcplSvImSvImVPVZ = 0._dp 


 ! ## ZcplSvImSvImVPVZp ## 
ZcplSvImSvImVPVZp = 0._dp 


 ! ## ZcplSvImSvImcVWmVWm ## 
ZcplSvImSvImcVWmVWm = 0._dp 


 ! ## ZcplSvImSvImVZVZ ## 
ZcplSvImSvImVZVZ = 0._dp 


 ! ## ZcplSvImSvImVZVZp ## 
ZcplSvImSvImVZVZp = 0._dp 


 ! ## ZcplSvImSvImVZpVZp ## 
ZcplSvImSvImVZpVZp = 0._dp 


 ! ## ZcplSvImcSeVPVWm ## 
ZcplSvImcSeVPVWm = 0._dp 


 ! ## ZcplSvImcSeVWmVZ ## 
ZcplSvImcSeVWmVZ = 0._dp 


 ! ## ZcplSvImcSeVWmVZp ## 
ZcplSvImcSeVWmVZp = 0._dp 


 ! ## ZcplSvReSvReVPVP ## 
ZcplSvReSvReVPVP = 0._dp 


 ! ## ZcplSvReSvReVPVZ ## 
ZcplSvReSvReVPVZ = 0._dp 


 ! ## ZcplSvReSvReVPVZp ## 
ZcplSvReSvReVPVZp = 0._dp 


 ! ## ZcplSvReSvRecVWmVWm ## 
ZcplSvReSvRecVWmVWm = 0._dp 


 ! ## ZcplSvReSvReVZVZ ## 
ZcplSvReSvReVZVZ = 0._dp 


 ! ## ZcplSvReSvReVZVZp ## 
ZcplSvReSvReVZVZp = 0._dp 


 ! ## ZcplSvReSvReVZpVZp ## 
ZcplSvReSvReVZpVZp = 0._dp 


 ! ## ZcplSvRecSeVPVWm ## 
ZcplSvRecSeVPVWm = 0._dp 


 ! ## ZcplSvRecSeVWmVZ ## 
ZcplSvRecSeVWmVZ = 0._dp 


 ! ## ZcplSvRecSeVWmVZp ## 
ZcplSvRecSeVWmVZp = 0._dp 


 ! ## ZcplVGVGVG ## 
ZcplVGVGVG = 0._dp 
TempcplVGVGVG = cplVGVGVG 
ZcplVGVGVG = TempcplVGVGVG 


 ! ## ZcplcVWmVPVWm ## 
ZcplcVWmVPVWm = 0._dp 
TempcplcVWmVPVWm = cplcVWmVPVWm 
ZcplcVWmVPVWm = TempcplcVWmVPVWm 


 ! ## ZcplcVWmVWmVZ ## 
ZcplcVWmVWmVZ = 0._dp 
TempcplcVWmVWmVZ = cplcVWmVWmVZ 
ZcplcVWmVWmVZ = TempcplcVWmVWmVZ 


 ! ## ZcplcVWmVWmVZp ## 
ZcplcVWmVWmVZp = 0._dp 
TempcplcVWmVWmVZp = cplcVWmVWmVZp 
ZcplcVWmVWmVZp = TempcplcVWmVWmVZp 


 ! ## ZcplcChaChaAhL ## 
ZcplcChaChaAhL = 0._dp 
TempcplcChaChaAhL = cplcChaChaAhL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhL(gt2,:,:) = ZcplcChaChaAhL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChaAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChaAhL = ZcplcChaChaAhL 
ZcplcChaChaAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhL(:,gt2,:) = ZcplcChaChaAhL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcChaChaAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChaAhL = ZcplcChaChaAhL 
ZcplcChaChaAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcChaChaAhL(:,:,gt2) = ZcplcChaChaAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcChaChaAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChaAhR ## 
ZcplcChaChaAhR = 0._dp 
TempcplcChaChaAhR = cplcChaChaAhR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhR(gt2,:,:) = ZcplcChaChaAhR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChaAhR = ZcplcChaChaAhR 
ZcplcChaChaAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhR(:,gt2,:) = ZcplcChaChaAhR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcChaChaAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChaAhR = ZcplcChaChaAhR 
ZcplcChaChaAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcChaChaAhR(:,:,gt2) = ZcplcChaChaAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcChaChaAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChiAhL ## 
ZcplChiChiAhL = 0._dp 
TempcplChiChiAhL = cplChiChiAhL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiAhL(gt2,:,:) = ZcplChiChiAhL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChiAhL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChiAhL = ZcplChiChiAhL 
ZcplChiChiAhL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiAhL(:,gt2,:) = ZcplChiChiAhL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiAhL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChiAhL = ZcplChiChiAhL 
ZcplChiChiAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplChiChiAhL(:,:,gt2) = ZcplChiChiAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplChiChiAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChiAhR ## 
ZcplChiChiAhR = 0._dp 
TempcplChiChiAhR = cplChiChiAhR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiAhR(gt2,:,:) = ZcplChiChiAhR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChiAhR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChiAhR = ZcplChiChiAhR 
ZcplChiChiAhR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiAhR(:,gt2,:) = ZcplChiChiAhR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiAhR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChiAhR = ZcplChiChiAhR 
ZcplChiChiAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplChiChiAhR(:,:,gt2) = ZcplChiChiAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplChiChiAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdAhL ## 
ZcplcFdFdAhL = 0._dp 
TempcplcFdFdAhL = cplcFdFdAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(gt2,:,:) = ZcplcFdFdAhL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(:,gt2,:) = ZcplcFdFdAhL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFdFdAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFdFdAhL(:,:,gt2) = ZcplcFdFdAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdAhR ## 
ZcplcFdFdAhR = 0._dp 
TempcplcFdFdAhR = cplcFdFdAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(gt2,:,:) = ZcplcFdFdAhR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(:,gt2,:) = ZcplcFdFdAhR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFdFdAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFdFdAhR(:,:,gt2) = ZcplcFdFdAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhL ## 
ZcplcFeFeAhL = 0._dp 
TempcplcFeFeAhL = cplcFeFeAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(gt2,:,:) = ZcplcFeFeAhL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFeAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(:,gt2,:) = ZcplcFeFeAhL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcFeFeAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFeFeAhL(:,:,gt2) = ZcplcFeFeAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhR ## 
ZcplcFeFeAhR = 0._dp 
TempcplcFeFeAhR = cplcFeFeAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(gt2,:,:) = ZcplcFeFeAhR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(:,gt2,:) = ZcplcFeFeAhR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcFeFeAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFeFeAhR(:,:,gt2) = ZcplcFeFeAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhL ## 
ZcplcFuFuAhL = 0._dp 
TempcplcFuFuAhL = cplcFuFuAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(gt2,:,:) = ZcplcFuFuAhL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(:,gt2,:) = ZcplcFuFuAhL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFuFuAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFuFuAhL(:,:,gt2) = ZcplcFuFuAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhR ## 
ZcplcFuFuAhR = 0._dp 
TempcplcFuFuAhR = cplcFuFuAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(gt2,:,:) = ZcplcFuFuAhR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(:,gt2,:) = ZcplcFuFuAhR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFuFuAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFuFuAhR(:,:,gt2) = ZcplcFuFuAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhL ## 
ZcplFvFvAhL = 0._dp 
TempcplFvFvAhL = cplFvFvAhL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhL(gt2,:,:) = ZcplFvFvAhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhL(:,gt2,:) = ZcplFvFvAhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplFvFvAhL(:,:,gt2) = ZcplFvFvAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhR ## 
ZcplFvFvAhR = 0._dp 
TempcplFvFvAhR = cplFvFvAhR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhR(gt2,:,:) = ZcplFvFvAhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhR(:,gt2,:) = ZcplFvFvAhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplFvFvAhR(:,:,gt2) = ZcplFvFvAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacHpmL ## 
ZcplChiChacHpmL = 0._dp 
TempcplChiChacHpmL = cplChiChacHpmL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChacHpmL(gt2,:,:) = ZcplChiChacHpmL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChacHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChacHpmL = ZcplChiChacHpmL 
ZcplChiChacHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmL(:,gt2,:) = ZcplChiChacHpmL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplChiChacHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChacHpmL = ZcplChiChacHpmL 
ZcplChiChacHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmL(:,:,gt2) = ZcplChiChacHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplChiChacHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacHpmR ## 
ZcplChiChacHpmR = 0._dp 
TempcplChiChacHpmR = cplChiChacHpmR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChacHpmR(gt2,:,:) = ZcplChiChacHpmR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChacHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChacHpmR = ZcplChiChacHpmR 
ZcplChiChacHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmR(:,gt2,:) = ZcplChiChacHpmR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplChiChacHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChacHpmR = ZcplChiChacHpmR 
ZcplChiChacHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmR(:,:,gt2) = ZcplChiChacHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplChiChacHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChaFucSdL ## 
ZcplChaFucSdL = 0._dp 
TempcplChaFucSdL = cplChaFucSdL 
Do gt1=1,2
  Do gt2=1,2
ZcplChaFucSdL(gt2,:,:) = ZcplChaFucSdL(gt2,:,:) + ZRUUM(gt2,gt1)*TempcplChaFucSdL(gt1,:,:) 
 End Do 
End Do 
TempcplChaFucSdL = ZcplChaFucSdL 
ZcplChaFucSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChaFucSdL(:,gt2,:) = ZcplChaFucSdL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplChaFucSdL(:,gt1,:) 
 End Do 
End Do 
TempcplChaFucSdL = ZcplChaFucSdL 
ZcplChaFucSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChaFucSdL(:,:,gt2) = ZcplChaFucSdL(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChaFucSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChaFucSdR ## 
ZcplChaFucSdR = 0._dp 
TempcplChaFucSdR = cplChaFucSdR 
Do gt1=1,2
  Do gt2=1,2
ZcplChaFucSdR(gt2,:,:) = ZcplChaFucSdR(gt2,:,:) + ZRUUPc(gt2,gt1)*TempcplChaFucSdR(gt1,:,:) 
 End Do 
End Do 
TempcplChaFucSdR = ZcplChaFucSdR 
ZcplChaFucSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChaFucSdR(:,gt2,:) = ZcplChaFucSdR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplChaFucSdR(:,gt1,:) 
 End Do 
End Do 
TempcplChaFucSdR = ZcplChaFucSdR 
ZcplChaFucSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChaFucSdR(:,:,gt2) = ZcplChaFucSdR(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChaFucSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvChacSeL ## 
ZcplFvChacSeL = 0._dp 
TempcplFvChacSeL = cplFvChacSeL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeL(gt2,:,:) = ZcplFvChacSeL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvChacSeL(gt1,:,:) 
 End Do 
End Do 
TempcplFvChacSeL = ZcplFvChacSeL 
ZcplFvChacSeL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvChacSeL(:,gt2,:) = ZcplFvChacSeL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplFvChacSeL(:,gt1,:) 
 End Do 
End Do 
TempcplFvChacSeL = ZcplFvChacSeL 
ZcplFvChacSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeL(:,:,gt2) = ZcplFvChacSeL(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplFvChacSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvChacSeR ## 
ZcplFvChacSeR = 0._dp 
TempcplFvChacSeR = cplFvChacSeR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeR(gt2,:,:) = ZcplFvChacSeR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvChacSeR(gt1,:,:) 
 End Do 
End Do 
TempcplFvChacSeR = ZcplFvChacSeR 
ZcplFvChacSeR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvChacSeR(:,gt2,:) = ZcplFvChacSeR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplFvChacSeR(:,gt1,:) 
 End Do 
End Do 
TempcplFvChacSeR = ZcplFvChacSeR 
ZcplFvChacSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeR(:,:,gt2) = ZcplFvChacSeR(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplFvChacSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChahhL ## 
ZcplcChaChahhL = 0._dp 
TempcplcChaChahhL = cplcChaChahhL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhL(gt2,:,:) = ZcplcChaChahhL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChahhL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChahhL = ZcplcChaChahhL 
ZcplcChaChahhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhL(:,gt2,:) = ZcplcChaChahhL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcChaChahhL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChahhL = ZcplcChaChahhL 
ZcplcChaChahhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcChaChahhL(:,:,gt2) = ZcplcChaChahhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcChaChahhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChahhR ## 
ZcplcChaChahhR = 0._dp 
TempcplcChaChahhR = cplcChaChahhR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhR(gt2,:,:) = ZcplcChaChahhR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChahhR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChahhR = ZcplcChaChahhR 
ZcplcChaChahhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhR(:,gt2,:) = ZcplcChaChahhR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcChaChahhR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChahhR = ZcplcChaChahhR 
ZcplcChaChahhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcChaChahhR(:,:,gt2) = ZcplcChaChahhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcChaChahhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChaSuL ## 
ZcplcFdChaSuL = 0._dp 
TempcplcFdChaSuL = cplcFdChaSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChaSuL(gt2,:,:) = ZcplcFdChaSuL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdChaSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChaSuL = ZcplcFdChaSuL 
ZcplcFdChaSuL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdChaSuL(:,gt2,:) = ZcplcFdChaSuL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFdChaSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChaSuL = ZcplcFdChaSuL 
ZcplcFdChaSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChaSuL(:,:,gt2) = ZcplcFdChaSuL(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFdChaSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChaSuR ## 
ZcplcFdChaSuR = 0._dp 
TempcplcFdChaSuR = cplcFdChaSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChaSuR(gt2,:,:) = ZcplcFdChaSuR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdChaSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChaSuR = ZcplcFdChaSuR 
ZcplcFdChaSuR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdChaSuR(:,gt2,:) = ZcplcFdChaSuR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFdChaSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChaSuR = ZcplcFdChaSuR 
ZcplcFdChaSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChaSuR(:,:,gt2) = ZcplcFdChaSuR(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFdChaSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvImL ## 
ZcplcFeChaSvImL = 0._dp 
TempcplcFeChaSvImL = cplcFeChaSvImL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvImL(gt2,:,:) = ZcplcFeChaSvImL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChaSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvImL = ZcplcFeChaSvImL 
ZcplcFeChaSvImL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvImL(:,gt2,:) = ZcplcFeChaSvImL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFeChaSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvImL = ZcplcFeChaSvImL 
ZcplcFeChaSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvImL(:,:,gt2) = ZcplcFeChaSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcFeChaSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvImR ## 
ZcplcFeChaSvImR = 0._dp 
TempcplcFeChaSvImR = cplcFeChaSvImR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvImR(gt2,:,:) = ZcplcFeChaSvImR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChaSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvImR = ZcplcFeChaSvImR 
ZcplcFeChaSvImR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvImR(:,gt2,:) = ZcplcFeChaSvImR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFeChaSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvImR = ZcplcFeChaSvImR 
ZcplcFeChaSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvImR(:,:,gt2) = ZcplcFeChaSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcFeChaSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvReL ## 
ZcplcFeChaSvReL = 0._dp 
TempcplcFeChaSvReL = cplcFeChaSvReL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvReL(gt2,:,:) = ZcplcFeChaSvReL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChaSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvReL = ZcplcFeChaSvReL 
ZcplcFeChaSvReL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvReL(:,gt2,:) = ZcplcFeChaSvReL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFeChaSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvReL = ZcplcFeChaSvReL 
ZcplcFeChaSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvReL(:,:,gt2) = ZcplcFeChaSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcFeChaSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvReR ## 
ZcplcFeChaSvReR = 0._dp 
TempcplcFeChaSvReR = cplcFeChaSvReR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvReR(gt2,:,:) = ZcplcFeChaSvReR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChaSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvReR = ZcplcFeChaSvReR 
ZcplcFeChaSvReR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvReR(:,gt2,:) = ZcplcFeChaSvReR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFeChaSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvReR = ZcplcFeChaSvReR 
ZcplcFeChaSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvReR(:,:,gt2) = ZcplcFeChaSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcFeChaSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChihhL ## 
ZcplChiChihhL = 0._dp 
TempcplChiChihhL = cplChiChihhL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChihhL(gt2,:,:) = ZcplChiChihhL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChihhL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChihhL = ZcplChiChihhL 
ZcplChiChihhL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChihhL(:,gt2,:) = ZcplChiChihhL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChihhL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChihhL = ZcplChiChihhL 
ZcplChiChihhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplChiChihhL(:,:,gt2) = ZcplChiChihhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplChiChihhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChihhR ## 
ZcplChiChihhR = 0._dp 
TempcplChiChihhR = cplChiChihhR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChihhR(gt2,:,:) = ZcplChiChihhR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChihhR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChihhR = ZcplChiChihhR 
ZcplChiChihhR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChihhR(:,gt2,:) = ZcplChiChihhR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChihhR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChihhR = ZcplChiChihhR 
ZcplChiChihhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplChiChihhR(:,:,gt2) = ZcplChiChihhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplChiChihhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFdcSdL ## 
ZcplChiFdcSdL = 0._dp 
TempcplChiFdcSdL = cplChiFdcSdL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFdcSdL(gt2,:,:) = ZcplChiFdcSdL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFdcSdL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFdcSdL = ZcplChiFdcSdL 
ZcplChiFdcSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFdcSdL(:,gt2,:) = ZcplChiFdcSdL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplChiFdcSdL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFdcSdL = ZcplChiFdcSdL 
ZcplChiFdcSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFdcSdL(:,:,gt2) = ZcplChiFdcSdL(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChiFdcSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFdcSdR ## 
ZcplChiFdcSdR = 0._dp 
TempcplChiFdcSdR = cplChiFdcSdR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFdcSdR(gt2,:,:) = ZcplChiFdcSdR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFdcSdR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFdcSdR = ZcplChiFdcSdR 
ZcplChiFdcSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFdcSdR(:,gt2,:) = ZcplChiFdcSdR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplChiFdcSdR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFdcSdR = ZcplChiFdcSdR 
ZcplChiFdcSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFdcSdR(:,:,gt2) = ZcplChiFdcSdR(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChiFdcSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFecSeL ## 
ZcplChiFecSeL = 0._dp 
TempcplChiFecSeL = cplChiFecSeL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFecSeL(gt2,:,:) = ZcplChiFecSeL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFecSeL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFecSeL = ZcplChiFecSeL 
ZcplChiFecSeL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFecSeL(:,gt2,:) = ZcplChiFecSeL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplChiFecSeL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFecSeL = ZcplChiFecSeL 
ZcplChiFecSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFecSeL(:,:,gt2) = ZcplChiFecSeL(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplChiFecSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFecSeR ## 
ZcplChiFecSeR = 0._dp 
TempcplChiFecSeR = cplChiFecSeR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFecSeR(gt2,:,:) = ZcplChiFecSeR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFecSeR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFecSeR = ZcplChiFecSeR 
ZcplChiFecSeR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFecSeR(:,gt2,:) = ZcplChiFecSeR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplChiFecSeR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFecSeR = ZcplChiFecSeR 
ZcplChiFecSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFecSeR(:,:,gt2) = ZcplChiFecSeR(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplChiFecSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFucSuL ## 
ZcplChiFucSuL = 0._dp 
TempcplChiFucSuL = cplChiFucSuL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFucSuL(gt2,:,:) = ZcplChiFucSuL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFucSuL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFucSuL = ZcplChiFucSuL 
ZcplChiFucSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFucSuL(:,gt2,:) = ZcplChiFucSuL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplChiFucSuL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFucSuL = ZcplChiFucSuL 
ZcplChiFucSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFucSuL(:,:,gt2) = ZcplChiFucSuL(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplChiFucSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFucSuR ## 
ZcplChiFucSuR = 0._dp 
TempcplChiFucSuR = cplChiFucSuR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFucSuR(gt2,:,:) = ZcplChiFucSuR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFucSuR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFucSuR = ZcplChiFucSuR 
ZcplChiFucSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFucSuR(:,gt2,:) = ZcplChiFucSuR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplChiFucSuR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFucSuR = ZcplChiFucSuR 
ZcplChiFucSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFucSuR(:,:,gt2) = ZcplChiFucSuR(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplChiFucSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvImL ## 
ZcplChiFvSvImL = 0._dp 
TempcplChiFvSvImL = cplChiFvSvImL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFvSvImL(gt2,:,:) = ZcplChiFvSvImL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFvSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvImL = ZcplChiFvSvImL 
ZcplChiFvSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImL(:,gt2,:) = ZcplChiFvSvImL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplChiFvSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvImL = ZcplChiFvSvImL 
ZcplChiFvSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImL(:,:,gt2) = ZcplChiFvSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplChiFvSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvImR ## 
ZcplChiFvSvImR = 0._dp 
TempcplChiFvSvImR = cplChiFvSvImR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFvSvImR(gt2,:,:) = ZcplChiFvSvImR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFvSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvImR = ZcplChiFvSvImR 
ZcplChiFvSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImR(:,gt2,:) = ZcplChiFvSvImR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplChiFvSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvImR = ZcplChiFvSvImR 
ZcplChiFvSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImR(:,:,gt2) = ZcplChiFvSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplChiFvSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvReL ## 
ZcplChiFvSvReL = 0._dp 
TempcplChiFvSvReL = cplChiFvSvReL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFvSvReL(gt2,:,:) = ZcplChiFvSvReL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFvSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvReL = ZcplChiFvSvReL 
ZcplChiFvSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReL(:,gt2,:) = ZcplChiFvSvReL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplChiFvSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvReL = ZcplChiFvSvReL 
ZcplChiFvSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReL(:,:,gt2) = ZcplChiFvSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplChiFvSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvReR ## 
ZcplChiFvSvReR = 0._dp 
TempcplChiFvSvReR = cplChiFvSvReR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiFvSvReR(gt2,:,:) = ZcplChiFvSvReR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFvSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvReR = ZcplChiFvSvReR 
ZcplChiFvSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReR(:,gt2,:) = ZcplChiFvSvReR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplChiFvSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvReR = ZcplChiFvSvReR 
ZcplChiFvSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReR(:,:,gt2) = ZcplChiFvSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplChiFvSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChiHpmL ## 
ZcplcChaChiHpmL = 0._dp 
TempcplcChaChiHpmL = cplcChaChiHpmL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmL(gt2,:,:) = ZcplcChaChiHpmL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChiHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChiHpmL = ZcplcChaChiHpmL 
ZcplcChaChiHpmL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcChaChiHpmL(:,gt2,:) = ZcplcChaChiHpmL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcChaChiHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChiHpmL = ZcplcChaChiHpmL 
ZcplcChaChiHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmL(:,:,gt2) = ZcplcChaChiHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcChaChiHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChiHpmR ## 
ZcplcChaChiHpmR = 0._dp 
TempcplcChaChiHpmR = cplcChaChiHpmR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmR(gt2,:,:) = ZcplcChaChiHpmR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChiHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChiHpmR = ZcplcChaChiHpmR 
ZcplcChaChiHpmR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcChaChiHpmR(:,gt2,:) = ZcplcChaChiHpmR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcChaChiHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChiHpmR = ZcplcChaChiHpmR 
ZcplcChaChiHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmR(:,:,gt2) = ZcplcChaChiHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcChaChiHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChiSdL ## 
ZcplcFdChiSdL = 0._dp 
TempcplcFdChiSdL = cplcFdChiSdL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChiSdL(gt2,:,:) = ZcplcFdChiSdL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdChiSdL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChiSdL = ZcplcFdChiSdL 
ZcplcFdChiSdL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFdChiSdL(:,gt2,:) = ZcplcFdChiSdL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFdChiSdL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChiSdL = ZcplcFdChiSdL 
ZcplcFdChiSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChiSdL(:,:,gt2) = ZcplcFdChiSdL(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdChiSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChiSdR ## 
ZcplcFdChiSdR = 0._dp 
TempcplcFdChiSdR = cplcFdChiSdR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChiSdR(gt2,:,:) = ZcplcFdChiSdR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdChiSdR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChiSdR = ZcplcFdChiSdR 
ZcplcFdChiSdR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFdChiSdR(:,gt2,:) = ZcplcFdChiSdR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFdChiSdR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChiSdR = ZcplcFdChiSdR 
ZcplcFdChiSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChiSdR(:,:,gt2) = ZcplcFdChiSdR(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdChiSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChiSeL ## 
ZcplcFeChiSeL = 0._dp 
TempcplcFeChiSeL = cplcFeChiSeL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChiSeL(gt2,:,:) = ZcplcFeChiSeL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChiSeL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChiSeL = ZcplcFeChiSeL 
ZcplcFeChiSeL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFeChiSeL(:,gt2,:) = ZcplcFeChiSeL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFeChiSeL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChiSeL = ZcplcFeChiSeL 
ZcplcFeChiSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChiSeL(:,:,gt2) = ZcplcFeChiSeL(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcFeChiSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChiSeR ## 
ZcplcFeChiSeR = 0._dp 
TempcplcFeChiSeR = cplcFeChiSeR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChiSeR(gt2,:,:) = ZcplcFeChiSeR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChiSeR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChiSeR = ZcplcFeChiSeR 
ZcplcFeChiSeR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFeChiSeR(:,gt2,:) = ZcplcFeChiSeR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFeChiSeR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChiSeR = ZcplcFeChiSeR 
ZcplcFeChiSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChiSeR(:,:,gt2) = ZcplcFeChiSeR(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcFeChiSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuChiSuL ## 
ZcplcFuChiSuL = 0._dp 
TempcplcFuChiSuL = cplcFuChiSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuChiSuL(gt2,:,:) = ZcplcFuChiSuL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuChiSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuChiSuL = ZcplcFuChiSuL 
ZcplcFuChiSuL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFuChiSuL(:,gt2,:) = ZcplcFuChiSuL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFuChiSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuChiSuL = ZcplcFuChiSuL 
ZcplcFuChiSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuChiSuL(:,:,gt2) = ZcplcFuChiSuL(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuChiSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuChiSuR ## 
ZcplcFuChiSuR = 0._dp 
TempcplcFuChiSuR = cplcFuChiSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuChiSuR(gt2,:,:) = ZcplcFuChiSuR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuChiSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuChiSuR = ZcplcFuChiSuR 
ZcplcFuChiSuR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcFuChiSuR(:,gt2,:) = ZcplcFuChiSuR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFuChiSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuChiSuR = ZcplcFuChiSuR 
ZcplcFuChiSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuChiSuR(:,:,gt2) = ZcplcFuChiSuR(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuChiSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFdcSdL ## 
ZcplGluFdcSdL = 0._dp 
TempcplGluFdcSdL = cplGluFdcSdL 
ZcplGluFdcSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFdcSdL(gt2,:) = ZcplGluFdcSdL(gt2,:) + ZRUZDL(gt2,gt1)*TempcplGluFdcSdL(gt1,:) 
 End Do 
End Do 
TempcplGluFdcSdL = ZcplGluFdcSdL 
ZcplGluFdcSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFdcSdL(:,gt2) = ZcplGluFdcSdL(:,gt2) + ZRUZDc(gt2,gt1)*TempcplGluFdcSdL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFdcSdR ## 
ZcplGluFdcSdR = 0._dp 
TempcplGluFdcSdR = cplGluFdcSdR 
ZcplGluFdcSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFdcSdR(gt2,:) = ZcplGluFdcSdR(gt2,:) + ZRUZDRc(gt2,gt1)*TempcplGluFdcSdR(gt1,:) 
 End Do 
End Do 
TempcplGluFdcSdR = ZcplGluFdcSdR 
ZcplGluFdcSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFdcSdR(:,gt2) = ZcplGluFdcSdR(:,gt2) + ZRUZDc(gt2,gt1)*TempcplGluFdcSdR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhL ## 
ZcplcFdFdhhL = 0._dp 
TempcplcFdFdhhL = cplcFdFdhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(gt2,:,:) = ZcplcFdFdhhL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(:,gt2,:) = ZcplcFdFdhhL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFdFdhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFdFdhhL(:,:,gt2) = ZcplcFdFdhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhR ## 
ZcplcFdFdhhR = 0._dp 
TempcplcFdFdhhR = cplcFdFdhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(gt2,:,:) = ZcplcFdFdhhR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(:,gt2,:) = ZcplcFdFdhhR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFdFdhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFdFdhhR(:,:,gt2) = ZcplcFdFdhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFdcSuL ## 
ZcplcChaFdcSuL = 0._dp 
TempcplcChaFdcSuL = cplcChaFdcSuL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFdcSuL(gt2,:,:) = ZcplcChaFdcSuL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFdcSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFdcSuL = ZcplcChaFdcSuL 
ZcplcChaFdcSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFdcSuL(:,gt2,:) = ZcplcChaFdcSuL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcChaFdcSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFdcSuL = ZcplcChaFdcSuL 
ZcplcChaFdcSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFdcSuL(:,:,gt2) = ZcplcChaFdcSuL(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplcChaFdcSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFdcSuR ## 
ZcplcChaFdcSuR = 0._dp 
TempcplcChaFdcSuR = cplcChaFdcSuR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFdcSuR(gt2,:,:) = ZcplcChaFdcSuR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFdcSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFdcSuR = ZcplcChaFdcSuR 
ZcplcChaFdcSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFdcSuR(:,gt2,:) = ZcplcChaFdcSuR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcChaFdcSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFdcSuR = ZcplcChaFdcSuR 
ZcplcChaFdcSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFdcSuR(:,:,gt2) = ZcplcChaFdcSuR(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplcChaFdcSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdcHpmL ## 
ZcplcFuFdcHpmL = 0._dp 
TempcplcFuFdcHpmL = cplcFuFdcHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmL(gt2,:,:) = ZcplcFuFdcHpmL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFdcHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdcHpmL = ZcplcFuFdcHpmL 
ZcplcFuFdcHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmL(:,gt2,:) = ZcplcFuFdcHpmL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFuFdcHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdcHpmL = ZcplcFuFdcHpmL 
ZcplcFuFdcHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFdcHpmL(:,:,gt2) = ZcplcFuFdcHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdcHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdcHpmR ## 
ZcplcFuFdcHpmR = 0._dp 
TempcplcFuFdcHpmR = cplcFuFdcHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmR(gt2,:,:) = ZcplcFuFdcHpmR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFdcHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdcHpmR = ZcplcFuFdcHpmR 
ZcplcFuFdcHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmR(:,gt2,:) = ZcplcFuFdcHpmR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFuFdcHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdcHpmR = ZcplcFuFdcHpmR 
ZcplcFuFdcHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFdcHpmR(:,:,gt2) = ZcplcFuFdcHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdcHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFecHpmL ## 
ZcplFvFecHpmL = 0._dp 
TempcplFvFecHpmL = cplFvFecHpmL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecHpmL(gt2,:,:) = ZcplFvFecHpmL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFecHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFecHpmL = ZcplFvFecHpmL 
ZcplFvFecHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecHpmL(:,gt2,:) = ZcplFvFecHpmL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplFvFecHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFecHpmL = ZcplFvFecHpmL 
ZcplFvFecHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFecHpmL(:,:,gt2) = ZcplFvFecHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFecHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFecHpmR ## 
ZcplFvFecHpmR = 0._dp 
TempcplFvFecHpmR = cplFvFecHpmR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecHpmR(gt2,:,:) = ZcplFvFecHpmR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFecHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFecHpmR = ZcplFvFecHpmR 
ZcplFvFecHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecHpmR(:,gt2,:) = ZcplFvFecHpmR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplFvFecHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFecHpmR = ZcplFvFecHpmR 
ZcplFvFecHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFecHpmR(:,:,gt2) = ZcplFvFecHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFecHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhL ## 
ZcplcFeFehhL = 0._dp 
TempcplcFeFehhL = cplcFeFehhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(gt2,:,:) = ZcplcFeFehhL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFehhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(:,gt2,:) = ZcplcFeFehhL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcFeFehhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFeFehhL(:,:,gt2) = ZcplcFeFehhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhR ## 
ZcplcFeFehhR = 0._dp 
TempcplcFeFehhR = cplcFeFehhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(gt2,:,:) = ZcplcFeFehhR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFehhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(:,gt2,:) = ZcplcFeFehhR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcFeFehhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFeFehhR(:,:,gt2) = ZcplcFeFehhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvImL ## 
ZcplcChaFeSvImL = 0._dp 
TempcplcChaFeSvImL = cplcChaFeSvImL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvImL(gt2,:,:) = ZcplcChaFeSvImL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFeSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvImL = ZcplcChaFeSvImL 
ZcplcChaFeSvImL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvImL(:,gt2,:) = ZcplcChaFeSvImL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcChaFeSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvImL = ZcplcChaFeSvImL 
ZcplcChaFeSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvImL(:,:,gt2) = ZcplcChaFeSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcChaFeSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvImR ## 
ZcplcChaFeSvImR = 0._dp 
TempcplcChaFeSvImR = cplcChaFeSvImR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvImR(gt2,:,:) = ZcplcChaFeSvImR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFeSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvImR = ZcplcChaFeSvImR 
ZcplcChaFeSvImR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvImR(:,gt2,:) = ZcplcChaFeSvImR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcChaFeSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvImR = ZcplcChaFeSvImR 
ZcplcChaFeSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvImR(:,:,gt2) = ZcplcChaFeSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcChaFeSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvReL ## 
ZcplcChaFeSvReL = 0._dp 
TempcplcChaFeSvReL = cplcChaFeSvReL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvReL(gt2,:,:) = ZcplcChaFeSvReL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFeSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvReL = ZcplcChaFeSvReL 
ZcplcChaFeSvReL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvReL(:,gt2,:) = ZcplcChaFeSvReL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcChaFeSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvReL = ZcplcChaFeSvReL 
ZcplcChaFeSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvReL(:,:,gt2) = ZcplcChaFeSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcChaFeSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvReR ## 
ZcplcChaFeSvReR = 0._dp 
TempcplcChaFeSvReR = cplcChaFeSvReR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvReR(gt2,:,:) = ZcplcChaFeSvReR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFeSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvReR = ZcplcChaFeSvReR 
ZcplcChaFeSvReR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvReR(:,gt2,:) = ZcplcChaFeSvReR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcChaFeSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvReR = ZcplcChaFeSvReR 
ZcplcChaFeSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvReR(:,:,gt2) = ZcplcChaFeSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcChaFeSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFucSuL ## 
ZcplGluFucSuL = 0._dp 
TempcplGluFucSuL = cplGluFucSuL 
ZcplGluFucSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFucSuL(gt2,:) = ZcplGluFucSuL(gt2,:) + ZRUZUL(gt2,gt1)*TempcplGluFucSuL(gt1,:) 
 End Do 
End Do 
TempcplGluFucSuL = ZcplGluFucSuL 
ZcplGluFucSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFucSuL(:,gt2) = ZcplGluFucSuL(:,gt2) + ZRUZUc(gt2,gt1)*TempcplGluFucSuL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFucSuR ## 
ZcplGluFucSuR = 0._dp 
TempcplGluFucSuR = cplGluFucSuR 
ZcplGluFucSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFucSuR(gt2,:) = ZcplGluFucSuR(gt2,:) + ZRUZURc(gt2,gt1)*TempcplGluFucSuR(gt1,:) 
 End Do 
End Do 
TempcplGluFucSuR = ZcplGluFucSuR 
ZcplGluFucSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFucSuR(:,gt2) = ZcplGluFucSuR(:,gt2) + ZRUZUc(gt2,gt1)*TempcplGluFucSuR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhL ## 
ZcplcFuFuhhL = 0._dp 
TempcplcFuFuhhL = cplcFuFuhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(gt2,:,:) = ZcplcFuFuhhL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(:,gt2,:) = ZcplcFuFuhhL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFuFuhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFuFuhhL(:,:,gt2) = ZcplcFuFuhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhR ## 
ZcplcFuFuhhR = 0._dp 
TempcplcFuFuhhR = cplcFuFuhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(gt2,:,:) = ZcplcFuFuhhR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(:,gt2,:) = ZcplcFuFuhhR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFuFuhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcFuFuhhR(:,:,gt2) = ZcplcFuFuhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFuHpmL ## 
ZcplcFdFuHpmL = 0._dp 
TempcplcFdFuHpmL = cplcFdFuHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmL(gt2,:,:) = ZcplcFdFuHpmL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFuHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFuHpmL = ZcplcFdFuHpmL 
ZcplcFdFuHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmL(:,gt2,:) = ZcplcFdFuHpmL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFdFuHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFuHpmL = ZcplcFdFuHpmL 
ZcplcFdFuHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFuHpmL(:,:,gt2) = ZcplcFdFuHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFuHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFuHpmR ## 
ZcplcFdFuHpmR = 0._dp 
TempcplcFdFuHpmR = cplcFdFuHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmR(gt2,:,:) = ZcplcFdFuHpmR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFuHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFuHpmR = ZcplcFdFuHpmR 
ZcplcFdFuHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmR(:,gt2,:) = ZcplcFdFuHpmR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFdFuHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFuHpmR = ZcplcFdFuHpmR 
ZcplcFdFuHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFuHpmR(:,:,gt2) = ZcplcFdFuHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFuHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvhhL ## 
ZcplFvFvhhL = 0._dp 
TempcplFvFvhhL = cplFvFvhhL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhL(gt2,:,:) = ZcplFvFvhhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhL(:,gt2,:) = ZcplFvFvhhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplFvFvhhL(:,:,gt2) = ZcplFvFvhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplFvFvhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvhhR ## 
ZcplFvFvhhR = 0._dp 
TempcplFvFvhhR = cplFvFvhhR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhR(gt2,:,:) = ZcplFvFvhhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhR(:,gt2,:) = ZcplFvFvhhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplFvFvhhR(:,:,gt2) = ZcplFvFvhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplFvFvhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvHpmL ## 
ZcplcFeFvHpmL = 0._dp 
TempcplcFeFvHpmL = cplcFeFvHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvHpmL(gt2,:,:) = ZcplcFeFvHpmL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFvHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvHpmL = ZcplcFeFvHpmL 
ZcplcFeFvHpmL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvHpmL(:,gt2,:) = ZcplcFeFvHpmL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplcFeFvHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvHpmL = ZcplcFeFvHpmL 
ZcplcFeFvHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFvHpmL(:,:,gt2) = ZcplcFeFvHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvHpmR ## 
ZcplcFeFvHpmR = 0._dp 
TempcplcFeFvHpmR = cplcFeFvHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvHpmR(gt2,:,:) = ZcplcFeFvHpmR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFvHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvHpmR = ZcplcFeFvHpmR 
ZcplcFeFvHpmR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvHpmR(:,gt2,:) = ZcplcFeFvHpmR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplcFeFvHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvHpmR = ZcplcFeFvHpmR 
ZcplcFeFvHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFvHpmR(:,:,gt2) = ZcplcFeFvHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFvSeL ## 
ZcplcChaFvSeL = 0._dp 
TempcplcChaFvSeL = cplcChaFvSeL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFvSeL(gt2,:,:) = ZcplcChaFvSeL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFvSeL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFvSeL = ZcplcChaFvSeL 
ZcplcChaFvSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeL(:,gt2,:) = ZcplcChaFvSeL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplcChaFvSeL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFvSeL = ZcplcChaFvSeL 
ZcplcChaFvSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeL(:,:,gt2) = ZcplcChaFvSeL(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcChaFvSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFvSeR ## 
ZcplcChaFvSeR = 0._dp 
TempcplcChaFvSeR = cplcChaFvSeR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFvSeR(gt2,:,:) = ZcplcChaFvSeR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFvSeR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFvSeR = ZcplcChaFvSeR 
ZcplcChaFvSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeR(:,gt2,:) = ZcplcChaFvSeR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplcChaFvSeR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFvSeR = ZcplcChaFvSeR 
ZcplcChaFvSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeR(:,:,gt2) = ZcplcChaFvSeR(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcChaFvSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdGluSdL ## 
ZcplcFdGluSdL = 0._dp 
TempcplcFdGluSdL = cplcFdGluSdL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdGluSdL(gt2,:) = ZcplcFdGluSdL(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdGluSdL(gt1,:) 
 End Do 
End Do 
TempcplcFdGluSdL = ZcplcFdGluSdL 
ZcplcFdGluSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdGluSdL(:,gt2) = ZcplcFdGluSdL(:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdGluSdL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdGluSdR ## 
ZcplcFdGluSdR = 0._dp 
TempcplcFdGluSdR = cplcFdGluSdR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdGluSdR(gt2,:) = ZcplcFdGluSdR(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdGluSdR(gt1,:) 
 End Do 
End Do 
TempcplcFdGluSdR = ZcplcFdGluSdR 
ZcplcFdGluSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdGluSdR(:,gt2) = ZcplcFdGluSdR(:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdGluSdR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuGluSuL ## 
ZcplcFuGluSuL = 0._dp 
TempcplcFuGluSuL = cplcFuGluSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuGluSuL(gt2,:) = ZcplcFuGluSuL(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuGluSuL(gt1,:) 
 End Do 
End Do 
TempcplcFuGluSuL = ZcplcFuGluSuL 
ZcplcFuGluSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuGluSuL(:,gt2) = ZcplcFuGluSuL(:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuGluSuL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuGluSuR ## 
ZcplcFuGluSuR = 0._dp 
TempcplcFuGluSuR = cplcFuGluSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuGluSuR(gt2,:) = ZcplcFuGluSuR(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuGluSuR(gt1,:) 
 End Do 
End Do 
TempcplcFuGluSuR = ZcplcFuGluSuR 
ZcplcFuGluSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuGluSuR(:,gt2) = ZcplcFuGluSuR(:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuGluSuR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChacFuSdL ## 
ZcplcChacFuSdL = 0._dp 
TempcplcChacFuSdL = cplcChacFuSdL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChacFuSdL(gt2,:,:) = ZcplcChacFuSdL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChacFuSdL(gt1,:,:) 
 End Do 
End Do 
TempcplcChacFuSdL = ZcplcChacFuSdL 
ZcplcChacFuSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChacFuSdL(:,gt2,:) = ZcplcChacFuSdL(:,gt2,:) + ZRUZUR(gt2,gt1)*TempcplcChacFuSdL(:,gt1,:) 
 End Do 
End Do 
TempcplcChacFuSdL = ZcplcChacFuSdL 
ZcplcChacFuSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChacFuSdL(:,:,gt2) = ZcplcChacFuSdL(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcChacFuSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChacFuSdR ## 
ZcplcChacFuSdR = 0._dp 
TempcplcChacFuSdR = cplcChacFuSdR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChacFuSdR(gt2,:,:) = ZcplcChacFuSdR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChacFuSdR(gt1,:,:) 
 End Do 
End Do 
TempcplcChacFuSdR = ZcplcChacFuSdR 
ZcplcChacFuSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChacFuSdR(:,gt2,:) = ZcplcChacFuSdR(:,gt2,:) + ZRUZULc(gt2,gt1)*TempcplcChacFuSdR(:,gt1,:) 
 End Do 
End Do 
TempcplcChacFuSdR = ZcplcChacFuSdR 
ZcplcChacFuSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChacFuSdR(:,:,gt2) = ZcplcChacFuSdR(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcChacFuSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacVWmL ## 
ZcplChiChacVWmL = 0._dp 
TempcplChiChacVWmL = cplChiChacVWmL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChacVWmL(gt2,:) = ZcplChiChacVWmL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChacVWmL(gt1,:) 
 End Do 
End Do 
TempcplChiChacVWmL = ZcplChiChacVWmL 
ZcplChiChacVWmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacVWmL(:,gt2) = ZcplChiChacVWmL(:,gt2) + ZRUUM(gt2,gt1)*TempcplChiChacVWmL(:,gt1) 
 End Do 
End Do 
TempcplChiChacVWmL = ZcplChiChacVWmL 


 ! ## ZcplChiChacVWmR ## 
ZcplChiChacVWmR = 0._dp 
TempcplChiChacVWmR = cplChiChacVWmR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChacVWmR(gt2,:) = ZcplChiChacVWmR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChacVWmR(gt1,:) 
 End Do 
End Do 
TempcplChiChacVWmR = ZcplChiChacVWmR 
ZcplChiChacVWmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacVWmR(:,gt2) = ZcplChiChacVWmR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplChiChacVWmR(:,gt1) 
 End Do 
End Do 
TempcplChiChacVWmR = ZcplChiChacVWmR 


 ! ## ZcplcChaChaVPL ## 
ZcplcChaChaVPL = 0._dp 
TempcplcChaChaVPL = cplcChaChaVPL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPL(gt2,:) = ZcplcChaChaVPL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaVPL(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVPL = ZcplcChaChaVPL 
ZcplcChaChaVPL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPL(:,gt2) = ZcplcChaChaVPL(:,gt2) + ZRUUM(gt2,gt1)*TempcplcChaChaVPL(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVPL = ZcplcChaChaVPL 


 ! ## ZcplcChaChaVPR ## 
ZcplcChaChaVPR = 0._dp 
TempcplcChaChaVPR = cplcChaChaVPR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPR(gt2,:) = ZcplcChaChaVPR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChaVPR(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVPR = ZcplcChaChaVPR 
ZcplcChaChaVPR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPR(:,gt2) = ZcplcChaChaVPR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplcChaChaVPR(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVPR = ZcplcChaChaVPR 


 ! ## ZcplcChaChaVZL ## 
ZcplcChaChaVZL = 0._dp 
TempcplcChaChaVZL = cplcChaChaVZL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZL(gt2,:) = ZcplcChaChaVZL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaVZL(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZL = ZcplcChaChaVZL 
ZcplcChaChaVZL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZL(:,gt2) = ZcplcChaChaVZL(:,gt2) + ZRUUM(gt2,gt1)*TempcplcChaChaVZL(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZL = ZcplcChaChaVZL 


 ! ## ZcplcChaChaVZR ## 
ZcplcChaChaVZR = 0._dp 
TempcplcChaChaVZR = cplcChaChaVZR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZR(gt2,:) = ZcplcChaChaVZR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChaVZR(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZR = ZcplcChaChaVZR 
ZcplcChaChaVZR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZR(:,gt2) = ZcplcChaChaVZR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplcChaChaVZR(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZR = ZcplcChaChaVZR 


 ! ## ZcplcChaChaVZpL ## 
ZcplcChaChaVZpL = 0._dp 
TempcplcChaChaVZpL = cplcChaChaVZpL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZpL(gt2,:) = ZcplcChaChaVZpL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaVZpL(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZpL = ZcplcChaChaVZpL 
ZcplcChaChaVZpL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZpL(:,gt2) = ZcplcChaChaVZpL(:,gt2) + ZRUUM(gt2,gt1)*TempcplcChaChaVZpL(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZpL = ZcplcChaChaVZpL 


 ! ## ZcplcChaChaVZpR ## 
ZcplcChaChaVZpR = 0._dp 
TempcplcChaChaVZpR = cplcChaChaVZpR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZpR(gt2,:) = ZcplcChaChaVZpR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChaVZpR(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZpR = ZcplcChaChaVZpR 
ZcplcChaChaVZpR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZpR(:,gt2) = ZcplcChaChaVZpR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplcChaChaVZpR(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZpR = ZcplcChaChaVZpR 


 ! ## ZcplChiChiVPL ## 
ZcplChiChiVPL = 0._dp 
TempcplChiChiVPL = cplChiChiVPL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVPL(gt2,:) = ZcplChiChiVPL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiVPL(gt1,:) 
 End Do 
End Do 
TempcplChiChiVPL = ZcplChiChiVPL 
ZcplChiChiVPL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVPL(:,gt2) = ZcplChiChiVPL(:,gt2) + ZRUZN(gt2,gt1)*TempcplChiChiVPL(:,gt1) 
 End Do 
End Do 
TempcplChiChiVPL = ZcplChiChiVPL 


 ! ## ZcplChiChiVPR ## 
ZcplChiChiVPR = 0._dp 
TempcplChiChiVPR = cplChiChiVPR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVPR(gt2,:) = ZcplChiChiVPR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiVPR(gt1,:) 
 End Do 
End Do 
TempcplChiChiVPR = ZcplChiChiVPR 
ZcplChiChiVPR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVPR(:,gt2) = ZcplChiChiVPR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplChiChiVPR(:,gt1) 
 End Do 
End Do 
TempcplChiChiVPR = ZcplChiChiVPR 


 ! ## ZcplChiChiVZL ## 
ZcplChiChiVZL = 0._dp 
TempcplChiChiVZL = cplChiChiVZL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZL(gt2,:) = ZcplChiChiVZL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiVZL(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZL = ZcplChiChiVZL 
ZcplChiChiVZL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZL(:,gt2) = ZcplChiChiVZL(:,gt2) + ZRUZN(gt2,gt1)*TempcplChiChiVZL(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZL = ZcplChiChiVZL 


 ! ## ZcplChiChiVZR ## 
ZcplChiChiVZR = 0._dp 
TempcplChiChiVZR = cplChiChiVZR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZR(gt2,:) = ZcplChiChiVZR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiVZR(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZR = ZcplChiChiVZR 
ZcplChiChiVZR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZR(:,gt2) = ZcplChiChiVZR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplChiChiVZR(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZR = ZcplChiChiVZR 


 ! ## ZcplChiChiVZpL ## 
ZcplChiChiVZpL = 0._dp 
TempcplChiChiVZpL = cplChiChiVZpL 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZpL(gt2,:) = ZcplChiChiVZpL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiVZpL(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZpL = ZcplChiChiVZpL 
ZcplChiChiVZpL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZpL(:,gt2) = ZcplChiChiVZpL(:,gt2) + ZRUZN(gt2,gt1)*TempcplChiChiVZpL(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZpL = ZcplChiChiVZpL 


 ! ## ZcplChiChiVZpR ## 
ZcplChiChiVZpR = 0._dp 
TempcplChiChiVZpR = cplChiChiVZpR 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZpR(gt2,:) = ZcplChiChiVZpR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiVZpR(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZpR = ZcplChiChiVZpR 
ZcplChiChiVZpR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplChiChiVZpR(:,gt2) = ZcplChiChiVZpR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplChiChiVZpR(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZpR = ZcplChiChiVZpR 


 ! ## ZcplcChaChiVWmL ## 
ZcplcChaChiVWmL = 0._dp 
TempcplcChaChiVWmL = cplcChaChiVWmL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiVWmL(gt2,:) = ZcplcChaChiVWmL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChiVWmL(gt1,:) 
 End Do 
End Do 
TempcplcChaChiVWmL = ZcplcChaChiVWmL 
ZcplcChaChiVWmL = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcChaChiVWmL(:,gt2) = ZcplcChaChiVWmL(:,gt2) + ZRUZN(gt2,gt1)*TempcplcChaChiVWmL(:,gt1) 
 End Do 
End Do 
TempcplcChaChiVWmL = ZcplcChaChiVWmL 


 ! ## ZcplcChaChiVWmR ## 
ZcplcChaChiVWmR = 0._dp 
TempcplcChaChiVWmR = cplcChaChiVWmR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiVWmR(gt2,:) = ZcplcChaChiVWmR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChiVWmR(gt1,:) 
 End Do 
End Do 
TempcplcChaChiVWmR = ZcplcChaChiVWmR 
ZcplcChaChiVWmR = 0._dp 
Do gt1=1,7
  Do gt2=1,7
ZcplcChaChiVWmR(:,gt2) = ZcplcChaChiVWmR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplcChaChiVWmR(:,gt1) 
 End Do 
End Do 
TempcplcChaChiVWmR = ZcplcChaChiVWmR 


 ! ## ZcplcFdFdVGL ## 
ZcplcFdFdVGL = 0._dp 
TempcplcFdFdVGL = cplcFdFdVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(gt2,:) = ZcplcFdFdVGL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVGL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 
ZcplcFdFdVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(:,gt2) = ZcplcFdFdVGL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVGL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 


 ! ## ZcplcFdFdVGR ## 
ZcplcFdFdVGR = 0._dp 
TempcplcFdFdVGR = cplcFdFdVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(gt2,:) = ZcplcFdFdVGR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVGR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 
ZcplcFdFdVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(:,gt2) = ZcplcFdFdVGR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVGR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 


 ! ## ZcplcFdFdVPL ## 
ZcplcFdFdVPL = 0._dp 
TempcplcFdFdVPL = cplcFdFdVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(gt2,:) = ZcplcFdFdVPL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVPL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 
ZcplcFdFdVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(:,gt2) = ZcplcFdFdVPL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVPL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 


 ! ## ZcplcFdFdVPR ## 
ZcplcFdFdVPR = 0._dp 
TempcplcFdFdVPR = cplcFdFdVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(gt2,:) = ZcplcFdFdVPR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVPR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 
ZcplcFdFdVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(:,gt2) = ZcplcFdFdVPR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVPR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 


 ! ## ZcplcFdFdVZL ## 
ZcplcFdFdVZL = 0._dp 
TempcplcFdFdVZL = cplcFdFdVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(gt2,:) = ZcplcFdFdVZL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVZL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 
ZcplcFdFdVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(:,gt2) = ZcplcFdFdVZL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVZL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 


 ! ## ZcplcFdFdVZR ## 
ZcplcFdFdVZR = 0._dp 
TempcplcFdFdVZR = cplcFdFdVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(gt2,:) = ZcplcFdFdVZR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVZR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 
ZcplcFdFdVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(:,gt2) = ZcplcFdFdVZR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVZR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 


 ! ## ZcplcFdFdVZpL ## 
ZcplcFdFdVZpL = 0._dp 
TempcplcFdFdVZpL = cplcFdFdVZpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZpL(gt2,:) = ZcplcFdFdVZpL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZpL = ZcplcFdFdVZpL 
ZcplcFdFdVZpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZpL(:,gt2) = ZcplcFdFdVZpL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZpL = ZcplcFdFdVZpL 


 ! ## ZcplcFdFdVZpR ## 
ZcplcFdFdVZpR = 0._dp 
TempcplcFdFdVZpR = cplcFdFdVZpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZpR(gt2,:) = ZcplcFdFdVZpR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZpR = ZcplcFdFdVZpR 
ZcplcFdFdVZpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZpR(:,gt2) = ZcplcFdFdVZpR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZpR = ZcplcFdFdVZpR 


 ! ## ZcplcFuFdcVWmL ## 
ZcplcFuFdcVWmL = 0._dp 
TempcplcFuFdcVWmL = cplcFuFdcVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmL(gt2,:) = ZcplcFuFdcVWmL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFdcVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWmL = ZcplcFuFdcVWmL 
ZcplcFuFdcVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmL(:,gt2) = ZcplcFuFdcVWmL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFuFdcVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWmL = ZcplcFuFdcVWmL 


 ! ## ZcplcFuFdcVWmR ## 
ZcplcFuFdcVWmR = 0._dp 
TempcplcFuFdcVWmR = cplcFuFdcVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmR(gt2,:) = ZcplcFuFdcVWmR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFdcVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWmR = ZcplcFuFdcVWmR 
ZcplcFuFdcVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmR(:,gt2) = ZcplcFuFdcVWmR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFuFdcVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWmR = ZcplcFuFdcVWmR 


 ! ## ZcplFvFecVWmL ## 
ZcplFvFecVWmL = 0._dp 
TempcplFvFecVWmL = cplFvFecVWmL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecVWmL(gt2,:) = ZcplFvFecVWmL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFecVWmL(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWmL = ZcplFvFecVWmL 
ZcplFvFecVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWmL(:,gt2) = ZcplFvFecVWmL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplFvFecVWmL(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWmL = ZcplFvFecVWmL 


 ! ## ZcplFvFecVWmR ## 
ZcplFvFecVWmR = 0._dp 
TempcplFvFecVWmR = cplFvFecVWmR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecVWmR(gt2,:) = ZcplFvFecVWmR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFecVWmR(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWmR = ZcplFvFecVWmR 
ZcplFvFecVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWmR(:,gt2) = ZcplFvFecVWmR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplFvFecVWmR(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWmR = ZcplFvFecVWmR 


 ! ## ZcplcFeFeVPL ## 
ZcplcFeFeVPL = 0._dp 
TempcplcFeFeVPL = cplcFeFeVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(gt2,:) = ZcplcFeFeVPL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeVPL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 
ZcplcFeFeVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(:,gt2) = ZcplcFeFeVPL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplcFeFeVPL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 


 ! ## ZcplcFeFeVPR ## 
ZcplcFeFeVPR = 0._dp 
TempcplcFeFeVPR = cplcFeFeVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(gt2,:) = ZcplcFeFeVPR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFeVPR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 
ZcplcFeFeVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(:,gt2) = ZcplcFeFeVPR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplcFeFeVPR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 


 ! ## ZcplcFeFeVZL ## 
ZcplcFeFeVZL = 0._dp 
TempcplcFeFeVZL = cplcFeFeVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(gt2,:) = ZcplcFeFeVZL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeVZL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 
ZcplcFeFeVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(:,gt2) = ZcplcFeFeVZL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplcFeFeVZL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 


 ! ## ZcplcFeFeVZR ## 
ZcplcFeFeVZR = 0._dp 
TempcplcFeFeVZR = cplcFeFeVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(gt2,:) = ZcplcFeFeVZR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFeVZR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 
ZcplcFeFeVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(:,gt2) = ZcplcFeFeVZR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplcFeFeVZR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 


 ! ## ZcplcFeFeVZpL ## 
ZcplcFeFeVZpL = 0._dp 
TempcplcFeFeVZpL = cplcFeFeVZpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZpL(gt2,:) = ZcplcFeFeVZpL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZpL = ZcplcFeFeVZpL 
ZcplcFeFeVZpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZpL(:,gt2) = ZcplcFeFeVZpL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplcFeFeVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZpL = ZcplcFeFeVZpL 


 ! ## ZcplcFeFeVZpR ## 
ZcplcFeFeVZpR = 0._dp 
TempcplcFeFeVZpR = cplcFeFeVZpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZpR(gt2,:) = ZcplcFeFeVZpR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFeVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZpR = ZcplcFeFeVZpR 
ZcplcFeFeVZpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZpR(:,gt2) = ZcplcFeFeVZpR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplcFeFeVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZpR = ZcplcFeFeVZpR 


 ! ## ZcplcFuFuVGL ## 
ZcplcFuFuVGL = 0._dp 
TempcplcFuFuVGL = cplcFuFuVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(gt2,:) = ZcplcFuFuVGL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVGL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 
ZcplcFuFuVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(:,gt2) = ZcplcFuFuVGL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVGL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 


 ! ## ZcplcFuFuVGR ## 
ZcplcFuFuVGR = 0._dp 
TempcplcFuFuVGR = cplcFuFuVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(gt2,:) = ZcplcFuFuVGR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVGR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 
ZcplcFuFuVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(:,gt2) = ZcplcFuFuVGR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVGR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 


 ! ## ZcplcFuFuVPL ## 
ZcplcFuFuVPL = 0._dp 
TempcplcFuFuVPL = cplcFuFuVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(gt2,:) = ZcplcFuFuVPL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVPL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 
ZcplcFuFuVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(:,gt2) = ZcplcFuFuVPL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVPL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 


 ! ## ZcplcFuFuVPR ## 
ZcplcFuFuVPR = 0._dp 
TempcplcFuFuVPR = cplcFuFuVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(gt2,:) = ZcplcFuFuVPR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVPR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 
ZcplcFuFuVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(:,gt2) = ZcplcFuFuVPR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVPR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 


 ! ## ZcplcFdFuVWmL ## 
ZcplcFdFuVWmL = 0._dp 
TempcplcFdFuVWmL = cplcFdFuVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmL(gt2,:) = ZcplcFdFuVWmL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFuVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWmL = ZcplcFdFuVWmL 
ZcplcFdFuVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmL(:,gt2) = ZcplcFdFuVWmL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFdFuVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWmL = ZcplcFdFuVWmL 


 ! ## ZcplcFdFuVWmR ## 
ZcplcFdFuVWmR = 0._dp 
TempcplcFdFuVWmR = cplcFdFuVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmR(gt2,:) = ZcplcFdFuVWmR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFuVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWmR = ZcplcFdFuVWmR 
ZcplcFdFuVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmR(:,gt2) = ZcplcFdFuVWmR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFdFuVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWmR = ZcplcFdFuVWmR 


 ! ## ZcplcFuFuVZL ## 
ZcplcFuFuVZL = 0._dp 
TempcplcFuFuVZL = cplcFuFuVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(gt2,:) = ZcplcFuFuVZL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVZL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 
ZcplcFuFuVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(:,gt2) = ZcplcFuFuVZL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVZL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 


 ! ## ZcplcFuFuVZR ## 
ZcplcFuFuVZR = 0._dp 
TempcplcFuFuVZR = cplcFuFuVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(gt2,:) = ZcplcFuFuVZR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVZR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 
ZcplcFuFuVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(:,gt2) = ZcplcFuFuVZR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVZR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 


 ! ## ZcplcFuFuVZpL ## 
ZcplcFuFuVZpL = 0._dp 
TempcplcFuFuVZpL = cplcFuFuVZpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZpL(gt2,:) = ZcplcFuFuVZpL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZpL = ZcplcFuFuVZpL 
ZcplcFuFuVZpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZpL(:,gt2) = ZcplcFuFuVZpL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZpL = ZcplcFuFuVZpL 


 ! ## ZcplcFuFuVZpR ## 
ZcplcFuFuVZpR = 0._dp 
TempcplcFuFuVZpR = cplcFuFuVZpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZpR(gt2,:) = ZcplcFuFuVZpR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZpR = ZcplcFuFuVZpR 
ZcplcFuFuVZpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZpR(:,gt2) = ZcplcFuFuVZpR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZpR = ZcplcFuFuVZpR 


 ! ## ZcplFvFvVPL ## 
ZcplFvFvVPL = 0._dp 
TempcplFvFvVPL = cplFvFvVPL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVPL(gt2,:) = ZcplFvFvVPL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVPL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVPL = ZcplFvFvVPL 
ZcplFvFvVPL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVPL(:,gt2) = ZcplFvFvVPL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVPL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVPL = ZcplFvFvVPL 


 ! ## ZcplFvFvVPR ## 
ZcplFvFvVPR = 0._dp 
TempcplFvFvVPR = cplFvFvVPR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVPR(gt2,:) = ZcplFvFvVPR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVPR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVPR = ZcplFvFvVPR 
ZcplFvFvVPR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVPR(:,gt2) = ZcplFvFvVPR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVPR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVPR = ZcplFvFvVPR 


 ! ## ZcplFvFvVZL ## 
ZcplFvFvVZL = 0._dp 
TempcplFvFvVZL = cplFvFvVZL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZL(gt2,:) = ZcplFvFvVZL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVZL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 
ZcplFvFvVZL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZL(:,gt2) = ZcplFvFvVZL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVZL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 


 ! ## ZcplFvFvVZR ## 
ZcplFvFvVZR = 0._dp 
TempcplFvFvVZR = cplFvFvVZR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZR(gt2,:) = ZcplFvFvVZR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVZR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 
ZcplFvFvVZR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZR(:,gt2) = ZcplFvFvVZR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVZR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 


 ! ## ZcplFvFvVZpL ## 
ZcplFvFvVZpL = 0._dp 
TempcplFvFvVZpL = cplFvFvVZpL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZpL(gt2,:) = ZcplFvFvVZpL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVZpL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZpL = ZcplFvFvVZpL 
ZcplFvFvVZpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZpL(:,gt2) = ZcplFvFvVZpL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVZpL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZpL = ZcplFvFvVZpL 


 ! ## ZcplFvFvVZpR ## 
ZcplFvFvVZpR = 0._dp 
TempcplFvFvVZpR = cplFvFvVZpR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZpR(gt2,:) = ZcplFvFvVZpR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVZpR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZpR = ZcplFvFvVZpR 
ZcplFvFvVZpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZpR(:,gt2) = ZcplFvFvVZpR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVZpR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZpR = ZcplFvFvVZpR 


 ! ## ZcplcFeFvVWmL ## 
ZcplcFeFvVWmL = 0._dp 
TempcplcFeFvVWmL = cplcFeFvVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWmL(gt2,:) = ZcplcFeFvVWmL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFvVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWmL = ZcplcFeFvVWmL 
ZcplcFeFvVWmL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvVWmL(:,gt2) = ZcplcFeFvVWmL(:,gt2) + ZRUUV(gt2,gt1)*TempcplcFeFvVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWmL = ZcplcFeFvVWmL 


 ! ## ZcplcFeFvVWmR ## 
ZcplcFeFvVWmR = 0._dp 
TempcplcFeFvVWmR = cplcFeFvVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWmR(gt2,:) = ZcplcFeFvVWmR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFvVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWmR = ZcplcFeFvVWmR 
ZcplcFeFvVWmR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvVWmR(:,gt2) = ZcplcFeFvVWmR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplcFeFvVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWmR = ZcplcFeFvVWmR 


 ! ## ZcplGluGluVGL ## 
ZcplGluGluVGL = 0._dp 
TempcplGluGluVGL = cplGluGluVGL 
ZcplGluGluVGL = TempcplGluGluVGL 


 ! ## ZcplGluGluVGR ## 
ZcplGluGluVGR = 0._dp 
TempcplGluGluVGR = cplGluGluVGR 
ZcplGluGluVGR = TempcplGluGluVGR 


 ! ## ZcplVGVGVGVG1 ## 
ZcplVGVGVGVG1 = 0._dp 


 ! ## ZcplVGVGVGVG2 ## 
ZcplVGVGVGVG2 = 0._dp 


 ! ## ZcplVGVGVGVG3 ## 
ZcplVGVGVGVG3 = 0._dp 


 ! ## ZcplcVWmVPVPVWm1 ## 
ZcplcVWmVPVPVWm1 = 0._dp 


 ! ## ZcplcVWmVPVPVWm2 ## 
ZcplcVWmVPVPVWm2 = 0._dp 


 ! ## ZcplcVWmVPVPVWm3 ## 
ZcplcVWmVPVPVWm3 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ1 ## 
ZcplcVWmVPVWmVZ1 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ2 ## 
ZcplcVWmVPVWmVZ2 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ3 ## 
ZcplcVWmVPVWmVZ3 = 0._dp 


 ! ## ZcplcVWmVPVWmVZp1 ## 
ZcplcVWmVPVWmVZp1 = 0._dp 


 ! ## ZcplcVWmVPVWmVZp2 ## 
ZcplcVWmVPVWmVZp2 = 0._dp 


 ! ## ZcplcVWmVPVWmVZp3 ## 
ZcplcVWmVPVWmVZp3 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm1 ## 
ZcplcVWmcVWmVWmVWm1 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm2 ## 
ZcplcVWmcVWmVWmVWm2 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm3 ## 
ZcplcVWmcVWmVWmVWm3 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ1 ## 
ZcplcVWmVWmVZVZ1 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ2 ## 
ZcplcVWmVWmVZVZ2 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ3 ## 
ZcplcVWmVWmVZVZ3 = 0._dp 


 ! ## ZcplcVWmVWmVZVZp1 ## 
ZcplcVWmVWmVZVZp1 = 0._dp 


 ! ## ZcplcVWmVWmVZVZp2 ## 
ZcplcVWmVWmVZVZp2 = 0._dp 


 ! ## ZcplcVWmVWmVZVZp3 ## 
ZcplcVWmVWmVZVZp3 = 0._dp 


 ! ## ZcplcVWmVWmVZpVZp1 ## 
ZcplcVWmVWmVZpVZp1 = 0._dp 


 ! ## ZcplcVWmVWmVZpVZp2 ## 
ZcplcVWmVWmVZpVZp2 = 0._dp 


 ! ## ZcplcVWmVWmVZpVZp3 ## 
ZcplcVWmVWmVZpVZp3 = 0._dp 


 ! ## ZcplcgGgGVG ## 
ZcplcgGgGVG = 0._dp 
TempcplcgGgGVG = cplcgGgGVG 
ZcplcgGgGVG = TempcplcgGgGVG 


 ! ## ZcplcgWmgAVWm ## 
ZcplcgWmgAVWm = 0._dp 
TempcplcgWmgAVWm = cplcgWmgAVWm 
ZcplcgWmgAVWm = TempcplcgWmgAVWm 


 ! ## ZcplcgWpCgAcVWm ## 
ZcplcgWpCgAcVWm = 0._dp 
TempcplcgWpCgAcVWm = cplcgWpCgAcVWm 
ZcplcgWpCgAcVWm = TempcplcgWpCgAcVWm 


 ! ## ZcplcgWmgWmVP ## 
ZcplcgWmgWmVP = 0._dp 
TempcplcgWmgWmVP = cplcgWmgWmVP 
ZcplcgWmgWmVP = TempcplcgWmgWmVP 


 ! ## ZcplcgWmgWmVZ ## 
ZcplcgWmgWmVZ = 0._dp 
TempcplcgWmgWmVZ = cplcgWmgWmVZ 
ZcplcgWmgWmVZ = TempcplcgWmgWmVZ 


 ! ## ZcplcgWmgWmVZp ## 
ZcplcgWmgWmVZp = 0._dp 
TempcplcgWmgWmVZp = cplcgWmgWmVZp 
ZcplcgWmgWmVZp = TempcplcgWmgWmVZp 


 ! ## ZcplcgAgWmcVWm ## 
ZcplcgAgWmcVWm = 0._dp 
TempcplcgAgWmcVWm = cplcgAgWmcVWm 
ZcplcgAgWmcVWm = TempcplcgAgWmcVWm 


 ! ## ZcplcgZgWmcVWm ## 
ZcplcgZgWmcVWm = 0._dp 
TempcplcgZgWmcVWm = cplcgZgWmcVWm 
ZcplcgZgWmcVWm = TempcplcgZgWmcVWm 


 ! ## ZcplcgZpgWmcVWm ## 
ZcplcgZpgWmcVWm = 0._dp 
TempcplcgZpgWmcVWm = cplcgZpgWmcVWm 
ZcplcgZpgWmcVWm = TempcplcgZpgWmcVWm 


 ! ## ZcplcgWpCgWpCVP ## 
ZcplcgWpCgWpCVP = 0._dp 
TempcplcgWpCgWpCVP = cplcgWpCgWpCVP 
ZcplcgWpCgWpCVP = TempcplcgWpCgWpCVP 


 ! ## ZcplcgAgWpCVWm ## 
ZcplcgAgWpCVWm = 0._dp 
TempcplcgAgWpCVWm = cplcgAgWpCVWm 
ZcplcgAgWpCVWm = TempcplcgAgWpCVWm 


 ! ## ZcplcgZgWpCVWm ## 
ZcplcgZgWpCVWm = 0._dp 
TempcplcgZgWpCVWm = cplcgZgWpCVWm 
ZcplcgZgWpCVWm = TempcplcgZgWpCVWm 


 ! ## ZcplcgZpgWpCVWm ## 
ZcplcgZpgWpCVWm = 0._dp 
TempcplcgZpgWpCVWm = cplcgZpgWpCVWm 
ZcplcgZpgWpCVWm = TempcplcgZpgWpCVWm 


 ! ## ZcplcgWpCgWpCVZ ## 
ZcplcgWpCgWpCVZ = 0._dp 
TempcplcgWpCgWpCVZ = cplcgWpCgWpCVZ 
ZcplcgWpCgWpCVZ = TempcplcgWpCgWpCVZ 


 ! ## ZcplcgWpCgWpCVZp ## 
ZcplcgWpCgWpCVZp = 0._dp 
TempcplcgWpCgWpCVZp = cplcgWpCgWpCVZp 
ZcplcgWpCgWpCVZp = TempcplcgWpCgWpCVZp 


 ! ## ZcplcgWmgZVWm ## 
ZcplcgWmgZVWm = 0._dp 
TempcplcgWmgZVWm = cplcgWmgZVWm 
ZcplcgWmgZVWm = TempcplcgWmgZVWm 


 ! ## ZcplcgWpCgZcVWm ## 
ZcplcgWpCgZcVWm = 0._dp 
TempcplcgWpCgZcVWm = cplcgWpCgZcVWm 
ZcplcgWpCgZcVWm = TempcplcgWpCgZcVWm 


 ! ## ZcplcgWmgZpVWm ## 
ZcplcgWmgZpVWm = 0._dp 
TempcplcgWmgZpVWm = cplcgWmgZpVWm 
ZcplcgWmgZpVWm = TempcplcgWmgZpVWm 


 ! ## ZcplcgWpCgZpcVWm ## 
ZcplcgWpCgZpcVWm = 0._dp 
TempcplcgWpCgZpcVWm = cplcgWpCgZpcVWm 
ZcplcgWpCgZpcVWm = TempcplcgWpCgZpcVWm 


 ! ## ZcplcgWmgWmAh ## 
ZcplcgWmgWmAh = 0._dp 
TempcplcgWmgWmAh = cplcgWmgWmAh 
ZcplcgWmgWmAh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgWmgWmAh(gt2) = ZcplcgWmgWmAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWmgWmAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgWpCAh ## 
ZcplcgWpCgWpCAh = 0._dp 
TempcplcgWpCgWpCAh = cplcgWpCgWpCAh 
ZcplcgWpCgWpCAh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgWpCgWpCAh(gt2) = ZcplcgWpCgWpCAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWpCgWpCAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgAhh ## 
ZcplcgZgAhh = 0._dp 
TempcplcgZgAhh = cplcgZgAhh 
ZcplcgZgAhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZgAhh(gt2) = ZcplcgZgAhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgAhh ## 
ZcplcgZpgAhh = 0._dp 
TempcplcgZpgAhh = cplcgZpgAhh 
ZcplcgZpgAhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZpgAhh(gt2) = ZcplcgZpgAhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZpgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgAHpm ## 
ZcplcgWmgAHpm = 0._dp 
TempcplcgWmgAHpm = cplcgWmgAHpm 
ZcplcgWmgAHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWmgAHpm(gt2) = ZcplcgWmgAHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWmgAHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgAcHpm ## 
ZcplcgWpCgAcHpm = 0._dp 
TempcplcgWpCgAcHpm = cplcgWpCgAcHpm 
ZcplcgWpCgAcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpCgAcHpm(gt2) = ZcplcgWpCgAcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpCgAcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgWmhh ## 
ZcplcgWmgWmhh = 0._dp 
TempcplcgWmgWmhh = cplcgWmgWmhh 
ZcplcgWmgWmhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgWmgWmhh(gt2) = ZcplcgWmgWmhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWmgWmhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWmcHpm ## 
ZcplcgZgWmcHpm = 0._dp 
TempcplcgZgWmcHpm = cplcgZgWmcHpm 
ZcplcgZgWmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgWmcHpm(gt2) = ZcplcgZgWmcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWmcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgWmcHpm ## 
ZcplcgZpgWmcHpm = 0._dp 
TempcplcgZpgWmcHpm = cplcgZpgWmcHpm 
ZcplcgZpgWmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZpgWmcHpm(gt2) = ZcplcgZpgWmcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZpgWmcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgWpChh ## 
ZcplcgWpCgWpChh = 0._dp 
TempcplcgWpCgWpChh = cplcgWpCgWpChh 
ZcplcgWpCgWpChh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgWpCgWpChh(gt2) = ZcplcgWpCgWpChh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWpCgWpChh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWpCHpm ## 
ZcplcgZgWpCHpm = 0._dp 
TempcplcgZgWpCHpm = cplcgZgWpCHpm 
ZcplcgZgWpCHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgWpCHpm(gt2) = ZcplcgZgWpCHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWpCHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgWpCHpm ## 
ZcplcgZpgWpCHpm = 0._dp 
TempcplcgZpgWpCHpm = cplcgZpgWpCHpm 
ZcplcgZpgWpCHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZpgWpCHpm(gt2) = ZcplcgZpgWpCHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZpgWpCHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgZhh ## 
ZcplcgZgZhh = 0._dp 
TempcplcgZgZhh = cplcgZgZhh 
ZcplcgZgZhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZgZhh(gt2) = ZcplcgZgZhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgZhh ## 
ZcplcgZpgZhh = 0._dp 
TempcplcgZpgZhh = cplcgZpgZhh 
ZcplcgZpgZhh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZpgZhh(gt2) = ZcplcgZpgZhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZpgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgZHpm ## 
ZcplcgWmgZHpm = 0._dp 
TempcplcgWmgZHpm = cplcgWmgZHpm 
ZcplcgWmgZHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWmgZHpm(gt2) = ZcplcgWmgZHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWmgZHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgZcHpm ## 
ZcplcgWpCgZcHpm = 0._dp 
TempcplcgWpCgZcHpm = cplcgWpCgZcHpm 
ZcplcgWpCgZcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpCgZcHpm(gt2) = ZcplcgWpCgZcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpCgZcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgZphh ## 
ZcplcgZgZphh = 0._dp 
TempcplcgZgZphh = cplcgZgZphh 
ZcplcgZgZphh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZgZphh(gt2) = ZcplcgZgZphh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgZphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgZphh ## 
ZcplcgZpgZphh = 0._dp 
TempcplcgZpgZphh = cplcgZpgZphh 
ZcplcgZpgZphh = 0._dp 
Do gt1=1,4
  Do gt2=1,4
ZcplcgZpgZphh(gt2) = ZcplcgZpgZphh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZpgZphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgZpHpm ## 
ZcplcgWmgZpHpm = 0._dp 
TempcplcgWmgZpHpm = cplcgWmgZpHpm 
ZcplcgWmgZpHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWmgZpHpm(gt2) = ZcplcgWmgZpHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWmgZpHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgZpcHpm ## 
ZcplcgWpCgZpcHpm = 0._dp 
TempcplcgWpCgZpcHpm = cplcgWpCgZpcHpm 
ZcplcgWpCgZpcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpCgZpcHpm(gt2) = ZcplcgWpCgZpcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpCgZpcHpm(gt1) 
 End Do 
End Do 
End Subroutine  getZCouplings 

Subroutine getGBCouplings(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,             & 
& MSvIm2OS,MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,             & 
& MChi2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,              & 
& ZVIOS,ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,          & 
& ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,          & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,cplAhcHpmVWm,cplcChaChiVWmL,        & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplChiChacVWmL,cplChiChacVWmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,   & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecVWmL,cplFvFecVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,ZcplAhcHpmVWm,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFuVWmL,             & 
& ZcplcFdFuVWmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,               & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,ZcplcHpmVWmVZp,            & 
& ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplhhcHpmVWm,  & 
& ZcplhhcVWmVWm,ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSucSdVWm,ZcplSvImcSeVWm, & 
& ZcplSvRecSeVWm,GcplAhHpmcHpm,GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe, & 
& GcplSdcHpmcSu,GcplSeSvImcHpm,GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,               & 
& GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplHpmcVWmVP,  & 
& GcplHpmcVWmVZ,GcplHpmcVWmVZp,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,               & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,        & 
& GcplcFuFdcHpmR,GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,  & 
& GcplcFeFvHpmR,GZcplAhHpmcHpm,GZcplhhHpmcHpm,GZcplHpmSucSd,GZcplHpmSvImcSe,             & 
& GZcplHpmSvRecSe,GZcplSdcHpmcSu,GZcplSeSvImcHpm,GZcplSeSvRecHpm,GZcplAhHpmcVWm,         & 
& GZcplAhcHpmVWm,GZcplhhHpmcVWm,GZcplhhcHpmVWm,GZcplHpmcHpmVP,GZcplHpmcHpmVZ,            & 
& GZcplHpmcHpmVZp,GZcplHpmcVWmVP,GZcplHpmcVWmVZ,GZcplHpmcVWmVZp,GZcplcHpmVPVWm,          & 
& GZcplcHpmVWmVZ,GZcplcHpmVWmVZp,GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcChaChiHpmL,     & 
& GZcplcChaChiHpmR,GZcplcFuFdcHpmL,GZcplcFuFdcHpmR,GZcplFvFecHpmL,GZcplFvFecHpmR,        & 
& GZcplcFdFuHpmL,GZcplcFdFuHpmR,GZcplcFeFvHpmL,GZcplcFeFvHpmR,GosZcplAhHpmcHpm,          & 
& GosZcplhhHpmcHpm,GosZcplHpmSucSd,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,GosZcplSdcHpmcSu, & 
& GosZcplSeSvImcHpm,GosZcplSeSvRecHpm,GosZcplAhHpmcVWm,GosZcplAhcHpmVWm,GosZcplhhHpmcVWm,& 
& GosZcplhhcHpmVWm,GosZcplHpmcHpmVP,GosZcplHpmcHpmVZ,GosZcplHpmcHpmVZp,GosZcplHpmcVWmVP, & 
& GosZcplHpmcVWmVZ,GosZcplHpmcVWmVZp,GosZcplcHpmVPVWm,GosZcplcHpmVWmVZ,GosZcplcHpmVWmVZp,& 
& GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcChaChiHpmL,GosZcplcChaChiHpmR,           & 
& GosZcplcFuFdcHpmL,GosZcplcFuFdcHpmR,GosZcplFvFecHpmL,GosZcplFvFecHpmR,GosZcplcFdFuHpmL,& 
& GosZcplcFdFuHpmR,GosZcplcFeFvHpmL,GosZcplcFeFvHpmR)

Implicit None

Real(dp), Intent(in) :: MSdOS(6),MSd2OS(6),MSuOS(6),MSu2OS(6),MSeOS(6),MSe2OS(6),MSvImOS(6),MSvIm2OS(6),      & 
& MSvReOS(6),MSvRe2OS(6),MhhOS(4),Mhh2OS(4),MAhOS(4),MAh2OS(4),MHpmOS(2),MHpm2OS(2),     & 
& MChiOS(7),MChi2OS(7),MChaOS(2),MCha2OS(2),MFvOS(6),MFv2OS(6),MFeOS(3),MFe2OS(3),       & 
& MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,              & 
& MVZp2OS,MVWmOS,MVWm2OS,ZHOS(4,4),ZAOS(4,4),ZPOS(2,2)

Complex(dp), Intent(in) :: ZDOS(6,6),ZUOS(6,6),ZEOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZNOS(7,7),UMOS(2,2),              & 
& UPOS(2,2),UVOS(6,6),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp), Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp), Intent(in) :: cplAhcHpmVWm(4,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFuVWmL(3,3),          & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),              & 
& cplcFuFdcVWmR(3,3),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcHpmVPVWm(2),            & 
& cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,              & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplSdcSucVWm(6,6),& 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),             & 
& cplSvRecSeVWm(6,6),ZcplAhcHpmVWm(4,2),ZcplcChaChiVWmL(2,7),ZcplcChaChiVWmR(2,7),       & 
& ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),ZcplcFeFvVWmL(3,6),ZcplcFeFvVWmR(3,6),           & 
& ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),ZcplChiChacVWmL(7,2),ZcplChiChacVWmR(7,2),     & 
& ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),ZcplcHpmVWmVZp(2),ZcplcVWmVPVWm,ZcplcVWmVWmVZ,       & 
& ZcplcVWmVWmVZp,ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),ZcplhhcHpmVWm(4,2),               & 
& ZcplhhcVWmVWm(4),ZcplSdcSucVWm(6,6),ZcplSeSvImcVWm(6,6),ZcplSeSvRecVWm(6,6),           & 
& ZcplSucSdVWm(6,6),ZcplSvImcSeVWm(6,6),ZcplSvRecSeVWm(6,6)

Integer :: gt1, gt2, gt3, i1, i2
Complex(dp), Intent(out) :: GcplAhHpmcHpm(4,2,2),GcplhhHpmcHpm(4,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(4,2),GcplAhcHpmVWm(4,2),GcplhhHpmcVWm(4,2),GcplhhcHpmVWm(4,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcHpmVZp(2,2),GcplHpmcVWmVP(2),            & 
& GcplHpmcVWmVZ(2),GcplHpmcVWmVZp(2),GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplcHpmVWmVZp(2),& 
& GcplChiChacHpmL(7,2,2),GcplChiChacHpmR(7,2,2),GcplcChaChiHpmL(2,7,2),GcplcChaChiHpmR(2,7,2),& 
& GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2), & 
& GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Complex(dp), Intent(out) :: GZcplAhHpmcHpm(4,2,2),GZcplhhHpmcHpm(4,2,2),GZcplHpmSucSd(2,6,6),GZcplHpmSvImcSe(2,6,6),& 
& GZcplHpmSvRecSe(2,6,6),GZcplSdcHpmcSu(6,2,6),GZcplSeSvImcHpm(6,6,2),GZcplSeSvRecHpm(6,6,2),& 
& GZcplAhHpmcVWm(4,2),GZcplAhcHpmVWm(4,2),GZcplhhHpmcVWm(4,2),GZcplhhcHpmVWm(4,2),       & 
& GZcplHpmcHpmVP(2,2),GZcplHpmcHpmVZ(2,2),GZcplHpmcHpmVZp(2,2),GZcplHpmcVWmVP(2),        & 
& GZcplHpmcVWmVZ(2),GZcplHpmcVWmVZp(2),GZcplcHpmVPVWm(2),GZcplcHpmVWmVZ(2),              & 
& GZcplcHpmVWmVZp(2),GZcplChiChacHpmL(7,2,2),GZcplChiChacHpmR(7,2,2),GZcplcChaChiHpmL(2,7,2),& 
& GZcplcChaChiHpmR(2,7,2),GZcplcFuFdcHpmL(3,3,2),GZcplcFuFdcHpmR(3,3,2),GZcplFvFecHpmL(6,3,2),& 
& GZcplFvFecHpmR(6,3,2),GZcplcFdFuHpmL(3,3,2),GZcplcFdFuHpmR(3,3,2),GZcplcFeFvHpmL(3,6,2),& 
& GZcplcFeFvHpmR(3,6,2)

Complex(dp), Intent(out) :: GosZcplAhHpmcHpm(4,2,2),GosZcplhhHpmcHpm(4,2,2),GosZcplHpmSucSd(2,6,6),               & 
& GosZcplHpmSvImcSe(2,6,6),GosZcplHpmSvRecSe(2,6,6),GosZcplSdcHpmcSu(6,2,6),             & 
& GosZcplSeSvImcHpm(6,6,2),GosZcplSeSvRecHpm(6,6,2),GosZcplAhHpmcVWm(4,2),               & 
& GosZcplAhcHpmVWm(4,2),GosZcplhhHpmcVWm(4,2),GosZcplhhcHpmVWm(4,2),GosZcplHpmcHpmVP(2,2),& 
& GosZcplHpmcHpmVZ(2,2),GosZcplHpmcHpmVZp(2,2),GosZcplHpmcVWmVP(2),GosZcplHpmcVWmVZ(2),  & 
& GosZcplHpmcVWmVZp(2),GosZcplcHpmVPVWm(2),GosZcplcHpmVWmVZ(2),GosZcplcHpmVWmVZp(2),     & 
& GosZcplChiChacHpmL(7,2,2),GosZcplChiChacHpmR(7,2,2),GosZcplcChaChiHpmL(2,7,2),         & 
& GosZcplcChaChiHpmR(2,7,2),GosZcplcFuFdcHpmL(3,3,2),GosZcplcFuFdcHpmR(3,3,2),           & 
& GosZcplFvFecHpmL(6,3,2),GosZcplFvFecHpmR(6,3,2),GosZcplcFdFuHpmL(3,3,2),               & 
& GosZcplcFdFuHpmR(3,3,2),GosZcplcFeFvHpmL(3,6,2),GosZcplcFeFvHpmR(3,6,2)

Do i1=1,4
 Do i2=1,2
GcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2OS(i1) - MHpm2OS(i2))/MVWmOS*cplAhcHpmVWm(i1,i2)
GosZcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2OS(i1) - MHpm2OS(i2))/MVWmOS*ZcplAhcHpmVWm(i1,i2)
GZcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2(i1) - MHpm2(i2))/MVWm*ZcplAhcHpmVWm(i1,i2)
 End Do
End Do 
Do i1=1,4
 Do i2=1,2
GcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2OS(i1) - MHpm2OS(i2))/MVWmOS*cplhhcHpmVWm(i1,i2)
GosZcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2OS(i1) - MHpm2OS(i2))/MVWmOS*ZcplhhcHpmVWm(i1,i2)
GZcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2(i1) - MHpm2(i2))/MVWm*ZcplhhcHpmVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSucSd(1,i1,i2) = (1)*(MSu2OS(i1) - MSd2OS(i2))/MVWmOS*cplSucSdVWm(i1,i2)
GosZcplHpmSucSd(1,i1,i2) = (1)*(MSu2OS(i1) - MSd2OS(i2))/MVWmOS*ZcplSucSdVWm(i1,i2)
GZcplHpmSucSd(1,i1,i2) = (1)*(MSu2(i1) - MSd2(i2))/MVWm*ZcplSucSdVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2OS(i1) - MSe2OS(i2))/MVWmOS*cplSvImcSeVWm(i1,i2)
GosZcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2OS(i1) - MSe2OS(i2))/MVWmOS*ZcplSvImcSeVWm(i1,i2)
GZcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2(i1) - MSe2(i2))/MVWm*ZcplSvImcSeVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2OS(i1) - MSe2OS(i2))/MVWmOS*cplSvRecSeVWm(i1,i2)
GosZcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2OS(i1) - MSe2OS(i2))/MVWmOS*ZcplSvRecSeVWm(i1,i2)
GZcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2(i1) - MSe2(i2))/MVWm*ZcplSvRecSeVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2OS(i1) - MSu2OS(i2))/MVWmOS*cplSdcSucVWm(i1,i2)
GosZcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2OS(i1) - MSu2OS(i2))/MVWmOS*ZcplSdcSucVWm(i1,i2)
GZcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2(i1) - MSu2(i2))/MVWm*ZcplSdcSucVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvIm2OS(i2))/MVWmOS*cplSeSvImcVWm(i1,i2)
GosZcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvIm2OS(i2))/MVWmOS*ZcplSeSvImcVWm(i1,i2)
GZcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2(i1) - MSvIm2(i2))/MVWm*ZcplSeSvImcVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvRe2OS(i2))/MVWmOS*cplSeSvRecVWm(i1,i2)
GosZcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvRe2OS(i2))/MVWmOS*ZcplSeSvRecVWm(i1,i2)
GZcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2(i1) - MSvRe2(i2))/MVWm*ZcplSeSvRecVWm(i1,i2)
 End Do
End Do 
Do i1=1,4
GcplAhHpmcVWm(i1,1) = 0._dp 
GosZcplAhHpmcVWm(i1,1) = 0._dp
GZcplAhHpmcVWm(i1,1) = 0._dp
End Do 
Do i1=1,4
GcplAhcHpmVWm(i1,1) = 0._dp 
GosZcplAhcHpmVWm(i1,1) = 0._dp
GZcplAhcHpmVWm(i1,1) = 0._dp
End Do 
Do i1=1,4
GcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWmOS*cplhhcVWmVWm(i1)
GosZcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWmOS*ZcplhhcVWmVWm(i1)
GZcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWm*ZcplhhcVWmVWm(i1)
End Do 
Do i1=1,4
GcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWmOS*cplhhcVWmVWm(i1)
GosZcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWmOS*ZcplhhcVWmVWm(i1)
GZcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWm*ZcplhhcVWmVWm(i1)
End Do 
Do i1=1,2
GcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWmOS*cplcHpmVPVWm(i1)
GosZcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWmOS*ZcplcHpmVPVWm(i1)
GZcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWm*ZcplcHpmVPVWm(i1)
End Do 
Do i1=1,2
GcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWmOS*cplcHpmVWmVZ(i1)
GosZcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWmOS*ZcplcHpmVWmVZ(i1)
GZcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWm*ZcplcHpmVWmVZ(i1)
End Do 
Do i1=1,2
GcplHpmcHpmVZp(1,i1) = 0.5_dp*(1)/MVWmOS*cplcHpmVWmVZp(i1)
GosZcplHpmcHpmVZp(1,i1) = 0.5_dp*(1)/MVWmOS*ZcplcHpmVWmVZp(i1)
GZcplHpmcHpmVZp(1,i1) = 0.5_dp*(1)/MVWm*ZcplcHpmVWmVZp(i1)
End Do 
GcplHpmcVWmVP(1) = (-1)*(MVWm2OS - 0._dp)/MVWmOS*cplcVWmVPVWm
GosZcplHpmcVWmVP(1) = (-1)*(MVWm2OS - 0._dp)/MVWmOS*ZcplcVWmVPVWm
GZcplHpmcVWmVP(1) = (-1)*(MVWm2 - 0._dp)/MVWmOS*ZcplcVWmVPVWm 
GcplHpmcVWmVZ(1) = (1)*(MVWm2OS - MVZ2OS)/MVWmOS*cplcVWmVWmVZ
GosZcplHpmcVWmVZ(1) = (1)*(MVWm2OS - MVZ2OS)/MVWmOS*ZcplcVWmVWmVZ
GZcplHpmcVWmVZ(1) = (1)*(MVWm2 - MVZ2)/MVWmOS*ZcplcVWmVWmVZ 
GcplHpmcVWmVZp(1) = (1)*(MVWm2OS - MVZp2OS)/MVWmOS*cplcVWmVWmVZp
GosZcplHpmcVWmVZp(1) = (1)*(MVWm2OS - MVZp2OS)/MVWmOS*ZcplcVWmVWmVZp
GZcplHpmcVWmVZp(1) = (1)*(MVWm2 - MVZp2)/MVWmOS*ZcplcVWmVWmVZp 
GcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2OS)/MVWmOS*cplcVWmVPVWm
GosZcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2OS)/MVWmOS*ZcplcVWmVPVWm
GZcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2)/MVWmOS*ZcplcVWmVPVWm 
GcplcHpmVWmVZ(1) = (-1)*(MVWm2OS - MVZ2OS)/MVWmOS*cplcVWmVWmVZ
GosZcplcHpmVWmVZ(1) = (-1)*(MVWm2OS - MVZ2OS)/MVWmOS*ZcplcVWmVWmVZ
GZcplcHpmVWmVZ(1) = (-1)*(MVWm2 - MVZ2)/MVWmOS*ZcplcVWmVWmVZ 
GcplcHpmVWmVZp(1) = (-1)*(MVWm2OS - MVZp2OS)/MVWmOS*cplcVWmVWmVZp
GosZcplcHpmVWmVZp(1) = (-1)*(MVWm2OS - MVZp2OS)/MVWmOS*ZcplcVWmVWmVZp
GZcplcHpmVWmVZp(1) = (-1)*(MVWm2 - MVZp2)/MVWmOS*ZcplcVWmVWmVZp 
Do i1=1,7
 Do i2=1,2
GcplChiChacHpmL(i1,i2,1) = (MChiOS(i1)*cplChiChacVWmL(i1,i2) - MChaOS(i2)*cplChiChacVWmR(i1,i2))/MVWmOS
GcplChiChacHpmR(i1,i2,1) = -(MChaOS(i2)*cplChiChacVWmL(i1,i2) - MChiOS(i1)*cplChiChacVWmR(i1,i2))/MVWmOS
GosZcplChiChacHpmL(i1,i2,1) = (MChiOS(i1)*ZcplChiChacVWmL(i1,i2) - MChaOS(i2)*ZcplChiChacVWmR(i1,i2))/MVWmOS
GosZcplChiChacHpmR(i1,i2,1) = -(MChaOS(i2)*ZcplChiChacVWmL(i1,i2) - MChiOS(i1)*ZcplChiChacVWmR(i1,i2))/MVWmOS
GZcplChiChacHpmL(i1,i2,1) = (MChi(i1)*ZcplChiChacVWmL(i1,i2) - MCha(i2)*ZcplChiChacVWmR(i1,i2))/MVWm
GZcplChiChacHpmR(i1,i2,1) = -(MCha(i2)*ZcplChiChacVWmL(i1,i2) - MChi(i1)*ZcplChiChacVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,2
 Do i2=1,7
GcplcChaChiHpmL(i1,i2,1) = (MChaOS(i1)*cplcChaChiVWmL(i1,i2) - MChiOS(i2)*cplcChaChiVWmR(i1,i2))/MVWmOS
GcplcChaChiHpmR(i1,i2,1) = -(MChiOS(i2)*cplcChaChiVWmL(i1,i2) - MChaOS(i1)*cplcChaChiVWmR(i1,i2))/MVWmOS
GosZcplcChaChiHpmL(i1,i2,1) = (MChaOS(i1)*ZcplcChaChiVWmL(i1,i2) - MChiOS(i2)*ZcplcChaChiVWmR(i1,i2))/MVWmOS
GosZcplcChaChiHpmR(i1,i2,1) = -(MChiOS(i2)*ZcplcChaChiVWmL(i1,i2) - MChaOS(i1)*ZcplcChaChiVWmR(i1,i2))/MVWmOS
GZcplcChaChiHpmL(i1,i2,1) = (MCha(i1)*ZcplcChaChiVWmL(i1,i2) - MChi(i2)*ZcplcChaChiVWmR(i1,i2))/MVWm
GZcplcChaChiHpmR(i1,i2,1) = -(MChi(i2)*ZcplcChaChiVWmL(i1,i2) - MCha(i1)*ZcplcChaChiVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFuFdcHpmL(i1,i2,1) = (MFuOS(i1)*cplcFuFdcVWmL(i1,i2) - MFdOS(i2)*cplcFuFdcVWmR(i1,i2))/MVWmOS
GcplcFuFdcHpmR(i1,i2,1) = -(MFdOS(i2)*cplcFuFdcVWmL(i1,i2) - MFuOS(i1)*cplcFuFdcVWmR(i1,i2))/MVWmOS
GosZcplcFuFdcHpmL(i1,i2,1) = (MFuOS(i1)*ZcplcFuFdcVWmL(i1,i2) - MFdOS(i2)*ZcplcFuFdcVWmR(i1,i2))/MVWmOS
GosZcplcFuFdcHpmR(i1,i2,1) = -(MFdOS(i2)*ZcplcFuFdcVWmL(i1,i2) - MFuOS(i1)*ZcplcFuFdcVWmR(i1,i2))/MVWmOS
GZcplcFuFdcHpmL(i1,i2,1) = (MFu(i1)*ZcplcFuFdcVWmL(i1,i2) - MFd(i2)*ZcplcFuFdcVWmR(i1,i2))/MVWm
GZcplcFuFdcHpmR(i1,i2,1) = -(MFd(i2)*ZcplcFuFdcVWmL(i1,i2) - MFu(i1)*ZcplcFuFdcVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,6
 Do i2=1,3
GcplFvFecHpmL(i1,i2,1) = (MFvOS(i1)*cplFvFecVWmL(i1,i2) - MFeOS(i2)*cplFvFecVWmR(i1,i2))/MVWmOS
GcplFvFecHpmR(i1,i2,1) = -(MFeOS(i2)*cplFvFecVWmL(i1,i2) - MFvOS(i1)*cplFvFecVWmR(i1,i2))/MVWmOS
GosZcplFvFecHpmL(i1,i2,1) = (MFvOS(i1)*ZcplFvFecVWmL(i1,i2) - MFeOS(i2)*ZcplFvFecVWmR(i1,i2))/MVWmOS
GosZcplFvFecHpmR(i1,i2,1) = -(MFeOS(i2)*ZcplFvFecVWmL(i1,i2) - MFvOS(i1)*ZcplFvFecVWmR(i1,i2))/MVWmOS
GZcplFvFecHpmL(i1,i2,1) = (MFv(i1)*ZcplFvFecVWmL(i1,i2) - MFe(i2)*ZcplFvFecVWmR(i1,i2))/MVWm
GZcplFvFecHpmR(i1,i2,1) = -(MFe(i2)*ZcplFvFecVWmL(i1,i2) - MFv(i1)*ZcplFvFecVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFdFuHpmL(i1,i2,1) = (MFdOS(i1)*cplcFdFuVWmL(i1,i2) - MFuOS(i2)*cplcFdFuVWmR(i1,i2))/MVWmOS
GcplcFdFuHpmR(i1,i2,1) = -(MFuOS(i2)*cplcFdFuVWmL(i1,i2) - MFdOS(i1)*cplcFdFuVWmR(i1,i2))/MVWmOS
GosZcplcFdFuHpmL(i1,i2,1) = (MFdOS(i1)*ZcplcFdFuVWmL(i1,i2) - MFuOS(i2)*ZcplcFdFuVWmR(i1,i2))/MVWmOS
GosZcplcFdFuHpmR(i1,i2,1) = -(MFuOS(i2)*ZcplcFdFuVWmL(i1,i2) - MFdOS(i1)*ZcplcFdFuVWmR(i1,i2))/MVWmOS
GZcplcFdFuHpmL(i1,i2,1) = (MFd(i1)*ZcplcFdFuVWmL(i1,i2) - MFu(i2)*ZcplcFdFuVWmR(i1,i2))/MVWm
GZcplcFdFuHpmR(i1,i2,1) = -(MFu(i2)*ZcplcFdFuVWmL(i1,i2) - MFd(i1)*ZcplcFdFuVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,6
GcplcFeFvHpmL(i1,i2,1) = (MFeOS(i1)*cplcFeFvVWmL(i1,i2) - MFvOS(i2)*cplcFeFvVWmR(i1,i2))/MVWmOS
GcplcFeFvHpmR(i1,i2,1) = -(MFvOS(i2)*cplcFeFvVWmL(i1,i2) - MFeOS(i1)*cplcFeFvVWmR(i1,i2))/MVWmOS
GosZcplcFeFvHpmL(i1,i2,1) = (MFeOS(i1)*ZcplcFeFvVWmL(i1,i2) - MFvOS(i2)*ZcplcFeFvVWmR(i1,i2))/MVWmOS
GosZcplcFeFvHpmR(i1,i2,1) = -(MFvOS(i2)*ZcplcFeFvVWmL(i1,i2) - MFeOS(i1)*ZcplcFeFvVWmR(i1,i2))/MVWmOS
GZcplcFeFvHpmL(i1,i2,1) = (MFe(i1)*ZcplcFeFvVWmL(i1,i2) - MFv(i2)*ZcplcFeFvVWmR(i1,i2))/MVWm
GZcplcFeFvHpmR(i1,i2,1) = -(MFv(i2)*ZcplcFeFvVWmL(i1,i2) - MFe(i1)*ZcplcFeFvVWmR(i1,i2))/MVWm
 End Do
End Do 
End Subroutine  getGBCouplings 

Subroutine WaveFunctionRenormalisation(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,               & 
& MSe2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,             & 
& MHpm2OS,MChiOS,MChi2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,          & 
& MFuOS,MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,           & 
& ZUOS,ZEOS,ZVIOS,ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,            & 
& ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,cplAhAhhh,cplAhHpmcHpm,        & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,   & 
& cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,      & 
& cplSeSvRecHpm,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,        & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhHpmcHpm,           & 
& cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,         & 
& cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,            & 
& cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe, & 
& cplhhhhSvReSvRe,cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,          & 
& cplhhSeSvImcHpm,cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,     & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,              & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,            & 
& cplSdSvReSvRecSd,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,          & 
& cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,        & 
& cplSuSvImSvImcSu,cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,& 
& cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,           & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZ,  & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,          & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,              & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,          & 
& cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,   & 
& cplAhHpmcVWmVZp,cplAhcHpmVPVWm,cplAhcHpmVWmVZ,cplAhcHpmVWmVZp,cplhhhhVPVP,             & 
& cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,        & 
& cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhHpmcVWmVZp,cplhhcHpmVPVWm,cplhhcHpmVWmVZ,           & 
& cplhhcHpmVWmVZp,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmVPVZp,cplHpmcHpmcVWmVWm,       & 
& cplHpmcHpmVZVZ,cplHpmcHpmVZVZp,cplHpmcHpmVZpVZp,cplSdcSdVGVG,cplSdcSdVGVP,             & 
& cplSdcSdVGVZ,cplSdcSdVGVZp,cplSdcSucVWmVG,cplSdcSdVPVP,cplSdcSdVPVZ,cplSdcSdVPVZp,     & 
& cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSdVZVZp,cplSdcSucVWmVZ,              & 
& cplSdcSdVZpVZp,cplSdcSucVWmVZp,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvImcVWmVZp,       & 
& cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSeSvRecVWmVZp,cplSecSeVPVP,cplSecSeVPVZ,            & 
& cplSecSeVPVZp,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZVZp,cplSecSeVZpVZp,               & 
& cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVGVZp,cplSucSuVPVP,       & 
& cplSucSdVPVWm,cplSucSuVPVZ,cplSucSuVPVZp,cplSucSdVWmVZ,cplSucSdVWmVZp,cplSucSucVWmVWm, & 
& cplSucSuVZVZ,cplSucSuVZVZp,cplSucSuVZpVZp,cplSvImSvImVPVP,cplSvImSvImVPVZ,             & 
& cplSvImSvImVPVZp,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZVZp,cplSvImSvImVZpVZp,& 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvImcSeVWmVZp,cplSvReSvReVPVP,cplSvReSvReVPVZ,      & 
& cplSvReSvReVPVZp,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZVZp,cplSvReSvReVZpVZp,& 
& cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplSvRecSeVWmVZp,cplVGVGVG,cplcVWmVPVWm,               & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,           & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,     & 
& cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcgGgGVG,     & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgAgWmcVWm,     & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,               & 
& cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,cplcgWpCgZcVWm,             & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgZpgAhh,      & 
& cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,  & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcHpm,GcplAhHpmcHpm,GcplhhHpmcHpm,    & 
& GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,GcplSeSvImcHpm,               & 
& GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,  & 
& GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplHpmcVWmVZp,               & 
& GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,GcplChiChacHpmL,GcplChiChacHpmR,            & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,GcplFvFecHpmL,           & 
& GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,dg1,             & 
& dg2,dg3,dgBL,dgYB,dgBY,dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,            & 
& dYv,dTv,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,             & 
& dMBp,dMBBp,dvd,dvu,dx1,dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,              & 
& dUP,dUV,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,            & 
& dTanTWp,ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfLm,ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,            & 
& ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ,ctcplAhAhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,        & 
& ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,             & 
& ctcplhhhhhh,ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,     & 
& ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,         & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,   & 
& ctcplAhHpmcVWm,ctcplAhcHpmVWm,ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,            & 
& ctcplHpmcHpmVZ,ctcplHpmcHpmVZp,ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,   & 
& ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm,ctcplSecSeVP,ctcplSecSeVZ,              & 
& ctcplSecSeVZp,ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,ctcplSucSuVZ,ctcplSucSuVZp,      & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,ctcplSvImcSeVWm,ctcplSvRecSeVWm,      & 
& ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhcVWmVWm,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,        & 
& ctcplHpmcVWmVP,ctcplHpmcVWmVZ,ctcplHpmcVWmVZp,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,           & 
& ctcplcHpmVWmVZp,ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,             & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplcFdFdAhL,           & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,    & 
& ctcplFvFvAhR,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChaFucSdL,ctcplChaFucSdR,          & 
& ctcplFvChacSeL,ctcplFvChacSeR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdChaSuL,          & 
& ctcplcFdChaSuR,ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplcFeChaSvReL,ctcplcFeChaSvReR,    & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,          & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,      & 
& ctcplcFdChiSdR,ctcplcFeChiSeL,ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,            & 
& ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,             & 
& ctcplcChaFdcSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplFvFecHpmL,ctcplFvFecHpmR,         & 
& ctcplcFeFehhL,ctcplcFeFehhR,ctcplcChaFeSvImL,ctcplcChaFeSvImR,ctcplcChaFeSvReL,        & 
& ctcplcChaFeSvReR,ctcplGluFucSuL,ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,            & 
& ctcplcFdFuHpmL,ctcplcFdFuHpmR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR, & 
& ctcplcChaFvSeL,ctcplcChaFvSeR,ctcplcFdGluSdL,ctcplcFdGluSdR,ctcplcFuGluSuL,            & 
& ctcplcFuGluSuR,ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplChiChacVWmL,ctcplChiChacVWmR,      & 
& ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,      & 
& ctcplcChaChaVZpR,ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL,ctcplChiChiVZR,          & 
& ctcplChiChiVZpL,ctcplChiChiVZpR,ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcFdFdVGL,       & 
& ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,  & 
& ctcplcFdFdVZpR,ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,          & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR, & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR, & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplFvFvVPL,ctcplFvFvVPR,   & 
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,   & 
& ctcplGluGluVGL,ctcplGluGluVGR,MLambda,deltaM,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: vd,vu,x1,x2

Complex(dp),Intent(in) :: cplAhAhhh(4,4,4),cplAhHpmcHpm(4,2,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),      & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),              & 
& cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplAhAhAhAh(4,4,4,4),cplAhAhhhhh(4,4,4,4),   & 
& cplAhAhHpmcHpm(4,4,2,2),cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),& 
& cplAhAhSvImSvIm(4,4,6,6),cplAhAhSvImSvRe(4,4,6,6),cplAhAhSvReSvRe(4,4,6,6),            & 
& cplAhhhHpmcHpm(4,4,2,2),cplAhhhSvImSvIm(4,4,6,6),cplAhhhSvImSvRe(4,4,6,6),             & 
& cplAhhhSvReSvRe(4,4,6,6),cplAhHpmSucSd(4,2,6,6),cplAhHpmSvImcSe(4,2,6,6),              & 
& cplAhHpmSvRecSe(4,2,6,6),cplAhSdcHpmcSu(4,6,2,6),cplAhSeSvImcHpm(4,6,6,2),             & 
& cplAhSeSvRecHpm(4,6,6,2),cplhhhhhhhh(4,4,4,4),cplhhhhHpmcHpm(4,4,2,2),cplhhhhSdcSd(4,4,6,6),& 
& cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvImSvRe(4,4,6,6),& 
& cplhhhhSvReSvRe(4,4,6,6),cplhhHpmSucSd(4,2,6,6),cplhhHpmSvImcSe(4,2,6,6),              & 
& cplhhHpmSvRecSe(4,2,6,6),cplhhSdcHpmcSu(4,6,2,6),cplhhSeSvImcHpm(4,6,6,2),             & 
& cplhhSeSvRecHpm(4,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),          & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),        & 
& cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),               & 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcVWm(4,2),cplAhcHpmVWm(4,2),     & 
& cplhhHpmcVWm(4,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),     & 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),& 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcVWmVWm(4),      & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),             & 
& cplHpmcVWmVZp(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplAhAhVPVP(4,4),    & 
& cplAhAhVPVZ(4,4),cplAhAhVPVZp(4,4),cplAhAhcVWmVWm(4,4),cplAhAhVZVZ(4,4),               & 
& cplAhAhVZVZp(4,4),cplAhAhVZpVZp(4,4),cplAhHpmcVWmVP(4,2),cplAhHpmcVWmVZ(4,2),          & 
& cplAhHpmcVWmVZp(4,2),cplAhcHpmVPVWm(4,2),cplAhcHpmVWmVZ(4,2),cplAhcHpmVWmVZp(4,2)

Complex(dp),Intent(in) :: cplhhhhVPVP(4,4),cplhhhhVPVZ(4,4),cplhhhhVPVZp(4,4),cplhhhhcVWmVWm(4,4),               & 
& cplhhhhVZVZ(4,4),cplhhhhVZVZp(4,4),cplhhhhVZpVZp(4,4),cplhhHpmcVWmVP(4,2),             & 
& cplhhHpmcVWmVZ(4,2),cplhhHpmcVWmVZp(4,2),cplhhcHpmVPVWm(4,2),cplhhcHpmVWmVZ(4,2),      & 
& cplhhcHpmVWmVZp(4,2),cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmVPVZp(2,2),     & 
& cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),cplHpmcHpmVZVZp(2,2),cplHpmcHpmVZpVZp(2,2), & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSdVGVZp(6,6),              & 
& cplSdcSucVWmVG(6,6),cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSdVPVZp(6,6),            & 
& cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),cplSdcSdVZVZ(6,6),cplSdcSdVZVZp(6,6),         & 
& cplSdcSucVWmVZ(6,6),cplSdcSdVZpVZp(6,6),cplSdcSucVWmVZp(6,6),cplSeSvImcVWmVP(6,6),     & 
& cplSeSvImcVWmVZ(6,6),cplSeSvImcVWmVZp(6,6),cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),  & 
& cplSeSvRecVWmVZp(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVPVZp(6,6),          & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSecSeVZVZp(6,6),cplSecSeVZpVZp(6,6),         & 
& cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),              & 
& cplSucSuVGVZp(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),cplSucSuVPVZ(6,6),             & 
& cplSucSuVPVZp(6,6),cplSucSdVWmVZ(6,6),cplSucSdVWmVZp(6,6),cplSucSucVWmVWm(6,6),        & 
& cplSucSuVZVZ(6,6),cplSucSuVZVZp(6,6),cplSucSuVZpVZp(6,6),cplSvImSvImVPVP(6,6),         & 
& cplSvImSvImVPVZ(6,6),cplSvImSvImVPVZp(6,6),cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),& 
& cplSvImSvImVZVZp(6,6),cplSvImSvImVZpVZp(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvImcSeVWmVZp(6,6),cplSvReSvReVPVP(6,6),cplSvReSvReVPVZ(6,6),cplSvReSvReVPVZp(6,6), & 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvReSvReVZVZp(6,6),cplSvReSvReVZpVZp(6,6),& 
& cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),cplSvRecSeVWmVZp(6,6),cplVGVGVG,             & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),     & 
& cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),           & 
& cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),       & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Complex(dp),Intent(in) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3), & 
& cplcFdFdVZpR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),             & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),& 
& cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6), & 
& cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,      & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,& 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,& 
& cplcgGgGVG,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,               & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,              & 
& cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh(4),cplcgWpCgWpCAh(4),        & 
& cplcgZgAhh(4),cplcgZpgAhh(4),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),cplcgWmgWmhh(4),        & 
& cplcgZgWmcHpm(2),cplcgZpgWmcHpm(2),cplcgWpCgWpChh(4),cplcgZgWpCHpm(2),cplcgZpgWpCHpm(2),& 
& cplcgZgZhh(4),cplcgZpgZhh(4),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),cplcgZgZphh(4),         & 
& cplcgZpgZphh(4),cplcgWmgZpHpm(2),cplcgWpCgZpcHpm(2)

Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSuOS(6),MSu2OS(6),MSeOS(6),MSe2OS(6),MSvImOS(6),MSvIm2OS(6),      & 
& MSvReOS(6),MSvRe2OS(6),MhhOS(4),Mhh2OS(4),MAhOS(4),MAh2OS(4),MHpmOS(2),MHpm2OS(2),     & 
& MChiOS(7),MChi2OS(7),MChaOS(2),MCha2OS(2),MFvOS(6),MFv2OS(6),MFeOS(3),MFe2OS(3),       & 
& MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,              & 
& MVZp2OS,MVWmOS,MVWm2OS,ZHOS(4,4),ZAOS(4,4),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZUOS(6,6),ZEOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZNOS(7,7),UMOS(2,2),              & 
& UPOS(2,2),UVOS(6,6),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Complex(dp) :: PiSd(6,6,6),DerPiSd(6,6,6),PiSu(6,6,6),DerPiSu(6,6,6),PiSe(6,6,6),DerPiSe(6,6,6),     & 
& PiSvIm(6,6,6),DerPiSvIm(6,6,6),PiSvRe(6,6,6),DerPiSvRe(6,6,6),Pihh(4,4,4),             & 
& DerPihh(4,4,4),PiAh(4,4,4),DerPiAh(4,4,4),PiHpm(2,2,2),DerPiHpm(2,2,2),SigmaLChi(7,7,7),& 
& SigmaSLChi(7,7,7),SigmaSRChi(7,7,7),SigmaRChi(7,7,7),DerSigmaLChi(7,7,7),              & 
& DerSigmaSLChi(7,7,7),DerSigmaSRChi(7,7,7),DerSigmaRChi(7,7,7),DerSigmaLirChi(7,7,7),   & 
& DerSigmaSLirChi(7,7,7),DerSigmaSRirChi(7,7,7),DerSigmaRirChi(7,7,7),SigmaLCha(2,2,2),  & 
& SigmaSLCha(2,2,2),SigmaSRCha(2,2,2),SigmaRCha(2,2,2),DerSigmaLCha(2,2,2),              & 
& DerSigmaSLCha(2,2,2),DerSigmaSRCha(2,2,2),DerSigmaRCha(2,2,2),DerSigmaLirCha(2,2,2),   & 
& DerSigmaSLirCha(2,2,2),DerSigmaSRirCha(2,2,2),DerSigmaRirCha(2,2,2),SigmaLFv(6,6,6),   & 
& SigmaSLFv(6,6,6),SigmaSRFv(6,6,6),SigmaRFv(6,6,6),DerSigmaLFv(6,6,6),DerSigmaSLFv(6,6,6),& 
& DerSigmaSRFv(6,6,6),DerSigmaRFv(6,6,6),DerSigmaLirFv(6,6,6),DerSigmaSLirFv(6,6,6),     & 
& DerSigmaSRirFv(6,6,6),DerSigmaRirFv(6,6,6),SigmaLFe(3,3,3),SigmaSLFe(3,3,3),           & 
& SigmaSRFe(3,3,3),SigmaRFe(3,3,3),DerSigmaLFe(3,3,3),DerSigmaSLFe(3,3,3),               & 
& DerSigmaSRFe(3,3,3),DerSigmaRFe(3,3,3),DerSigmaLirFe(3,3,3),DerSigmaSLirFe(3,3,3),     & 
& DerSigmaSRirFe(3,3,3),DerSigmaRirFe(3,3,3),SigmaLFd(3,3,3),SigmaSLFd(3,3,3),           & 
& SigmaSRFd(3,3,3),SigmaRFd(3,3,3),DerSigmaLFd(3,3,3),DerSigmaSLFd(3,3,3),               & 
& DerSigmaSRFd(3,3,3),DerSigmaRFd(3,3,3),DerSigmaLirFd(3,3,3),DerSigmaSLirFd(3,3,3),     & 
& DerSigmaSRirFd(3,3,3),DerSigmaRirFd(3,3,3),SigmaLFu(3,3,3),SigmaSLFu(3,3,3),           & 
& SigmaSRFu(3,3,3),SigmaRFu(3,3,3),DerSigmaLFu(3,3,3),DerSigmaSLFu(3,3,3),               & 
& DerSigmaSRFu(3,3,3),DerSigmaRFu(3,3,3),DerSigmaLirFu(3,3,3),DerSigmaSLirFu(3,3,3),     & 
& DerSigmaSRirFu(3,3,3),DerSigmaRirFu(3,3,3),SigmaLGlu,SigmaSLGlu,SigmaSRGlu,            & 
& SigmaRGlu,DerSigmaLGlu,DerSigmaSLGlu,DerSigmaSRGlu,DerSigmaRGlu,DerSigmaLirGlu,        & 
& DerSigmaSLirGlu,DerSigmaSRirGlu,DerSigmaRirGlu,PiVG,DerPiVG,PiVP,DerPiVP,              & 
& PiVZ,DerPiVZ,PiVZp,DerPiVZp,PiVWm,DerPiVWm,PiVPlight0,DerPiVPlight0,PiVPheavy0,        & 
& DerPiVPheavy0,PiVPlightMZ,DerPiVPlightMZ,PiVPheavyMZ,DerPiVPheavyMZ,PiVPVZ,            & 
& DerPiVPVZ,PiVZVP,DerPiVZVP,PiVPVZp,DerPiVPVZp,PiVZpVP,DerPiVZpVP,PiVZVZp,              & 
& DerPiVZVZp,PiVZpVZ,DerPiVZpVZ,PiVZhh(4,4,4),DerPiVZhh(4,4,4),PihhVZ(4,4,4),            & 
& DerPihhVZ(4,4,4),PiVZAh(4,4,4),DerPiVZAh(4,4,4),PiAhVZ(4,4,4),DerPiAhVZ(4,4,4),        & 
& PiVZphh(4,4,4),DerPiVZphh(4,4,4),PihhVZp(4,4,4),DerPihhVZp(4,4,4),PiVZpAh(4,4,4),      & 
& DerPiVZpAh(4,4,4),PiAhVZp(4,4,4),DerPiAhVZp(4,4,4),PiVWmHpm(2,2,2),DerPiVWmHpm(2,2,2), & 
& PiHpmVWm(2,2,2),DerPiHpmVWm(2,2,2)

Complex(dp) :: PiSdDR(6,6,6),DerPiSdDR(6,6,6),PiSuDR(6,6,6),DerPiSuDR(6,6,6),PiSeDR(6,6,6),          & 
& DerPiSeDR(6,6,6),PiSvImDR(6,6,6),DerPiSvImDR(6,6,6),PiSvReDR(6,6,6),DerPiSvReDR(6,6,6),& 
& PihhDR(4,4,4),DerPihhDR(4,4,4),PiAhDR(4,4,4),DerPiAhDR(4,4,4),PiHpmDR(2,2,2),          & 
& DerPiHpmDR(2,2,2),SigmaLChiDR(7,7,7),SigmaSLChiDR(7,7,7),SigmaSRChiDR(7,7,7),          & 
& SigmaRChiDR(7,7,7),DerSigmaLChiDR(7,7,7),DerSigmaSLChiDR(7,7,7),DerSigmaSRChiDR(7,7,7),& 
& DerSigmaRChiDR(7,7,7),DerSigmaLirChiDR(7,7,7),DerSigmaSLirChiDR(7,7,7),DerSigmaSRirChiDR(7,7,7),& 
& DerSigmaRirChiDR(7,7,7),SigmaLChaDR(2,2,2),SigmaSLChaDR(2,2,2),SigmaSRChaDR(2,2,2),    & 
& SigmaRChaDR(2,2,2),DerSigmaLChaDR(2,2,2),DerSigmaSLChaDR(2,2,2),DerSigmaSRChaDR(2,2,2),& 
& DerSigmaRChaDR(2,2,2),DerSigmaLirChaDR(2,2,2),DerSigmaSLirChaDR(2,2,2),DerSigmaSRirChaDR(2,2,2),& 
& DerSigmaRirChaDR(2,2,2),SigmaLFvDR(6,6,6),SigmaSLFvDR(6,6,6),SigmaSRFvDR(6,6,6),       & 
& SigmaRFvDR(6,6,6),DerSigmaLFvDR(6,6,6),DerSigmaSLFvDR(6,6,6),DerSigmaSRFvDR(6,6,6),    & 
& DerSigmaRFvDR(6,6,6),DerSigmaLirFvDR(6,6,6),DerSigmaSLirFvDR(6,6,6),DerSigmaSRirFvDR(6,6,6),& 
& DerSigmaRirFvDR(6,6,6),SigmaLFeDR(3,3,3),SigmaSLFeDR(3,3,3),SigmaSRFeDR(3,3,3),        & 
& SigmaRFeDR(3,3,3),DerSigmaLFeDR(3,3,3),DerSigmaSLFeDR(3,3,3),DerSigmaSRFeDR(3,3,3),    & 
& DerSigmaRFeDR(3,3,3),DerSigmaLirFeDR(3,3,3),DerSigmaSLirFeDR(3,3,3),DerSigmaSRirFeDR(3,3,3),& 
& DerSigmaRirFeDR(3,3,3),SigmaLFdDR(3,3,3),SigmaSLFdDR(3,3,3),SigmaSRFdDR(3,3,3),        & 
& SigmaRFdDR(3,3,3),DerSigmaLFdDR(3,3,3),DerSigmaSLFdDR(3,3,3),DerSigmaSRFdDR(3,3,3),    & 
& DerSigmaRFdDR(3,3,3),DerSigmaLirFdDR(3,3,3),DerSigmaSLirFdDR(3,3,3),DerSigmaSRirFdDR(3,3,3),& 
& DerSigmaRirFdDR(3,3,3),SigmaLFuDR(3,3,3),SigmaSLFuDR(3,3,3),SigmaSRFuDR(3,3,3),        & 
& SigmaRFuDR(3,3,3),DerSigmaLFuDR(3,3,3),DerSigmaSLFuDR(3,3,3),DerSigmaSRFuDR(3,3,3),    & 
& DerSigmaRFuDR(3,3,3),DerSigmaLirFuDR(3,3,3),DerSigmaSLirFuDR(3,3,3),DerSigmaSRirFuDR(3,3,3),& 
& DerSigmaRirFuDR(3,3,3),SigmaLGluDR,SigmaSLGluDR,SigmaSRGluDR,SigmaRGluDR,              & 
& DerSigmaLGluDR,DerSigmaSLGluDR,DerSigmaSRGluDR,DerSigmaRGluDR,DerSigmaLirGluDR,        & 
& DerSigmaSLirGluDR,DerSigmaSRirGluDR,DerSigmaRirGluDR,PiVGDR,DerPiVGDR,PiVPDR,          & 
& DerPiVPDR,PiVZDR,DerPiVZDR,PiVZpDR,DerPiVZpDR,PiVWmDR,DerPiVWmDR,PiVPlight0DR,         & 
& DerPiVPlight0DR,PiVPheavy0DR,DerPiVPheavy0DR,PiVPlightMZDR,DerPiVPlightMZDR,           & 
& PiVPheavyMZDR,DerPiVPheavyMZDR,PiVPVZDR,DerPiVPVZDR,PiVZVPDR,DerPiVZVPDR,              & 
& PiVPVZpDR,DerPiVPVZpDR,PiVZpVPDR,DerPiVZpVPDR,PiVZVZpDR,DerPiVZVZpDR,PiVZpVZDR,        & 
& DerPiVZpVZDR,PiVZhhDR(4,4,4),DerPiVZhhDR(4,4,4),PihhVZDR(4,4,4),DerPihhVZDR(4,4,4),    & 
& PiVZAhDR(4,4,4),DerPiVZAhDR(4,4,4),PiAhVZDR(4,4,4),DerPiAhVZDR(4,4,4),PiVZphhDR(4,4,4),& 
& DerPiVZphhDR(4,4,4),PihhVZpDR(4,4,4),DerPihhVZpDR(4,4,4),PiVZpAhDR(4,4,4),             & 
& DerPiVZpAhDR(4,4,4),PiAhVZpDR(4,4,4),DerPiAhVZpDR(4,4,4),PiVWmHpmDR(2,2,2),            & 
& DerPiVWmHpmDR(2,2,2),PiHpmVWmDR(2,2,2),DerPiHpmVWmDR(2,2,2)

Complex(dp) :: PiSdOS(6,6,6),DerPiSdOS(6,6,6),PiSuOS(6,6,6),DerPiSuOS(6,6,6),PiSeOS(6,6,6),          & 
& DerPiSeOS(6,6,6),PiSvImOS(6,6,6),DerPiSvImOS(6,6,6),PiSvReOS(6,6,6),DerPiSvReOS(6,6,6),& 
& PihhOS(4,4,4),DerPihhOS(4,4,4),PiAhOS(4,4,4),DerPiAhOS(4,4,4),PiHpmOS(2,2,2),          & 
& DerPiHpmOS(2,2,2),SigmaLChiOS(7,7,7),SigmaSLChiOS(7,7,7),SigmaSRChiOS(7,7,7),          & 
& SigmaRChiOS(7,7,7),DerSigmaLChiOS(7,7,7),DerSigmaSLChiOS(7,7,7),DerSigmaSRChiOS(7,7,7),& 
& DerSigmaRChiOS(7,7,7),DerSigmaLirChiOS(7,7,7),DerSigmaSLirChiOS(7,7,7),DerSigmaSRirChiOS(7,7,7),& 
& DerSigmaRirChiOS(7,7,7),SigmaLChaOS(2,2,2),SigmaSLChaOS(2,2,2),SigmaSRChaOS(2,2,2),    & 
& SigmaRChaOS(2,2,2),DerSigmaLChaOS(2,2,2),DerSigmaSLChaOS(2,2,2),DerSigmaSRChaOS(2,2,2),& 
& DerSigmaRChaOS(2,2,2),DerSigmaLirChaOS(2,2,2),DerSigmaSLirChaOS(2,2,2),DerSigmaSRirChaOS(2,2,2),& 
& DerSigmaRirChaOS(2,2,2),SigmaLFvOS(6,6,6),SigmaSLFvOS(6,6,6),SigmaSRFvOS(6,6,6),       & 
& SigmaRFvOS(6,6,6),DerSigmaLFvOS(6,6,6),DerSigmaSLFvOS(6,6,6),DerSigmaSRFvOS(6,6,6),    & 
& DerSigmaRFvOS(6,6,6),DerSigmaLirFvOS(6,6,6),DerSigmaSLirFvOS(6,6,6),DerSigmaSRirFvOS(6,6,6),& 
& DerSigmaRirFvOS(6,6,6),SigmaLFeOS(3,3,3),SigmaSLFeOS(3,3,3),SigmaSRFeOS(3,3,3),        & 
& SigmaRFeOS(3,3,3),DerSigmaLFeOS(3,3,3),DerSigmaSLFeOS(3,3,3),DerSigmaSRFeOS(3,3,3),    & 
& DerSigmaRFeOS(3,3,3),DerSigmaLirFeOS(3,3,3),DerSigmaSLirFeOS(3,3,3),DerSigmaSRirFeOS(3,3,3),& 
& DerSigmaRirFeOS(3,3,3),SigmaLFdOS(3,3,3),SigmaSLFdOS(3,3,3),SigmaSRFdOS(3,3,3),        & 
& SigmaRFdOS(3,3,3),DerSigmaLFdOS(3,3,3),DerSigmaSLFdOS(3,3,3),DerSigmaSRFdOS(3,3,3),    & 
& DerSigmaRFdOS(3,3,3),DerSigmaLirFdOS(3,3,3),DerSigmaSLirFdOS(3,3,3),DerSigmaSRirFdOS(3,3,3),& 
& DerSigmaRirFdOS(3,3,3),SigmaLFuOS(3,3,3),SigmaSLFuOS(3,3,3),SigmaSRFuOS(3,3,3),        & 
& SigmaRFuOS(3,3,3),DerSigmaLFuOS(3,3,3),DerSigmaSLFuOS(3,3,3),DerSigmaSRFuOS(3,3,3),    & 
& DerSigmaRFuOS(3,3,3),DerSigmaLirFuOS(3,3,3),DerSigmaSLirFuOS(3,3,3),DerSigmaSRirFuOS(3,3,3),& 
& DerSigmaRirFuOS(3,3,3),SigmaLGluOS,SigmaSLGluOS,SigmaSRGluOS,SigmaRGluOS,              & 
& DerSigmaLGluOS,DerSigmaSLGluOS,DerSigmaSRGluOS,DerSigmaRGluOS,DerSigmaLirGluOS,        & 
& DerSigmaSLirGluOS,DerSigmaSRirGluOS,DerSigmaRirGluOS,PiVGOS,DerPiVGOS,PiVPOS,          & 
& DerPiVPOS,PiVZOS,DerPiVZOS,PiVZpOS,DerPiVZpOS,PiVWmOS,DerPiVWmOS,PiVPlight0OS,         & 
& DerPiVPlight0OS,PiVPheavy0OS,DerPiVPheavy0OS,PiVPlightMZOS,DerPiVPlightMZOS,           & 
& PiVPheavyMZOS,DerPiVPheavyMZOS,PiVPVZOS,DerPiVPVZOS,PiVZVPOS,DerPiVZVPOS,              & 
& PiVPVZpOS,DerPiVPVZpOS,PiVZpVPOS,DerPiVZpVPOS,PiVZVZpOS,DerPiVZVZpOS,PiVZpVZOS,        & 
& DerPiVZpVZOS,PiVZhhOS(4,4,4),DerPiVZhhOS(4,4,4),PihhVZOS(4,4,4),DerPihhVZOS(4,4,4),    & 
& PiVZAhOS(4,4,4),DerPiVZAhOS(4,4,4),PiAhVZOS(4,4,4),DerPiAhVZOS(4,4,4),PiVZphhOS(4,4,4),& 
& DerPiVZphhOS(4,4,4),PihhVZpOS(4,4,4),DerPihhVZpOS(4,4,4),PiVZpAhOS(4,4,4),             & 
& DerPiVZpAhOS(4,4,4),PiAhVZpOS(4,4,4),DerPiAhVZpOS(4,4,4),PiVWmHpmOS(2,2,2),            & 
& DerPiVWmHpmOS(2,2,2),PiHpmVWmOS(2,2,2),DerPiHpmVWmOS(2,2,2)

Real(dp), Intent(in) :: MLambda, deltaM 

Integer, Intent(out) :: kont 
Real(dp),Intent(out) :: dg1,dg2,dg3,dgBL,dgYB,dgBY,dmHd2,dmHu2,dmC12,dmC22,dvd,dvu,dx1,dx2,dZH(4,4),          & 
& dZA(4,4),dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp),Intent(out) :: dMuP,dBMuP,dMu,dBmu,dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dYu(3,3),dTu(3,3),            & 
& dYx(3,3),dTx(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dMBp,dMBBp,dpG,dZD(6,6),dZU(6,6),dZE(6,6),             & 
& dZVI(6,6),dZVR(6,6),dZN(7,7),dUM(2,2),dUP(2,2),dUV(6,6),dZEL(3,3),dZER(3,3),           & 
& dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(out) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd(6,6),ZfSu(6,6),ZfSe(6,6),ZfSvIm(6,6),            & 
& ZfSvRe(6,6),Zfhh(4,4),ZfAh(4,4),ZfHpm(2,2),ZfL0(7,7),ZfLm(2,2),ZfLp(2,2),              & 
& ZfFvm(6,6),ZfFEL(3,3),ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),          & 
& ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ

Complex(dp),Intent(out) :: ctcplAhAhhh(4,4,4),ctcplAhHpmcHpm(4,2,2),ctcplAhSdcSd(4,6,6),ctcplAhSecSe(4,6,6),     & 
& ctcplAhSucSu(4,6,6),ctcplAhSvImSvIm(4,6,6),ctcplAhSvImSvRe(4,6,6),ctcplAhSvReSvRe(4,6,6),& 
& ctcplhhhhhh(4,4,4),ctcplhhHpmcHpm(4,2,2),ctcplhhSdcSd(4,6,6),ctcplhhSecSe(4,6,6),      & 
& ctcplhhSucSu(4,6,6),ctcplhhSvImSvIm(4,6,6),ctcplhhSvImSvRe(4,6,6),ctcplhhSvReSvRe(4,6,6),& 
& ctcplHpmSucSd(2,6,6),ctcplHpmSvImcSe(2,6,6),ctcplHpmSvRecSe(2,6,6),ctcplSdcHpmcSu(6,2,6),& 
& ctcplSeSvImcHpm(6,6,2),ctcplSeSvRecHpm(6,6,2),ctcplAhhhVP(4,4),ctcplAhhhVZ(4,4),       & 
& ctcplAhhhVZp(4,4),ctcplAhHpmcVWm(4,2),ctcplAhcHpmVWm(4,2),ctcplhhHpmcVWm(4,2),         & 
& ctcplhhcHpmVWm(4,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplHpmcHpmVZp(2,2),      & 
& ctcplSdcSdVG(6,6),ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6),              & 
& ctcplSdcSucVWm(6,6),ctcplSeSvImcVWm(6,6),ctcplSeSvRecVWm(6,6),ctcplSecSeVP(6,6),       & 
& ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6),ctcplSucSuVG(6,6),ctcplSucSuVP(6,6),              & 
& ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),ctcplSucSuVZp(6,6),ctcplSvImSvReVP(6,6),          & 
& ctcplSvImSvReVZ(6,6),ctcplSvImSvReVZp(6,6),ctcplSvImcSeVWm(6,6),ctcplSvRecSeVWm(6,6),  & 
& ctcplhhVPVZ(4),ctcplhhVPVZp(4),ctcplhhcVWmVWm(4),ctcplhhVZVZ(4),ctcplhhVZVZp(4),       & 
& ctcplhhVZpVZp(4),ctcplHpmcVWmVP(2),ctcplHpmcVWmVZ(2),ctcplHpmcVWmVZp(2),               & 
& ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),ctcplcHpmVWmVZp(2),ctcplVGVGVG,ctcplcVWmVPVWm,     & 
& ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,ctcplcChaChaAhL(2,2,4),ctcplcChaChaAhR(2,2,4),          & 
& ctcplChiChiAhL(7,7,4),ctcplChiChiAhR(7,7,4),ctcplcFdFdAhL(3,3,4),ctcplcFdFdAhR(3,3,4), & 
& ctcplcFeFeAhL(3,3,4),ctcplcFeFeAhR(3,3,4),ctcplcFuFuAhL(3,3,4),ctcplcFuFuAhR(3,3,4),   & 
& ctcplFvFvAhL(6,6,4),ctcplFvFvAhR(6,6,4),ctcplChiChacHpmL(7,2,2),ctcplChiChacHpmR(7,2,2),& 
& ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6),& 
& ctcplcChaChahhL(2,2,4),ctcplcChaChahhR(2,2,4),ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),& 
& ctcplcFeChaSvImL(3,2,6),ctcplcFeChaSvImR(3,2,6),ctcplcFeChaSvReL(3,2,6),               & 
& ctcplcFeChaSvReR(3,2,6),ctcplChiChihhL(7,7,4),ctcplChiChihhR(7,7,4),ctcplChiFdcSdL(7,3,6),& 
& ctcplChiFdcSdR(7,3,6),ctcplChiFecSeL(7,3,6),ctcplChiFecSeR(7,3,6),ctcplChiFucSuL(7,3,6),& 
& ctcplChiFucSuR(7,3,6),ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6),ctcplChiFvSvReL(7,6,6),& 
& ctcplChiFvSvReR(7,6,6),ctcplcChaChiHpmL(2,7,2),ctcplcChaChiHpmR(2,7,2),ctcplcFdChiSdL(3,7,6),& 
& ctcplcFdChiSdR(3,7,6),ctcplcFeChiSeL(3,7,6),ctcplcFeChiSeR(3,7,6),ctcplcFuChiSuL(3,7,6),& 
& ctcplcFuChiSuR(3,7,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,4),    & 
& ctcplcFdFdhhR(3,3,4),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),& 
& ctcplcFuFdcHpmR(3,3,2),ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),ctcplcFeFehhL(3,3,4),& 
& ctcplcFeFehhR(3,3,4),ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),& 
& ctcplcChaFeSvReR(2,3,6),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6),ctcplcFuFuhhL(3,3,4),  & 
& ctcplcFuFuhhR(3,3,4),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2),ctcplFvFvhhL(6,6,4),  & 
& ctcplFvFvhhR(6,6,4),ctcplcFeFvHpmL(3,6,2),ctcplcFeFvHpmR(3,6,2),ctcplcChaFvSeL(2,6,6), & 
& ctcplcChaFvSeR(2,6,6),ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),     & 
& ctcplcFuGluSuR(3,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplChiChacVWmL(7,2)

Complex(dp),Intent(out) :: ctcplChiChacVWmR(7,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
& ctcplcChaChaVZR(2,2),ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2),ctcplChiChiVPL(7,7),  & 
& ctcplChiChiVPR(7,7),ctcplChiChiVZL(7,7),ctcplChiChiVZR(7,7),ctcplChiChiVZpL(7,7),      & 
& ctcplChiChiVZpR(7,7),ctcplcChaChiVWmL(2,7),ctcplcChaChiVWmR(2,7),ctcplcFdFdVGL(3,3),   & 
& ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),           & 
& ctcplcFdFdVZR(3,3),ctcplcFdFdVZpL(3,3),ctcplcFdFdVZpR(3,3),ctcplcFuFdcVWmL(3,3),       & 
& ctcplcFuFdcVWmR(3,3),ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3),ctcplcFeFeVPL(3,3),       & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFeFeVZpL(3,3),          & 
& ctcplcFeFeVZpR(3,3),ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),          & 
& ctcplcFuFuVPR(3,3),ctcplcFdFuVWmL(3,3),ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),         & 
& ctcplcFuFuVZR(3,3),ctcplcFuFuVZpL(3,3),ctcplcFuFuVZpR(3,3),ctcplFvFvVPL(6,6),          & 
& ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6),ctcplFvFvVZpL(6,6),              & 
& ctcplFvFvVZpR(6,6),ctcplcFeFvVWmL(3,6),ctcplcFeFvVWmR(3,6),ctcplGluGluVGL,             & 
& ctcplGluGluVGR

Complex(dp),Intent(in) :: GcplAhHpmcHpm(4,2,2),GcplhhHpmcHpm(4,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(4,2),GcplAhcHpmVWm(4,2),GcplhhHpmcVWm(4,2),GcplhhcHpmVWm(4,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcHpmVZp(2,2),GcplHpmcVWmVP(2),            & 
& GcplHpmcVWmVZ(2),GcplHpmcVWmVZp(2),GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplcHpmVWmVZp(2),& 
& GcplChiChacHpmL(7,2,2),GcplChiChacHpmR(7,2,2),GcplcChaChiHpmL(2,7,2),GcplcChaChiHpmR(2,7,2),& 
& GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2), & 
& GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Real(dp) ::  g1D(320) 
Real(dp) :: p2 
Logical :: TwoLoopRGEsave 
Real(dp) ::MVG,MVP,MVG2,MVP2
Complex(dp) ::  Tad1Loop(10)
Complex(dp) :: MatTad_hh(4,4)=0._dp 
Integer :: i1,i2,i3 

MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

Call OneLoopTadpoleshh(vd,vu,x1,x2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplcChaChahhL,      & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh, & 
& cplcgZgZhh,cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,cplhhVZpVZp,Tad1Loop(1:4))

Tad1Loop(1:4) = MatMul(ZH,Tad1Loop(1:4)) 
Tad1Loop(1) = Tad1Loop(1)/vd 
Tad1Loop(2) = Tad1Loop(2)/vu 
Tad1Loop(3) = Tad1Loop(3)/x1 
Tad1Loop(4) = Tad1Loop(4)/x2 
Do i1=1,4
MatTad_hh(i1,i1) = Tad1Loop(0+ i1) 
End Do 
MatTad_hh = MatMul(MatMul(ZH,MatTad_hh),Transpose(ZH)) 
! Not working!! 
MatTad_hh= 0._dp
!--------------------------
!Sd
!--------------------------
Do i1=1,6
p2 = MSd2(i1)
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,               & 
& cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,            & 
& cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,               & 
& cplSdcSdVZpVZp,kont,PiSd(i1,:,:))

Call DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,             & 
& MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,    & 
& cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,            & 
& cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,               & 
& cplSdcSdVZpVZp,kont,DerPiSd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,             & 
& MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,    & 
& cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,            & 
& cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,               & 
& cplSdcSdVZpVZp,kont,DerPiSdDR(i1,:,:))

p2 =MSd2OS(i1)
Call DerPi1LoopSd(p2,MSdOS,MSd2OS,MAhOS,MAh2OS,MFuOS,MFu2OS,MChaOS,MCha2OS,           & 
& MFdOS,MFd2OS,MChiOS,MChi2OS,MGluOS,MGlu2OS,MhhOS,Mhh2OS,MSuOS,MSu2OS,MHpmOS,           & 
& MHpm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MVWmOS,MVWm2OS,MSeOS,MSe2OS,MSvImOS,               & 
& MSvIm2OS,MSvReOS,MSvRe2OS,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,           & 
& cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,               & 
& cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,            & 
& cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,               & 
& cplSdcSdVZpVZp,kont,DerPiSdOS(i1,:,:))

DerPiSd(i1,:,:) = DerPiSd(i1,:,:)- DerPiSdDR(i1,:,:) + DerPiSdOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Su
!--------------------------
Do i1=1,6
p2 = MSu2(i1)
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSu,cplhhhhSucSu,   & 
& cplHpmSucHpmcSu,cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,            & 
& cplSuSvReSvRecSu,cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,               & 
& cplSucSuVZpVZp,kont,PiSu(i1,:,:))

Call DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,            & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSu,cplhhhhSucSu,   & 
& cplHpmSucHpmcSu,cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,            & 
& cplSuSvReSvRecSu,cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,               & 
& cplSucSuVZpVZp,kont,DerPiSu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,            & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSu,cplhhhhSucSu,   & 
& cplHpmSucHpmcSu,cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,            & 
& cplSuSvReSvRecSu,cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,               & 
& cplSucSuVZpVZp,kont,DerPiSuDR(i1,:,:))

p2 =MSu2OS(i1)
Call DerPi1LoopSu(p2,MSuOS,MSu2OS,MAhOS,MAh2OS,MFuOS,MFu2OS,MChiOS,MChi2OS,           & 
& MChaOS,MCha2OS,MFdOS,MFd2OS,MGluOS,MGlu2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,MSdOS,          & 
& MSd2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,       & 
& MSvReOS,MSvRe2OS,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,             & 
& cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSu,cplhhhhSucSu,cplHpmSucHpmcSu,           & 
& cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,           & 
& cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,cplSucSuVZpVZp,kont,            & 
& DerPiSuOS(i1,:,:))

DerPiSu(i1,:,:) = DerPiSu(i1,:,:)- DerPiSuDR(i1,:,:) + DerPiSuOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Se
!--------------------------
Do i1=1,6
p2 = MSe2(i1)
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,      & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,              & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,   & 
& cplSeSecSecSe,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSecSeVPVP,            & 
& cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZpVZp,kont,PiSe(i1,:,:))

Call DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,             & 
& MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,        & 
& cplChiFecSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,             & 
& cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,     & 
& cplSdSecSdcSe,cplSeSecSecSe,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,           & 
& cplSecSeVPVP,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZpVZp,kont,DerPiSe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,             & 
& MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,        & 
& cplChiFecSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,             & 
& cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,     & 
& cplSdSecSdcSe,cplSeSecSecSe,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,           & 
& cplSecSeVPVP,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZpVZp,kont,DerPiSeDR(i1,:,:))

p2 =MSe2OS(i1)
Call DerPi1LoopSe(p2,MSeOS,MSe2OS,MAhOS,MAh2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,           & 
& MFeOS,MFe2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSvImOS,MSvIm2OS,MHpmOS,MHpm2OS,              & 
& MSvReOS,MSvRe2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,              & 
& MSuOS,MSu2OS,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,           & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,              & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,   & 
& cplSeSecSecSe,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSecSeVPVP,            & 
& cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZpVZp,kont,DerPiSeOS(i1,:,:))

DerPiSe(i1,:,:) = DerPiSe(i1,:,:)- DerPiSeDR(i1,:,:) + DerPiSeOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!SvIm
!--------------------------
Do i1=1,6
p2 = MSvIm2(i1)
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,   & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvImSvIm,cplhhhhSvImSvIm,            & 
& cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,cplSeSvImSvImcSe,cplSuSvImSvImcSu,cplSvImSvImSvImSvIm,& 
& cplSvImSvImSvReSvRe,cplSvImSvImVPVP,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZpVZp,& 
& kont,PiSvIm(i1,:,:))

Call DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,               & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,  & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvImSvIm,              & 
& cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,cplSeSvImSvImcSe,cplSuSvImSvImcSu, & 
& cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,cplSvImSvImVPVP,cplSvImSvImcVWmVWm,            & 
& cplSvImSvImVZVZ,cplSvImSvImVZpVZp,kont,DerPiSvIm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,               & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,  & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvImSvIm,              & 
& cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,cplSeSvImSvImcSe,cplSuSvImSvImcSu, & 
& cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,cplSvImSvImVPVP,cplSvImSvImcVWmVWm,            & 
& cplSvImSvImVZVZ,cplSvImSvImVZpVZp,kont,DerPiSvImDR(i1,:,:))

p2 =MSvIm2OS(i1)
Call DerPi1LoopSvIm(p2,MSvImOS,MSvIm2OS,MAhOS,MAh2OS,MSvReOS,MSvRe2OS,MFeOS,          & 
& MFe2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSeOS,MSe2OS,           & 
& MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSdOS,MSd2OS,MSuOS,          & 
& MSu2OS,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvImSvIm,cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,       & 
& cplSdSvImSvImcSd,cplSeSvImSvImcSe,cplSuSvImSvImcSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,& 
& cplSvImSvImVPVP,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZpVZp,kont,             & 
& DerPiSvImOS(i1,:,:))

DerPiSvIm(i1,:,:) = DerPiSvIm(i1,:,:)- DerPiSvImDR(i1,:,:) + DerPiSvImOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!SvRe
!--------------------------
Do i1=1,6
p2 = MSvRe2(i1)
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,   & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvReSvRe,cplhhhhSvReSvRe,            & 
& cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,cplSeSvReSvRecSe,cplSuSvReSvRecSu,cplSvImSvImSvReSvRe,& 
& cplSvReSvReSvReSvRe,cplSvReSvReVPVP,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZpVZp,& 
& kont,PiSvRe(i1,:,:))

Call DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,               & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,  & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvReSvRe,              & 
& cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,cplSeSvReSvRecSe,cplSuSvReSvRecSu, & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSvReSvReVPVP,cplSvReSvRecVWmVWm,            & 
& cplSvReSvReVZVZ,cplSvReSvReVZpVZp,kont,DerPiSvRe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,               & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,  & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvReSvRe,              & 
& cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,cplSeSvReSvRecSe,cplSuSvReSvRecSu, & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSvReSvReVPVP,cplSvReSvRecVWmVWm,            & 
& cplSvReSvReVZVZ,cplSvReSvReVZpVZp,kont,DerPiSvReDR(i1,:,:))

p2 =MSvRe2OS(i1)
Call DerPi1LoopSvRe(p2,MSvImOS,MSvIm2OS,MAhOS,MAh2OS,MSvReOS,MSvRe2OS,MFeOS,          & 
& MFe2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSeOS,MSe2OS,           & 
& MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSdOS,MSd2OS,MSuOS,          & 
& MSu2OS,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,        & 
& cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplAhAhSvReSvRe,cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,       & 
& cplSdSvReSvRecSd,cplSeSvReSvRecSe,cplSuSvReSvRecSu,cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,& 
& cplSvReSvReVPVP,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZpVZp,kont,             & 
& DerPiSvReOS(i1,:,:))

DerPiSvRe(i1,:,:) = DerPiSvRe(i1,:,:)- DerPiSvReDR(i1,:,:) + DerPiSvReOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!hh
!--------------------------
Do i1=1,4
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,             & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,            & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplhhhhVPVP,cplhhhhcVWmVWm,  & 
& cplhhhhVZVZ,cplhhhhVZpVZp,kont,Pihh(i1,:,:))

Pihh(i1,:,:) = Pihh(i1,:,:) + MatTad_hh
Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,             & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,            & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplhhhhVPVP,cplhhhhcVWmVWm,  & 
& cplhhhhVZVZ,cplhhhhVZpVZp,kont,DerPihh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,             & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,            & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplhhhhVPVP,cplhhhhcVWmVWm,  & 
& cplhhhhVZVZ,cplhhhhVZpVZp,kont,DerPihhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1Loophh(p2,MAhOS,MAh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MChaOS,MCha2OS,         & 
& MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,              & 
& Mhh2OS,MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,           & 
& MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,            & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,            & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplhhhhVPVP,cplhhhhcVWmVWm,  & 
& cplhhhhVZVZ,cplhhhhVZpVZp,kont,DerPihhOS(i1,:,:))

DerPihh(i1,:,:) = DerPihh(i1,:,:)- DerPihhDR(i1,:,:) + DerPihhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Ah
!--------------------------
Do i1=1,4
p2 = MAh2(i1)
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,          & 
& cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe, & 
& cplAhAhVPVP,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZpVZp,kont,PiAh(i1,:,:))

Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,          & 
& cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe, & 
& cplAhAhVPVP,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,          & 
& cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe, & 
& cplAhAhVPVP,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopAh(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,         & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,               & 
& MVZp2OS,MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,          & 
& MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,          & 
& cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe, & 
& cplAhAhVPVP,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAhOS(i1,:,:))

DerPiAh(i1,:,:) = DerPiAh(i1,:,:)- DerPiAhDR(i1,:,:) + DerPiAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Hpm
!--------------------------
Do i1=1,2
p2 = MHpm2(i1)
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgZpgWmcHpm,cplcgWmgZpHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplcgWpCgZpcHpm,& 
& cplcgZpgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,cplHpmcHpmVZpVZp,kont,PiHpm(i1,:,:))

Call DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,           & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgZpgWmcHpm,cplcgWmgZpHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplcgWpCgZpcHpm,& 
& cplcgZpgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,cplHpmcHpmVZpVZp,kont,DerPiHpm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,           & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgZpgWmcHpm,cplcgWmgZpHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplcgWpCgZpcHpm,& 
& cplcgZpgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,cplHpmcHpmVZpVZp,kont,DerPiHpmDR(i1,:,:))

p2 =MHpm2OS(i1)
Call DerPi1LoopHpm(p2,MHpmOS,MHpm2OS,MAhOS,MAh2OS,MVWmOS,MVWm2OS,MChiOS,              & 
& MChi2OS,MChaOS,MCha2OS,MFuOS,MFu2OS,MFdOS,MFd2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,            & 
& MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSuOS,MSu2OS,MSdOS,MSd2OS,MSvImOS,            & 
& MSvIm2OS,MSeOS,MSe2OS,MSvReOS,MSvRe2OS,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,       & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgZpgWmcHpm,cplcgWmgZpHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplcgWpCgZpcHpm,& 
& cplcgZpgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,cplHpmcHpmVZpVZp,kont,DerPiHpmOS(i1,:,:))

DerPiHpm(i1,:,:) = DerPiHpm(i1,:,:)- DerPiHpmDR(i1,:,:) + DerPiHpmOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Chi
!--------------------------
Do i1=1,7
p2 = MChi2(i1)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,             & 
& MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,SigmaLChi(i1,:,:),SigmaRChi(i1,:,:),SigmaSLChi(i1,:,:)   & 
& ,SigmaSRChi(i1,:,:))

Call DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,              & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,            & 
& MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,              & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChi(i1,:,:),DerSigmaRChi(i1,:,:)   & 
& ,DerSigmaSLChi(i1,:,:),DerSigmaSRChi(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,              & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,            & 
& MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,              & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChiDR(i1,:,:),DerSigmaRChiDR(i1,:,:)& 
& ,DerSigmaSLChiDR(i1,:,:),DerSigmaSRChiDR(i1,:,:))

p2 =MChi2OS(i1)
Call DerSigma1LoopChi(p2,MChiOS,MChi2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChaOS,           & 
& MCha2OS,MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSdOS,MSd2OS,          & 
& MFdOS,MFd2OS,MSeOS,MSe2OS,MFeOS,MFe2OS,MSuOS,MSu2OS,MFuOS,MFu2OS,MSvImOS,              & 
& MSvIm2OS,MFvOS,MFv2OS,MSvReOS,MSvRe2OS,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,       & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChiOS(i1,:,:),DerSigmaRChiOS(i1,:,:)            & 
& ,DerSigmaSLChiOS(i1,:,:),DerSigmaSRChiOS(i1,:,:))

DerSigmaLChi(i1,:,:) = DerSigmaLChi(i1,:,:) - DerSigmaLChiDR(i1,:,:)! + DerSigmaLChiOS(i1,:,:)
DerSigmaRChi(i1,:,:) = DerSigmaRChi(i1,:,:) - DerSigmaRChiDR(i1,:,:)! + DerSigmaRChiOS(i1,:,:)
DerSigmaSLChi(i1,:,:) = DerSigmaSLChi(i1,:,:) - DerSigmaSLChiDR(i1,:,:)! + DerSigmaSLChiOS(i1,:,:)
DerSigmaSRChi(i1,:,:) = DerSigmaSRChi(i1,:,:) - DerSigmaSRChiDR(i1,:,:)! + DerSigmaSRChiOS(i1,:,:)
DerSigmaLirChi(i1,:,:) =  + DerSigmaLChiOS(i1,:,:)
DerSigmaRirChi(i1,:,:) =  + DerSigmaRChiOS(i1,:,:)
DerSigmaSLirChi(i1,:,:) = + DerSigmaSLChiOS(i1,:,:)
DerSigmaSRirChi(i1,:,:) = + DerSigmaSRChiOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirChi(i1,:,:) =  0._dp
DerSigmaRirChi(i1,:,:) =  0._dp
DerSigmaSLirChi(i1,:,:) = 0._dp
DerSigmaSRirChi(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Cha
!--------------------------
Do i1=1,2
p2 =MCha2(i1)
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,            & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,   & 
& SigmaLCha(i1,:,:),SigmaRCha(i1,:,:),SigmaSLCha(i1,:,:),SigmaSRCha(i1,:,:))

Call DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,            & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,   & 
& DerSigmaLCha(i1,:,:),DerSigmaRCha(i1,:,:),DerSigmaSLCha(i1,:,:),DerSigmaSRCha(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,            & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,   & 
& DerSigmaLChaDR(i1,:,:),DerSigmaRChaDR(i1,:,:),DerSigmaSLChaDR(i1,:,:),DerSigmaSRChaDR(i1,:,:))

p2 =MCha2OS(i1)
Call DerSigma1LoopCha(p2,MChaOS,MCha2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,              & 
& MVZ2OS,MVZpOS,MVZp2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MVWmOS,MVWm2OS,MSuOS,              & 
& MSu2OS,MFdOS,MFd2OS,MSvImOS,MSvIm2OS,MFeOS,MFe2OS,MSvReOS,MSvRe2OS,MSeOS,              & 
& MSe2OS,MFvOS,MFv2OS,MFuOS,MFu2OS,MSdOS,MSd2OS,cplcChaChaAhL,cplcChaChaAhR,             & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,            & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,   & 
& DerSigmaLChaOS(i1,:,:),DerSigmaRChaOS(i1,:,:),DerSigmaSLChaOS(i1,:,:),DerSigmaSRChaOS(i1,:,:))

DerSigmaLCha(i1,:,:) = DerSigmaLCha(i1,:,:) - DerSigmaLChaDR(i1,:,:)! + DerSigmaLChaOS(i1,:,:)
DerSigmaRCha(i1,:,:) = DerSigmaRCha(i1,:,:) - DerSigmaRChaDR(i1,:,:)! + DerSigmaRChaOS(i1,:,:)
DerSigmaSLCha(i1,:,:) = DerSigmaSLCha(i1,:,:) - DerSigmaSLChaDR(i1,:,:)! + DerSigmaSLChaOS(i1,:,:)
DerSigmaSRCha(i1,:,:) = DerSigmaSRCha(i1,:,:) - DerSigmaSRChaDR(i1,:,:)! + DerSigmaSRChaOS(i1,:,:)
DerSigmaLirCha(i1,:,:) = + DerSigmaLChaOS(i1,:,:)
DerSigmaRirCha(i1,:,:) = + DerSigmaRChaOS(i1,:,:)
DerSigmaSLirCha(i1,:,:) = + DerSigmaSLChaOS(i1,:,:)
DerSigmaSRirCha(i1,:,:) = + DerSigmaSRChaOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirCha(i1,:,:) = 0._dp
DerSigmaRirCha(i1,:,:) = 0._dp
DerSigmaSLirCha(i1,:,:) = 0._dp
DerSigmaSRirCha(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fv
!--------------------------
Do i1=1,6
p2 = MFv2(i1)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,              & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,SigmaLFv(i1,:,:),SigmaRFv(i1,:,:),SigmaSLFv(i1,:,:)          & 
& ,SigmaSRFv(i1,:,:))

Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,           & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,              & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFv(i1,:,:),DerSigmaRFv(i1,:,:),DerSigmaSLFv(i1,:,:) & 
& ,DerSigmaSRFv(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,           & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,              & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFvDR(i1,:,:),DerSigmaRFvDR(i1,:,:),DerSigmaSLFvDR(i1,:,:)& 
& ,DerSigmaSRFvDR(i1,:,:))

p2 =MFv2OS(i1)
Call DerSigma1LoopFv(p2,MFvOS,MFv2OS,MAhOS,MAh2OS,MSeOS,MSe2OS,MChaOS,MCha2OS,        & 
& MSvImOS,MSvIm2OS,MChiOS,MChi2OS,MSvReOS,MSvRe2OS,MHpmOS,MHpm2OS,MFeOS,MFe2OS,          & 
& MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,         & 
& cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFvOS(i1,:,:) & 
& ,DerSigmaRFvOS(i1,:,:),DerSigmaSLFvOS(i1,:,:),DerSigmaSRFvOS(i1,:,:))

DerSigmaLFv(i1,:,:) = DerSigmaLFv(i1,:,:) - DerSigmaLFvDR(i1,:,:)! + DerSigmaLFvOS(i1,:,:)
DerSigmaRFv(i1,:,:) = DerSigmaRFv(i1,:,:) - DerSigmaRFvDR(i1,:,:)! + DerSigmaRFvOS(i1,:,:)
DerSigmaSLFv(i1,:,:) = DerSigmaSLFv(i1,:,:) - DerSigmaSLFvDR(i1,:,:)! + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRFv(i1,:,:) = DerSigmaSRFv(i1,:,:) - DerSigmaSRFvDR(i1,:,:)! + DerSigmaSRFvOS(i1,:,:)
DerSigmaLirFv(i1,:,:) =  + DerSigmaLFvOS(i1,:,:)
DerSigmaRirFv(i1,:,:) =  + DerSigmaRFvOS(i1,:,:)
DerSigmaSLirFv(i1,:,:) = + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRirFv(i1,:,:) = + DerSigmaSRFvOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFv(i1,:,:) =  0._dp
DerSigmaRirFv(i1,:,:) =  0._dp
DerSigmaSLirFv(i1,:,:) = 0._dp
DerSigmaSRirFv(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fe
!--------------------------
Do i1=1,3
p2 =MFe2(i1)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,             & 
& MVWm2,cplcFeFeAhL,cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,            & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,            & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,SigmaLFe(i1,:,:),SigmaRFe(i1,:,:)               & 
& ,SigmaSLFe(i1,:,:),SigmaSRFe(i1,:,:))

Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,              & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcFeFeAhL,cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,            & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFe(i1,:,:),DerSigmaRFe(i1,:,:)         & 
& ,DerSigmaSLFe(i1,:,:),DerSigmaSRFe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,              & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcFeFeAhL,cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,            & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFeDR(i1,:,:),DerSigmaRFeDR(i1,:,:)     & 
& ,DerSigmaSLFeDR(i1,:,:),DerSigmaSRFeDR(i1,:,:))

p2 =MFe2OS(i1)
Call DerSigma1LoopFe(p2,MFeOS,MFe2OS,MAhOS,MAh2OS,MSvImOS,MSvIm2OS,MChaOS,            & 
& MCha2OS,MSvReOS,MSvRe2OS,MSeOS,MSe2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MVZOS,               & 
& MVZ2OS,MVZpOS,MVZp2OS,MHpmOS,MHpm2OS,MFvOS,MFv2OS,MVWmOS,MVWm2OS,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFeOS(i1,:,:),DerSigmaRFeOS(i1,:,:),DerSigmaSLFeOS(i1,:,:)& 
& ,DerSigmaSRFeOS(i1,:,:))

DerSigmaLFe(i1,:,:) = DerSigmaLFe(i1,:,:) - DerSigmaLFeDR(i1,:,:)! + DerSigmaLFeOS(i1,:,:)
DerSigmaRFe(i1,:,:) = DerSigmaRFe(i1,:,:) - DerSigmaRFeDR(i1,:,:)! + DerSigmaRFeOS(i1,:,:)
DerSigmaSLFe(i1,:,:) = DerSigmaSLFe(i1,:,:) - DerSigmaSLFeDR(i1,:,:)! + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRFe(i1,:,:) = DerSigmaSRFe(i1,:,:) - DerSigmaSRFeDR(i1,:,:)! + DerSigmaSRFeOS(i1,:,:)
DerSigmaLirFe(i1,:,:) = + DerSigmaLFeOS(i1,:,:)
DerSigmaRirFe(i1,:,:) = + DerSigmaRFeOS(i1,:,:)
DerSigmaSLirFe(i1,:,:) = + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRirFe(i1,:,:) = + DerSigmaSRFeOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFe(i1,:,:) = 0._dp
DerSigmaRirFe(i1,:,:) = 0._dp
DerSigmaSLirFe(i1,:,:) = 0._dp
DerSigmaSRirFe(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fd
!--------------------------
Do i1=1,3
p2 =MFd2(i1)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,SigmaLFd(i1,:,:),SigmaRFd(i1,:,:)  & 
& ,SigmaSLFd(i1,:,:),SigmaSRFd(i1,:,:))

Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,               & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,           & 
& MGlu2,cplcFdFdAhL,cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,DerSigmaLFd(i1,:,:),               & 
& DerSigmaRFd(i1,:,:),DerSigmaSLFd(i1,:,:),DerSigmaSRFd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,               & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,           & 
& MGlu2,cplcFdFdAhL,cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,DerSigmaLFdDR(i1,:,:)              & 
& ,DerSigmaRFdDR(i1,:,:),DerSigmaSLFdDR(i1,:,:),DerSigmaSRFdDR(i1,:,:))

p2 =MFd2OS(i1)
Call DerSigma1LoopFd(p2,MFdOS,MFd2OS,MAhOS,MAh2OS,MSuOS,MSu2OS,MChaOS,MCha2OS,        & 
& MSdOS,MSd2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MHpmOS,           & 
& MHpm2OS,MFuOS,MFu2OS,MVWmOS,MVWm2OS,MGluOS,MGlu2OS,cplcFdFdAhL,cplcFdFdAhR,            & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,         & 
& cplcFdGluSdL,cplcFdGluSdR,DerSigmaLFdOS(i1,:,:),DerSigmaRFdOS(i1,:,:),DerSigmaSLFdOS(i1,:,:)& 
& ,DerSigmaSRFdOS(i1,:,:))

DerSigmaLFd(i1,:,:) = DerSigmaLFd(i1,:,:) - DerSigmaLFdDR(i1,:,:)! + DerSigmaLFdOS(i1,:,:)
DerSigmaRFd(i1,:,:) = DerSigmaRFd(i1,:,:) - DerSigmaRFdDR(i1,:,:)! + DerSigmaRFdOS(i1,:,:)
DerSigmaSLFd(i1,:,:) = DerSigmaSLFd(i1,:,:) - DerSigmaSLFdDR(i1,:,:)! + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRFd(i1,:,:) = DerSigmaSRFd(i1,:,:) - DerSigmaSRFdDR(i1,:,:)! + DerSigmaSRFdOS(i1,:,:)
DerSigmaLirFd(i1,:,:) = + DerSigmaLFdOS(i1,:,:)
DerSigmaRirFd(i1,:,:) = + DerSigmaRFdOS(i1,:,:)
DerSigmaSLirFd(i1,:,:) = + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRirFd(i1,:,:) = + DerSigmaSRFdOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFd(i1,:,:) = 0._dp
DerSigmaRirFd(i1,:,:) = 0._dp
DerSigmaSLirFd(i1,:,:) = 0._dp
DerSigmaSRirFd(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fu
!--------------------------
Do i1=1,3
p2 =MFu2(i1)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,         & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,SigmaLFu(i1,:,:),SigmaRFu(i1,:,:)& 
& ,SigmaSLFu(i1,:,:),SigmaSRFu(i1,:,:))

Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,             & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,    & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,DerSigmaLFu(i1,:,:)              & 
& ,DerSigmaRFu(i1,:,:),DerSigmaSLFu(i1,:,:),DerSigmaSRFu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,             & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,    & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,DerSigmaLFuDR(i1,:,:)            & 
& ,DerSigmaRFuDR(i1,:,:),DerSigmaSLFuDR(i1,:,:),DerSigmaSRFuDR(i1,:,:))

p2 =MFu2OS(i1)
Call DerSigma1LoopFu(p2,MFuOS,MFu2OS,MAhOS,MAh2OS,MSuOS,MSu2OS,MChiOS,MChi2OS,        & 
& MHpmOS,MHpm2OS,MFdOS,MFd2OS,MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,           & 
& MVZp2OS,MGluOS,MGlu2OS,MChaOS,MCha2OS,MSdOS,MSd2OS,cplcFuFuAhL,cplcFuFuAhR,            & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,DerSigmaLFuOS(i1,:,:),DerSigmaRFuOS(i1,:,:),               & 
& DerSigmaSLFuOS(i1,:,:),DerSigmaSRFuOS(i1,:,:))

DerSigmaLFu(i1,:,:) = DerSigmaLFu(i1,:,:) - DerSigmaLFuDR(i1,:,:)! + DerSigmaLFuOS(i1,:,:)
DerSigmaRFu(i1,:,:) = DerSigmaRFu(i1,:,:) - DerSigmaRFuDR(i1,:,:)! + DerSigmaRFuOS(i1,:,:)
DerSigmaSLFu(i1,:,:) = DerSigmaSLFu(i1,:,:) - DerSigmaSLFuDR(i1,:,:)! + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRFu(i1,:,:) = DerSigmaSRFu(i1,:,:) - DerSigmaSRFuDR(i1,:,:)! + DerSigmaSRFuOS(i1,:,:)
DerSigmaLirFu(i1,:,:) = + DerSigmaLFuOS(i1,:,:)
DerSigmaRirFu(i1,:,:) = + DerSigmaRFuOS(i1,:,:)
DerSigmaSLirFu(i1,:,:) = + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRirFu(i1,:,:) = + DerSigmaSRFuOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFu(i1,:,:) = 0._dp
DerSigmaRirFu(i1,:,:) = 0._dp
DerSigmaSLirFu(i1,:,:) = 0._dp
DerSigmaSRirFu(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Glu
!--------------------------
p2 = MGlu2
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigmaLGlu,SigmaRGlu,SigmaSLGlu,SigmaSRGlu)

Call DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGlu,DerSigmaRGlu,         & 
& DerSigmaSLGlu,DerSigmaSRGlu)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGluDR,DerSigmaRGluDR,     & 
& DerSigmaSLGluDR,DerSigmaSRGluDR)

p2 = MGlu2OS
Call DerSigma1LoopGlu(p2,MSdOS,MSd2OS,MFdOS,MFd2OS,MSuOS,MSu2OS,MFuOS,MFu2OS,         & 
& MGluOS,MGlu2OS,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,       & 
& cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGluOS,       & 
& DerSigmaRGluOS,DerSigmaSLGluOS,DerSigmaSRGluOS)

DerSigmaLGlu = DerSigmaLGlu - DerSigmaLGluDR !+ DerSigmaLGluOS
DerSigmaRGlu = DerSigmaRGlu - DerSigmaRGluDR !+ DerSigmaRGluOS
DerSigmaSLGlu = DerSigmaSLGlu - DerSigmaSLGluDR !+ DerSigmaSLGluOS
DerSigmaSRGlu = DerSigmaSRGlu - DerSigmaSRGluDR !+ DerSigmaSRGluOS
DerSigmaLirGlu = + DerSigmaLGluOS
DerSigmaRirGlu = + DerSigmaRGluOS
DerSigmaSLirGlu = + DerSigmaSLGluOS
DerSigmaSRirGlu = + DerSigmaSRGluOS
IRdivonly=.False. 
Else 
DerSigmaLirGlu = 0._dp
DerSigmaRirGlu = 0._dp
DerSigmaSLirGlu = 0._dp
DerSigmaSRirGlu = 0._dp 
End if 
!--------------------------
!VG
!--------------------------
p2 = MVG2
Call Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,         & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,PiVG)

Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,      & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,DerPiVG)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,      & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,DerPiVGDR)

p2 = 0.
Call DerPi1LoopVG(p2,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MSdOS,MSd2OS,           & 
& MSuOS,MSu2OS,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,               & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,   & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,DerPiVGOS)

DerPiVG = DerPiVG-DerPiVGDR + DerPiVGOS
IRdivonly=.False. 
End if 
!--------------------------
!VP
!--------------------------
p2 = MVP2
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVP)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPDR)

p2 = 0.
Call DerPi1LoopVP(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,         & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,               & 
& MVZp2OS,MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,          & 
& MSvReOS,MSvRe2OS,MSvImOS,MSvIm2OS,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,               & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,GcplHpmcHpmVP,GcplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,     & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPOS)

DerPiVP = DerPiVP-DerPiVPDR + DerPiVPOS
IRdivonly=.False. 
End if 
!--------------------------
!VZ
!--------------------------
p2 = MVZ2
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiVZ)

Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,DerPiVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,DerPiVZDR)

p2 = MVZ2OS
Call DerPi1LoopVZ(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,         & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,               & 
& MVZp2OS,MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,          & 
& MSvReOS,MSvRe2OS,MSvImOS,MSvIm2OS,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,               & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVZ,GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,DerPiVZOS)

DerPiVZ = DerPiVZ-DerPiVZDR + DerPiVZOS
IRdivonly=.False. 
End if 
!--------------------------
!VZp
!--------------------------
p2 = MVZp2
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,             & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,      & 
& cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,       & 
& cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,               & 
& kont,PiVZp)

Call DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,         & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,        & 
& cplhhhhVZpVZp,cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,           & 
& cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,               & 
& cplcVWmVWmVZpVZp3,kont,DerPiVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,         & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,        & 
& cplhhhhVZpVZp,cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,           & 
& cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,               & 
& cplcVWmVWmVZpVZp3,kont,DerPiVZpDR)

p2 = MVZp2OS
Call DerPi1LoopVZp(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,        & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,               & 
& MVZp2OS,MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,          & 
& MSvReOS,MSvRe2OS,MSvImOS,MSvIm2OS,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,            & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,GcplHpmcHpmVZp,GcplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,      & 
& cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,       & 
& cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,               & 
& kont,DerPiVZpOS)

DerPiVZp = DerPiVZp-DerPiVZpDR + DerPiVZpOS
IRdivonly=.False. 
End if 
!--------------------------
!VWm
!--------------------------
p2 = MVWm2
Call Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,            & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,               & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,PiVWm)

Call DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,DerPiVWm)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,DerPiVWmDR)

p2 = MVWm2OS
Call DerPi1LoopVWm(p2,MHpmOS,MHpm2OS,MAhOS,MAh2OS,MChiOS,MChi2OS,MChaOS,              & 
& MCha2OS,MFuOS,MFu2OS,MFdOS,MFd2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MhhOS,Mhh2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MSuOS,MSu2OS,MSdOS,MSd2OS,MSvImOS,          & 
& MSvIm2OS,MSeOS,MSe2OS,MSvReOS,MSvRe2OS,GcplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,GcplhhHpmcVWm,             & 
& cplhhcVWmVWm,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,    & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,   & 
& cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,  & 
& cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3, & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,DerPiVWmOS)

DerPiVWm = DerPiVWm-DerPiVWmDR + DerPiVWmOS
IRdivonly=.False. 
End if 
!--------------------------
! Additional Self-Energies for Photon
!--------------------------
p2 = 0._dp
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPlight0)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPlight0)

OnlyLightStates = .False. 
p2 = 0._dp
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPheavy0)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPheavy0)

OnlyHeavyStates = .False. 
p2 = MVZ2
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPlightMZ)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPlightMZ)

OnlyLightStates = .False. 
p2 = MVZ2
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPheavyMZ)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPheavyMZ)

OnlyHeavyStates = .False. 
!--------------------------
!VP
!--------------------------
p2 = MVZ2
Call Pi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,PiVPVZ)

Call DerPi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVPVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVPVZDR)

p2 =MVZ2OS
Call DerPi1LoopVPVZ(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,            & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,              & 
& cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,              & 
& cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVP,cplHpmcHpmVPVZ,    & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,          & 
& cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ, & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,PiVZVP)

Call DerPi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVZVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,        & 
& cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVPVZDR)

p2 = 0._dp 
Call DerPi1LoopVPVZ(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,            & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,     & 
& GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,              & 
& cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,              & 
& cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVP,cplHpmcHpmVPVZ,    & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,          & 
& cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ, & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
!--------------------------
!VP
!--------------------------
p2 = MVZp2
Call Pi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,PiVPVZp)

Call DerPi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVPVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVPVZpDR)

p2 =MVZp2OS
Call DerPi1LoopVPVZp(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& GcplcHpmVPVWm,GcplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpmcHpmVP,cplHpmcHpmVPVZp,& 
& GcplHpmcHpmVZp,GcplHpmcVWmVP,GcplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,      & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVPVZpOS)

DerPiVPVZp = DerPiVPVZp- DerPiVPVZpDR + DerPiVPVZpOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,PiVZpVP)

Call DerPi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVZpVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,             & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVPVZpDR)

p2 = 0._dp 
Call DerPi1LoopVPVZp(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,  & 
& GcplcHpmVPVWm,GcplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpmcHpmVP,cplHpmcHpmVPVZp,& 
& GcplHpmcHpmVZp,GcplHpmcVWmVP,GcplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,      & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,DerPiVPVZpOS)

DerPiVPVZp = DerPiVPVZp- DerPiVPVZpDR + DerPiVPVZpOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = MVZp2
Call Pi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,PiVZVZp)

Call DerPi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZVZpDR)

p2 =MVZp2OS
Call DerPi1LoopVZVZp(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,          & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,GcplcHpmVWmVZ,GcplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1, & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVZ,      & 
& GcplHpmcHpmVZp,cplHpmcHpmVZVZp,GcplHpmcVWmVZ,GcplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZVZpOS)

DerPiVZVZp = DerPiVZVZp- DerPiVZVZpDR + DerPiVZVZpOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,PiVZpVZ)

Call DerPi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZpVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZVZpDR)

p2 =MVZ2OS
Call DerPi1LoopVZVZp(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,          & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,cplcFdFdVZpL,    & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplChiChiVZR,GcplcHpmVWmVZ,GcplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1, & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVZ,      & 
& GcplHpmcHpmVZp,cplHpmcHpmVZVZp,GcplHpmcVWmVZ,GcplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,cplSucSuVZ,cplSucSuVZp,             & 
& cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplSvReSvReVZVZp,          & 
& kont,DerPiVZVZpOS)

DerPiVZVZp = DerPiVZVZp- DerPiVZVZpDR + DerPiVZVZpOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,4
p2 = Mhh2(i1)
Call Pi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PiVZhh(i1,:,:))

Call DerPi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZhh(p2,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,              & 
& MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,             & 
& MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVWmOS,MVWm2OS,cplcChaChahhL,           & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpmVWm,cplhhcVWmVWm,   & 
& GcplhhHpmcHpm,GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,            & 
& GcplHpmcHpmVZ,GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& kont,DerPiVZhhOS(i1,:,:))

DerPiVZhh(i1,:,:) = DerPiVZhh(i1,:,:)- DerPiVZhhDR(i1,:,:) + DerPiVZhhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PihhVZ)

Call DerPi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPihhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhDR)

p2 =MVZ2OS
Call DerPi1LoopVZhh(p2,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,              & 
& MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,             & 
& MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVWmOS,MVWm2OS,cplcChaChahhL,           & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpmVWm,cplhhcVWmVWm,   & 
& GcplhhHpmcHpm,GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,            & 
& GcplHpmcHpmVZ,GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,4
p2 = MAh2(i1)
Call Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,PiVZAh(i1,:,:))

Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,DerPiVZAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,DerPiVZAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,GcplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,      & 
& cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVZ,GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,kont,DerPiVZAhOS(i1,:,:))

DerPiVZAh(i1,:,:) = DerPiVZAh(i1,:,:)- DerPiVZAhDR(i1,:,:) + DerPiVZAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,PiAhVZ)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,DerPiAhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,DerPiVZAhDR)

p2 =MVZ2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,GcplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,      & 
& cplhhVZVZ,cplhhVZVZp,GcplHpmcHpmVZ,GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
!--------------------------
!VZp
!--------------------------
Do i1=1,4
p2 = Mhh2(i1)
Call Pi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,PiVZphh(i1,:,:))

Call DerPi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZphh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZphhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZphh(p2,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,             & 
& MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,             & 
& MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVWmOS,MVWm2OS,cplcChaChahhL,           & 
& cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,      & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,       & 
& cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,GcplcHpmVWmVZp,  & 
& cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,GcplhhcHpmVWm,             & 
& cplhhcVWmVWm,GcplhhHpmcHpm,GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhSvImSvRe,GcplHpmcHpmVZp,GcplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,       & 
& cplSvImSvReVZp,kont,DerPiVZphhOS(i1,:,:))

DerPiVZphh(i1,:,:) = DerPiVZphh(i1,:,:)- DerPiVZphhDR(i1,:,:) + DerPiVZphhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZp2
Call Pi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,PihhVZp)

Call DerPi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPihhVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZphhDR)

p2 =MVZp2OS
Call DerPi1LoopVZphh(p2,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,             & 
& MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,             & 
& MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVWmOS,MVWm2OS,cplcChaChahhL,           & 
& cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,      & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,       & 
& cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,GcplcHpmVWmVZp,  & 
& cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,GcplhhcHpmVWm,             & 
& cplhhcVWmVWm,GcplhhHpmcHpm,GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhSvImSvRe,GcplHpmcHpmVZp,GcplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,       & 
& cplSvImSvReVZp,kont,DerPiVZphhOS)

DerPiVZphh = DerPiVZphh- DerPiVZphhDR + DerPiVZphhOS
IRdivonly=.False. 
End if
!--------------------------
!VZp
!--------------------------
Do i1=1,4
p2 = MAh2(i1)
Call Pi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,PiVZpAh(i1,:,:))

Call DerPi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZpAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZpAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopVZpAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,GcplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpmcHpmVZp,GcplHpmcVWmVZp,           & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZpAhOS(i1,:,:))

DerPiVZpAh(i1,:,:) = DerPiVZpAh(i1,:,:)- DerPiVZpAhDR(i1,:,:) + DerPiVZpAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZp2
Call Pi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,PiAhVZp)

Call DerPi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiAhVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZpAhDR)

p2 =MVZp2OS
Call DerPi1LoopVZpAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,             & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,GcplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpmcHpmVZp,GcplHpmcVWmVZp,           & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,DerPiVZpAhOS)

DerPiVZpAh = DerPiVZpAh- DerPiVZpAhDR + DerPiVZpAhOS
IRdivonly=.False. 
End if
!--------------------------
!VWm
!--------------------------
Do i1=1,2
p2 = MHpm2(i1)
Call Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,PiVWmHpm(i1,:,:))

Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmDR(i1,:,:))

p2 =MHpm2OS(i1)
Call DerPi1LoopVWmHpm(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,            & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,GcplAhcHpmVWm,GcplAhHpmcHpm,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,GcplcFuFdcHpmL,     & 
& GcplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm, & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,            & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,GcplFvFecHpmL,GcplFvFecHpmR,GcplhhcHpmVWm,     & 
& cplhhcVWmVWm,GcplhhHpmcHpm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplSdcHpmcSu,   & 
& GcplSeSvImcHpm,GcplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,            & 
& DerPiVWmHpmOS(i1,:,:))

DerPiVWmHpm(i1,:,:) = DerPiVWmHpm(i1,:,:)- DerPiVWmHpmDR(i1,:,:) + DerPiVWmHpmOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVWm2
Call Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,PiHpmVWm)

Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiHpmVWm)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmDR)

p2 =MVWm2OS
Call DerPi1LoopVWmHpm(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,            & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,GcplAhcHpmVWm,GcplAhHpmcHpm,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,GcplcFuFdcHpmL,     & 
& GcplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm, & 
& cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWpCVWm,             & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,            & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,GcplFvFecHpmL,GcplFvFecHpmR,GcplhhcHpmVWm,     & 
& cplhhcVWmVWm,GcplhhHpmcHpm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplSdcHpmcSu,   & 
& GcplSeSvImcHpm,GcplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,            & 
& DerPiVWmHpmOS)

DerPiVWmHpm = DerPiVWmHpm- DerPiVWmHpmDR + DerPiVWmHpmOS
IRdivonly=.False. 
End if
! -----------------------------------------------------------
! Calculate now all wave-function renormalisation constants 
! -----------------------------------------------------------


!  ######    VG    ###### 
ZfVG = -DerPiVG


!  ######    fG    ###### 
ZffG = -SigmaRGlu + &
& -MGlu*(MGlu*DerSigmaRGlu+MGlu*DerSigmaLGlu+DerSigmaSRGlu+DerSigmaSLGlu)
If (OSkinematics) Then 
ZffG = ZffG &
& + -MGluOS*(MGluOS*DerSigmaRirGlu+MGluOS*DerSigmaLirGlu+(DerSigmaSRirGlu+DerSigmaSLirGlu))
Else 
ZffG = ZffG &
& + -MGlu*(MGlu*DerSigmaRirGlu+MGlu*DerSigmaLirGlu+(DerSigmaSRirGlu+DerSigmaSLirGlu))
End if 


!  ######    VP    ###### 
ZfVP = -DerPiVP


!  ######    VZ    ###### 
ZfVZ = -DerPiVZ


!  ######    VZp    ###### 
ZfVZp = -DerPiVZp


!  ######    VWm    ###### 
ZfVWm = -DerPiVWm


!  ######    Sd    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSd(i1).eq.MSd(i2))) Then 
       ZfSd(i1,i2) = -DerPiSd(i1,i1,i2)
   Else 
       ZfSd(i1,i2) = 2._dp/(MSd2(i1)-MSd2(i2))*PiSd(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Su    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSu(i1).eq.MSu(i2))) Then 
       ZfSu(i1,i2) = -DerPiSu(i1,i1,i2)
   Else 
       ZfSu(i1,i2) = 2._dp/(MSu2(i1)-MSu2(i2))*PiSu(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Se    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSe(i1).eq.MSe(i2))) Then 
       ZfSe(i1,i2) = -DerPiSe(i1,i1,i2)
   Else 
       ZfSe(i1,i2) = 2._dp/(MSe2(i1)-MSe2(i2))*PiSe(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    SvIm    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSvIm(i1).eq.MSvIm(i2))) Then 
       ZfSvIm(i1,i2) = -DerPiSvIm(i1,i1,i2)
   Else 
       ZfSvIm(i1,i2) = 2._dp/(MSvIm2(i1)-MSvIm2(i2))*PiSvIm(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    SvRe    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSvRe(i1).eq.MSvRe(i2))) Then 
       ZfSvRe(i1,i2) = -DerPiSvRe(i1,i1,i2)
   Else 
       ZfSvRe(i1,i2) = 2._dp/(MSvRe2(i1)-MSvRe2(i2))*PiSvRe(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    hh    ###### 
Do i1=1,4
  Do i2=1,4
   If ((i1.eq.i2).or.(Mhh(i1).eq.Mhh(i2))) Then 
       Zfhh(i1,i2) = -DerPihh(i1,i1,i2)
   Else 
       Zfhh(i1,i2) = 2._dp/(Mhh2(i1)-Mhh2(i2))*Pihh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Ah    ###### 
Do i1=1,4
  Do i2=1,4
   If ((i1.eq.i2).or.(MAh(i1).eq.MAh(i2))) Then 
       ZfAh(i1,i2) = -DerPiAh(i1,i1,i2)
   Else 
       ZfAh(i1,i2) = 2._dp/(MAh2(i1)-MAh2(i2))*PiAh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Hpm    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MHpm(i1).eq.MHpm(i2))) Then 
       ZfHpm(i1,i2) = -DerPiHpm(i1,i1,i2)
   Else 
       ZfHpm(i1,i2) = 2._dp/(MHpm2(i1)-MHpm2(i2))*PiHpm(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    L0    ###### 
Do i1=1,7
  Do i2=1,7
   If ((i1.eq.i2).or.(MChi(i1).eq.MChi(i2))) Then 
     ZfL0(i1,i2) = -SigmaRChi(i2,i1,i2) &
      & -MChi2(i1)*(DerSigmaRChi(i2,i1,i2) + DerSigmaLChi(i2,i1,i2))&
      & -MChi(i1)*(DerSigmaSRChi(i2,i1,i2)+DerSigmaSLChi(i2,i1,i2))
     If (OSkinematics) Then 
     ZfL0(i1,i2) = ZfL0(i1,i2) &
      & -MChi2OS(i1)*(DerSigmaRirChi(i2,i1,i2) + DerSigmaLirChi(i2,i1,i2))&
      & -MChiOS(i1)*(DerSigmaSRirChi(i2,i1,i2)+DerSigmaSLirChi(i2,i1,i2))
     Else 
     ZfL0(i1,i2) = ZfL0(i1,i2) &
      & -MChi2(i1)*(DerSigmaRirChi(i2,i1,i2) + DerSigmaLirChi(i2,i1,i2))&
      & -MChi(i1)*(DerSigmaSRirChi(i2,i1,i2)+DerSigmaSLirChi(i2,i1,i2))
     End if 
   Else 
     ZfL0(i1,i2) = 2._dp/(MChi2(i1) - MChi2(i2))* &
      & (MChi2(i2)*SigmaRChi(i2,i1,i2) + MChi(i1)*MChi(i2)*SigmaLChi(i2,i1,i2) + MChi(i1)*SigmaSRChi(i2,i1,i2) + MChi(i2)*SigmaSLChi(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    Lm    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MCha(i1).eq.MCha(i2))) Then 
     ZfLm(i1,i2) = -SigmaRCha(i2,i1,i2) &
      & -MCha2(i1)*(DerSigmaRCha(i2,i1,i2) + DerSigmaLCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSRCha(i2,i1,i2)+DerSigmaSLCha(i2,i1,i2))
     If (OSkinematics) Then 
     ZfLm(i1,i2) = ZfLm(i1,i2) &
      & -MCha2OS(i1)*(DerSigmaRirCha(i2,i1,i2) + DerSigmaLirCha(i2,i1,i2))&
      & -MChaOS(i1)*(DerSigmaSRirCha(i2,i1,i2)+DerSigmaSLirCha(i2,i1,i2))
     Else 
     ZfLm(i1,i2) = ZfLm(i1,i2) &
      & -MCha2(i1)*(DerSigmaRirCha(i2,i1,i2) + DerSigmaLirCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSRirCha(i2,i1,i2)+DerSigmaSLirCha(i2,i1,i2))
     End if 
   Else 
     ZfLm(i1,i2) = 2._dp/(MCha2(i1) - MCha2(i2))* &
      & (MCha2(i2)*SigmaRCha(i2,i1,i2) + MCha(i1)*MCha(i2)*SigmaLCha(i2,i1,i2) + MCha(i1)*SigmaSRCha(i2,i1,i2) + MCha(i2)*SigmaSLCha(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    Lp    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MCha(i1).eq.MCha(i2))) Then 
     ZfLp(i1,i2) = -SigmaLCha(i2,i1,i2) &
      & -MCha2(i1)*(DerSigmaLCha(i2,i1,i2) + DerSigmaRCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSLCha(i2,i1,i2)+DerSigmaSRCha(i2,i1,i2))
     If (OSkinematics) Then 
     ZfLp(i1,i2) = ZfLp(i1,i2) &
      & -MCha2OS(i1)*(DerSigmaLirCha(i2,i1,i2) + DerSigmaRirCha(i2,i1,i2))&
      & -MChaOS(i1)*(DerSigmaSLirCha(i2,i1,i2)+DerSigmaSRirCha(i2,i1,i2))
     Else 
     ZfLp(i1,i2) = ZfLp(i1,i2) &
      & -MCha2(i1)*(DerSigmaLirCha(i2,i1,i2) + DerSigmaRirCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSLirCha(i2,i1,i2)+DerSigmaSRirCha(i2,i1,i2))
     End if 
   Else 
     ZfLp(i1,i2) = 2._dp/(MCha2(i1) - MCha2(i2))* &
      & (MCha2(i2)*SigmaLCha(i2,i1,i2) + MCha(i1)*MCha(i2)*SigmaRCha(i2,i1,i2) + MCha(i1)*SigmaSLCha(i2,i1,i2) + MCha(i2)*SigmaSRCha(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    Fvm    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFv(i1).eq.MFv(i2))) Then 
     ZfFvm(i1,i2) = -SigmaRFv(i2,i1,i2) &
      & -MFv2(i1)*(DerSigmaRFv(i2,i1,i2) + DerSigmaLFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRFv(i2,i1,i2)+DerSigmaSLFv(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFvm(i1,i2) = ZfFvm(i1,i2) &
      & -MFv2OS(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFvOS(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     Else 
     ZfFvm(i1,i2) = ZfFvm(i1,i2) &
      & -MFv2(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     End if 
   Else 
     ZfFvm(i1,i2) = 2._dp/(MFv2(i1) - MFv2(i2))* &
      & (MFv2(i2)*SigmaRFv(i2,i1,i2) + MFv(i1)*MFv(i2)*SigmaLFv(i2,i1,i2) + MFv(i1)*SigmaSRFv(i2,i1,i2) + MFv(i2)*SigmaSLFv(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FEL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfFEL(i1,i2) = -SigmaRFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaRFe(i2,i1,i2) + DerSigmaLFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRFe(i2,i1,i2)+DerSigmaSLFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFEL(i1,i2) = ZfFEL(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     Else 
     ZfFEL(i1,i2) = ZfFEL(i1,i2) &
      & -MFe2(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     End if 
   Else 
     ZfFEL(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*SigmaSRFe(i2,i1,i2) + MFe(i2)*SigmaSLFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FER    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfFER(i1,i2) = -SigmaLFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaLFe(i2,i1,i2) + DerSigmaRFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLFe(i2,i1,i2)+DerSigmaSRFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFER(i1,i2) = ZfFER(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     Else 
     ZfFER(i1,i2) = ZfFER(i1,i2) &
      & -MFe2(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     End if 
   Else 
     ZfFER(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*SigmaSLFe(i2,i1,i2) + MFe(i2)*SigmaSRFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FDL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfFDL(i1,i2) = -SigmaRFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaRFd(i2,i1,i2) + DerSigmaLFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRFd(i2,i1,i2)+DerSigmaSLFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFDL(i1,i2) = ZfFDL(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     Else 
     ZfFDL(i1,i2) = ZfFDL(i1,i2) &
      & -MFd2(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     End if 
   Else 
     ZfFDL(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*SigmaSRFd(i2,i1,i2) + MFd(i2)*SigmaSLFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FDR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfFDR(i1,i2) = -SigmaLFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaLFd(i2,i1,i2) + DerSigmaRFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLFd(i2,i1,i2)+DerSigmaSRFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFDR(i1,i2) = ZfFDR(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     Else 
     ZfFDR(i1,i2) = ZfFDR(i1,i2) &
      & -MFd2(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     End if 
   Else 
     ZfFDR(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*SigmaSLFd(i2,i1,i2) + MFd(i2)*SigmaSRFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FUL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfFUL(i1,i2) = -SigmaRFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaRFu(i2,i1,i2) + DerSigmaLFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRFu(i2,i1,i2)+DerSigmaSLFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFUL(i1,i2) = ZfFUL(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     Else 
     ZfFUL(i1,i2) = ZfFUL(i1,i2) &
      & -MFu2(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     End if 
   Else 
     ZfFUL(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*SigmaSRFu(i2,i1,i2) + MFu(i2)*SigmaSLFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FUR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfFUR(i1,i2) = -SigmaLFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaLFu(i2,i1,i2) + DerSigmaRFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLFu(i2,i1,i2)+DerSigmaSRFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFUR(i1,i2) = ZfFUR(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     Else 
     ZfFUR(i1,i2) = ZfFUR(i1,i2) &
      & -MFu2(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     End if 
   Else 
     ZfFUR(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*SigmaSLFu(i2,i1,i2) + MFu(i2)*SigmaSRFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    VPVZ    ###### 
ZfVPVZ = 2._dp*PiVPVZ/(MVP2-MVZ2 )
ZfVZVP = 2._dp*PiVZVP/(MVZ2-MVP2 )


!  ######    VPVZp    ###### 
ZfVPVZp = 2._dp*PiVPVZp/(MVP2-MVZp2 )
ZfVZpVP = 2._dp*PiVZpVP/(MVZp2-MVP2 )


!  ######    VZVZp    ###### 
ZfVZVZp = 2._dp*PiVZVZp/(MVZ2-MVZp2 )
ZfVZpVZ = 2._dp*PiVZpVZ/(MVZp2-MVZ2 )
! -----------------------------------------------------------
! Setting the Counter-Terms 
! -----------------------------------------------------------
! ----------- getting the divergent pieces ---------

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,g1D)

TwoLoopRGEsave=TwoLoopRGE 
TwoLoopRGE=.False. 
Call rge320(320,0._dp,g1D,g1D) 
TwoLoopRGE=TwoLoopRGEsave 
Call GToParameters320(g1D,dg1,dg2,dg3,dgBL,dgYB,dgBY,dYd,dYe,dYu,dYx,dYv,             & 
& dMuP,dMu,dTd,dTe,dTu,dTx,dTv,dBMuP,dBmu,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,               & 
& dme2,dmv2,dmC12,dmC22,dMBBp,dM1,dM2,dM3,dMBp,dvd,dvu,dx1,dx2)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
dg1 = Sqrt(3._dp/5._dp)*dg1 
dgBL = Sqrt(3._dp/2._dp)*dgBL 
dgYB = Sqrt(3._dp/5._dp)*dgYB 
dgBY = Sqrt(3._dp/2._dp)*dgBY 
! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 
dg1 = 0.5_dp*divergence*dg1 
dg2 = 0.5_dp*divergence*dg2 
dg3 = 0.5_dp*divergence*dg3 
dgBL = 0.5_dp*divergence*dgBL 
dgYB = 0.5_dp*divergence*dgYB 
dgBY = 0.5_dp*divergence*dgBY 
dMuP = 0.5_dp*divergence*dMuP 
dBMuP = 0.5_dp*divergence*dBMuP 
dMu = 0.5_dp*divergence*dMu 
dBmu = 0.5_dp*divergence*dBmu 
dYd = 0.5_dp*divergence*dYd 
dTd = 0.5_dp*divergence*dTd 
dYe = 0.5_dp*divergence*dYe 
dTe = 0.5_dp*divergence*dTe 
dYu = 0.5_dp*divergence*dYu 
dTu = 0.5_dp*divergence*dTu 
dYx = 0.5_dp*divergence*dYx 
dTx = 0.5_dp*divergence*dTx 
dYv = 0.5_dp*divergence*dYv 
dTv = 0.5_dp*divergence*dTv 
dmq2 = 0.5_dp*divergence*dmq2 
dml2 = 0.5_dp*divergence*dml2 
dmHd2 = 0.5_dp*divergence*dmHd2 
dmHu2 = 0.5_dp*divergence*dmHu2 
dmd2 = 0.5_dp*divergence*dmd2 
dmu2 = 0.5_dp*divergence*dmu2 
dme2 = 0.5_dp*divergence*dme2 
dmv2 = 0.5_dp*divergence*dmv2 
dmC12 = 0.5_dp*divergence*dmC12 
dmC22 = 0.5_dp*divergence*dmC22 
dM1 = 0.5_dp*divergence*dM1 
dM2 = 0.5_dp*divergence*dM2 
dM3 = 0.5_dp*divergence*dM3 
dMBp = 0.5_dp*divergence*dMBp 
dMBBp = 0.5_dp*divergence*dMBBp 
dvd = 0.5_dp*divergence*dvd 
dvu = 0.5_dp*divergence*dvu 
dx1 = 0.5_dp*divergence*dx1 
dx2 = 0.5_dp*divergence*dx2 
dpG = 0._dp 
dZD = 0._dp 
dZU = 0._dp 
dZE = 0._dp 
dZVI = 0._dp 
dZVR = 0._dp 
dZH = 0._dp 
dZA = 0._dp 
dZP = 0._dp 
dZN = 0._dp 
dUM = 0._dp 
dUP = 0._dp 
dUV = 0._dp 
dZEL = 0._dp 
dZER = 0._dp 
dZDL = 0._dp 
dZDR = 0._dp 
dZUL = 0._dp 
dZUR = 0._dp 
dSinTW = 0._dp 
dCosTW = 0._dp 
dTanTW = 0._dp 
dSinTWp = 0._dp 
dCosTWp = 0._dp 
dTanTWp = 0._dp 
If (CTinLoopDecays) Then 
End if 
 
dUM = 0.25_dp*MatMul(ZfLm- Conjg(Transpose(ZfLm)),UM)
dUP = 0.25_dp*MatMul(ZfLp- Conjg(Transpose(ZfLp)),UP)
dUV = 0.25_dp*MatMul(ZfFvm- Conjg(Transpose(ZfFvm)),UV)
dZA = 0.25_dp*MatMul(ZfAh- Conjg(Transpose(ZfAh)),ZA)
dZD = 0.25_dp*MatMul(ZfSd- Conjg(Transpose(ZfSd)),ZD)
dZDL = 0.25_dp*MatMul(ZfFDL- Conjg(Transpose(ZfFDL)),ZDL)
dZDR = 0.25_dp*MatMul(ZfFDR- Conjg(Transpose(ZfFDR)),ZDR)
dZE = 0.25_dp*MatMul(ZfSe- Conjg(Transpose(ZfSe)),ZE)
dZEL = 0.25_dp*MatMul(ZfFEL- Conjg(Transpose(ZfFEL)),ZEL)
dZER = 0.25_dp*MatMul(ZfFER- Conjg(Transpose(ZfFER)),ZER)
dZH = 0.25_dp*MatMul(Zfhh- Conjg(Transpose(Zfhh)),ZH)
dZN = 0.25_dp*MatMul(ZfL0- Conjg(Transpose(ZfL0)),ZN)
dZP = 0.25_dp*MatMul(ZfHpm- Conjg(Transpose(ZfHpm)),ZP)
dZU = 0.25_dp*MatMul(ZfSu- Conjg(Transpose(ZfSu)),ZU)
dZUL = 0.25_dp*MatMul(ZfFUL- Conjg(Transpose(ZfFUL)),ZUL)
dZUR = 0.25_dp*MatMul(ZfFUR- Conjg(Transpose(ZfFUR)),ZUR)
dZVI = 0.25_dp*MatMul(ZfSvIm- Conjg(Transpose(ZfSvIm)),ZVI)
dZVR = 0.25_dp*MatMul(ZfSvRe- Conjg(Transpose(ZfSvRe)),ZVR)


! -----------------------------------------------------------
! Calculating the CT vertices 
! -----------------------------------------------------------
Call CalculateCouplingCT(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,ZP,Mu,Yd,Td,             & 
& ZD,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,Tv,ZVI,ZVR,TW,TWp,g3,UM,UP,ZN,ZDL,ZDR,               & 
& ZEL,ZER,ZUL,ZUR,UV,pG,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZA,dZP,              & 
& dMu,dYd,dTd,dZD,dYe,dTe,dZE,dYu,dTu,dZU,dMuP,dYx,dTx,dYv,dTv,dZVI,dZVR,dSinTW,         & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,dg3,dUM,dUP,dZN,dZDL,dZDR,dZEL,dZER,             & 
& dZUL,dZUR,dUV,dpG,ctcplAhAhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,ctcplAhSecSe,ctcplAhSucSu,   & 
& ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,ctcplhhhhhh,ctcplhhHpmcHpm,            & 
& ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,ctcplhhSvImSvRe,ctcplhhSvReSvRe,& 
& ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,ctcplSdcHpmcSu,ctcplSeSvImcHpm,          & 
& ctcplSeSvRecHpm,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpmcVWm,ctcplAhcHpmVWm,    & 
& ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,ctcplHpmcHpmVZp,           & 
& ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,ctcplSdcSucVWm,ctcplSeSvImcVWm,   & 
& ctcplSeSvRecVWm,ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,ctcplSucSuVG,ctcplSucSuVP,     & 
& ctcplSucSdVWm,ctcplSucSuVZ,ctcplSucSuVZp,ctcplSvImSvReVP,ctcplSvImSvReVZ,              & 
& ctcplSvImSvReVZp,ctcplSvImcSeVWm,ctcplSvRecSeVWm,ctcplhhVPVZ,ctcplhhVPVZp,             & 
& ctcplhhcVWmVWm,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,ctcplHpmcVWmVP,ctcplHpmcVWmVZ,   & 
& ctcplHpmcVWmVZp,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplcHpmVWmVZp,ctcplVGVGVG,             & 
& ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,ctcplcChaChaAhL,ctcplcChaChaAhR,         & 
& ctcplChiChiAhL,ctcplChiChiAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,               & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,ctcplFvFvAhR,ctcplChiChacHpmL,  & 
& ctcplChiChacHpmR,ctcplChaFucSdL,ctcplChaFucSdR,ctcplFvChacSeL,ctcplFvChacSeR,          & 
& ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdChaSuL,ctcplcFdChaSuR,ctcplcFeChaSvImL,        & 
& ctcplcFeChaSvImR,ctcplcFeChaSvReL,ctcplcFeChaSvReR,ctcplChiChihhL,ctcplChiChihhR,      & 
& ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,ctcplChiFecSeR,ctcplChiFucSuL,            & 
& ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplChiFvSvReL,ctcplChiFvSvReR,        & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,ctcplcFdChiSdR,ctcplcFeChiSeL,        & 
& ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,ctcplGluFdcSdL,ctcplGluFdcSdR,            & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplcFuFdcHpmL,           & 
& ctcplcFuFdcHpmR,ctcplFvFecHpmL,ctcplFvFecHpmR,ctcplcFeFehhL,ctcplcFeFehhR,             & 
& ctcplcChaFeSvImL,ctcplcChaFeSvImR,ctcplcChaFeSvReL,ctcplcChaFeSvReR,ctcplGluFucSuL,    & 
& ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFuHpmL,ctcplcFdFuHpmR,              & 
& ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR,ctcplcChaFvSeL,ctcplcChaFvSeR, & 
& ctcplcFdGluSdL,ctcplcFdGluSdR,ctcplcFuGluSuL,ctcplcFuGluSuR,ctcplcChacFuSdL,           & 
& ctcplcChacFuSdR,ctcplChiChacVWmL,ctcplChiChacVWmR,ctcplcChaChaVPL,ctcplcChaChaVPR,     & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,ctcplChiChiVPL,      & 
& ctcplChiChiVPR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,          & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,           & 
& ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,               & 
& ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,ctcplcFeFeVPL,           & 
& ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,               & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR, & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplFvFvVPL,ctcplFvFvVPR,   & 
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,   & 
& ctcplGluGluVGL,ctcplGluGluVGR)

End Subroutine WaveFunctionRenormalisation 
Subroutine CalculateOneLoopDecays(gP1LSd,gP1LSu,gP1LSe,gP1LSvRe,gP1LSvIm,             & 
& gP1Lhh,gP1LAh,gP1LHpm,gP1LGlu,gP1LCha,gP1LChi,gP1LFu,gP1LFv,MSdOS,MSd2OS,              & 
& MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,              & 
& MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,          & 
& MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,           & 
& MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,               & 
& UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,             & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,epsI,deltaM,kont)

Implicit None 
Real(dp), Intent(in) :: epsI, deltaM 
Integer, Intent(inout) :: kont 
Real(dp) :: MLambda, em, gs, vSM, sinW2, g1SM, g2SM 
Integer :: divset, i1 
Complex(dp) :: divvalue, YuSM(3,3), YdSM(3,3), YeSM(3,3) 
Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: vd,vu,x1,x2

Real(dp) :: dg1,dg2,dg3,dgBL,dgYB,dgBY,dmHd2,dmHu2,dmC12,dmC22,dvd,dvu,dx1,dx2,dZH(4,4),          & 
& dZA(4,4),dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp) :: dMuP,dBMuP,dMu,dBmu,dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dYu(3,3),dTu(3,3),            & 
& dYx(3,3),dTx(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dMBp,dMBBp,dpG,dZD(6,6),dZU(6,6),dZE(6,6),             & 
& dZVI(6,6),dZVR(6,6),dZN(7,7),dUM(2,2),dUP(2,2),dUV(6,6),dZEL(3,3),dZER(3,3),           & 
& dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd(6,6),ZfSu(6,6),ZfSe(6,6),ZfSvIm(6,6),            & 
& ZfSvRe(6,6),Zfhh(4,4),ZfAh(4,4),ZfHpm(2,2),ZfL0(7,7),ZfLm(2,2),ZfLp(2,2),              & 
& ZfFvm(6,6),ZfFEL(3,3),ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),          & 
& ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSuOS(6),MSu2OS(6),MSeOS(6),MSe2OS(6),MSvImOS(6),MSvIm2OS(6),      & 
& MSvReOS(6),MSvRe2OS(6),MhhOS(4),Mhh2OS(4),MAhOS(4),MAh2OS(4),MHpmOS(2),MHpm2OS(2),     & 
& MChiOS(7),MChi2OS(7),MChaOS(2),MCha2OS(2),MFvOS(6),MFv2OS(6),MFeOS(3),MFe2OS(3),       & 
& MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,              & 
& MVZp2OS,MVWmOS,MVWm2OS,ZHOS(4,4),ZAOS(4,4),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZUOS(6,6),ZEOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZNOS(7,7),UMOS(2,2),              & 
& UPOS(2,2),UVOS(6,6),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Real(dp) :: p2, q2, q2_save 
Real(dp) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplAhAhAhAh1(4,4,4,4),cplAhAhhhhh1(4,4,4,4),cplAhAhHpmcHpm1(4,4,2,2),cplAhAhSdcSdaa(4,4,6,6),& 
& cplAhAhSecSe1(4,4,6,6),cplAhAhSucSuaa(4,4,6,6),cplAhAhSvImSvIm1(4,4,6,6),              & 
& cplAhAhSvImSvRe1(4,4,6,6),cplAhAhSvReSvRe1(4,4,6,6),cplAhhhHpmcHpm1(4,4,2,2),          & 
& cplAhhhSvImSvIm1(4,4,6,6),cplAhhhSvImSvRe1(4,4,6,6),cplAhhhSvReSvRe1(4,4,6,6),         & 
& cplAhHpmSucSdaa(4,2,6,6),cplAhHpmSvImcSe1(4,2,6,6),cplAhHpmSvRecSe1(4,2,6,6),          & 
& cplAhSdcHpmcSuaa(4,6,2,6),cplAhSeSvImcHpm1(4,6,6,2),cplAhSeSvRecHpm1(4,6,6,2),         & 
& cplhhhhhhhh1(4,4,4,4),cplhhhhHpmcHpm1(4,4,2,2),cplhhhhSdcSdaa(4,4,6,6),cplhhhhSecSe1(4,4,6,6),& 
& cplhhhhSucSuaa(4,4,6,6),cplhhhhSvImSvIm1(4,4,6,6),cplhhhhSvImSvRe1(4,4,6,6),           & 
& cplhhhhSvReSvRe1(4,4,6,6),cplhhHpmSucSdaa(4,2,6,6),cplhhHpmSvImcSe1(4,2,6,6),          & 
& cplhhHpmSvRecSe1(4,2,6,6),cplhhSdcHpmcSuaa(4,6,2,6),cplhhSeSvImcHpm1(4,6,6,2),         & 
& cplhhSeSvRecHpm1(4,6,6,2),cplHpmHpmcHpmcHpm1(2,2,2,2),cplHpmSdcHpmcSdaa(2,6,2,6),      & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSvImSvImcHpm1(2,6,6,2),     & 
& cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdSdcSdcSdabba(6,6,6,6),  & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvImcSecSuaa(6,6,6,6),     & 
& cplSdSvReSvRecSdaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),        & 
& cplSeSuSvImcSdaa(6,6,6,6),cplSeSuSvRecSdaa(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),          & 
& cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),cplSeSvReSvRecSe1(6,6,6,6),      & 
& cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),     & 
& cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),cplSvImSvImSvImSvIm1(6,6,6,6), & 
& cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),cplSvImSvReSvReSvRe1(6,6,6,6),& 
& cplSvReSvReSvReSvRe1(6,6,6,6),cplAhAhVPVP1(4,4),cplAhAhVPVZ1(4,4),cplAhAhVPVZp1(4,4),  & 
& cplAhAhcVWmVWm1(4,4),cplAhAhVZVZ1(4,4),cplAhAhVZVZp1(4,4),cplAhAhVZpVZp1(4,4),         & 
& cplAhHpmcVWmVP1(4,2),cplAhHpmcVWmVZ1(4,2),cplAhHpmcVWmVZp1(4,2),cplAhcHpmVPVWm1(4,2),  & 
& cplAhcHpmVWmVZ1(4,2),cplAhcHpmVWmVZp1(4,2),cplhhhhVPVP1(4,4),cplhhhhVPVZ1(4,4),        & 
& cplhhhhVPVZp1(4,4),cplhhhhcVWmVWm1(4,4),cplhhhhVZVZ1(4,4),cplhhhhVZVZp1(4,4),          & 
& cplhhhhVZpVZp1(4,4),cplhhHpmcVWmVP1(4,2),cplhhHpmcVWmVZ1(4,2),cplhhHpmcVWmVZp1(4,2),   & 
& cplhhcHpmVPVWm1(4,2),cplhhcHpmVWmVZ1(4,2),cplhhcHpmVWmVZp1(4,2),cplHpmcHpmVPVP1(2,2),  & 
& cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVPVZp1(2,2),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVZVZ1(2,2),& 
& cplHpmcHpmVZVZp1(2,2),cplHpmcHpmVZpVZp1(2,2),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVGVPLamct3ct2ct1(6,6),          & 
& cplSdcSdVGVZLamct3ct2ct1(6,6),cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSucVWmVPaa(6,6),    & 
& cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6),cplSdcSdVZVZpaa(6,6),cplSdcSucVWmVZaa(6,6), & 
& cplSdcSdVZpVZpaa(6,6),cplSdcSucVWmVZpaa(6,6),cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6),& 
& cplSeSvImcVWmVZp1(6,6),cplSeSvRecVWmVP1(6,6),cplSeSvRecVWmVZ1(6,6),cplSeSvRecVWmVZp1(6,6),& 
& cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),cplSecSecVWmVWm1(6,6)

Complex(dp) :: cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),cplSecSeVZpVZp1(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVGVPLamct3ct2ct1(6,6),          & 
& cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),cplSucSuVGVZpLamct3ct2ct1(6,6),& 
& cplSucSuVPVPaa(6,6),cplSucSdVPVWmaa(6,6),cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),     & 
& cplSucSdVWmVZaa(6,6),cplSucSdVWmVZpaa(6,6),cplSucSucVWmVWmaa(6,6),cplSucSuVZVZaa(6,6), & 
& cplSucSuVZVZpaa(6,6),cplSucSuVZpVZpaa(6,6),cplSvImSvImVPVP1(6,6),cplSvImSvImVPVZ1(6,6),& 
& cplSvImSvImVPVZp1(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvImSvImVZVZ1(6,6),cplSvImSvImVZVZp1(6,6),& 
& cplSvImSvImVZpVZp1(6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvImcSeVWmVZp1(6,6),& 
& cplSvReSvReVPVP1(6,6),cplSvReSvReVPVZ1(6,6),cplSvReSvReVPVZp1(6,6),cplSvReSvRecVWmVWm1(6,6),& 
& cplSvReSvReVZVZ1(6,6),cplSvReSvReVZVZp1(6,6),cplSvReSvReVZpVZp1(6,6),cplSvRecSeVPVWm1(6,6),& 
& cplSvRecSeVWmVZ1(6,6),cplSvRecSeVWmVZp1(6,6),cplVGVGVGVG1Q,cplVGVGVGVG2Q,              & 
& cplVGVGVGVG3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWmVZ1Q,     & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,& 
& cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ1Q,          & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp3Q,& 
& cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q

Complex(dp) :: cplAhAhhh(4,4,4),cplAhHpmcHpm(4,2,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),      & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),              & 
& cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplAhAhAhAh(4,4,4,4),cplAhAhhhhh(4,4,4,4),   & 
& cplAhAhHpmcHpm(4,4,2,2),cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),& 
& cplAhAhSvImSvIm(4,4,6,6),cplAhAhSvImSvRe(4,4,6,6),cplAhAhSvReSvRe(4,4,6,6),            & 
& cplAhhhHpmcHpm(4,4,2,2),cplAhhhSvImSvIm(4,4,6,6),cplAhhhSvImSvRe(4,4,6,6),             & 
& cplAhhhSvReSvRe(4,4,6,6),cplAhHpmSucSd(4,2,6,6),cplAhHpmSvImcSe(4,2,6,6),              & 
& cplAhHpmSvRecSe(4,2,6,6),cplAhSdcHpmcSu(4,6,2,6),cplAhSeSvImcHpm(4,6,6,2),             & 
& cplAhSeSvRecHpm(4,6,6,2),cplhhhhhhhh(4,4,4,4),cplhhhhHpmcHpm(4,4,2,2),cplhhhhSdcSd(4,4,6,6),& 
& cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvImSvRe(4,4,6,6),& 
& cplhhhhSvReSvRe(4,4,6,6),cplhhHpmSucSd(4,2,6,6),cplhhHpmSvImcSe(4,2,6,6),              & 
& cplhhHpmSvRecSe(4,2,6,6),cplhhSdcHpmcSu(4,6,2,6),cplhhSeSvImcHpm(4,6,6,2),             & 
& cplhhSeSvRecHpm(4,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),          & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),        & 
& cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),               & 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcVWm(4,2),cplAhcHpmVWm(4,2),     & 
& cplhhHpmcVWm(4,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),     & 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),& 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcVWmVWm(4),      & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),             & 
& cplHpmcVWmVZp(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplAhAhVPVP(4,4),    & 
& cplAhAhVPVZ(4,4),cplAhAhVPVZp(4,4),cplAhAhcVWmVWm(4,4),cplAhAhVZVZ(4,4),               & 
& cplAhAhVZVZp(4,4),cplAhAhVZpVZp(4,4),cplAhHpmcVWmVP(4,2),cplAhHpmcVWmVZ(4,2),          & 
& cplAhHpmcVWmVZp(4,2),cplAhcHpmVPVWm(4,2),cplAhcHpmVWmVZ(4,2),cplAhcHpmVWmVZp(4,2)

Complex(dp) :: cplhhhhVPVP(4,4),cplhhhhVPVZ(4,4),cplhhhhVPVZp(4,4),cplhhhhcVWmVWm(4,4),               & 
& cplhhhhVZVZ(4,4),cplhhhhVZVZp(4,4),cplhhhhVZpVZp(4,4),cplhhHpmcVWmVP(4,2),             & 
& cplhhHpmcVWmVZ(4,2),cplhhHpmcVWmVZp(4,2),cplhhcHpmVPVWm(4,2),cplhhcHpmVWmVZ(4,2),      & 
& cplhhcHpmVWmVZp(4,2),cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmVPVZp(2,2),     & 
& cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),cplHpmcHpmVZVZp(2,2),cplHpmcHpmVZpVZp(2,2), & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSdVGVZp(6,6),              & 
& cplSdcSucVWmVG(6,6),cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSdVPVZp(6,6),            & 
& cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),cplSdcSdVZVZ(6,6),cplSdcSdVZVZp(6,6),         & 
& cplSdcSucVWmVZ(6,6),cplSdcSdVZpVZp(6,6),cplSdcSucVWmVZp(6,6),cplSeSvImcVWmVP(6,6),     & 
& cplSeSvImcVWmVZ(6,6),cplSeSvImcVWmVZp(6,6),cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),  & 
& cplSeSvRecVWmVZp(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVPVZp(6,6),          & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSecSeVZVZp(6,6),cplSecSeVZpVZp(6,6),         & 
& cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),              & 
& cplSucSuVGVZp(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),cplSucSuVPVZ(6,6),             & 
& cplSucSuVPVZp(6,6),cplSucSdVWmVZ(6,6),cplSucSdVWmVZp(6,6),cplSucSucVWmVWm(6,6),        & 
& cplSucSuVZVZ(6,6),cplSucSuVZVZp(6,6),cplSucSuVZpVZp(6,6),cplSvImSvImVPVP(6,6),         & 
& cplSvImSvImVPVZ(6,6),cplSvImSvImVPVZp(6,6),cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),& 
& cplSvImSvImVZVZp(6,6),cplSvImSvImVZpVZp(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvImcSeVWmVZp(6,6),cplSvReSvReVPVP(6,6),cplSvReSvReVPVZ(6,6),cplSvReSvReVPVZp(6,6), & 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvReSvReVZVZp(6,6),cplSvReSvReVZpVZp(6,6),& 
& cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),cplSvRecSeVWmVZp(6,6),cplVGVGVG,             & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),     & 
& cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),           & 
& cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),       & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Complex(dp) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3), & 
& cplcFdFdVZpR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),             & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),& 
& cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6), & 
& cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,      & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,& 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,& 
& cplcgGgGVG,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,               & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,              & 
& cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh(4),cplcgWpCgWpCAh(4),        & 
& cplcgZgAhh(4),cplcgZpgAhh(4),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),cplcgWmgWmhh(4),        & 
& cplcgZgWmcHpm(2),cplcgZpgWmcHpm(2),cplcgWpCgWpChh(4),cplcgZgWpCHpm(2),cplcgZpgWpCHpm(2),& 
& cplcgZgZhh(4),cplcgZpgZhh(4),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),cplcgZgZphh(4),         & 
& cplcgZpgZphh(4),cplcgWmgZpHpm(2),cplcgWpCgZpcHpm(2)

Complex(dp) :: ctcplAhAhhh(4,4,4),ctcplAhHpmcHpm(4,2,2),ctcplAhSdcSd(4,6,6),ctcplAhSecSe(4,6,6),     & 
& ctcplAhSucSu(4,6,6),ctcplAhSvImSvIm(4,6,6),ctcplAhSvImSvRe(4,6,6),ctcplAhSvReSvRe(4,6,6),& 
& ctcplhhhhhh(4,4,4),ctcplhhHpmcHpm(4,2,2),ctcplhhSdcSd(4,6,6),ctcplhhSecSe(4,6,6),      & 
& ctcplhhSucSu(4,6,6),ctcplhhSvImSvIm(4,6,6),ctcplhhSvImSvRe(4,6,6),ctcplhhSvReSvRe(4,6,6),& 
& ctcplHpmSucSd(2,6,6),ctcplHpmSvImcSe(2,6,6),ctcplHpmSvRecSe(2,6,6),ctcplSdcHpmcSu(6,2,6),& 
& ctcplSeSvImcHpm(6,6,2),ctcplSeSvRecHpm(6,6,2),ctcplAhhhVP(4,4),ctcplAhhhVZ(4,4),       & 
& ctcplAhhhVZp(4,4),ctcplAhHpmcVWm(4,2),ctcplAhcHpmVWm(4,2),ctcplhhHpmcVWm(4,2),         & 
& ctcplhhcHpmVWm(4,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplHpmcHpmVZp(2,2),      & 
& ctcplSdcSdVG(6,6),ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6),              & 
& ctcplSdcSucVWm(6,6),ctcplSeSvImcVWm(6,6),ctcplSeSvRecVWm(6,6),ctcplSecSeVP(6,6),       & 
& ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6),ctcplSucSuVG(6,6),ctcplSucSuVP(6,6),              & 
& ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),ctcplSucSuVZp(6,6),ctcplSvImSvReVP(6,6),          & 
& ctcplSvImSvReVZ(6,6),ctcplSvImSvReVZp(6,6),ctcplSvImcSeVWm(6,6),ctcplSvRecSeVWm(6,6),  & 
& ctcplhhVPVZ(4),ctcplhhVPVZp(4),ctcplhhcVWmVWm(4),ctcplhhVZVZ(4),ctcplhhVZVZp(4),       & 
& ctcplhhVZpVZp(4),ctcplHpmcVWmVP(2),ctcplHpmcVWmVZ(2),ctcplHpmcVWmVZp(2),               & 
& ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),ctcplcHpmVWmVZp(2),ctcplVGVGVG,ctcplcVWmVPVWm,     & 
& ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,ctcplcChaChaAhL(2,2,4),ctcplcChaChaAhR(2,2,4),          & 
& ctcplChiChiAhL(7,7,4),ctcplChiChiAhR(7,7,4),ctcplcFdFdAhL(3,3,4),ctcplcFdFdAhR(3,3,4), & 
& ctcplcFeFeAhL(3,3,4),ctcplcFeFeAhR(3,3,4),ctcplcFuFuAhL(3,3,4),ctcplcFuFuAhR(3,3,4),   & 
& ctcplFvFvAhL(6,6,4),ctcplFvFvAhR(6,6,4),ctcplChiChacHpmL(7,2,2),ctcplChiChacHpmR(7,2,2),& 
& ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6),& 
& ctcplcChaChahhL(2,2,4),ctcplcChaChahhR(2,2,4),ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),& 
& ctcplcFeChaSvImL(3,2,6),ctcplcFeChaSvImR(3,2,6),ctcplcFeChaSvReL(3,2,6),               & 
& ctcplcFeChaSvReR(3,2,6),ctcplChiChihhL(7,7,4),ctcplChiChihhR(7,7,4),ctcplChiFdcSdL(7,3,6),& 
& ctcplChiFdcSdR(7,3,6),ctcplChiFecSeL(7,3,6),ctcplChiFecSeR(7,3,6),ctcplChiFucSuL(7,3,6),& 
& ctcplChiFucSuR(7,3,6),ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6),ctcplChiFvSvReL(7,6,6),& 
& ctcplChiFvSvReR(7,6,6),ctcplcChaChiHpmL(2,7,2),ctcplcChaChiHpmR(2,7,2),ctcplcFdChiSdL(3,7,6),& 
& ctcplcFdChiSdR(3,7,6),ctcplcFeChiSeL(3,7,6),ctcplcFeChiSeR(3,7,6),ctcplcFuChiSuL(3,7,6),& 
& ctcplcFuChiSuR(3,7,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,4),    & 
& ctcplcFdFdhhR(3,3,4),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),& 
& ctcplcFuFdcHpmR(3,3,2),ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),ctcplcFeFehhL(3,3,4),& 
& ctcplcFeFehhR(3,3,4),ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),& 
& ctcplcChaFeSvReR(2,3,6),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6),ctcplcFuFuhhL(3,3,4),  & 
& ctcplcFuFuhhR(3,3,4),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2),ctcplFvFvhhL(6,6,4),  & 
& ctcplFvFvhhR(6,6,4),ctcplcFeFvHpmL(3,6,2),ctcplcFeFvHpmR(3,6,2),ctcplcChaFvSeL(2,6,6), & 
& ctcplcChaFvSeR(2,6,6),ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),     & 
& ctcplcFuGluSuR(3,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplChiChacVWmL(7,2)

Complex(dp) :: ctcplChiChacVWmR(7,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
& ctcplcChaChaVZR(2,2),ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2),ctcplChiChiVPL(7,7),  & 
& ctcplChiChiVPR(7,7),ctcplChiChiVZL(7,7),ctcplChiChiVZR(7,7),ctcplChiChiVZpL(7,7),      & 
& ctcplChiChiVZpR(7,7),ctcplcChaChiVWmL(2,7),ctcplcChaChiVWmR(2,7),ctcplcFdFdVGL(3,3),   & 
& ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),           & 
& ctcplcFdFdVZR(3,3),ctcplcFdFdVZpL(3,3),ctcplcFdFdVZpR(3,3),ctcplcFuFdcVWmL(3,3),       & 
& ctcplcFuFdcVWmR(3,3),ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3),ctcplcFeFeVPL(3,3),       & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFeFeVZpL(3,3),          & 
& ctcplcFeFeVZpR(3,3),ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),          & 
& ctcplcFuFuVPR(3,3),ctcplcFdFuVWmL(3,3),ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),         & 
& ctcplcFuFuVZR(3,3),ctcplcFuFuVZpL(3,3),ctcplcFuFuVZpR(3,3),ctcplFvFvVPL(6,6),          & 
& ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6),ctcplFvFvVZpL(6,6),              & 
& ctcplFvFvVZpR(6,6),ctcplcFeFvVWmL(3,6),ctcplcFeFvVWmR(3,6),ctcplGluGluVGL,             & 
& ctcplGluGluVGR

Complex(dp) :: ZRUZD(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZH(4,4),ZRUZA(4,4),       & 
& ZRUZP(2,2),ZRUZN(7,7),ZRUUM(2,2),ZRUUP(2,2),ZRUUV(6,6),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Complex(dp) :: ZcplAhAhhh(4,4,4),ZcplAhHpmcHpm(4,2,2),ZcplAhSdcSd(4,6,6),ZcplAhSecSe(4,6,6),         & 
& ZcplAhSucSu(4,6,6),ZcplAhSvImSvIm(4,6,6),ZcplAhSvImSvRe(4,6,6),ZcplAhSvReSvRe(4,6,6),  & 
& Zcplhhhhhh(4,4,4),ZcplhhHpmcHpm(4,2,2),ZcplhhSdcSd(4,6,6),ZcplhhSecSe(4,6,6),          & 
& ZcplhhSucSu(4,6,6),ZcplhhSvImSvIm(4,6,6),ZcplhhSvImSvRe(4,6,6),ZcplhhSvReSvRe(4,6,6),  & 
& ZcplHpmSucSd(2,6,6),ZcplHpmSvImcSe(2,6,6),ZcplHpmSvRecSe(2,6,6),ZcplSdcHpmcSu(6,2,6),  & 
& ZcplSeSvImcHpm(6,6,2),ZcplSeSvRecHpm(6,6,2),ZcplAhAhAhAh(4,4,4,4),ZcplAhAhhhhh(4,4,4,4),& 
& ZcplAhAhHpmcHpm(4,4,2,2),ZcplAhAhSdcSd(4,4,6,6),ZcplAhAhSecSe(4,4,6,6),ZcplAhAhSucSu(4,4,6,6),& 
& ZcplAhAhSvImSvIm(4,4,6,6),ZcplAhAhSvImSvRe(4,4,6,6),ZcplAhAhSvReSvRe(4,4,6,6),         & 
& ZcplAhhhHpmcHpm(4,4,2,2),ZcplAhhhSvImSvIm(4,4,6,6),ZcplAhhhSvImSvRe(4,4,6,6),          & 
& ZcplAhhhSvReSvRe(4,4,6,6),ZcplAhHpmSucSd(4,2,6,6),ZcplAhHpmSvImcSe(4,2,6,6),           & 
& ZcplAhHpmSvRecSe(4,2,6,6),ZcplAhSdcHpmcSu(4,6,2,6),ZcplAhSeSvImcHpm(4,6,6,2),          & 
& ZcplAhSeSvRecHpm(4,6,6,2),Zcplhhhhhhhh(4,4,4,4),ZcplhhhhHpmcHpm(4,4,2,2),              & 
& ZcplhhhhSdcSd(4,4,6,6),ZcplhhhhSecSe(4,4,6,6),ZcplhhhhSucSu(4,4,6,6),ZcplhhhhSvImSvIm(4,4,6,6),& 
& ZcplhhhhSvImSvRe(4,4,6,6),ZcplhhhhSvReSvRe(4,4,6,6),ZcplhhHpmSucSd(4,2,6,6),           & 
& ZcplhhHpmSvImcSe(4,2,6,6),ZcplhhHpmSvRecSe(4,2,6,6),ZcplhhSdcHpmcSu(4,6,2,6),          & 
& ZcplhhSeSvImcHpm(4,6,6,2),ZcplhhSeSvRecHpm(4,6,6,2),ZcplHpmHpmcHpmcHpm(2,2,2,2),       & 
& ZcplHpmSdcHpmcSd(2,6,2,6),ZcplHpmSecHpmcSe(2,6,2,6),ZcplHpmSucHpmcSu(2,6,2,6),         & 
& ZcplHpmSvImSvImcHpm(2,6,6,2),ZcplHpmSvImSvRecHpm(2,6,6,2),ZcplHpmSvReSvRecHpm(2,6,6,2),& 
& ZcplSdSdcSdcSd(6,6,6,6),ZcplSdSecSdcSe(6,6,6,6),ZcplSdSucSdcSu(6,6,6,6),               & 
& ZcplSdSvImSvImcSd(6,6,6,6),ZcplSdSvImcSecSu(6,6,6,6),ZcplSdSvReSvRecSd(6,6,6,6),       & 
& ZcplSdSvRecSecSu(6,6,6,6),ZcplSeSecSecSe(6,6,6,6),ZcplSeSuSvImcSd(6,6,6,6),            & 
& ZcplSeSuSvRecSd(6,6,6,6),ZcplSeSucSecSu(6,6,6,6),ZcplSeSvImSvImcSe(6,6,6,6),           & 
& ZcplSeSvImSvRecSe(6,6,6,6),ZcplSeSvReSvRecSe(6,6,6,6),ZcplSuSucSucSu(6,6,6,6),         & 
& ZcplSuSvImSvImcSu(6,6,6,6),ZcplSuSvImSvRecSu(6,6,6,6),ZcplSuSvReSvRecSu(6,6,6,6),      & 
& ZcplSvImSvImSvImSvIm(6,6,6,6),ZcplSvImSvImSvImSvRe(6,6,6,6),ZcplSvImSvImSvReSvRe(6,6,6,6),& 
& ZcplSvImSvReSvReSvRe(6,6,6,6),ZcplSvReSvReSvReSvRe(6,6,6,6),ZcplAhhhVP(4,4),           & 
& ZcplAhhhVZ(4,4),ZcplAhhhVZp(4,4),ZcplAhHpmcVWm(4,2),ZcplAhcHpmVWm(4,2),ZcplhhHpmcVWm(4,2),& 
& ZcplhhcHpmVWm(4,2),ZcplHpmcHpmVP(2,2),ZcplHpmcHpmVZ(2,2),ZcplHpmcHpmVZp(2,2),          & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSdcSdVZ(6,6),ZcplSdcSdVZp(6,6),ZcplSdcSucVWm(6,6),& 
& ZcplSeSvImcVWm(6,6),ZcplSeSvRecVWm(6,6),ZcplSecSeVP(6,6),ZcplSecSeVZ(6,6),             & 
& ZcplSecSeVZp(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6),ZcplSucSdVWm(6,6),ZcplSucSuVZ(6,6),& 
& ZcplSucSuVZp(6,6),ZcplSvImSvReVP(6,6),ZcplSvImSvReVZ(6,6),ZcplSvImSvReVZp(6,6),        & 
& ZcplSvImcSeVWm(6,6),ZcplSvRecSeVWm(6,6),ZcplhhVPVZ(4),ZcplhhVPVZp(4),ZcplhhcVWmVWm(4), & 
& ZcplhhVZVZ(4),ZcplhhVZVZp(4),ZcplhhVZpVZp(4),ZcplHpmcVWmVP(2),ZcplHpmcVWmVZ(2),        & 
& ZcplHpmcVWmVZp(2),ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),ZcplcHpmVWmVZp(2),ZcplAhAhVPVP(4,4),& 
& ZcplAhAhVPVZ(4,4),ZcplAhAhVPVZp(4,4),ZcplAhAhcVWmVWm(4,4),ZcplAhAhVZVZ(4,4),           & 
& ZcplAhAhVZVZp(4,4),ZcplAhAhVZpVZp(4,4),ZcplAhHpmcVWmVP(4,2),ZcplAhHpmcVWmVZ(4,2)

Complex(dp) :: ZcplAhHpmcVWmVZp(4,2),ZcplAhcHpmVPVWm(4,2),ZcplAhcHpmVWmVZ(4,2),ZcplAhcHpmVWmVZp(4,2), & 
& ZcplhhhhVPVP(4,4),ZcplhhhhVPVZ(4,4),ZcplhhhhVPVZp(4,4),ZcplhhhhcVWmVWm(4,4),           & 
& ZcplhhhhVZVZ(4,4),ZcplhhhhVZVZp(4,4),ZcplhhhhVZpVZp(4,4),ZcplhhHpmcVWmVP(4,2),         & 
& ZcplhhHpmcVWmVZ(4,2),ZcplhhHpmcVWmVZp(4,2),ZcplhhcHpmVPVWm(4,2),ZcplhhcHpmVWmVZ(4,2),  & 
& ZcplhhcHpmVWmVZp(4,2),ZcplHpmcHpmVPVP(2,2),ZcplHpmcHpmVPVZ(2,2),ZcplHpmcHpmVPVZp(2,2), & 
& ZcplHpmcHpmcVWmVWm(2,2),ZcplHpmcHpmVZVZ(2,2),ZcplHpmcHpmVZVZp(2,2),ZcplHpmcHpmVZpVZp(2,2),& 
& ZcplSdcSdVGVG(6,6),ZcplSdcSdVGVP(6,6),ZcplSdcSdVGVZ(6,6),ZcplSdcSdVGVZp(6,6),          & 
& ZcplSdcSucVWmVG(6,6),ZcplSdcSdVPVP(6,6),ZcplSdcSdVPVZ(6,6),ZcplSdcSdVPVZp(6,6),        & 
& ZcplSdcSucVWmVP(6,6),ZcplSdcSdcVWmVWm(6,6),ZcplSdcSdVZVZ(6,6),ZcplSdcSdVZVZp(6,6),     & 
& ZcplSdcSucVWmVZ(6,6),ZcplSdcSdVZpVZp(6,6),ZcplSdcSucVWmVZp(6,6),ZcplSeSvImcVWmVP(6,6), & 
& ZcplSeSvImcVWmVZ(6,6),ZcplSeSvImcVWmVZp(6,6),ZcplSeSvRecVWmVP(6,6),ZcplSeSvRecVWmVZ(6,6),& 
& ZcplSeSvRecVWmVZp(6,6),ZcplSecSeVPVP(6,6),ZcplSecSeVPVZ(6,6),ZcplSecSeVPVZp(6,6),      & 
& ZcplSecSecVWmVWm(6,6),ZcplSecSeVZVZ(6,6),ZcplSecSeVZVZp(6,6),ZcplSecSeVZpVZp(6,6),     & 
& ZcplSucSuVGVG(6,6),ZcplSucSuVGVP(6,6),ZcplSucSdVGVWm(6,6),ZcplSucSuVGVZ(6,6),          & 
& ZcplSucSuVGVZp(6,6),ZcplSucSuVPVP(6,6),ZcplSucSdVPVWm(6,6),ZcplSucSuVPVZ(6,6),         & 
& ZcplSucSuVPVZp(6,6),ZcplSucSdVWmVZ(6,6),ZcplSucSdVWmVZp(6,6),ZcplSucSucVWmVWm(6,6),    & 
& ZcplSucSuVZVZ(6,6),ZcplSucSuVZVZp(6,6),ZcplSucSuVZpVZp(6,6),ZcplSvImSvImVPVP(6,6),     & 
& ZcplSvImSvImVPVZ(6,6),ZcplSvImSvImVPVZp(6,6),ZcplSvImSvImcVWmVWm(6,6),ZcplSvImSvImVZVZ(6,6),& 
& ZcplSvImSvImVZVZp(6,6),ZcplSvImSvImVZpVZp(6,6),ZcplSvImcSeVPVWm(6,6),ZcplSvImcSeVWmVZ(6,6),& 
& ZcplSvImcSeVWmVZp(6,6),ZcplSvReSvReVPVP(6,6),ZcplSvReSvReVPVZ(6,6),ZcplSvReSvReVPVZp(6,6),& 
& ZcplSvReSvRecVWmVWm(6,6),ZcplSvReSvReVZVZ(6,6),ZcplSvReSvReVZVZp(6,6),ZcplSvReSvReVZpVZp(6,6),& 
& ZcplSvRecSeVPVWm(6,6),ZcplSvRecSeVWmVZ(6,6),ZcplSvRecSeVWmVZp(6,6),ZcplVGVGVG,         & 
& ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,ZcplcChaChaAhL(2,2,4),ZcplcChaChaAhR(2,2,4),& 
& ZcplChiChiAhL(7,7,4),ZcplChiChiAhR(7,7,4),ZcplcFdFdAhL(3,3,4),ZcplcFdFdAhR(3,3,4),     & 
& ZcplcFeFeAhL(3,3,4),ZcplcFeFeAhR(3,3,4),ZcplcFuFuAhL(3,3,4),ZcplcFuFuAhR(3,3,4),       & 
& ZcplFvFvAhL(6,6,4),ZcplFvFvAhR(6,6,4),ZcplChiChacHpmL(7,2,2),ZcplChiChacHpmR(7,2,2),   & 
& ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),   & 
& ZcplcChaChahhL(2,2,4),ZcplcChaChahhR(2,2,4),ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6), & 
& ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),& 
& ZcplChiChihhL(7,7,4),ZcplChiChihhR(7,7,4),ZcplChiFdcSdL(7,3,6),ZcplChiFdcSdR(7,3,6),   & 
& ZcplChiFecSeL(7,3,6),ZcplChiFecSeR(7,3,6),ZcplChiFucSuL(7,3,6),ZcplChiFucSuR(7,3,6),   & 
& ZcplChiFvSvImL(7,6,6),ZcplChiFvSvImR(7,6,6),ZcplChiFvSvReL(7,6,6),ZcplChiFvSvReR(7,6,6),& 
& ZcplcChaChiHpmL(2,7,2),ZcplcChaChiHpmR(2,7,2),ZcplcFdChiSdL(3,7,6),ZcplcFdChiSdR(3,7,6),& 
& ZcplcFeChiSeL(3,7,6),ZcplcFeChiSeR(3,7,6),ZcplcFuChiSuL(3,7,6),ZcplcFuChiSuR(3,7,6),   & 
& ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),ZcplcFdFdhhL(3,3,4),ZcplcFdFdhhR(3,3,4),         & 
& ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),ZcplcFuFdcHpmL(3,3,2),ZcplcFuFdcHpmR(3,3,2),& 
& ZcplFvFecHpmL(6,3,2),ZcplFvFecHpmR(6,3,2),ZcplcFeFehhL(3,3,4),ZcplcFeFehhR(3,3,4)

Complex(dp) :: ZcplcChaFeSvImL(2,3,6),ZcplcChaFeSvImR(2,3,6),ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),& 
& ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),ZcplcFuFuhhL(3,3,4),ZcplcFuFuhhR(3,3,4),         & 
& ZcplcFdFuHpmL(3,3,2),ZcplcFdFuHpmR(3,3,2),ZcplFvFvhhL(6,6,4),ZcplFvFvhhR(6,6,4),       & 
& ZcplcFeFvHpmL(3,6,2),ZcplcFeFvHpmR(3,6,2),ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),   & 
& ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),           & 
& ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),ZcplChiChacVWmL(7,2),ZcplChiChacVWmR(7,2), & 
& ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),ZcplcChaChaVZL(2,2),ZcplcChaChaVZR(2,2),       & 
& ZcplcChaChaVZpL(2,2),ZcplcChaChaVZpR(2,2),ZcplChiChiVPL(7,7),ZcplChiChiVPR(7,7),       & 
& ZcplChiChiVZL(7,7),ZcplChiChiVZR(7,7),ZcplChiChiVZpL(7,7),ZcplChiChiVZpR(7,7),         & 
& ZcplcChaChiVWmL(2,7),ZcplcChaChiVWmR(2,7),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFdFdVZpL(3,3),ZcplcFdFdVZpR(3,3),ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),         & 
& ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),             & 
& ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),ZcplcFeFeVZpL(3,3),ZcplcFeFeVZpR(3,3),             & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
& ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplcFuFuVZpL(3,3),ZcplcFuFuVZpR(3,3),ZcplFvFvVPL(6,6),ZcplFvFvVPR(6,6),               & 
& ZcplFvFvVZL(6,6),ZcplFvFvVZR(6,6),ZcplFvFvVZpL(6,6),ZcplFvFvVZpR(6,6),ZcplcFeFvVWmL(3,6),& 
& ZcplcFeFvVWmR(3,6),ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,            & 
& ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,     & 
& ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,ZcplcVWmVPVWmVZp1,ZcplcVWmVPVWmVZp2,ZcplcVWmVPVWmVZp3,& 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcVWmVWmVZVZp1,ZcplcVWmVWmVZVZp2,ZcplcVWmVWmVZVZp3,& 
& ZcplcVWmVWmVZpVZp1,ZcplcVWmVWmVZpVZp2,ZcplcVWmVWmVZpVZp3,ZcplcgGgGVG,ZcplcgWmgAVWm,    & 
& ZcplcgWpCgAcVWm,ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgWmgWmVZp,ZcplcgAgWmcVWm,             & 
& ZcplcgZgWmcVWm,ZcplcgZpgWmcVWm,ZcplcgWpCgWpCVP,ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,          & 
& ZcplcgZpgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWpCgWpCVZp,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,        & 
& ZcplcgWmgZpVWm,ZcplcgWpCgZpcVWm,ZcplcgWmgWmAh(4),ZcplcgWpCgWpCAh(4),ZcplcgZgAhh(4),    & 
& ZcplcgZpgAhh(4),ZcplcgWmgAHpm(2),ZcplcgWpCgAcHpm(2),ZcplcgWmgWmhh(4),ZcplcgZgWmcHpm(2),& 
& ZcplcgZpgWmcHpm(2),ZcplcgWpCgWpChh(4),ZcplcgZgWpCHpm(2),ZcplcgZpgWpCHpm(2),            & 
& ZcplcgZgZhh(4),ZcplcgZpgZhh(4),ZcplcgWmgZHpm(2),ZcplcgWpCgZcHpm(2),ZcplcgZgZphh(4),    & 
& ZcplcgZpgZphh(4),ZcplcgWmgZpHpm(2),ZcplcgWpCgZpcHpm(2)

Complex(dp) :: GcplAhHpmcHpm(4,2,2),GcplhhHpmcHpm(4,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(4,2),GcplAhcHpmVWm(4,2),GcplhhHpmcVWm(4,2),GcplhhcHpmVWm(4,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcHpmVZp(2,2),GcplHpmcVWmVP(2),            & 
& GcplHpmcVWmVZ(2),GcplHpmcVWmVZp(2),GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplcHpmVWmVZp(2),& 
& GcplChiChacHpmL(7,2,2),GcplChiChacHpmR(7,2,2),GcplcChaChiHpmL(2,7,2),GcplcChaChiHpmR(2,7,2),& 
& GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2), & 
& GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Complex(dp) :: GZcplAhHpmcHpm(4,2,2),GZcplhhHpmcHpm(4,2,2),GZcplHpmSucSd(2,6,6),GZcplHpmSvImcSe(2,6,6),& 
& GZcplHpmSvRecSe(2,6,6),GZcplSdcHpmcSu(6,2,6),GZcplSeSvImcHpm(6,6,2),GZcplSeSvRecHpm(6,6,2),& 
& GZcplAhHpmcVWm(4,2),GZcplAhcHpmVWm(4,2),GZcplhhHpmcVWm(4,2),GZcplhhcHpmVWm(4,2),       & 
& GZcplHpmcHpmVP(2,2),GZcplHpmcHpmVZ(2,2),GZcplHpmcHpmVZp(2,2),GZcplHpmcVWmVP(2),        & 
& GZcplHpmcVWmVZ(2),GZcplHpmcVWmVZp(2),GZcplcHpmVPVWm(2),GZcplcHpmVWmVZ(2),              & 
& GZcplcHpmVWmVZp(2),GZcplChiChacHpmL(7,2,2),GZcplChiChacHpmR(7,2,2),GZcplcChaChiHpmL(2,7,2),& 
& GZcplcChaChiHpmR(2,7,2),GZcplcFuFdcHpmL(3,3,2),GZcplcFuFdcHpmR(3,3,2),GZcplFvFecHpmL(6,3,2),& 
& GZcplFvFecHpmR(6,3,2),GZcplcFdFuHpmL(3,3,2),GZcplcFdFuHpmR(3,3,2),GZcplcFeFvHpmL(3,6,2),& 
& GZcplcFeFvHpmR(3,6,2)

Complex(dp) :: GosZcplAhHpmcHpm(4,2,2),GosZcplhhHpmcHpm(4,2,2),GosZcplHpmSucSd(2,6,6),               & 
& GosZcplHpmSvImcSe(2,6,6),GosZcplHpmSvRecSe(2,6,6),GosZcplSdcHpmcSu(6,2,6),             & 
& GosZcplSeSvImcHpm(6,6,2),GosZcplSeSvRecHpm(6,6,2),GosZcplAhHpmcVWm(4,2),               & 
& GosZcplAhcHpmVWm(4,2),GosZcplhhHpmcVWm(4,2),GosZcplhhcHpmVWm(4,2),GosZcplHpmcHpmVP(2,2),& 
& GosZcplHpmcHpmVZ(2,2),GosZcplHpmcHpmVZp(2,2),GosZcplHpmcVWmVP(2),GosZcplHpmcVWmVZ(2),  & 
& GosZcplHpmcVWmVZp(2),GosZcplcHpmVPVWm(2),GosZcplcHpmVWmVZ(2),GosZcplcHpmVWmVZp(2),     & 
& GosZcplChiChacHpmL(7,2,2),GosZcplChiChacHpmR(7,2,2),GosZcplcChaChiHpmL(2,7,2),         & 
& GosZcplcChaChiHpmR(2,7,2),GosZcplcFuFdcHpmL(3,3,2),GosZcplcFuFdcHpmR(3,3,2),           & 
& GosZcplFvFecHpmL(6,3,2),GosZcplFvFecHpmR(6,3,2),GosZcplcFdFuHpmL(3,3,2),               & 
& GosZcplcFdFuHpmR(3,3,2),GosZcplcFeFvHpmL(3,6,2),GosZcplcFeFvHpmR(3,6,2)

Real(dp), Intent(out) :: gP1LSd(6,102) 
Real(dp), Intent(out) :: gP1LSu(6,102) 
Real(dp), Intent(out) :: gP1LSe(6,111) 
Real(dp), Intent(out) :: gP1LSvRe(6,168) 
Real(dp), Intent(out) :: gP1LSvIm(6,168) 
Real(dp), Intent(out) :: gP1Lhh(4,320) 
Real(dp), Intent(out) :: gP1LAh(4,318) 
Real(dp), Intent(out) :: gP1LHpm(2,167) 
Real(dp), Intent(out) :: gP1LGlu(1,53) 
Real(dp), Intent(out) :: gP1LCha(2,140) 
Real(dp), Intent(out) :: gP1LChi(7,194) 
Real(dp), Intent(out) :: gP1LFu(3,96) 
Real(dp), Intent(out) :: gP1LFv(6,156) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateOneLoopDecays'
 
Write(*,*) "Calculating one loop decays" 
! Regulator mass for gluon/photon 
MLambda = Mass_Regulator_PhotonGluon 
divset=SetDivonlyAdd(INT(divonly_save)) 
divvalue=SetDivergenceAdd(divergence_save) 
If (.not.CalculateOneLoopMasses) Then 
 If (OSkinematics) Then 
  Write(*,*) "Loop masses not calculated: tree-level masses used for kinematics" 
  OSkinematics = .false. 
 End if
 If (ExternalZfactors) Then 
  Write(*,*) "Loop masses not calculated: no U-factors are applied" 
  ExternalZfactors = .false. 
 End if
End if

If (Extra_scale_loopDecays) Then 
q2_save = GetRenormalizationScale() 
q2 = SetRenormalizationScale(scale_loopdecays **2) 
End if 
If ((OSkinematics).or.(ExternalZfactors)) ShiftIRdiv = .true. 
If (ewOSinDecays) Then 
sinW2=1._dp-mW2/mZ2 
g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2) 
vSM=sqrt(mz2*4._dp/(g1SM**2+g2SM**2)) 
g1=g1SM 
g2=g2SM 
vd=vSM/Sqrt(1 + TanBeta**2) 
vu=TanBeta*vd 
 If (yukOSinDecays) Then !! Allow OS Yukawas only together with vSM 
    YuSM = 0._dp 
    YdSM = 0._dp 
    YuSM = 0._dp 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
   If(GenerationMixing) Then 
    YuSM = Transpose(Matmul(Transpose(CKM),Transpose(YuSM))) 
   End if 
Yu=(vSM*YuSM)/vu 
Yd=(vSM*YdSM)/vd 
Ye=(vSM*YeSM)/vd 
 End if 
End if 
! -------------------------------------------- 
! General information needed in the following 
! -------------------------------------------- 

! DR parameters 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

! Stabilize numerics 
Where (Abs(MSd).lt.1.0E-15_dp) MSd=0._dp
Where (Abs(MSd2).lt.1.0E-30_dp) MSd2=0._dp
Where (Abs(MSu).lt.1.0E-15_dp) MSu=0._dp
Where (Abs(MSu2).lt.1.0E-30_dp) MSu2=0._dp
Where (Abs(MSe).lt.1.0E-15_dp) MSe=0._dp
Where (Abs(MSe2).lt.1.0E-30_dp) MSe2=0._dp
Where (Abs(MSvIm).lt.1.0E-15_dp) MSvIm=0._dp
Where (Abs(MSvIm2).lt.1.0E-30_dp) MSvIm2=0._dp
Where (Abs(MSvRe).lt.1.0E-15_dp) MSvRe=0._dp
Where (Abs(MSvRe2).lt.1.0E-30_dp) MSvRe2=0._dp
Where (Abs(Mhh).lt.1.0E-15_dp) Mhh=0._dp
Where (Abs(Mhh2).lt.1.0E-30_dp) Mhh2=0._dp
Where (Abs(MAh).lt.1.0E-15_dp) MAh=0._dp
Where (Abs(MAh2).lt.1.0E-30_dp) MAh2=0._dp
Where (Abs(MHpm).lt.1.0E-15_dp) MHpm=0._dp
Where (Abs(MHpm2).lt.1.0E-30_dp) MHpm2=0._dp
If (Abs(MGlu).lt.1.0E-15_dp) MGlu=0._dp
If (Abs(MGlu2).lt.1.0E-30_dp) MGlu2=0._dp
Where (Abs(MChi).lt.1.0E-15_dp) MChi=0._dp
Where (Abs(MChi2).lt.1.0E-30_dp) MChi2=0._dp
Where (Abs(MCha).lt.1.0E-15_dp) MCha=0._dp
Where (Abs(MCha2).lt.1.0E-30_dp) MCha2=0._dp
Where (Abs(MFv).lt.1.0E-15_dp) MFv=0._dp
Where (Abs(MFv2).lt.1.0E-30_dp) MFv2=0._dp
Where (Abs(MFe).lt.1.0E-15_dp) MFe=0._dp
Where (Abs(MFe2).lt.1.0E-30_dp) MFe2=0._dp
Where (Abs(MFd).lt.1.0E-15_dp) MFd=0._dp
Where (Abs(MFd2).lt.1.0E-30_dp) MFd2=0._dp
Where (Abs(MFu).lt.1.0E-15_dp) MFu=0._dp
Where (Abs(MFu2).lt.1.0E-30_dp) MFu2=0._dp
If (UseZeroRotationMatrices) Then  ! Rotation matrices calculated for p2=0
ZRUZD = MatMul(ZDOS_0, Conjg(Transpose(ZD)))
ZRUZU = MatMul(ZUOS_0, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS_0, Conjg(Transpose(ZE)))
ZRUZVI = MatMul(ZVIOS_0, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS_0, Conjg(Transpose(ZVR)))
ZRUZH = MatMul(ZHOS_0, Transpose(ZH))
ZRUZA = MatMul(ZAOS_0, Transpose(ZA))
ZRUZP = MatMul(ZPOS_0, Transpose(ZP))
ZRUZN = MatMul(ZNOS_0, Conjg(Transpose(ZN)))
ZRUUM = MatMul(UMOS_0, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS_0, Conjg(Transpose(UP)))
ZRUUV = MatMul(UVOS_0, Conjg(Transpose(UV)))
ZRUZEL = MatMul(ZELOS_0, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS_0, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS_0, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS_0, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS_0, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS_0, Conjg(Transpose(ZUR)))
Else If (UseP2Matrices) Then   ! p2 dependent matrix 
ZRUZD = MatMul(ZDOS_p2, Conjg(Transpose(ZD)))
ZRUZU = MatMul(ZUOS_p2, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS_p2, Conjg(Transpose(ZE)))
ZRUZVI = MatMul(ZVIOS_p2, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS_p2, Conjg(Transpose(ZVR)))
ZRUZH = MatMul(ZHOS_p2, Transpose(ZH))
ZRUZA = MatMul(ZAOS_p2, Transpose(ZA))
ZRUZP = MatMul(ZPOS_p2, Transpose(ZP))
ZRUZN = MatMul(ZNOS_p2, Conjg(Transpose(ZN)))
ZRUUM = MatMul(UMOS_p2, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS_p2, Conjg(Transpose(UP)))
ZRUUV = MatMul(UVOS_p2, Conjg(Transpose(UV)))
ZRUZEL = MatMul(ZELOS_p2, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS_p2, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS_p2, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS_p2, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS_p2, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS_p2, Conjg(Transpose(ZUR)))
Else  ! Rotation matrix for lightest state
ZRUZD = MatMul(ZDOS, Conjg(Transpose(ZD)))
ZRUZU = MatMul(ZUOS, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS, Conjg(Transpose(ZE)))
ZRUZVI = MatMul(ZVIOS, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS, Conjg(Transpose(ZVR)))
ZRUZH = MatMul(ZHOS, Transpose(ZH))
ZRUZA = MatMul(ZAOS, Transpose(ZA))
ZRUZP = MatMul(ZPOS, Transpose(ZP))
ZRUZN = MatMul(ZNOS, Conjg(Transpose(ZN)))
ZRUUM = MatMul(UMOS, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS, Conjg(Transpose(UP)))
ZRUUV = MatMul(UVOS, Conjg(Transpose(UV)))
ZRUZEL = MatMul(ZELOS, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS, Conjg(Transpose(ZUR)))
End if 
! Couplings 
Call AllCouplingsReallyAll(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,ZP,Mu,Yd,              & 
& Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,Tv,ZVI,ZVR,g3,TW,TWp,UM,UP,ZN,ZDL,ZDR,            & 
& ZEL,ZER,ZUL,ZUR,UV,pG,cplAhAhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplAhAhAhAh,      & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,     & 
& cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhHpmcHpm,cplAhhhSvImSvIm,cplAhhhSvImSvRe,        & 
& cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,          & 
& cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,               & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,     & 
& cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,  & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,       & 
& cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,            & 
& cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,     & 
& cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,          & 
& cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,   & 
& cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSeSvImcVWm,               & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,     & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZVZp,          & 
& cplAhAhVZpVZp,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,cplAhHpmcVWmVZp,cplAhcHpmVPVWm,            & 
& cplAhcHpmVWmVZ,cplAhcHpmVWmVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWmVWm,    & 
& cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhHpmcVWmVZp,  & 
& cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplhhcHpmVWmVZp,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,           & 
& cplHpmcHpmVPVZp,cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ,cplHpmcHpmVZVZp,cplHpmcHpmVZpVZp,     & 
& cplSdcSdVGVG,cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSdVGVZp,cplSdcSucVWmVG,cplSdcSdVPVP,      & 
& cplSdcSdVPVZ,cplSdcSdVPVZp,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSdVZVZp,  & 
& cplSdcSucVWmVZ,cplSdcSdVZpVZp,cplSdcSucVWmVZp,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,         & 
& cplSeSvImcVWmVZp,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSeSvRecVWmVZp,cplSecSeVPVP,        & 
& cplSecSeVPVZ,cplSecSeVPVZp,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZVZp,cplSecSeVZpVZp,  & 
& cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVGVZp,cplSucSuVPVP,       & 
& cplSucSdVPVWm,cplSucSuVPVZ,cplSucSuVPVZp,cplSucSdVWmVZ,cplSucSdVWmVZp,cplSucSucVWmVWm, & 
& cplSucSuVZVZ,cplSucSuVZVZp,cplSucSuVZpVZp,cplSvImSvImVPVP,cplSvImSvImVPVZ,             & 
& cplSvImSvImVPVZp,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZVZp,cplSvImSvImVZpVZp,& 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvImcSeVWmVZp,cplSvReSvReVPVP,cplSvReSvReVPVZ,      & 
& cplSvReSvReVPVZp,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZVZp,cplSvReSvReVZpVZp,& 
& cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplSvRecSeVWmVZp,cplVGVGVG,cplcVWmVPVWm,               & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,           & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,     & 
& cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcgGgGVG,     & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgAgWmcVWm,     & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,               & 
& cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,cplcgWpCgZcVWm,             & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgZpgAhh,      & 
& cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,  & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcHpm)

em = cplcVWmVPVWm 
gs = cplcFdFdVGL(1,1) 
Call CouplingsColoredQuartics(g1,g2,gBL,gYB,gBY,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,              & 
& ZU,Yx,Yv,ZVI,ZVR,g3,TW,TWp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,   & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSucSdaa,    & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,  & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,   & 
& cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmHpmcHpmcHpm1,& 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,           & 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvImcSecSuaa,& 
& cplSdSvReSvRecSdaa,cplSdSvRecSecSuaa,cplSeSecSecSe1,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa, & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSuSucSucSuabba,& 
& cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,            & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,   & 
& cplSvReSvReSvReSvRe1,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhAhcVWmVWm1,          & 
& cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,             & 
& cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhVPVP1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,  & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,      & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,  & 
& cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSucVWmVGLamct4ct2ct1,cplSdcSdVPVPaa,cplSdcSdVPVZaa,    & 
& cplSdcSdVPVZpaa,cplSdcSucVWmVPaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,     & 
& cplSdcSucVWmVZaa,cplSdcSdVZpVZpaa,cplSdcSucVWmVZpaa,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1, & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSeVPVP1,   & 
& cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,            & 
& cplSecSeVZpVZp1,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVPLamct3ct2ct1,cplSucSdVGVWmLamct3ct2ct1,cplSucSuVGVZLamct3ct2ct1,           & 
& cplSucSuVGVZpLamct3ct2ct1,cplSucSuVPVPaa,cplSucSdVPVWmaa,cplSucSuVPVZaa,               & 
& cplSucSuVPVZpaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,     & 
& cplSucSuVZVZpaa,cplSucSuVZpVZpaa,cplSvImSvImVPVP1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,  & 
& cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,              & 
& cplSvReSvReVZpVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,cplVGVGVGVG1Q,  & 
& cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,        & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,& 
& cplcVWmVPVWmVZp3Q,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,         & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp3Q,cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q)

If (externalZfactors) Then 
Call getZCouplings(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,ZP,Mu,Yd,Td,ZD,Ye,             & 
& Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,Tv,ZVI,ZVR,g3,TW,TWp,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,             & 
& ZUL,ZUR,UV,pG,cplAhAhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,   & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplAhAhAhAh,cplAhAhhhhh,        & 
& cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe, & 
& cplAhAhSvReSvRe,cplAhhhHpmcHpm,cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,        & 
& cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,          & 
& cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,     & 
& cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,cplhhHpmSucSd,cplhhHpmSvImcSe,         & 
& cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,      & 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm, & 
& cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,         & 
& cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,         & 
& cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,       & 
& cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,       & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,    & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,              & 
& cplSdcSdVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVP,    & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplhhVPVZ,cplhhVPVZp,         & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,               & 
& cplHpmcVWmVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhVPVP,cplAhAhVPVZ,         & 
& cplAhAhVPVZp,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpmcVWmVP,     & 
& cplAhHpmcVWmVZ,cplAhHpmcVWmVZp,cplAhcHpmVPVWm,cplAhcHpmVWmVZ,cplAhcHpmVWmVZp,          & 
& cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhhhVZVZp,          & 
& cplhhhhVZpVZp,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhHpmcVWmVZp,cplhhcHpmVPVWm,            & 
& cplhhcHpmVWmVZ,cplhhcHpmVWmVZp,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmVPVZp,          & 
& cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ,cplHpmcHpmVZVZp,cplHpmcHpmVZpVZp,cplSdcSdVGVG,        & 
& cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSdVGVZp,cplSdcSucVWmVG,cplSdcSdVPVP,cplSdcSdVPVZ,      & 
& cplSdcSdVPVZp,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSdVZVZp,               & 
& cplSdcSucVWmVZ,cplSdcSdVZpVZp,cplSdcSucVWmVZp,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,         & 
& cplSeSvImcVWmVZp,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSeSvRecVWmVZp,cplSecSeVPVP,        & 
& cplSecSeVPVZ,cplSecSeVPVZp,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZVZp,cplSecSeVZpVZp,  & 
& cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVGVZp,cplSucSuVPVP,       & 
& cplSucSdVPVWm,cplSucSuVPVZ,cplSucSuVPVZp,cplSucSdVWmVZ,cplSucSdVWmVZp,cplSucSucVWmVWm, & 
& cplSucSuVZVZ,cplSucSuVZVZp,cplSucSuVZpVZp,cplSvImSvImVPVP,cplSvImSvImVPVZ,             & 
& cplSvImSvImVPVZp,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZVZp,cplSvImSvImVZpVZp,& 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvImcSeVWmVZp,cplSvReSvReVPVP,cplSvReSvReVPVZ,      & 
& cplSvReSvReVPVZp,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZVZp,cplSvReSvReVZpVZp,& 
& cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplSvRecSeVWmVZp,cplVGVGVG,cplcVWmVPVWm,               & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,           & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,     & 
& cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcgGgGVG,     & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgAgWmcVWm,     & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,               & 
& cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,cplcgWpCgZcVWm,             & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgZpgAhh,      & 
& cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,  & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcHpm,ZRUZD,ZRUZU,ZRUZE,              & 
& ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,          & 
& ZRUZDR,ZRUZUL,ZRUZUR,ZcplAhAhhh,ZcplAhHpmcHpm,ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,     & 
& ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhSdcSd,     & 
& ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvImSvIm,ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSucSd,     & 
& ZcplHpmSvImcSe,ZcplHpmSvRecSe,ZcplSdcHpmcSu,ZcplSeSvImcHpm,ZcplSeSvRecHpm,             & 
& ZcplAhAhAhAh,ZcplAhAhhhhh,ZcplAhAhHpmcHpm,ZcplAhAhSdcSd,ZcplAhAhSecSe,ZcplAhAhSucSu,   & 
& ZcplAhAhSvImSvIm,ZcplAhAhSvImSvRe,ZcplAhAhSvReSvRe,ZcplAhhhHpmcHpm,ZcplAhhhSvImSvIm,   & 
& ZcplAhhhSvImSvRe,ZcplAhhhSvReSvRe,ZcplAhHpmSucSd,ZcplAhHpmSvImcSe,ZcplAhHpmSvRecSe,    & 
& ZcplAhSdcHpmcSu,ZcplAhSeSvImcHpm,ZcplAhSeSvRecHpm,Zcplhhhhhhhh,ZcplhhhhHpmcHpm,        & 
& ZcplhhhhSdcSd,ZcplhhhhSecSe,ZcplhhhhSucSu,ZcplhhhhSvImSvIm,ZcplhhhhSvImSvRe,           & 
& ZcplhhhhSvReSvRe,ZcplhhHpmSucSd,ZcplhhHpmSvImcSe,ZcplhhHpmSvRecSe,ZcplhhSdcHpmcSu,     & 
& ZcplhhSeSvImcHpm,ZcplhhSeSvRecHpm,ZcplHpmHpmcHpmcHpm,ZcplHpmSdcHpmcSd,ZcplHpmSecHpmcSe,& 
& ZcplHpmSucHpmcSu,ZcplHpmSvImSvImcHpm,ZcplHpmSvImSvRecHpm,ZcplHpmSvReSvRecHpm,          & 
& ZcplSdSdcSdcSd,ZcplSdSecSdcSe,ZcplSdSucSdcSu,ZcplSdSvImSvImcSd,ZcplSdSvImcSecSu,       & 
& ZcplSdSvReSvRecSd,ZcplSdSvRecSecSu,ZcplSeSecSecSe,ZcplSeSuSvImcSd,ZcplSeSuSvRecSd,     & 
& ZcplSeSucSecSu,ZcplSeSvImSvImcSe,ZcplSeSvImSvRecSe,ZcplSeSvReSvRecSe,ZcplSuSucSucSu,   & 
& ZcplSuSvImSvImcSu,ZcplSuSvImSvRecSu,ZcplSuSvReSvRecSu,ZcplSvImSvImSvImSvIm,            & 
& ZcplSvImSvImSvImSvRe,ZcplSvImSvImSvReSvRe,ZcplSvImSvReSvReSvRe,ZcplSvReSvReSvReSvRe,   & 
& ZcplAhhhVP,ZcplAhhhVZ,ZcplAhhhVZp,ZcplAhHpmcVWm,ZcplAhcHpmVWm,ZcplhhHpmcVWm,           & 
& ZcplhhcHpmVWm,ZcplHpmcHpmVP,ZcplHpmcHpmVZ,ZcplHpmcHpmVZp,ZcplSdcSdVG,ZcplSdcSdVP,      & 
& ZcplSdcSdVZ,ZcplSdcSdVZp,ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSecSeVP,      & 
& ZcplSecSeVZ,ZcplSecSeVZp,ZcplSucSuVG,ZcplSucSuVP,ZcplSucSdVWm,ZcplSucSuVZ,             & 
& ZcplSucSuVZp,ZcplSvImSvReVP,ZcplSvImSvReVZ,ZcplSvImSvReVZp,ZcplSvImcSeVWm,             & 
& ZcplSvRecSeVWm,ZcplhhVPVZ,ZcplhhVPVZp,ZcplhhcVWmVWm,ZcplhhVZVZ,ZcplhhVZVZp,            & 
& ZcplhhVZpVZp,ZcplHpmcVWmVP,ZcplHpmcVWmVZ,ZcplHpmcVWmVZp,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,   & 
& ZcplcHpmVWmVZp,ZcplAhAhVPVP,ZcplAhAhVPVZ,ZcplAhAhVPVZp,ZcplAhAhcVWmVWm,ZcplAhAhVZVZ,   & 
& ZcplAhAhVZVZp,ZcplAhAhVZpVZp,ZcplAhHpmcVWmVP,ZcplAhHpmcVWmVZ,ZcplAhHpmcVWmVZp,         & 
& ZcplAhcHpmVPVWm,ZcplAhcHpmVWmVZ,ZcplAhcHpmVWmVZp,ZcplhhhhVPVP,ZcplhhhhVPVZ,            & 
& ZcplhhhhVPVZp,ZcplhhhhcVWmVWm,ZcplhhhhVZVZ,ZcplhhhhVZVZp,ZcplhhhhVZpVZp,               & 
& ZcplhhHpmcVWmVP,ZcplhhHpmcVWmVZ,ZcplhhHpmcVWmVZp,ZcplhhcHpmVPVWm,ZcplhhcHpmVWmVZ,      & 
& ZcplhhcHpmVWmVZp,ZcplHpmcHpmVPVP,ZcplHpmcHpmVPVZ,ZcplHpmcHpmVPVZp,ZcplHpmcHpmcVWmVWm,  & 
& ZcplHpmcHpmVZVZ,ZcplHpmcHpmVZVZp,ZcplHpmcHpmVZpVZp,ZcplSdcSdVGVG,ZcplSdcSdVGVP,        & 
& ZcplSdcSdVGVZ,ZcplSdcSdVGVZp,ZcplSdcSucVWmVG,ZcplSdcSdVPVP,ZcplSdcSdVPVZ,              & 
& ZcplSdcSdVPVZp,ZcplSdcSucVWmVP,ZcplSdcSdcVWmVWm,ZcplSdcSdVZVZ,ZcplSdcSdVZVZp,          & 
& ZcplSdcSucVWmVZ,ZcplSdcSdVZpVZp,ZcplSdcSucVWmVZp,ZcplSeSvImcVWmVP,ZcplSeSvImcVWmVZ,    & 
& ZcplSeSvImcVWmVZp,ZcplSeSvRecVWmVP,ZcplSeSvRecVWmVZ,ZcplSeSvRecVWmVZp,ZcplSecSeVPVP,   & 
& ZcplSecSeVPVZ,ZcplSecSeVPVZp,ZcplSecSecVWmVWm,ZcplSecSeVZVZ,ZcplSecSeVZVZp,            & 
& ZcplSecSeVZpVZp,ZcplSucSuVGVG,ZcplSucSuVGVP,ZcplSucSdVGVWm,ZcplSucSuVGVZ,              & 
& ZcplSucSuVGVZp,ZcplSucSuVPVP,ZcplSucSdVPVWm,ZcplSucSuVPVZ,ZcplSucSuVPVZp,              & 
& ZcplSucSdVWmVZ,ZcplSucSdVWmVZp,ZcplSucSucVWmVWm,ZcplSucSuVZVZ,ZcplSucSuVZVZp,          & 
& ZcplSucSuVZpVZp,ZcplSvImSvImVPVP,ZcplSvImSvImVPVZ,ZcplSvImSvImVPVZp,ZcplSvImSvImcVWmVWm,& 
& ZcplSvImSvImVZVZ,ZcplSvImSvImVZVZp,ZcplSvImSvImVZpVZp,ZcplSvImcSeVPVWm,ZcplSvImcSeVWmVZ,& 
& ZcplSvImcSeVWmVZp,ZcplSvReSvReVPVP,ZcplSvReSvReVPVZ,ZcplSvReSvReVPVZp,ZcplSvReSvRecVWmVWm,& 
& ZcplSvReSvReVZVZ,ZcplSvReSvReVZVZp,ZcplSvReSvReVZpVZp,ZcplSvRecSeVPVWm,ZcplSvRecSeVWmVZ,& 
& ZcplSvRecSeVWmVZp,ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,               & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,   & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,           & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,             & 
& ZcplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,               & 
& ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplChiChihhL,         & 
& ZcplChiChihhR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,   & 
& ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,             & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,             & 
& ZcplcFeChiSeR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,              & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR, & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,ZcplcFdFuHpmL,ZcplcFdFuHpmR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvHpmL,        & 
& ZcplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,   & 
& ZcplcFuGluSuR,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplChiChacVWmL,ZcplChiChacVWmR,           & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChaVZpL,           & 
& ZcplcChaChaVZpR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiChiVZL,ZcplChiChiVZR,               & 
& ZcplChiChiVZpL,ZcplChiChiVZpR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVGL,            & 
& ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,        & 
& ZcplcFdFdVZpR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,ZcplFvFecVWmL,ZcplFvFecVWmR,               & 
& ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,       & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFuVWmL,ZcplcFdFuVWmR,       & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplFvFvVPL,ZcplFvFvVPR,         & 
& ZcplFvFvVZL,ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,         & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmVPVWmVZp1,ZcplcVWmVPVWmVZp2,ZcplcVWmVPVWmVZp3,ZcplcVWmcVWmVWmVWm1,             & 
& ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,ZcplcVWmVWmVZVZ2,             & 
& ZcplcVWmVWmVZVZ3,ZcplcVWmVWmVZVZp1,ZcplcVWmVWmVZVZp2,ZcplcVWmVWmVZVZp3,ZcplcVWmVWmVZpVZp1,& 
& ZcplcVWmVWmVZpVZp2,ZcplcVWmVWmVZpVZp3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,       & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgWmgWmVZp,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,              & 
& ZcplcgZpgWmcVWm,ZcplcgWpCgWpCVP,ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgZpgWpCVWm,         & 
& ZcplcgWpCgWpCVZ,ZcplcgWpCgWpCVZp,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,ZcplcgWmgZpVWm,         & 
& ZcplcgWpCgZpcVWm,ZcplcgWmgWmAh,ZcplcgWpCgWpCAh,ZcplcgZgAhh,ZcplcgZpgAhh,               & 
& ZcplcgWmgAHpm,ZcplcgWpCgAcHpm,ZcplcgWmgWmhh,ZcplcgZgWmcHpm,ZcplcgZpgWmcHpm,            & 
& ZcplcgWpCgWpChh,ZcplcgZgWpCHpm,ZcplcgZpgWpCHpm,ZcplcgZgZhh,ZcplcgZpgZhh,               & 
& ZcplcgWmgZHpm,ZcplcgWpCgZcHpm,ZcplcgZgZphh,ZcplcgZpgZphh,ZcplcgWmgZpHpm,               & 
& ZcplcgWpCgZpcHpm)

End if 
Call getGBCouplings(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,          & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,cplAhcHpmVWm,cplcChaChiVWmL,        & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplChiChacVWmL,cplChiChacVWmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,   & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecVWmL,cplFvFecVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,ZcplAhcHpmVWm,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFuVWmL,             & 
& ZcplcFdFuVWmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,               & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,ZcplcHpmVWmVZp,            & 
& ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplcVWmVWmVZp,ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplhhcHpmVWm,  & 
& ZcplhhcVWmVWm,ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSucSdVWm,ZcplSvImcSeVWm, & 
& ZcplSvRecSeVWm,GcplAhHpmcHpm,GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe, & 
& GcplSdcHpmcSu,GcplSeSvImcHpm,GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,               & 
& GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplHpmcVWmVP,  & 
& GcplHpmcVWmVZ,GcplHpmcVWmVZp,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,               & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,        & 
& GcplcFuFdcHpmR,GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,  & 
& GcplcFeFvHpmR,GZcplAhHpmcHpm,GZcplhhHpmcHpm,GZcplHpmSucSd,GZcplHpmSvImcSe,             & 
& GZcplHpmSvRecSe,GZcplSdcHpmcSu,GZcplSeSvImcHpm,GZcplSeSvRecHpm,GZcplAhHpmcVWm,         & 
& GZcplAhcHpmVWm,GZcplhhHpmcVWm,GZcplhhcHpmVWm,GZcplHpmcHpmVP,GZcplHpmcHpmVZ,            & 
& GZcplHpmcHpmVZp,GZcplHpmcVWmVP,GZcplHpmcVWmVZ,GZcplHpmcVWmVZp,GZcplcHpmVPVWm,          & 
& GZcplcHpmVWmVZ,GZcplcHpmVWmVZp,GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcChaChiHpmL,     & 
& GZcplcChaChiHpmR,GZcplcFuFdcHpmL,GZcplcFuFdcHpmR,GZcplFvFecHpmL,GZcplFvFecHpmR,        & 
& GZcplcFdFuHpmL,GZcplcFdFuHpmR,GZcplcFeFvHpmL,GZcplcFeFvHpmR,GosZcplAhHpmcHpm,          & 
& GosZcplhhHpmcHpm,GosZcplHpmSucSd,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,GosZcplSdcHpmcSu, & 
& GosZcplSeSvImcHpm,GosZcplSeSvRecHpm,GosZcplAhHpmcVWm,GosZcplAhcHpmVWm,GosZcplhhHpmcVWm,& 
& GosZcplhhcHpmVWm,GosZcplHpmcHpmVP,GosZcplHpmcHpmVZ,GosZcplHpmcHpmVZp,GosZcplHpmcVWmVP, & 
& GosZcplHpmcVWmVZ,GosZcplHpmcVWmVZp,GosZcplcHpmVPVWm,GosZcplcHpmVWmVZ,GosZcplcHpmVWmVZp,& 
& GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcChaChiHpmL,GosZcplcChaChiHpmR,           & 
& GosZcplcFuFdcHpmL,GosZcplcFuFdcHpmR,GosZcplFvFecHpmL,GosZcplFvFecHpmR,GosZcplcFdFuHpmL,& 
& GosZcplcFdFuHpmR,GosZcplcFeFvHpmL,GosZcplcFeFvHpmR)

! Write intilization of all counter terms 
Call WaveFunctionRenormalisation(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,              & 
& MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,            & 
& MChiOS,MChi2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,            & 
& MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,            & 
& ZEOS,ZVIOS,ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,           & 
& ZULOS,ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,           & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,            & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,               & 
& gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,               & 
& mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,cplAhAhhh,cplAhHpmcHpm,            & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,   & 
& cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,      & 
& cplSeSvRecHpm,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,        & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhHpmcHpm,           & 
& cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,         & 
& cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,            & 
& cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe, & 
& cplhhhhSvReSvRe,cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,          & 
& cplhhSeSvImcHpm,cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,     & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,              & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,            & 
& cplSdSvReSvRecSd,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,          & 
& cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,        & 
& cplSuSvImSvImcSu,cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,& 
& cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,           & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZ,  & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,          & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,              & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,          & 
& cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,   & 
& cplAhHpmcVWmVZp,cplAhcHpmVPVWm,cplAhcHpmVWmVZ,cplAhcHpmVWmVZp,cplhhhhVPVP,             & 
& cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,        & 
& cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhHpmcVWmVZp,cplhhcHpmVPVWm,cplhhcHpmVWmVZ,           & 
& cplhhcHpmVWmVZp,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmVPVZp,cplHpmcHpmcVWmVWm,       & 
& cplHpmcHpmVZVZ,cplHpmcHpmVZVZp,cplHpmcHpmVZpVZp,cplSdcSdVGVG,cplSdcSdVGVP,             & 
& cplSdcSdVGVZ,cplSdcSdVGVZp,cplSdcSucVWmVG,cplSdcSdVPVP,cplSdcSdVPVZ,cplSdcSdVPVZp,     & 
& cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSdVZVZp,cplSdcSucVWmVZ,              & 
& cplSdcSdVZpVZp,cplSdcSucVWmVZp,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvImcVWmVZp,       & 
& cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSeSvRecVWmVZp,cplSecSeVPVP,cplSecSeVPVZ,            & 
& cplSecSeVPVZp,cplSecSecVWmVWm,cplSecSeVZVZ,cplSecSeVZVZp,cplSecSeVZpVZp,               & 
& cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVGVZp,cplSucSuVPVP,       & 
& cplSucSdVPVWm,cplSucSuVPVZ,cplSucSuVPVZp,cplSucSdVWmVZ,cplSucSdVWmVZp,cplSucSucVWmVWm, & 
& cplSucSuVZVZ,cplSucSuVZVZp,cplSucSuVZpVZp,cplSvImSvImVPVP,cplSvImSvImVPVZ,             & 
& cplSvImSvImVPVZp,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImSvImVZVZp,cplSvImSvImVZpVZp,& 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvImcSeVWmVZp,cplSvReSvReVPVP,cplSvReSvReVPVZ,      & 
& cplSvReSvReVPVZp,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvReSvReVZVZp,cplSvReSvReVZpVZp,& 
& cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplSvRecSeVWmVZp,cplVGVGVG,cplcVWmVPVWm,               & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,           & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,     & 
& cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcgGgGVG,     & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgAgWmcVWm,     & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,               & 
& cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,cplcgWpCgZcVWm,             & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgZpgAhh,      & 
& cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,  & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcHpm,GcplAhHpmcHpm,GcplhhHpmcHpm,    & 
& GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,GcplSeSvImcHpm,               & 
& GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,  & 
& GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplHpmcVWmVZp,               & 
& GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplcHpmVWmVZp,GcplChiChacHpmL,GcplChiChacHpmR,            & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,GcplFvFecHpmL,           & 
& GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,dg1,             & 
& dg2,dg3,dgBL,dgYB,dgBY,dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,            & 
& dYv,dTv,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,             & 
& dMBp,dMBBp,dvd,dvu,dx1,dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,              & 
& dUP,dUV,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,            & 
& dTanTWp,ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfLm,ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,            & 
& ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ,ctcplAhAhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,        & 
& ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,             & 
& ctcplhhhhhh,ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,     & 
& ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,         & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,   & 
& ctcplAhHpmcVWm,ctcplAhcHpmVWm,ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,            & 
& ctcplHpmcHpmVZ,ctcplHpmcHpmVZp,ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,   & 
& ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm,ctcplSecSeVP,ctcplSecSeVZ,              & 
& ctcplSecSeVZp,ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,ctcplSucSuVZ,ctcplSucSuVZp,      & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,ctcplSvImcSeVWm,ctcplSvRecSeVWm,      & 
& ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhcVWmVWm,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,        & 
& ctcplHpmcVWmVP,ctcplHpmcVWmVZ,ctcplHpmcVWmVZp,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,           & 
& ctcplcHpmVWmVZp,ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,             & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplcFdFdAhL,           & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,    & 
& ctcplFvFvAhR,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChaFucSdL,ctcplChaFucSdR,          & 
& ctcplFvChacSeL,ctcplFvChacSeR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdChaSuL,          & 
& ctcplcFdChaSuR,ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplcFeChaSvReL,ctcplcFeChaSvReR,    & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,          & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,      & 
& ctcplcFdChiSdR,ctcplcFeChiSeL,ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,            & 
& ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,             & 
& ctcplcChaFdcSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplFvFecHpmL,ctcplFvFecHpmR,         & 
& ctcplcFeFehhL,ctcplcFeFehhR,ctcplcChaFeSvImL,ctcplcChaFeSvImR,ctcplcChaFeSvReL,        & 
& ctcplcChaFeSvReR,ctcplGluFucSuL,ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,            & 
& ctcplcFdFuHpmL,ctcplcFdFuHpmR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR, & 
& ctcplcChaFvSeL,ctcplcChaFvSeR,ctcplcFdGluSdL,ctcplcFdGluSdR,ctcplcFuGluSuL,            & 
& ctcplcFuGluSuR,ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplChiChacVWmL,ctcplChiChacVWmR,      & 
& ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,      & 
& ctcplcChaChaVZpR,ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL,ctcplChiChiVZR,          & 
& ctcplChiChiVZpL,ctcplChiChiVZpR,ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcFdFdVGL,       & 
& ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,  & 
& ctcplcFdFdVZpR,ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,          & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR, & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR, & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplFvFvVPL,ctcplFvFvVPR,   & 
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,   & 
& ctcplGluGluVGL,ctcplGluGluVGR,MLambda,deltaM,kont)

! -------------------------------------------- 
! The decays at one-loop 
! -------------------------------------------- 

! Sd
If (CalcLoopDecay_Sd) Then 
Call OneLoopDecay_Sd(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhAhSdcSdaa,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,             & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplAhSdcSd,      & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,        & 
& cplGluGluVGL,cplGluGluVGR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSdcSdaa,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplhhSdcSd,cplhhSecSe,      & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,               & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,             & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplHpmSucSd,            & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,    & 
& cplSdcSdVZ,cplSdcSdVZp,cplSdcSdVZpVZpaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWm,   & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,cplSdcSucVWmVZpaa,        & 
& cplSdSdcSdcSdabab,cplSdSdcSdcSdabba,cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,& 
& cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWm,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,& 
& cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplVGVGVG,              & 
& ctcplAhSdcSd,ctcplChaFucSdL,ctcplChaFucSdR,ctcplChiFdcSdL,ctcplChiFdcSdR,              & 
& ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplhhSdcSd,ctcplHpmSucSd,ctcplSdcSdVG,ctcplSdcSdVP,    & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,ctcplSucSdVWm,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplHpmSucSd,     & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplHpmSucSd,GZcplcHpmVPVWm,GZcplHpmcVWmVP,       & 
& GZcplHpmSucSd,ZcplAhSdcSd,ZcplChaFucSdL,ZcplChaFucSdR,ZcplChiFdcSdL,ZcplChiFdcSdR,     & 
& ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplhhSdcSd,ZcplHpmSucSd,ZcplSdcSdVZ,ZcplSdcSdVZp,         & 
& ZcplSucSdVWm,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,            & 
& ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LSd)

End if 
! Su
If (CalcLoopDecay_Su) Then 
Call OneLoopDecay_Su(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhAhSucSuaa,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,             & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplAhSdcSd,      & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,         & 
& cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,            & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,        & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,        & 
& cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,            & 
& cplhhhhSucSuaa,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSdcHpmcSdaa,               & 
& cplHpmSucHpmcSuaa,cplHpmSucSd,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,               & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSdcSucVWmVGLamct4ct2ct1,             & 
& cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,cplSdcSucVWmVZpaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,& 
& cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWm,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,& 
& cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVPLamct3ct2ct1,cplSucSuVGVZLamct3ct2ct1,cplSucSuVGVZpLamct3ct2ct1,           & 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSuVZ,cplSucSuVZp,       & 
& cplSucSuVZpVZpaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSuSucSucSuabab,cplSuSucSucSuabba,   & 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplVGVGVG,ctcplAhSucSu,       & 
& ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplGluFucSuL,          & 
& ctcplGluFucSuR,ctcplhhSucSu,ctcplSdcHpmcSu,ctcplSdcSucVWm,ctcplSucSuVG,ctcplSucSuVP,   & 
& ctcplSucSuVZ,ctcplSucSuVZp,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSdcHpmcSu,GosZcplcHpmVPVWm, & 
& GosZcplHpmcVWmVP,GosZcplSdcHpmcSu,GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplSdcHpmcSu,        & 
& ZcplAhSucSu,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplGluFucSuL,   & 
& ZcplGluFucSuR,ZcplhhSucSu,ZcplSdcHpmcSu,ZcplSdcSucVWm,ZcplSucSuVZ,ZcplSucSuVZp,        & 
& ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LSu)

End if 
! Se
If (CalcLoopDecay_Se) Then 
Call OneLoopDecay_Se(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhAhSecSe1,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,              & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcSd,     & 
& cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,            & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,     & 
& cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL,cplFvChacSeR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSecSe1,cplhhHpmcHpm,             & 
& cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1, & 
& cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,       & 
& cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,   & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSecHpmcSe1,cplHpmSucSd,cplHpmSvImcSe,    & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,             & 
& cplSdSecSdcSeaa,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSecSecVWmVWm1,cplSecSeVP,       & 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSeVZ,cplSecSeVZp,cplSecSeVZpVZp1,     & 
& cplSecSeVZVZ1,cplSecSeVZVZp1,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImcHpm,             & 
& cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvImSvImcSe1,   & 
& cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,       & 
& cplSeSvRecVWmVZp1,cplSeSvReSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWm,cplSvImcSeVWmVZ1,   & 
& cplSvImcSeVWmVZp1,cplSvImSvImcVWmVWm1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,      & 
& cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,cplSvReSvRecVWmVWm1, & 
& ctcplAhSecSe,ctcplChiFecSeL,ctcplChiFecSeR,ctcplFvChacSeL,ctcplFvChacSeR,              & 
& ctcplhhSecSe,ctcplHpmSvImcSe,ctcplHpmSvRecSe,ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,  & 
& ctcplSvImcSeVWm,ctcplSvRecSeVWm,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplHpmSvImcSe,            & 
& GcplHpmSvRecSe,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,  & 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplHpmSvImcSe,GZcplHpmSvRecSe,ZcplAhSecSe,             & 
& ZcplChiFecSeL,ZcplChiFecSeR,ZcplFvChacSeL,ZcplFvChacSeR,ZcplhhSecSe,ZcplHpmSvImcSe,    & 
& ZcplHpmSvRecSe,ZcplSecSeVZ,ZcplSecSeVZp,ZcplSvImcSeVWm,ZcplSvRecSeVWm,ZRUZD,           & 
& ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,            & 
& ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LSe)

End if 
! SvRe
If (CalcLoopDecay_SvRe) Then 
Call OneLoopDecay_SvRe(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,       & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,          & 
& cplAhcHpmVWm,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhhhVP,             & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,       & 
& cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,          & 
& cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSvImSvIm1,& 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvImcSe1,          & 
& cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,             & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSecHpmcSe1,cplHpmSucSd,cplHpmSvImcSe,    & 
& cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,               & 
& cplSdSvReSvRecSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvImSvRecSe1,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,       & 
& cplSeSvReSvRecSe1,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSvImcSeVPVWm1,              & 
& cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,& 
& cplSvImSvImVPVP1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImVZpVZp1,cplSvImSvImVZVZ1,& 
& cplSvImSvImVZVZp1,cplSvImSvReSvReSvRe1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,     & 
& cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,cplSvReSvRecVWmVWm1, & 
& cplSvReSvReSvReSvRe1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,              & 
& cplSvReSvReVZpVZp1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,ctcplAhSvImSvRe,ctcplAhSvReSvRe, & 
& ctcplcFeChaSvReL,ctcplcFeChaSvReR,ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplhhSvImSvRe,     & 
& ctcplhhSvReSvRe,ctcplHpmSvRecSe,ctcplSeSvRecVWm,ctcplSvImSvReVP,ctcplSvImSvReVZ,       & 
& ctcplSvImSvReVZp,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSeSvRecHpm,GosZcplcHpmVPVWm,          & 
& GosZcplHpmcVWmVP,GosZcplSeSvRecHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplSeSvRecHpm,      & 
& ZcplAhSvImSvRe,ZcplAhSvReSvRe,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplChiFvSvReL,          & 
& ZcplChiFvSvReR,ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSvRecSe,ZcplSeSvRecVWm,            & 
& ZcplSvImSvReVZ,ZcplSvImSvReVZp,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,            & 
& ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LSvRe)

End if 
! SvIm
If (CalcLoopDecay_SvIm) Then 
Call OneLoopDecay_SvIm(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,       & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,          & 
& cplAhcHpmVWm,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhhhVP,             & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,       & 
& cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,          & 
& cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSvImSvIm1,& 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvImcSe1,          & 
& cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,             & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSecHpmcSe1,cplHpmSucSd,cplHpmSvImcSe,    & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplSdSvImcSecSuaa,               & 
& cplSdSvImSvImcSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvImSvImcSe1,   & 
& cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,       & 
& cplSeSvRecVWmVZp1,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSvImcSeVPVWm1,              & 
& cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvImSvImcVWmVWm1,cplSvImSvImSvImSvIm1,& 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVPVP1,cplSvImSvImVPVZ1,           & 
& cplSvImSvImVPVZp1,cplSvImSvImVZpVZp1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,               & 
& cplSvImSvReSvReSvRe1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVPVWm1,      & 
& cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,    & 
& cplSvReSvReVPVZp1,cplSvReSvReVZpVZp1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,               & 
& ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplChiFvSvImL,     & 
& ctcplChiFvSvImR,ctcplhhSvImSvIm,ctcplhhSvImSvRe,ctcplHpmSvImcSe,ctcplSeSvImcVWm,       & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,GcplcHpmVPVWm,GcplHpmcVWmVP,          & 
& GcplSeSvImcHpm,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplSeSvImcHpm,GZcplcHpmVPVWm,     & 
& GZcplHpmcVWmVP,GZcplSeSvImcHpm,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplcFeChaSvImL,          & 
& ZcplcFeChaSvImR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplhhSvImSvIm,ZcplhhSvImSvRe,           & 
& ZcplHpmSvImcSe,ZcplSeSvImcVWm,ZcplSvImSvReVZ,ZcplSvImSvReVZp,ZRUZD,ZRUZU,              & 
& ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,           & 
& ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LSvIm)

End if 
! hh
If (CalcLoopDecay_hh) Then 
Call OneLoopDecay_hh(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhAhAh1,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpmcHpm1,   & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhAhVZpVZp1,               & 
& cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWm,cplAhcHpmVWmVZ1,               & 
& cplAhcHpmVWmVZp1,cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,   & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,              & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,       & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,       & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWmgZHpm,cplcgWmgZpHpm,cplcgWmgZpVWm,      & 
& cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh,cplcgWpCgWpCVP,              & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm,cplcgWpCgZcVWm,cplcgWpCgZpcHpm,          & 
& cplcgWpCgZpcVWm,cplcgZgAhh,cplcgZgWmcHpm,cplcgZgWmcVWm,cplcgZgWpCHpm,cplcgZgWpCVWm,    & 
& cplcgZgZhh,cplcgZgZphh,cplcgZpgAhh,cplcgZpgWmcHpm,cplcgZpgWmcVWm,cplcgZpgWpCHpm,       & 
& cplcgZpgWpCVWm,cplcgZpgZhh,cplcgZpgZphh,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,& 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,& 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,   & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp3Q,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,    & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,        & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,& 
& cplhhcVWmVWm,cplhhhhcVWmVWm1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,    & 
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,       & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZpVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,   & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmcVWmVWm1,& 
& cplHpmcHpmVP,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmVZ,            & 
& cplHpmcHpmVZp,cplHpmcHpmVZpVZp1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcVWmVP,         & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,      & 
& cplHpmSucHpmcSuaa,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,   & 
& cplHpmSvRecSe,cplHpmSvReSvRecHpm1,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,           & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZpVZpaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWm,cplSdSdcSdcSdabab,        & 
& cplSdSdcSdcSdabba,cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSecSeVPVZp1,cplSecSeVZ,cplSecSeVZp,cplSecSeVZpVZp1,cplSecSeVZVZ1,cplSecSeVZVZp1,    & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvImSvImcSe1,          & 
& cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvReSvRecSe1,cplSucSdVWm,           & 
& cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSuVZ,cplSucSuVZp,       & 
& cplSucSuVZpVZpaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSuSucSucSuabab,cplSuSucSucSuabba,   & 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSvImcSeVWm,cplSvImSvImcVWmVWm1,& 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVPVP1,       & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImVZpVZp1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,& 
& cplSvImSvReSvReSvRe1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,         & 
& cplSvReSvRecVWmVWm1,cplSvReSvReSvReSvRe1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,            & 
& cplSvReSvReVPVZp1,cplSvReSvReVZpVZp1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,               & 
& ctcplAhAhhh,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplcChaChahhL,ctcplcChaChahhR,      & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,   & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplhhcVWmVWm,ctcplhhhhhh,    & 
& ctcplhhHpmcHpm,ctcplhhHpmcVWm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,  & 
& ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZpVZp,ctcplhhVZVZ,    & 
& ctcplhhVZVZp,GcplcHpmVPVWm,GcplhhcHpmVWm,GcplhhHpmcHpm,GcplHpmcVWmVP,GosZcplcHpmVPVWm, & 
& GosZcplhhcHpmVWm,GosZcplhhHpmcHpm,GosZcplHpmcVWmVP,GZcplcHpmVPVWm,GZcplhhcHpmVWm,      & 
& GZcplhhHpmcHpm,GZcplHpmcVWmVP,ZcplAhAhhh,ZcplAhhhVZ,ZcplAhhhVZp,ZcplcChaChahhL,        & 
& ZcplcChaChahhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,       & 
& ZcplcFuFuhhR,ZcplChiChihhL,ZcplChiChihhR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplhhcVWmVWm,        & 
& Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhHpmcVWm,ZcplhhSdcSd,ZcplhhSecSe,ZcplhhSucSu,            & 
& ZcplhhSvImSvIm,ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplhhVZpVZp,ZcplhhVZVZ,ZcplhhVZVZp,      & 
& ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1Lhh)

End if 
! Ah
If (CalcLoopDecay_Ah) Then 
Call OneLoopDecay_Ah(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhAhAh1,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpmcHpm1,   & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhAhVZpVZp1,               & 
& cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWm,cplAhcHpmVWmVZ1,               & 
& cplAhcHpmVWmVZp1,cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,   & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,              & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,    & 
& cplAhSdcHpmcSuaa,cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,              & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,            & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,        & 
& cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgWmgZHpm,cplcgWmgZpHpm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,   & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm,           & 
& cplcgWpCgZcVWm,cplcgWpCgZpcHpm,cplcgWpCgZpcVWm,cplcgZgWmcHpm,cplcgZgWmcVWm,            & 
& cplcgZgWpCHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWmcVWm,cplcgZpgWpCHpm,              & 
& cplcgZpgWpCVWm,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,     & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,        & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,               & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,      & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplhhcVWmVWm,cplhhhhhh,cplhhhhHpmcHpm1,               & 
& cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,         & 
& cplhhhhSvReSvRe1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZpVZp1,               & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,  & 
& cplhhHpmcVWmVZp1,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmcVWmVWm1,& 
& cplHpmcHpmVP,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmVZ,            & 
& cplHpmcHpmVZp,cplHpmcHpmVZpVZp1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcVWmVP,         & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,      & 
& cplHpmSucHpmcSuaa,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,   & 
& cplHpmSvRecSe,cplHpmSvReSvRecHpm1,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,           & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZpVZpaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWm,cplSdSdcSdcSdabab,        & 
& cplSdSdcSdcSdabba,cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSecSeVPVZp1,cplSecSeVZ,cplSecSeVZp,cplSecSeVZpVZp1,cplSecSeVZVZ1,cplSecSeVZVZp1,    & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvImSvImcSe1,          & 
& cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvReSvRecSe1,cplSucSdVWm,           & 
& cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSuVZ,cplSucSuVZp,       & 
& cplSucSuVZpVZpaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSuSucSucSuabab,cplSuSucSucSuabba,   & 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSvImcSeVWm,cplSvImSvImcVWmVWm1,& 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVPVP1,       & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImVZpVZp1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,& 
& cplSvImSvReSvReSvRe1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,         & 
& cplSvReSvRecVWmVWm1,cplSvReSvReSvReSvRe1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,            & 
& cplSvReSvReVPVZp1,cplSvReSvReVZpVZp1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,               & 
& ctcplAhAhhh,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpmcHpm,ctcplAhHpmcVWm,        & 
& ctcplAhSdcSd,ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,& 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,             & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplChiChiAhL,ctcplChiChiAhR,               & 
& ctcplFvFvAhL,ctcplFvFvAhR,GcplAhHpmcHpm,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplAhHpmcHpm,  & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplAhHpmcHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,        & 
& ZcplAhAhhh,ZcplAhhhVZ,ZcplAhhhVZp,ZcplAhHpmcHpm,ZcplAhHpmcVWm,ZcplAhSdcSd,             & 
& ZcplAhSecSe,ZcplAhSucSu,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,ZcplcChaChaAhL,   & 
& ZcplcChaChaAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,       & 
& ZcplcFuFuAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplFvFvAhL,ZcplFvFvAhR,ZRUZD,ZRUZU,          & 
& ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,           & 
& ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LAh)

End if 
! Hpm
If (CalcLoopDecay_Hpm) Then 
Call OneLoopDecay_Hpm(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhHpmcHpm1,cplAhcHpmVPVWm1,             & 
& cplAhcHpmVWm,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplAhhhHpmcHpm1,cplAhhhVP,               & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,        & 
& cplAhHpmcVWmVZp1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcHpmcSuaa,   & 
& cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcgAgWpCVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,       & 
& cplcgWmgZHpm,cplcgWmgZpHpm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgWpCAh,   & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm,           & 
& cplcgWpCgZpcHpm,cplcgZgAhh,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgZgWpCVWm,cplcgZgZhh,       & 
& cplcgZgZphh,cplcgZpgAhh,cplcgZpgWmcHpm,cplcgZpgWpCHpm,cplcgZpgWpCVWm,cplcgZpgZhh,      & 
& cplcgZpgZphh,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,     & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,& 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,   & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp3Q,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,    & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,        & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,& 
& cplhhcVWmVWm,cplhhhhcVWmVWm1,cplhhhhhh,cplhhhhHpmcHpm1,cplhhHpmcHpm,cplhhHpmcVWm,      & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,     & 
& cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1,              & 
& cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,       & 
& cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,           & 
& cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmVZ,cplHpmcHpmVZp,           & 
& cplHpmcHpmVZpVZp1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcVWmVP,cplHpmcVWmVZ,          & 
& cplHpmcVWmVZp,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa, & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,       & 
& cplHpmSvReSvRecHpm1,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,         & 
& cplSdcSucVWm,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,cplSdcSucVWmVZpaa,cplSdSucSdcSuabab,    & 
& cplSdSucSdcSuabba,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSecSeVP,cplSecSeVZ,           & 
& cplSecSeVZp,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSeSvImcHpm,cplSeSvImcVWm,             & 
& cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,& 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,       & 
& cplSeSvReSvRecSe1,cplSucSdVPVWmaa,cplSucSdVWm,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,        & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplSvImcSeVPVWm1,cplSvImcSeVWm,           & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,         & 
& cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,ctcplAhcHpmVWm,      & 
& ctcplAhHpmcHpm,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplChiChacHpmL,ctcplChiChacHpmR,      & 
& ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplcHpmVWmVZp,ctcplFvFecHpmL,ctcplFvFecHpmR,           & 
& ctcplhhcHpmVWm,ctcplhhHpmcHpm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,ctcplHpmcHpmVZp,           & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,GcplAhHpmcHpm,GcplcHpmVPVWm,            & 
& GcplhhHpmcHpm,GcplHpmcHpmVZ,GcplHpmcHpmVZp,GcplHpmcVWmVP,GosZcplAhHpmcHpm,             & 
& GosZcplcHpmVPVWm,GosZcplhhHpmcHpm,GosZcplHpmcHpmVZ,GosZcplHpmcHpmVZp,GosZcplHpmcVWmVP, & 
& GZcplAhHpmcHpm,GZcplcHpmVPVWm,GZcplhhHpmcHpm,GZcplHpmcHpmVZ,GZcplHpmcHpmVZp,           & 
& GZcplHpmcVWmVP,ZcplAhcHpmVWm,ZcplAhHpmcHpm,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,              & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplcHpmVWmVZ,ZcplcHpmVWmVZp,ZcplFvFecHpmL,            & 
& ZcplFvFecHpmR,ZcplhhcHpmVWm,ZcplhhHpmcHpm,ZcplHpmcHpmVZ,ZcplHpmcHpmVZp,ZcplSdcHpmcSu,  & 
& ZcplSeSvImcHpm,ZcplSeSvRecHpm,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,             & 
& ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LHpm)

End if 
! Glu
If (CalcLoopDecay_Glu) Then 
Call OneLoopDecay_Glu(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhSdcSd,cplAhSucSu,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,          & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,         & 
& cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplhhSdcSd,cplhhSucSu,cplHpmSucSd,              & 
& cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSucSdVWm,    & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplVGVGVG,ctcplGluFdcSdL,ctcplGluFdcSdR,  & 
& ctcplGluFucSuL,ctcplGluFucSuR,ctcplGluGluVGL,ctcplGluGluVGR,ZcplAhSdcSd,               & 
& ZcplAhSucSu,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdhhL,        & 
& ZcplcFdFdhhR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,         & 
& ZcplcFdFdVZpL,ZcplcFdFdVZpR,ZcplcFdFdVZR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuChiSuL,    & 
& ZcplcFuChiSuR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,        & 
& ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZpL,ZcplcFuFuVZpR,       & 
& ZcplcFuFuVZR,ZcplcFuGluSuL,ZcplcFuGluSuR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFucSuL,    & 
& ZcplChiFucSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplGluGluVGL,   & 
& ZcplGluGluVGR,ZcplhhSdcSd,ZcplhhSucSu,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSdcSdVZ,             & 
& ZcplSdcSdVZp,ZcplSucSuVG,ZcplSucSuVP,ZcplSucSuVZ,ZcplSucSuVZp,ZcplVGVGVG,              & 
& ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,ZRUUP,ZRUUV,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LGlu)

End if 
! Cha
If (CalcLoopDecay_Cha) Then 
Call OneLoopDecay_Cha(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,       & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,      & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,        & 
& cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,    & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSucSd,        & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSdcSucVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSeSvImcHpm,              & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,cplSucSuVZp,cplSvImcSeVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,       & 
& cplSvRecSeVWm,ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplcChaChaAhL,ctcplcChaChaAhR,         & 
& ctcplcChaChahhL,ctcplcChaChahhR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,       & 
& ctcplcChaChaVZpL,ctcplcChaChaVZpR,ctcplcChaChaVZR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,   & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplcChaFeSvImL,    & 
& ctcplcChaFeSvImR,ctcplcChaFeSvReL,ctcplcChaFeSvReR,ctcplcChaFvSeL,ctcplcChaFvSeR,      & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplcChaChiHpmL,        & 
& GosZcplcChaChiHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplcChaChiHpmL,GZcplcChaChiHpmR,& 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplAhhhVP,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplcChaChaAhL, & 
& ZcplcChaChaAhR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcChaChaVPL,ZcplcChaChaVPR,            & 
& ZcplcChaChaVZL,ZcplcChaChaVZpL,ZcplcChaChaVZpR,ZcplcChaChaVZR,ZcplcChaChiHpmL,         & 
& ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,         & 
& ZcplcChaFeSvImL,ZcplcChaFeSvImR,ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplcChaFvSeL,         & 
& ZcplcChaFvSeR,ZcplcFdChaSuL,ZcplcFdChaSuR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFeChaSvImL,   & 
& ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplcFeFeVPL,ZcplcFeFeVPR,             & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplChiChacHpmL,ZcplChiChacHpmR, & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplcHpmVPVWm,             & 
& ZcplcVWmVPVWm,ZcplFvChacSeL,ZcplFvChacSeR,ZcplFvFvVPL,ZcplFvFvVPR,ZcplhhVPVZ,          & 
& ZcplhhVPVZp,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVP,           & 
& ZcplSvImSvReVP,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,          & 
& ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LCha)

End if 
! Chi
If (CalcLoopDecay_Chi) Then 
Call OneLoopDecay_Chi(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,            & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,          & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,      & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,        & 
& cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,    & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSucSd,        & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSdcSucVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSeSvImcHpm,              & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,cplSucSuVZp,cplSvImcSeVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,       & 
& cplSvRecSeVWm,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChiChacVWmL,ctcplChiChacVWmR,     & 
& ctcplChiChiAhL,ctcplChiChiAhR,ctcplChiChihhL,ctcplChiChihhR,ctcplChiChiVPL,            & 
& ctcplChiChiVPR,ctcplChiChiVZL,ctcplChiChiVZpL,ctcplChiChiVZpR,ctcplChiChiVZR,          & 
& ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,ctcplChiFecSeR,ctcplChiFucSuL,            & 
& ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplChiFvSvReL,ctcplChiFvSvReR,        & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplChiChacHpmL,        & 
& GosZcplChiChacHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplChiChacHpmL,GZcplChiChacHpmR,& 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplAhhhVP,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChiHpmL,& 
& ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdChiSdL,ZcplcFdChiSdR,           & 
& ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdGluSdL,ZcplcFdGluSdR,       & 
& ZcplcFeChiSeL,ZcplcFeChiSeR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuChiSuL,ZcplcFuChiSuR,     & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuGluSuL,ZcplcFuGluSuR,       & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplChiChiAhL,         & 
& ZcplChiChiAhR,ZcplChiChihhL,ZcplChiChihhR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiChiVZL,   & 
& ZcplChiChiVZpL,ZcplChiChiVZpR,ZcplChiChiVZR,ZcplChiFdcSdL,ZcplChiFdcSdR,               & 
& ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR, & 
& ZcplChiFvSvReL,ZcplChiFvSvReR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplFvFvVPL,ZcplFvFvVPR,     & 
& ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplhhVPVZ,ZcplhhVPVZp,        & 
& ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVG,           & 
& ZcplSucSuVP,ZcplSvImSvReVP,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,          & 
& ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,             & 
& em,gs,deltaM,kont,gP1LChi)

End if 
! Fu
If (CalcLoopDecay_Fu) Then 
Call OneLoopDecay_Fu(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,        & 
& cplcVWmVWmVZp,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,        & 
& cplGluGluVGR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,           & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,       & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,    & 
& cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplVGVGVG,ctcplcChacFuSdL,    & 
& ctcplcChacFuSdR,ctcplcFuChiSuL,ctcplcFuChiSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,         & 
& ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFuFuhhL,             & 
& ctcplcFuFuhhR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,   & 
& ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFuFuVZR,ctcplcFuGluSuL,ctcplcFuGluSuR,             & 
& GcplcFuFdcHpmL,GcplcFuFdcHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplcFuFdcHpmL,           & 
& GosZcplcFuFdcHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplcFuFdcHpmL,GZcplcFuFdcHpmR,   & 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplAhhhVP,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplcChaChaVPL, & 
& ZcplcChaChaVPR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFuHpmL,      & 
& ZcplcFdFuHpmR,ZcplcFdFuVWmL,ZcplcFdFuVWmR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcFuFdcHpmL,  & 
& ZcplcFuFdcHpmR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFuhhL,   & 
& ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,         & 
& ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplcFuFuVZR,ZcplcFuGluSuL,ZcplcFuGluSuR,ZcplChaFucSdL,    & 
& ZcplChaFucSdR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcHpmVPVWm,   & 
& ZcplcVWmVPVWm,ZcplGluFucSuL,ZcplGluFucSuR,ZcplGluGluVGL,ZcplGluGluVGR,ZcplhhVPVZ,      & 
& ZcplhhVPVZp,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSucSuVG,           & 
& ZcplSucSuVP,ZcplVGVGVG,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,              & 
& ZRUZN,ZRUUM,ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,             & 
& em,gs,deltaM,kont,gP1LFu)

End if 
! Fv
If (CalcLoopDecay_Fv) Then 
Call OneLoopDecay_Fv(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,         & 
& MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,              & 
& MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,ZVIOS,               & 
& ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,              & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,dg1,dg2,dg3,dgBL,dgYB,dgBY,            & 
& dMuP,dBMuP,dMu,dBmu,dYd,dTd,dYe,dTe,dYu,dTu,dYx,dTx,dYv,dTv,dmq2,dml2,dmHd2,           & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dmC12,dmC22,dM1,dM2,dM3,dMBp,dMBBp,dvd,dvu,dx1,              & 
& dx2,dpG,dZD,dZU,dZE,dZVI,dZVR,dZH,dZA,dZP,dZN,dUM,dUP,dUV,dZEL,dZER,dZDL,              & 
& dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,ZfVP,            & 
& ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSu,ZfSe,ZfSvIm,ZfSvRe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,               & 
& ZfLp,ZfFvm,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,          & 
& ZfVZVZp,ZfVZpVZ,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,            & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,       & 
& cplcVWmVWmVZp,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,        & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,        & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSvImcSe,      & 
& cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSeSvImcHpm,cplSeSvImcVWm,           & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImcSeVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvRecSeVWm,ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplChiFvSvReL,ctcplChiFvSvReR,         & 
& ctcplFvChacSeL,ctcplFvChacSeR,ctcplFvFecHpmL,ctcplFvFecHpmR,ctcplFvFecVWmL,            & 
& ctcplFvFecVWmR,ctcplFvFvAhL,ctcplFvFvAhR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplFvFvVPL,       & 
& ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplFvFvVZR,GcplcHpmVPVWm,      & 
& GcplFvFecHpmL,GcplFvFecHpmR,GcplHpmcVWmVP,GosZcplcHpmVPVWm,GosZcplFvFecHpmL,           & 
& GosZcplFvFecHpmR,GosZcplHpmcVWmVP,GZcplcHpmVPVWm,GZcplFvFecHpmL,GZcplFvFecHpmR,        & 
& GZcplHpmcVWmVP,ZcplAhhhVP,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaFvSeL,ZcplcChaFvSeR,   & 
& ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFvHpmL,ZcplcFeFvHpmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,     & 
& ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,              & 
& ZcplChiFvSvReR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplFvChacSeL,ZcplFvChacSeR,ZcplFvFecHpmL,  & 
& ZcplFvFecHpmR,ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplFvFvAhL,ZcplFvFvAhR,ZcplFvFvhhL,         & 
& ZcplFvFvhhR,ZcplFvFvVPL,ZcplFvFvVPR,ZcplFvFvVZL,ZcplFvFvVZpL,ZcplFvFvVZpR,             & 
& ZcplFvFvVZR,ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSecSeVP,            & 
& ZcplSvImSvReVP,ZRUZD,ZRUZU,ZRUZE,ZRUZVI,ZRUZVR,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUM,          & 
& ZRUUP,ZRUUV,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LFv)

End if 
If (Extra_scale_loopDecays) Then 
q2 = SetRenormalizationScale(q2_save) 
End if 
Iname = Iname - 1 
 
End Subroutine CalculateOneLoopDecays  
 
 
End Module OneLoopDecays_BLSSM 
 