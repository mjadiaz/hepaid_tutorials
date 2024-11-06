! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:14 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fv_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_Fv_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fv(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,            & 
& MSvIm2OS,MSvReOS,MSvRe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,             & 
& MChi2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZEOS,              & 
& ZVIOS,ZVROS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,UVOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,          & 
& ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,          & 
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

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dgBL,dgYB,dgBY,dmHd2,dmHu2,dmC12,dmC22,dvd,dvu,dx1,dx2,dZH(4,4),          & 
& dZA(4,4),dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp),Intent(in) :: dMuP,dBMuP,dMu,dBmu,dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dYu(3,3),dTu(3,3),            & 
& dYx(3,3),dTx(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dMBp,dMBBp,dpG,dZD(6,6),dZU(6,6),dZE(6,6),             & 
& dZVI(6,6),dZVR(6,6),dZN(7,7),dUM(2,2),dUP(2,2),dUV(6,6),dZEL(3,3),dZER(3,3),           & 
& dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),     & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSecSe(4,6,6),cplAhSvImSvIm(4,6,6),          & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),   & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),           & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),            & 
& cplcFeFvVWmR(3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplChiFecSeL(7,3,6),           & 
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),& 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplhhcHpmVWm(4,2),   & 
& cplhhcVWmVWm(4),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSecSe(4,6,6),& 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),           & 
& cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVP(2,2),             & 
& cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2), & 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),             & 
& cplSecSeVZp(6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),         & 
& cplSeSvRecVWm(6,6),cplSvImcSeVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),           & 
& cplSvImSvReVZp(6,6),cplSvRecSeVWm(6,6),ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6),  & 
& ctcplChiFvSvReL(7,6,6),ctcplChiFvSvReR(7,6,6),ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6),& 
& ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3),   & 
& ctcplFvFvAhL(6,6,4),ctcplFvFvAhR(6,6,4),ctcplFvFvhhL(6,6,4),ctcplFvFvhhR(6,6,4),       & 
& ctcplFvFvVPL(6,6),ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZpL(6,6),              & 
& ctcplFvFvVZpR(6,6),ctcplFvFvVZR(6,6),GcplcHpmVPVWm(2),GcplFvFecHpmL(6,3,2),            & 
& GcplFvFecHpmR(6,3,2),GcplHpmcVWmVP(2),GosZcplcHpmVPVWm(2),GosZcplFvFecHpmL(6,3,2),     & 
& GosZcplFvFecHpmR(6,3,2),GosZcplHpmcVWmVP(2),GZcplcHpmVPVWm(2),GZcplFvFecHpmL(6,3,2)

Complex(dp),Intent(in) :: GZcplFvFecHpmR(6,3,2),GZcplHpmcVWmVP(2),ZcplAhhhVP(4,4),ZcplcChaChaVPL(2,2),           & 
& ZcplcChaChaVPR(2,2),ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),ZcplcFeFeVPL(3,3),       & 
& ZcplcFeFeVPR(3,3),ZcplcFeFvHpmL(3,6,2),ZcplcFeFvHpmR(3,6,2),ZcplcFeFvVWmL(3,6),        & 
& ZcplcFeFvVWmR(3,6),ZcplChiChiVPL(7,7),ZcplChiChiVPR(7,7),ZcplChiFvSvImL(7,6,6),        & 
& ZcplChiFvSvImR(7,6,6),ZcplChiFvSvReL(7,6,6),ZcplChiFvSvReR(7,6,6),ZcplcHpmVPVWm(2),    & 
& ZcplcVWmVPVWm,ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),ZcplFvFecHpmL(6,3,2),          & 
& ZcplFvFecHpmR(6,3,2),ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),ZcplFvFvAhL(6,6,4),         & 
& ZcplFvFvAhR(6,6,4),ZcplFvFvhhL(6,6,4),ZcplFvFvhhR(6,6,4),ZcplFvFvVPL(6,6),             & 
& ZcplFvFvVPR(6,6),ZcplFvFvVZL(6,6),ZcplFvFvVZpL(6,6),ZcplFvFvVZpR(6,6),ZcplFvFvVZR(6,6),& 
& ZcplhhVPVZ(4),ZcplhhVPVZp(4),ZcplHpmcHpmVP(2,2),ZcplHpmcVWmVP(2),ZcplSecSeVP(6,6),     & 
& ZcplSvImSvReVP(6,6)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd(6,6),ZfSu(6,6),ZfSe(6,6),ZfSvIm(6,6),            & 
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

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZH(4,4),ZRUZA(4,4),       & 
& ZRUZP(2,2),ZRUZN(7,7),ZRUUM(2,2),ZRUUP(2,2),ZRUUV(6,6),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LFv(6,156) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

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
Real(dp) :: MRPFvToFvAh(6,6,4),MRGFvToFvAh(6,6,4), MRPZFvToFvAh(6,6,4),MRGZFvToFvAh(6,6,4) 
Real(dp) :: MVPFvToFvAh(6,6,4) 
Real(dp) :: RMsqTreeFvToFvAh(6,6,4),RMsqWaveFvToFvAh(6,6,4),RMsqVertexFvToFvAh(6,6,4) 
Complex(dp) :: AmpTreeFvToFvAh(2,6,6,4),AmpWaveFvToFvAh(2,6,6,4)=(0._dp,0._dp),AmpVertexFvToFvAh(2,6,6,4)& 
 & ,AmpVertexIRosFvToFvAh(2,6,6,4),AmpVertexIRdrFvToFvAh(2,6,6,4), AmpSumFvToFvAh(2,6,6,4), AmpSum2FvToFvAh(2,6,6,4) 
Complex(dp) :: AmpTreeZFvToFvAh(2,6,6,4),AmpWaveZFvToFvAh(2,6,6,4),AmpVertexZFvToFvAh(2,6,6,4) 
Real(dp) :: AmpSqFvToFvAh(6,6,4),  AmpSqTreeFvToFvAh(6,6,4) 
Real(dp) :: MRPFvToChacSe(6,2,6),MRGFvToChacSe(6,2,6), MRPZFvToChacSe(6,2,6),MRGZFvToChacSe(6,2,6) 
Real(dp) :: MVPFvToChacSe(6,2,6) 
Real(dp) :: RMsqTreeFvToChacSe(6,2,6),RMsqWaveFvToChacSe(6,2,6),RMsqVertexFvToChacSe(6,2,6) 
Complex(dp) :: AmpTreeFvToChacSe(2,6,2,6),AmpWaveFvToChacSe(2,6,2,6)=(0._dp,0._dp),AmpVertexFvToChacSe(2,6,2,6)& 
 & ,AmpVertexIRosFvToChacSe(2,6,2,6),AmpVertexIRdrFvToChacSe(2,6,2,6), AmpSumFvToChacSe(2,6,2,6), AmpSum2FvToChacSe(2,6,2,6) 
Complex(dp) :: AmpTreeZFvToChacSe(2,6,2,6),AmpWaveZFvToChacSe(2,6,2,6),AmpVertexZFvToChacSe(2,6,2,6) 
Real(dp) :: AmpSqFvToChacSe(6,2,6),  AmpSqTreeFvToChacSe(6,2,6) 
Real(dp) :: MRPFvToChiSvIm(6,7,6),MRGFvToChiSvIm(6,7,6), MRPZFvToChiSvIm(6,7,6),MRGZFvToChiSvIm(6,7,6) 
Real(dp) :: MVPFvToChiSvIm(6,7,6) 
Real(dp) :: RMsqTreeFvToChiSvIm(6,7,6),RMsqWaveFvToChiSvIm(6,7,6),RMsqVertexFvToChiSvIm(6,7,6) 
Complex(dp) :: AmpTreeFvToChiSvIm(2,6,7,6),AmpWaveFvToChiSvIm(2,6,7,6)=(0._dp,0._dp),AmpVertexFvToChiSvIm(2,6,7,6)& 
 & ,AmpVertexIRosFvToChiSvIm(2,6,7,6),AmpVertexIRdrFvToChiSvIm(2,6,7,6), AmpSumFvToChiSvIm(2,6,7,6), AmpSum2FvToChiSvIm(2,6,7,6) 
Complex(dp) :: AmpTreeZFvToChiSvIm(2,6,7,6),AmpWaveZFvToChiSvIm(2,6,7,6),AmpVertexZFvToChiSvIm(2,6,7,6) 
Real(dp) :: AmpSqFvToChiSvIm(6,7,6),  AmpSqTreeFvToChiSvIm(6,7,6) 
Real(dp) :: MRPFvToChiSvRe(6,7,6),MRGFvToChiSvRe(6,7,6), MRPZFvToChiSvRe(6,7,6),MRGZFvToChiSvRe(6,7,6) 
Real(dp) :: MVPFvToChiSvRe(6,7,6) 
Real(dp) :: RMsqTreeFvToChiSvRe(6,7,6),RMsqWaveFvToChiSvRe(6,7,6),RMsqVertexFvToChiSvRe(6,7,6) 
Complex(dp) :: AmpTreeFvToChiSvRe(2,6,7,6),AmpWaveFvToChiSvRe(2,6,7,6)=(0._dp,0._dp),AmpVertexFvToChiSvRe(2,6,7,6)& 
 & ,AmpVertexIRosFvToChiSvRe(2,6,7,6),AmpVertexIRdrFvToChiSvRe(2,6,7,6), AmpSumFvToChiSvRe(2,6,7,6), AmpSum2FvToChiSvRe(2,6,7,6) 
Complex(dp) :: AmpTreeZFvToChiSvRe(2,6,7,6),AmpWaveZFvToChiSvRe(2,6,7,6),AmpVertexZFvToChiSvRe(2,6,7,6) 
Real(dp) :: AmpSqFvToChiSvRe(6,7,6),  AmpSqTreeFvToChiSvRe(6,7,6) 
Real(dp) :: MRPFvToFecHpm(6,3,2),MRGFvToFecHpm(6,3,2), MRPZFvToFecHpm(6,3,2),MRGZFvToFecHpm(6,3,2) 
Real(dp) :: MVPFvToFecHpm(6,3,2) 
Real(dp) :: RMsqTreeFvToFecHpm(6,3,2),RMsqWaveFvToFecHpm(6,3,2),RMsqVertexFvToFecHpm(6,3,2) 
Complex(dp) :: AmpTreeFvToFecHpm(2,6,3,2),AmpWaveFvToFecHpm(2,6,3,2)=(0._dp,0._dp),AmpVertexFvToFecHpm(2,6,3,2)& 
 & ,AmpVertexIRosFvToFecHpm(2,6,3,2),AmpVertexIRdrFvToFecHpm(2,6,3,2), AmpSumFvToFecHpm(2,6,3,2), AmpSum2FvToFecHpm(2,6,3,2) 
Complex(dp) :: AmpTreeZFvToFecHpm(2,6,3,2),AmpWaveZFvToFecHpm(2,6,3,2),AmpVertexZFvToFecHpm(2,6,3,2) 
Real(dp) :: AmpSqFvToFecHpm(6,3,2),  AmpSqTreeFvToFecHpm(6,3,2) 
Real(dp) :: MRPFvToFecVWm(6,3),MRGFvToFecVWm(6,3), MRPZFvToFecVWm(6,3),MRGZFvToFecVWm(6,3) 
Real(dp) :: MVPFvToFecVWm(6,3) 
Real(dp) :: RMsqTreeFvToFecVWm(6,3),RMsqWaveFvToFecVWm(6,3),RMsqVertexFvToFecVWm(6,3) 
Complex(dp) :: AmpTreeFvToFecVWm(4,6,3),AmpWaveFvToFecVWm(4,6,3)=(0._dp,0._dp),AmpVertexFvToFecVWm(4,6,3)& 
 & ,AmpVertexIRosFvToFecVWm(4,6,3),AmpVertexIRdrFvToFecVWm(4,6,3), AmpSumFvToFecVWm(4,6,3), AmpSum2FvToFecVWm(4,6,3) 
Complex(dp) :: AmpTreeZFvToFecVWm(4,6,3),AmpWaveZFvToFecVWm(4,6,3),AmpVertexZFvToFecVWm(4,6,3) 
Real(dp) :: AmpSqFvToFecVWm(6,3),  AmpSqTreeFvToFecVWm(6,3) 
Real(dp) :: MRPFvToFvhh(6,6,4),MRGFvToFvhh(6,6,4), MRPZFvToFvhh(6,6,4),MRGZFvToFvhh(6,6,4) 
Real(dp) :: MVPFvToFvhh(6,6,4) 
Real(dp) :: RMsqTreeFvToFvhh(6,6,4),RMsqWaveFvToFvhh(6,6,4),RMsqVertexFvToFvhh(6,6,4) 
Complex(dp) :: AmpTreeFvToFvhh(2,6,6,4),AmpWaveFvToFvhh(2,6,6,4)=(0._dp,0._dp),AmpVertexFvToFvhh(2,6,6,4)& 
 & ,AmpVertexIRosFvToFvhh(2,6,6,4),AmpVertexIRdrFvToFvhh(2,6,6,4), AmpSumFvToFvhh(2,6,6,4), AmpSum2FvToFvhh(2,6,6,4) 
Complex(dp) :: AmpTreeZFvToFvhh(2,6,6,4),AmpWaveZFvToFvhh(2,6,6,4),AmpVertexZFvToFvhh(2,6,6,4) 
Real(dp) :: AmpSqFvToFvhh(6,6,4),  AmpSqTreeFvToFvhh(6,6,4) 
Real(dp) :: MRPFvToFvVZ(6,6),MRGFvToFvVZ(6,6), MRPZFvToFvVZ(6,6),MRGZFvToFvVZ(6,6) 
Real(dp) :: MVPFvToFvVZ(6,6) 
Real(dp) :: RMsqTreeFvToFvVZ(6,6),RMsqWaveFvToFvVZ(6,6),RMsqVertexFvToFvVZ(6,6) 
Complex(dp) :: AmpTreeFvToFvVZ(4,6,6),AmpWaveFvToFvVZ(4,6,6)=(0._dp,0._dp),AmpVertexFvToFvVZ(4,6,6)& 
 & ,AmpVertexIRosFvToFvVZ(4,6,6),AmpVertexIRdrFvToFvVZ(4,6,6), AmpSumFvToFvVZ(4,6,6), AmpSum2FvToFvVZ(4,6,6) 
Complex(dp) :: AmpTreeZFvToFvVZ(4,6,6),AmpWaveZFvToFvVZ(4,6,6),AmpVertexZFvToFvVZ(4,6,6) 
Real(dp) :: AmpSqFvToFvVZ(6,6),  AmpSqTreeFvToFvVZ(6,6) 
Real(dp) :: MRPFvToFvVZp(6,6),MRGFvToFvVZp(6,6), MRPZFvToFvVZp(6,6),MRGZFvToFvVZp(6,6) 
Real(dp) :: MVPFvToFvVZp(6,6) 
Real(dp) :: RMsqTreeFvToFvVZp(6,6),RMsqWaveFvToFvVZp(6,6),RMsqVertexFvToFvVZp(6,6) 
Complex(dp) :: AmpTreeFvToFvVZp(4,6,6),AmpWaveFvToFvVZp(4,6,6)=(0._dp,0._dp),AmpVertexFvToFvVZp(4,6,6)& 
 & ,AmpVertexIRosFvToFvVZp(4,6,6),AmpVertexIRdrFvToFvVZp(4,6,6), AmpSumFvToFvVZp(4,6,6), AmpSum2FvToFvVZp(4,6,6) 
Complex(dp) :: AmpTreeZFvToFvVZp(4,6,6),AmpWaveZFvToFvVZp(4,6,6),AmpVertexZFvToFvVZp(4,6,6) 
Real(dp) :: AmpSqFvToFvVZp(6,6),  AmpSqTreeFvToFvVZp(6,6) 
Real(dp) :: MRPFvToFvVP(6,6),MRGFvToFvVP(6,6), MRPZFvToFvVP(6,6),MRGZFvToFvVP(6,6) 
Real(dp) :: MVPFvToFvVP(6,6) 
Real(dp) :: RMsqTreeFvToFvVP(6,6),RMsqWaveFvToFvVP(6,6),RMsqVertexFvToFvVP(6,6) 
Complex(dp) :: AmpTreeFvToFvVP(4,6,6),AmpWaveFvToFvVP(4,6,6)=(0._dp,0._dp),AmpVertexFvToFvVP(4,6,6)& 
 & ,AmpVertexIRosFvToFvVP(4,6,6),AmpVertexIRdrFvToFvVP(4,6,6), AmpSumFvToFvVP(4,6,6), AmpSum2FvToFvVP(4,6,6) 
Complex(dp) :: AmpTreeZFvToFvVP(4,6,6),AmpWaveZFvToFvVP(4,6,6),AmpVertexZFvToFvVP(4,6,6) 
Real(dp) :: AmpSqFvToFvVP(6,6),  AmpSqTreeFvToFvVP(6,6) 
Write(*,*) "Calculating one-loop decays of Fv " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

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

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFvAh(cplFvFvAhL,cplFvFvAhR,MAh,MFv,MAh2,MFv2,           & 
& AmpTreeFvToFvAh)

  Else 
Call Amplitude_Tree_BLSSM_FvToFvAh(ZcplFvFvAhL,ZcplFvFvAhR,MAh,MFv,MAh2,              & 
& MFv2,AmpTreeFvToFvAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFvAh(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,MAhOS,             & 
& MFvOS,MRPFvToFvAh,MRGFvToFvAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFvAh(MLambda,em,gs,ZcplFvFvAhL,ZcplFvFvAhR,MAhOS,           & 
& MFvOS,MRPFvToFvAh,MRGFvToFvAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFvAh(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,MAh,               & 
& MFv,MRPFvToFvAh,MRGFvToFvAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFvAh(MLambda,em,gs,ZcplFvFvAhL,ZcplFvFvAhR,MAh,             & 
& MFv,MRPFvToFvAh,MRGFvToFvAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFvAh(cplFvFvAhL,cplFvFvAhR,ctcplFvFvAhL,ctcplFvFvAhR,   & 
& MAh,MAh2,MFv,MFv2,ZfAh,ZfFvm,AmpWaveFvToFvAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,             & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexFvToFvAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRdrFvToFvAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,ZcplFvFvAhL,ZcplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosFvToFvAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,ZcplFvFvAhL,ZcplFvFvAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosFvToFvAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,          & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosFvToFvAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosFvToFvAh)

 End if 
 End if 
AmpVertexFvToFvAh = AmpVertexFvToFvAh -  AmpVertexIRdrFvToFvAh! +  AmpVertexIRosFvToFvAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFvAh=0._dp 
AmpVertexZFvToFvAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvAh(1,gt2,:,:) = AmpWaveZFvToFvAh(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvAh(1,gt1,:,:) 
AmpVertexZFvToFvAh(1,gt2,:,:)= AmpVertexZFvToFvAh(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvAh(1,gt1,:,:) 
AmpWaveZFvToFvAh(2,gt2,:,:) = AmpWaveZFvToFvAh(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvAh(2,gt1,:,:) 
AmpVertexZFvToFvAh(2,gt2,:,:)= AmpVertexZFvToFvAh(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToFvAh=AmpWaveZFvToFvAh 
AmpVertexFvToFvAh= AmpVertexZFvToFvAh
! Final State 1 
AmpWaveZFvToFvAh=0._dp 
AmpVertexZFvToFvAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvAh(1,:,gt2,:) = AmpWaveZFvToFvAh(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvAh(1,:,gt1,:) 
AmpVertexZFvToFvAh(1,:,gt2,:)= AmpVertexZFvToFvAh(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexFvToFvAh(1,:,gt1,:) 
AmpWaveZFvToFvAh(2,:,gt2,:) = AmpWaveZFvToFvAh(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvAh(2,:,gt1,:) 
AmpVertexZFvToFvAh(2,:,gt2,:)= AmpVertexZFvToFvAh(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFvAh=AmpWaveZFvToFvAh 
AmpVertexFvToFvAh= AmpVertexZFvToFvAh
! Final State 2 
AmpWaveZFvToFvAh=0._dp 
AmpVertexZFvToFvAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZFvToFvAh(:,:,:,gt2) = AmpWaveZFvToFvAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveFvToFvAh(:,:,:,gt1) 
AmpVertexZFvToFvAh(:,:,:,gt2)= AmpVertexZFvToFvAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexFvToFvAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFvAh=AmpWaveZFvToFvAh 
AmpVertexFvToFvAh= AmpVertexZFvToFvAh
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFvAh = AmpVertexFvToFvAh  +  AmpVertexIRosFvToFvAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFvAh = AmpTreeFvToFvAh 
 AmpSum2FvToFvAh = AmpTreeFvToFvAh + 2._dp*AmpWaveFvToFvAh + 2._dp*AmpVertexFvToFvAh  
Else 
 AmpSumFvToFvAh = AmpTreeFvToFvAh + AmpWaveFvToFvAh + AmpVertexFvToFvAh
 AmpSum2FvToFvAh = AmpTreeFvToFvAh + AmpWaveFvToFvAh + AmpVertexFvToFvAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvAh = AmpTreeFvToFvAh
 AmpSum2FvToFvAh = AmpTreeFvToFvAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFv(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToFvAh = AmpTreeFvToFvAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFvAh(gt1, gt2, gt3) 
  AmpSum2FvToFvAh = 2._dp*AmpWaveFvToFvAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFvAh(gt1, gt2, gt3) 
  AmpSum2FvToFvAh = 2._dp*AmpVertexFvToFvAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFvAh(gt1, gt2, gt3) 
  AmpSum2FvToFvAh = AmpTreeFvToFvAh + 2._dp*AmpWaveFvToFvAh + 2._dp*AmpVertexFvToFvAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFvAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFvAh = AmpTreeFvToFvAh
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
  AmpSqTreeFvToFvAh(gt1, gt2, gt3) = AmpSqFvToFvAh(gt1, gt2, gt3)  
  AmpSum2FvToFvAh = + 2._dp*AmpWaveFvToFvAh + 2._dp*AmpVertexFvToFvAh
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
  AmpSqFvToFvAh(gt1, gt2, gt3) = AmpSqFvToFvAh(gt1, gt2, gt3) + AmpSqTreeFvToFvAh(gt1, gt2, gt3)  
Else  
  AmpSum2FvToFvAh = AmpTreeFvToFvAh
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
  AmpSqTreeFvToFvAh(gt1, gt2, gt3) = AmpSqFvToFvAh(gt1, gt2, gt3)  
  AmpSum2FvToFvAh = + 2._dp*AmpWaveFvToFvAh + 2._dp*AmpVertexFvToFvAh
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MAh(gt3),AmpSumFvToFvAh(:,gt1, gt2, gt3),AmpSum2FvToFvAh(:,gt1, gt2, gt3),AmpSqFvToFvAh(gt1, gt2, gt3)) 
  AmpSqFvToFvAh(gt1, gt2, gt3) = AmpSqFvToFvAh(gt1, gt2, gt3) + AmpSqTreeFvToFvAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToFvAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MAhOS(gt3),helfactor*AmpSqFvToFvAh(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFv(gt2),MAh(gt3),helfactor*AmpSqFvToFvAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToFvAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFvAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFvAh(gt1, gt2, gt3) + MRGFvToFvAh(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFvAh(gt1, gt2, gt3) + MRGFvToFvAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(Se)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToChacSe(cplFvChacSeL,cplFvChacSeR,MCha,MFv,              & 
& MSe,MCha2,MFv2,MSe2,AmpTreeFvToChacSe)

  Else 
Call Amplitude_Tree_BLSSM_FvToChacSe(ZcplFvChacSeL,ZcplFvChacSeR,MCha,MFv,            & 
& MSe,MCha2,MFv2,MSe2,AmpTreeFvToChacSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToChacSe(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,             & 
& MChaOS,MFvOS,MSeOS,MRPFvToChacSe,MRGFvToChacSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToChacSe(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,           & 
& MChaOS,MFvOS,MSeOS,MRPFvToChacSe,MRGFvToChacSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToChacSe(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,             & 
& MCha,MFv,MSe,MRPFvToChacSe,MRGFvToChacSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToChacSe(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,           & 
& MCha,MFv,MSe,MRPFvToChacSe,MRGFvToChacSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToChacSe(cplFvChacSeL,cplFvChacSeR,ctcplFvChacSeL,        & 
& ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFvm,ZfLm,ZfLp,ZfSe,AmpWaveFvToChacSe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,            & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexFvToChacSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrFvToChacSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,ZcplFvChacSeL,             & 
& ZcplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosFvToChacSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& ZcplFvChacSeL,ZcplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosFvToChacSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,              & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,              & 
& cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosFvToChacSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosFvToChacSe)

 End if 
 End if 
AmpVertexFvToChacSe = AmpVertexFvToChacSe -  AmpVertexIRdrFvToChacSe! +  AmpVertexIRosFvToChacSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToChacSe=0._dp 
AmpVertexZFvToChacSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChacSe(1,gt2,:,:) = AmpWaveZFvToChacSe(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToChacSe(1,gt1,:,:) 
AmpVertexZFvToChacSe(1,gt2,:,:)= AmpVertexZFvToChacSe(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToChacSe(1,gt1,:,:) 
AmpWaveZFvToChacSe(2,gt2,:,:) = AmpWaveZFvToChacSe(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToChacSe(2,gt1,:,:) 
AmpVertexZFvToChacSe(2,gt2,:,:)= AmpVertexZFvToChacSe(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToChacSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToChacSe=AmpWaveZFvToChacSe 
AmpVertexFvToChacSe= AmpVertexZFvToChacSe
! Final State 1 
AmpWaveZFvToChacSe=0._dp 
AmpVertexZFvToChacSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFvToChacSe(1,:,gt2,:) = AmpWaveZFvToChacSe(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveFvToChacSe(1,:,gt1,:) 
AmpVertexZFvToChacSe(1,:,gt2,:)= AmpVertexZFvToChacSe(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexFvToChacSe(1,:,gt1,:) 
AmpWaveZFvToChacSe(2,:,gt2,:) = AmpWaveZFvToChacSe(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveFvToChacSe(2,:,gt1,:) 
AmpVertexZFvToChacSe(2,:,gt2,:)= AmpVertexZFvToChacSe(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexFvToChacSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToChacSe=AmpWaveZFvToChacSe 
AmpVertexFvToChacSe= AmpVertexZFvToChacSe
! Final State 2 
AmpWaveZFvToChacSe=0._dp 
AmpVertexZFvToChacSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChacSe(:,:,:,gt2) = AmpWaveZFvToChacSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpWaveFvToChacSe(:,:,:,gt1) 
AmpVertexZFvToChacSe(:,:,:,gt2)= AmpVertexZFvToChacSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpVertexFvToChacSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToChacSe=AmpWaveZFvToChacSe 
AmpVertexFvToChacSe= AmpVertexZFvToChacSe
End if
If (ShiftIRdiv) Then 
AmpVertexFvToChacSe = AmpVertexFvToChacSe  +  AmpVertexIRosFvToChacSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Cha conj[Se] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToChacSe = AmpTreeFvToChacSe 
 AmpSum2FvToChacSe = AmpTreeFvToChacSe + 2._dp*AmpWaveFvToChacSe + 2._dp*AmpVertexFvToChacSe  
Else 
 AmpSumFvToChacSe = AmpTreeFvToChacSe + AmpWaveFvToChacSe + AmpVertexFvToChacSe
 AmpSum2FvToChacSe = AmpTreeFvToChacSe + AmpWaveFvToChacSe + AmpVertexFvToChacSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToChacSe = AmpTreeFvToChacSe
 AmpSum2FvToChacSe = AmpTreeFvToChacSe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,2
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MCha(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToChacSe = AmpTreeFvToChacSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToChacSe(gt1, gt2, gt3) 
  AmpSum2FvToChacSe = 2._dp*AmpWaveFvToChacSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToChacSe(gt1, gt2, gt3) 
  AmpSum2FvToChacSe = 2._dp*AmpVertexFvToChacSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToChacSe(gt1, gt2, gt3) 
  AmpSum2FvToChacSe = AmpTreeFvToChacSe + 2._dp*AmpWaveFvToChacSe + 2._dp*AmpVertexFvToChacSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToChacSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToChacSe = AmpTreeFvToChacSe
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
  AmpSqTreeFvToChacSe(gt1, gt2, gt3) = AmpSqFvToChacSe(gt1, gt2, gt3)  
  AmpSum2FvToChacSe = + 2._dp*AmpWaveFvToChacSe + 2._dp*AmpVertexFvToChacSe
  Call SquareAmp_FtoFS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
  AmpSqFvToChacSe(gt1, gt2, gt3) = AmpSqFvToChacSe(gt1, gt2, gt3) + AmpSqTreeFvToChacSe(gt1, gt2, gt3)  
Else  
  AmpSum2FvToChacSe = AmpTreeFvToChacSe
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
  AmpSqTreeFvToChacSe(gt1, gt2, gt3) = AmpSqFvToChacSe(gt1, gt2, gt3)  
  AmpSum2FvToChacSe = + 2._dp*AmpWaveFvToChacSe + 2._dp*AmpVertexFvToChacSe
  Call SquareAmp_FtoFS(MFv(gt1),MCha(gt2),MSe(gt3),AmpSumFvToChacSe(:,gt1, gt2, gt3),AmpSum2FvToChacSe(:,gt1, gt2, gt3),AmpSqFvToChacSe(gt1, gt2, gt3)) 
  AmpSqFvToChacSe(gt1, gt2, gt3) = AmpSqFvToChacSe(gt1, gt2, gt3) + AmpSqTreeFvToChacSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToChacSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToChacSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MChaOS(gt2),MSeOS(gt3),helfactor*AmpSqFvToChacSe(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MCha(gt2),MSe(gt3),helfactor*AmpSqFvToChacSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToChacSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChacSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToChacSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChacSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToChacSe(gt1, gt2, gt3) + MRGFvToChacSe(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToChacSe(gt1, gt2, gt3) + MRGFvToChacSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,MChi,               & 
& MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeFvToChiSvIm)

  Else 
Call Amplitude_Tree_BLSSM_FvToChiSvIm(ZcplChiFvSvImL,ZcplChiFvSvImR,MChi,             & 
& MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeFvToChiSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,          & 
& MChiOS,MFvOS,MSvImOS,MRPFvToChiSvIm,MRGFvToChiSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvIm(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,        & 
& MChiOS,MFvOS,MSvImOS,MRPFvToChiSvIm,MRGFvToChiSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToChiSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,          & 
& MChi,MFv,MSvIm,MRPFvToChiSvIm,MRGFvToChiSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvIm(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,        & 
& MChi,MFv,MSvIm,MRPFvToChiSvIm,MRGFvToChiSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,ctcplChiFvSvImL,    & 
& ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFvm,ZfL0,ZfSvIm,AmpWaveFvToChiSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexFvToChiSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRdrFvToChiSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvIm,          & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFecSeL,cplChiFecSeR,ZcplChiFvSvImL,ZcplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosFvToChiSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvSvImL,ZcplChiFvSvImR,cplChiFvSvReL,   & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosFvToChiSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvIm,          & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosFvToChiSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosFvToChiSvIm)

 End if 
 End if 
AmpVertexFvToChiSvIm = AmpVertexFvToChiSvIm -  AmpVertexIRdrFvToChiSvIm! +  AmpVertexIRosFvToChiSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToChiSvIm=0._dp 
AmpVertexZFvToChiSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChiSvIm(1,gt2,:,:) = AmpWaveZFvToChiSvIm(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToChiSvIm(1,gt1,:,:) 
AmpVertexZFvToChiSvIm(1,gt2,:,:)= AmpVertexZFvToChiSvIm(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToChiSvIm(1,gt1,:,:) 
AmpWaveZFvToChiSvIm(2,gt2,:,:) = AmpWaveZFvToChiSvIm(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToChiSvIm(2,gt1,:,:) 
AmpVertexZFvToChiSvIm(2,gt2,:,:)= AmpVertexZFvToChiSvIm(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToChiSvIm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToChiSvIm=AmpWaveZFvToChiSvIm 
AmpVertexFvToChiSvIm= AmpVertexZFvToChiSvIm
! Final State 1 
AmpWaveZFvToChiSvIm=0._dp 
AmpVertexZFvToChiSvIm=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZFvToChiSvIm(1,:,gt2,:) = AmpWaveZFvToChiSvIm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveFvToChiSvIm(1,:,gt1,:) 
AmpVertexZFvToChiSvIm(1,:,gt2,:)= AmpVertexZFvToChiSvIm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexFvToChiSvIm(1,:,gt1,:) 
AmpWaveZFvToChiSvIm(2,:,gt2,:) = AmpWaveZFvToChiSvIm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveFvToChiSvIm(2,:,gt1,:) 
AmpVertexZFvToChiSvIm(2,:,gt2,:)= AmpVertexZFvToChiSvIm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexFvToChiSvIm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToChiSvIm=AmpWaveZFvToChiSvIm 
AmpVertexFvToChiSvIm= AmpVertexZFvToChiSvIm
! Final State 2 
AmpWaveZFvToChiSvIm=0._dp 
AmpVertexZFvToChiSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChiSvIm(:,:,:,gt2) = AmpWaveZFvToChiSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveFvToChiSvIm(:,:,:,gt1) 
AmpVertexZFvToChiSvIm(:,:,:,gt2)= AmpVertexZFvToChiSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexFvToChiSvIm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToChiSvIm=AmpWaveZFvToChiSvIm 
AmpVertexFvToChiSvIm= AmpVertexZFvToChiSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexFvToChiSvIm = AmpVertexFvToChiSvIm  +  AmpVertexIRosFvToChiSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Chi SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToChiSvIm = AmpTreeFvToChiSvIm 
 AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm + 2._dp*AmpWaveFvToChiSvIm + 2._dp*AmpVertexFvToChiSvIm  
Else 
 AmpSumFvToChiSvIm = AmpTreeFvToChiSvIm + AmpWaveFvToChiSvIm + AmpVertexFvToChiSvIm
 AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm + AmpWaveFvToChiSvIm + AmpVertexFvToChiSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToChiSvIm = AmpTreeFvToChiSvIm
 AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,7
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MChi(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToChiSvIm(gt1, gt2, gt3) 
  AmpSum2FvToChiSvIm = 2._dp*AmpWaveFvToChiSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToChiSvIm(gt1, gt2, gt3) 
  AmpSum2FvToChiSvIm = 2._dp*AmpVertexFvToChiSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToChiSvIm(gt1, gt2, gt3) 
  AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm + 2._dp*AmpWaveFvToChiSvIm + 2._dp*AmpVertexFvToChiSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToChiSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
  AmpSqTreeFvToChiSvIm(gt1, gt2, gt3) = AmpSqFvToChiSvIm(gt1, gt2, gt3)  
  AmpSum2FvToChiSvIm = + 2._dp*AmpWaveFvToChiSvIm + 2._dp*AmpVertexFvToChiSvIm
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
  AmpSqFvToChiSvIm(gt1, gt2, gt3) = AmpSqFvToChiSvIm(gt1, gt2, gt3) + AmpSqTreeFvToChiSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2FvToChiSvIm = AmpTreeFvToChiSvIm
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
  AmpSqTreeFvToChiSvIm(gt1, gt2, gt3) = AmpSqFvToChiSvIm(gt1, gt2, gt3)  
  AmpSum2FvToChiSvIm = + 2._dp*AmpWaveFvToChiSvIm + 2._dp*AmpVertexFvToChiSvIm
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvIm(gt3),AmpSumFvToChiSvIm(:,gt1, gt2, gt3),AmpSum2FvToChiSvIm(:,gt1, gt2, gt3),AmpSqFvToChiSvIm(gt1, gt2, gt3)) 
  AmpSqFvToChiSvIm(gt1, gt2, gt3) = AmpSqFvToChiSvIm(gt1, gt2, gt3) + AmpSqTreeFvToChiSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToChiSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToChiSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MChiOS(gt2),MSvImOS(gt3),helfactor*AmpSqFvToChiSvIm(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MChi(gt2),MSvIm(gt3),helfactor*AmpSqFvToChiSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToChiSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChiSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToChiSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChiSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToChiSvIm(gt1, gt2, gt3) + MRGFvToChiSvIm(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToChiSvIm(gt1, gt2, gt3) + MRGFvToChiSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,MChi,               & 
& MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeFvToChiSvRe)

  Else 
Call Amplitude_Tree_BLSSM_FvToChiSvRe(ZcplChiFvSvReL,ZcplChiFvSvReR,MChi,             & 
& MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeFvToChiSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,          & 
& MChiOS,MFvOS,MSvReOS,MRPFvToChiSvRe,MRGFvToChiSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvRe(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR,        & 
& MChiOS,MFvOS,MSvReOS,MRPFvToChiSvRe,MRGFvToChiSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToChiSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,          & 
& MChi,MFv,MSvRe,MRPFvToChiSvRe,MRGFvToChiSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToChiSvRe(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR,        & 
& MChi,MFv,MSvRe,MRPFvToChiSvRe,MRGFvToChiSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,ctcplChiFvSvReL,    & 
& ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFvm,ZfL0,ZfSvRe,AmpWaveFvToChiSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexFvToChiSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRdrFvToChiSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvRe,          & 
& cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosFvToChiSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,ZcplChiFvSvReL,    & 
& ZcplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosFvToChiSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvRe,          & 
& cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosFvToChiSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosFvToChiSvRe)

 End if 
 End if 
AmpVertexFvToChiSvRe = AmpVertexFvToChiSvRe -  AmpVertexIRdrFvToChiSvRe! +  AmpVertexIRosFvToChiSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToChiSvRe=0._dp 
AmpVertexZFvToChiSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChiSvRe(1,gt2,:,:) = AmpWaveZFvToChiSvRe(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToChiSvRe(1,gt1,:,:) 
AmpVertexZFvToChiSvRe(1,gt2,:,:)= AmpVertexZFvToChiSvRe(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToChiSvRe(1,gt1,:,:) 
AmpWaveZFvToChiSvRe(2,gt2,:,:) = AmpWaveZFvToChiSvRe(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToChiSvRe(2,gt1,:,:) 
AmpVertexZFvToChiSvRe(2,gt2,:,:)= AmpVertexZFvToChiSvRe(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToChiSvRe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToChiSvRe=AmpWaveZFvToChiSvRe 
AmpVertexFvToChiSvRe= AmpVertexZFvToChiSvRe
! Final State 1 
AmpWaveZFvToChiSvRe=0._dp 
AmpVertexZFvToChiSvRe=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZFvToChiSvRe(1,:,gt2,:) = AmpWaveZFvToChiSvRe(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveFvToChiSvRe(1,:,gt1,:) 
AmpVertexZFvToChiSvRe(1,:,gt2,:)= AmpVertexZFvToChiSvRe(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexFvToChiSvRe(1,:,gt1,:) 
AmpWaveZFvToChiSvRe(2,:,gt2,:) = AmpWaveZFvToChiSvRe(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveFvToChiSvRe(2,:,gt1,:) 
AmpVertexZFvToChiSvRe(2,:,gt2,:)= AmpVertexZFvToChiSvRe(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexFvToChiSvRe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToChiSvRe=AmpWaveZFvToChiSvRe 
AmpVertexFvToChiSvRe= AmpVertexZFvToChiSvRe
! Final State 2 
AmpWaveZFvToChiSvRe=0._dp 
AmpVertexZFvToChiSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToChiSvRe(:,:,:,gt2) = AmpWaveZFvToChiSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveFvToChiSvRe(:,:,:,gt1) 
AmpVertexZFvToChiSvRe(:,:,:,gt2)= AmpVertexZFvToChiSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexFvToChiSvRe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToChiSvRe=AmpWaveZFvToChiSvRe 
AmpVertexFvToChiSvRe= AmpVertexZFvToChiSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexFvToChiSvRe = AmpVertexFvToChiSvRe  +  AmpVertexIRosFvToChiSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Chi SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToChiSvRe = AmpTreeFvToChiSvRe 
 AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe + 2._dp*AmpWaveFvToChiSvRe + 2._dp*AmpVertexFvToChiSvRe  
Else 
 AmpSumFvToChiSvRe = AmpTreeFvToChiSvRe + AmpWaveFvToChiSvRe + AmpVertexFvToChiSvRe
 AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe + AmpWaveFvToChiSvRe + AmpVertexFvToChiSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToChiSvRe = AmpTreeFvToChiSvRe
 AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,7
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MSvReOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MChi(gt2))+Abs(MSvRe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToChiSvRe(gt1, gt2, gt3) 
  AmpSum2FvToChiSvRe = 2._dp*AmpWaveFvToChiSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToChiSvRe(gt1, gt2, gt3) 
  AmpSum2FvToChiSvRe = 2._dp*AmpVertexFvToChiSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToChiSvRe(gt1, gt2, gt3) 
  AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe + 2._dp*AmpWaveFvToChiSvRe + 2._dp*AmpVertexFvToChiSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToChiSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
  AmpSqTreeFvToChiSvRe(gt1, gt2, gt3) = AmpSqFvToChiSvRe(gt1, gt2, gt3)  
  AmpSum2FvToChiSvRe = + 2._dp*AmpWaveFvToChiSvRe + 2._dp*AmpVertexFvToChiSvRe
  Call SquareAmp_FtoFS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
  AmpSqFvToChiSvRe(gt1, gt2, gt3) = AmpSqFvToChiSvRe(gt1, gt2, gt3) + AmpSqTreeFvToChiSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2FvToChiSvRe = AmpTreeFvToChiSvRe
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
  AmpSqTreeFvToChiSvRe(gt1, gt2, gt3) = AmpSqFvToChiSvRe(gt1, gt2, gt3)  
  AmpSum2FvToChiSvRe = + 2._dp*AmpWaveFvToChiSvRe + 2._dp*AmpVertexFvToChiSvRe
  Call SquareAmp_FtoFS(MFv(gt1),MChi(gt2),MSvRe(gt3),AmpSumFvToChiSvRe(:,gt1, gt2, gt3),AmpSum2FvToChiSvRe(:,gt1, gt2, gt3),AmpSqFvToChiSvRe(gt1, gt2, gt3)) 
  AmpSqFvToChiSvRe(gt1, gt2, gt3) = AmpSqFvToChiSvRe(gt1, gt2, gt3) + AmpSqTreeFvToChiSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToChiSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToChiSvRe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MChiOS(gt2),MSvReOS(gt3),helfactor*AmpSqFvToChiSvRe(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MChi(gt2),MSvRe(gt3),helfactor*AmpSqFvToChiSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToChiSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChiSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToChiSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToChiSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToChiSvRe(gt1, gt2, gt3) + MRGFvToChiSvRe(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToChiSvRe(gt1, gt2, gt3) + MRGFvToChiSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(Hpm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,MFe,MFv,               & 
& MHpm,MFe2,MFv2,MHpm2,AmpTreeFvToFecHpm)

  Else 
Call Amplitude_Tree_BLSSM_FvToFecHpm(ZcplFvFecHpmL,ZcplFvFecHpmR,MFe,MFv,             & 
& MHpm,MFe2,MFv2,MHpm2,AmpTreeFvToFecHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFecHpm(MLambda,em,gs,cplFvFecHpmL,cplFvFecHpmR,             & 
& MFeOS,MFvOS,MHpmOS,MRPFvToFecHpm,MRGFvToFecHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFecHpm(MLambda,em,gs,ZcplFvFecHpmL,ZcplFvFecHpmR,           & 
& MFeOS,MFvOS,MHpmOS,MRPFvToFecHpm,MRGFvToFecHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFecHpm(MLambda,em,gs,cplFvFecHpmL,cplFvFecHpmR,             & 
& MFe,MFv,MHpm,MRPFvToFecHpm,MRGFvToFecHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFecHpm(MLambda,em,gs,ZcplFvFecHpmL,ZcplFvFecHpmR,           & 
& MFe,MFv,MHpm,MRPFvToFecHpm,MRGFvToFecHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,ctcplFvFecHpmL,        & 
& ctcplFvFecHpmR,MFe,MFe2,MFv,MFv2,MHpm,MHpm2,ZfFEL,ZfFER,ZfFvm,ZfHpm,AmpWaveFvToFecHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,            & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexFvToFecHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRdrFvToFecHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcHpm,             & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,ZcplFvFecHpmL,    & 
& ZcplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosFvToFecHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,ZcplFvFecHpmL,ZcplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosFvToFecHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcHpm,             & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosFvToFecHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosFvToFecHpm)

 End if 
 End if 
AmpVertexFvToFecHpm = AmpVertexFvToFecHpm -  AmpVertexIRdrFvToFecHpm! +  AmpVertexIRosFvToFecHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFecHpm=0._dp 
AmpVertexZFvToFecHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFecHpm(1,gt2,:,:) = AmpWaveZFvToFecHpm(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFecHpm(1,gt1,:,:) 
AmpVertexZFvToFecHpm(1,gt2,:,:)= AmpVertexZFvToFecHpm(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFecHpm(1,gt1,:,:) 
AmpWaveZFvToFecHpm(2,gt2,:,:) = AmpWaveZFvToFecHpm(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFecHpm(2,gt1,:,:) 
AmpVertexZFvToFecHpm(2,gt2,:,:)= AmpVertexZFvToFecHpm(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFecHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToFecHpm=AmpWaveZFvToFecHpm 
AmpVertexFvToFecHpm= AmpVertexZFvToFecHpm
! Final State 1 
AmpWaveZFvToFecHpm=0._dp 
AmpVertexZFvToFecHpm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFecHpm(1,:,gt2,:) = AmpWaveZFvToFecHpm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveFvToFecHpm(1,:,gt1,:) 
AmpVertexZFvToFecHpm(1,:,gt2,:)= AmpVertexZFvToFecHpm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexFvToFecHpm(1,:,gt1,:) 
AmpWaveZFvToFecHpm(2,:,gt2,:) = AmpWaveZFvToFecHpm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveFvToFecHpm(2,:,gt1,:) 
AmpVertexZFvToFecHpm(2,:,gt2,:)= AmpVertexZFvToFecHpm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexFvToFecHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFecHpm=AmpWaveZFvToFecHpm 
AmpVertexFvToFecHpm= AmpVertexZFvToFecHpm
! Final State 2 
AmpWaveZFvToFecHpm=0._dp 
AmpVertexZFvToFecHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFvToFecHpm(:,:,:,gt2) = AmpWaveZFvToFecHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveFvToFecHpm(:,:,:,gt1) 
AmpVertexZFvToFecHpm(:,:,:,gt2)= AmpVertexZFvToFecHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexFvToFecHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFecHpm=AmpWaveZFvToFecHpm 
AmpVertexFvToFecHpm= AmpVertexZFvToFecHpm
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFecHpm = AmpVertexFvToFecHpm  +  AmpVertexIRosFvToFecHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fe conj[Hpm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFecHpm = AmpTreeFvToFecHpm 
 AmpSum2FvToFecHpm = AmpTreeFvToFecHpm + 2._dp*AmpWaveFvToFecHpm + 2._dp*AmpVertexFvToFecHpm  
Else 
 AmpSumFvToFecHpm = AmpTreeFvToFecHpm + AmpWaveFvToFecHpm + AmpVertexFvToFecHpm
 AmpSum2FvToFecHpm = AmpTreeFvToFecHpm + AmpWaveFvToFecHpm + AmpVertexFvToFecHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFecHpm = AmpTreeFvToFecHpm
 AmpSum2FvToFecHpm = AmpTreeFvToFecHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFe(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToFecHpm = AmpTreeFvToFecHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFecHpm(gt1, gt2, gt3) 
  AmpSum2FvToFecHpm = 2._dp*AmpWaveFvToFecHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFecHpm(gt1, gt2, gt3) 
  AmpSum2FvToFecHpm = 2._dp*AmpVertexFvToFecHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFecHpm(gt1, gt2, gt3) 
  AmpSum2FvToFecHpm = AmpTreeFvToFecHpm + 2._dp*AmpWaveFvToFecHpm + 2._dp*AmpVertexFvToFecHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFecHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFecHpm = AmpTreeFvToFecHpm
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
  AmpSqTreeFvToFecHpm(gt1, gt2, gt3) = AmpSqFvToFecHpm(gt1, gt2, gt3)  
  AmpSum2FvToFecHpm = + 2._dp*AmpWaveFvToFecHpm + 2._dp*AmpVertexFvToFecHpm
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
  AmpSqFvToFecHpm(gt1, gt2, gt3) = AmpSqFvToFecHpm(gt1, gt2, gt3) + AmpSqTreeFvToFecHpm(gt1, gt2, gt3)  
Else  
  AmpSum2FvToFecHpm = AmpTreeFvToFecHpm
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
  AmpSqTreeFvToFecHpm(gt1, gt2, gt3) = AmpSqFvToFecHpm(gt1, gt2, gt3)  
  AmpSum2FvToFecHpm = + 2._dp*AmpWaveFvToFecHpm + 2._dp*AmpVertexFvToFecHpm
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHpm(gt3),AmpSumFvToFecHpm(:,gt1, gt2, gt3),AmpSum2FvToFecHpm(:,gt1, gt2, gt3),AmpSqFvToFecHpm(gt1, gt2, gt3)) 
  AmpSqFvToFecHpm(gt1, gt2, gt3) = AmpSqFvToFecHpm(gt1, gt2, gt3) + AmpSqTreeFvToFecHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToFecHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFecHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFeOS(gt2),MHpmOS(gt3),helfactor*AmpSqFvToFecHpm(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFe(gt2),MHpm(gt3),helfactor*AmpSqFvToFecHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToFecHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFecHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFecHpm(gt1, gt2, gt3) + MRGFvToFecHpm(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFecHpm(gt1, gt2, gt3) + MRGFvToFecHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,MFe,MFv,               & 
& MVWm,MFe2,MFv2,MVWm2,AmpTreeFvToFecVWm)

  Else 
Call Amplitude_Tree_BLSSM_FvToFecVWm(ZcplFvFecVWmL,ZcplFvFecVWmR,MFe,MFv,             & 
& MVWm,MFe2,MFv2,MVWm2,AmpTreeFvToFecVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFecVWm(MLambda,em,gs,cplFvFecVWmL,cplFvFecVWmR,             & 
& MFeOS,MFvOS,MVWmOS,MRPFvToFecVWm,MRGFvToFecVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFecVWm(MLambda,em,gs,ZcplFvFecVWmL,ZcplFvFecVWmR,           & 
& MFeOS,MFvOS,MVWmOS,MRPFvToFecVWm,MRGFvToFecVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFecVWm(MLambda,em,gs,cplFvFecVWmL,cplFvFecVWmR,             & 
& MFe,MFv,MVWm,MRPFvToFecVWm,MRGFvToFecVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFecVWm(MLambda,em,gs,ZcplFvFecVWmL,ZcplFvFecVWmR,           & 
& MFe,MFv,MVWm,MRPFvToFecVWm,MRGFvToFecVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,ctcplFvFecVWmL,        & 
& ctcplFvFecVWmR,MFe,MFe2,MFv,MFv2,MVWm,MVWm2,ZfFEL,ZfFER,ZfFvm,ZfVWm,AmpWaveFvToFecVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,            & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcVWm,cplhhcVWmVWm,         & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,      & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexFvToFecVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRdrFvToFecVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcVWm,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,GosZcplFvFecHpmL,              & 
& GosZcplFvFecHpmR,ZcplFvFecVWmL,ZcplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,   & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcVWm,cplhhcVWmVWm,         & 
& GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,cplSeSvRecVWm,               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosFvToFecVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& GZcplFvFecHpmL,GZcplFvFecHpmR,ZcplFvFecVWmL,ZcplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,GZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,     & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosFvToFecVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcVWm,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,GcplFvFecHpmL,GcplFvFecHpmR,   & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GcplHpmcVWmVP,        & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,      & 
& cplcVWmVWmVZp,AmpVertexIRosFvToFecVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosFvToFecVWm)

 End if 
 End if 
AmpVertexFvToFecVWm = AmpVertexFvToFecVWm -  AmpVertexIRdrFvToFecVWm! +  AmpVertexIRosFvToFecVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFecVWm=0._dp 
AmpVertexZFvToFecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFecVWm(1,gt2,:) = AmpWaveZFvToFecVWm(1,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFecVWm(1,gt1,:) 
AmpVertexZFvToFecVWm(1,gt2,:)= AmpVertexZFvToFecVWm(1,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFecVWm(1,gt1,:) 
AmpWaveZFvToFecVWm(2,gt2,:) = AmpWaveZFvToFecVWm(2,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFecVWm(2,gt1,:) 
AmpVertexZFvToFecVWm(2,gt2,:)= AmpVertexZFvToFecVWm(2,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFecVWm(2,gt1,:) 
AmpWaveZFvToFecVWm(3,gt2,:) = AmpWaveZFvToFecVWm(3,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFecVWm(3,gt1,:) 
AmpVertexZFvToFecVWm(3,gt2,:)= AmpVertexZFvToFecVWm(3,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFecVWm(3,gt1,:) 
AmpWaveZFvToFecVWm(4,gt2,:) = AmpWaveZFvToFecVWm(4,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFecVWm(4,gt1,:) 
AmpVertexZFvToFecVWm(4,gt2,:)= AmpVertexZFvToFecVWm(4,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFecVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFecVWm=AmpWaveZFvToFecVWm 
AmpVertexFvToFecVWm= AmpVertexZFvToFecVWm
! Final State 1 
AmpWaveZFvToFecVWm=0._dp 
AmpVertexZFvToFecVWm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFecVWm(1,:,gt2) = AmpWaveZFvToFecVWm(1,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveFvToFecVWm(1,:,gt1) 
AmpVertexZFvToFecVWm(1,:,gt2)= AmpVertexZFvToFecVWm(1,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexFvToFecVWm(1,:,gt1) 
AmpWaveZFvToFecVWm(2,:,gt2) = AmpWaveZFvToFecVWm(2,:,gt2)+ZRUZERc(gt2,gt1)*AmpWaveFvToFecVWm(2,:,gt1) 
AmpVertexZFvToFecVWm(2,:,gt2)= AmpVertexZFvToFecVWm(2,:,gt2)+ZRUZERc(gt2,gt1)*AmpVertexFvToFecVWm(2,:,gt1) 
AmpWaveZFvToFecVWm(3,:,gt2) = AmpWaveZFvToFecVWm(3,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveFvToFecVWm(3,:,gt1) 
AmpVertexZFvToFecVWm(3,:,gt2)= AmpVertexZFvToFecVWm(3,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexFvToFecVWm(3,:,gt1) 
AmpWaveZFvToFecVWm(4,:,gt2) = AmpWaveZFvToFecVWm(4,:,gt2)+ZRUZERc(gt2,gt1)*AmpWaveFvToFecVWm(4,:,gt1) 
AmpVertexZFvToFecVWm(4,:,gt2)= AmpVertexZFvToFecVWm(4,:,gt2)+ZRUZERc(gt2,gt1)*AmpVertexFvToFecVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFecVWm=AmpWaveZFvToFecVWm 
AmpVertexFvToFecVWm= AmpVertexZFvToFecVWm
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFecVWm = AmpVertexFvToFecVWm  +  AmpVertexIRosFvToFecVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fe conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFecVWm = AmpTreeFvToFecVWm 
 AmpSum2FvToFecVWm = AmpTreeFvToFecVWm + 2._dp*AmpWaveFvToFecVWm + 2._dp*AmpVertexFvToFecVWm  
Else 
 AmpSumFvToFecVWm = AmpTreeFvToFecVWm + AmpWaveFvToFecVWm + AmpVertexFvToFecVWm
 AmpSum2FvToFecVWm = AmpTreeFvToFecVWm + AmpWaveFvToFecVWm + AmpVertexFvToFecVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFecVWm = AmpTreeFvToFecVWm
 AmpSum2FvToFecVWm = AmpTreeFvToFecVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFe(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FvToFecVWm = AmpTreeFvToFecVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFecVWm(gt1, gt2) 
  AmpSum2FvToFecVWm = 2._dp*AmpWaveFvToFecVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFecVWm(gt1, gt2) 
  AmpSum2FvToFecVWm = 2._dp*AmpVertexFvToFecVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFecVWm(gt1, gt2) 
  AmpSum2FvToFecVWm = AmpTreeFvToFecVWm + 2._dp*AmpWaveFvToFecVWm + 2._dp*AmpVertexFvToFecVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFecVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFecVWm = AmpTreeFvToFecVWm
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
  AmpSqTreeFvToFecVWm(gt1, gt2) = AmpSqFvToFecVWm(gt1, gt2)  
  AmpSum2FvToFecVWm = + 2._dp*AmpWaveFvToFecVWm + 2._dp*AmpVertexFvToFecVWm
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWmOS,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
  AmpSqFvToFecVWm(gt1, gt2) = AmpSqFvToFecVWm(gt1, gt2) + AmpSqTreeFvToFecVWm(gt1, gt2)  
Else  
  AmpSum2FvToFecVWm = AmpTreeFvToFecVWm
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
  AmpSqTreeFvToFecVWm(gt1, gt2) = AmpSqFvToFecVWm(gt1, gt2)  
  AmpSum2FvToFecVWm = + 2._dp*AmpWaveFvToFecVWm + 2._dp*AmpVertexFvToFecVWm
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWm,AmpSumFvToFecVWm(:,gt1, gt2),AmpSum2FvToFecVWm(:,gt1, gt2),AmpSqFvToFecVWm(gt1, gt2)) 
  AmpSqFvToFecVWm(gt1, gt2) = AmpSqFvToFecVWm(gt1, gt2) + AmpSqTreeFvToFecVWm(gt1, gt2)  
End if  
Else  
  AmpSqFvToFecVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFecVWm(gt1, gt2).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFeOS(gt2),MVWmOS,helfactor*AmpSqFvToFecVWm(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFe(gt2),MVWm,helfactor*AmpSqFvToFecVWm(gt1, gt2))
End if 
If ((Abs(MRPFvToFecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFecVWm(gt1, gt2) + MRGFvToFecVWm(gt1, gt2)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFecVWm(gt1, gt2) + MRGFvToFecVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFvhh(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,MFv2,Mhh2,           & 
& AmpTreeFvToFvhh)

  Else 
Call Amplitude_Tree_BLSSM_FvToFvhh(ZcplFvFvhhL,ZcplFvFvhhR,MFv,Mhh,MFv2,              & 
& Mhh2,AmpTreeFvToFvhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFvhh(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFvOS,             & 
& MhhOS,MRPFvToFvhh,MRGFvToFvhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFvhh(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFvOS,           & 
& MhhOS,MRPFvToFvhh,MRGFvToFvhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFvhh(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFv,               & 
& Mhh,MRPFvToFvhh,MRGFvToFvhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFvhh(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFv,             & 
& Mhh,MRPFvToFvhh,MRGFvToFvhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFvhh(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,ctcplFvFvhhR,   & 
& MFv,MFv2,Mhh,Mhh2,ZfFvm,Zfhh,AmpWaveFvToFvhh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,         & 
& cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexFvToFvhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrFvToFvhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,ZcplFvFvhhL,ZcplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,        & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& AmpVertexIRosFvToFvhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& ZcplFvFvhhL,ZcplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,       & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFvToFvhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,        & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& AmpVertexIRosFvToFvhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFvToFvhh)

 End if 
 End if 
AmpVertexFvToFvhh = AmpVertexFvToFvhh -  AmpVertexIRdrFvToFvhh! +  AmpVertexIRosFvToFvhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFvhh=0._dp 
AmpVertexZFvToFvhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvhh(1,gt2,:,:) = AmpWaveZFvToFvhh(1,gt2,:,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvhh(1,gt1,:,:) 
AmpVertexZFvToFvhh(1,gt2,:,:)= AmpVertexZFvToFvhh(1,gt2,:,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvhh(1,gt1,:,:) 
AmpWaveZFvToFvhh(2,gt2,:,:) = AmpWaveZFvToFvhh(2,gt2,:,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvhh(2,gt1,:,:) 
AmpVertexZFvToFvhh(2,gt2,:,:)= AmpVertexZFvToFvhh(2,gt2,:,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvhh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToFvhh=AmpWaveZFvToFvhh 
AmpVertexFvToFvhh= AmpVertexZFvToFvhh
! Final State 1 
AmpWaveZFvToFvhh=0._dp 
AmpVertexZFvToFvhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvhh(1,:,gt2,:) = AmpWaveZFvToFvhh(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvhh(1,:,gt1,:) 
AmpVertexZFvToFvhh(1,:,gt2,:)= AmpVertexZFvToFvhh(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexFvToFvhh(1,:,gt1,:) 
AmpWaveZFvToFvhh(2,:,gt2,:) = AmpWaveZFvToFvhh(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvhh(2,:,gt1,:) 
AmpVertexZFvToFvhh(2,:,gt2,:)= AmpVertexZFvToFvhh(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvhh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFvhh=AmpWaveZFvToFvhh 
AmpVertexFvToFvhh= AmpVertexZFvToFvhh
! Final State 2 
AmpWaveZFvToFvhh=0._dp 
AmpVertexZFvToFvhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZFvToFvhh(:,:,:,gt2) = AmpWaveZFvToFvhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveFvToFvhh(:,:,:,gt1) 
AmpVertexZFvToFvhh(:,:,:,gt2)= AmpVertexZFvToFvhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexFvToFvhh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFvhh=AmpWaveZFvToFvhh 
AmpVertexFvToFvhh= AmpVertexZFvToFvhh
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFvhh = AmpVertexFvToFvhh  +  AmpVertexIRosFvToFvhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFvhh = AmpTreeFvToFvhh 
 AmpSum2FvToFvhh = AmpTreeFvToFvhh + 2._dp*AmpWaveFvToFvhh + 2._dp*AmpVertexFvToFvhh  
Else 
 AmpSumFvToFvhh = AmpTreeFvToFvhh + AmpWaveFvToFvhh + AmpVertexFvToFvhh
 AmpSum2FvToFvhh = AmpTreeFvToFvhh + AmpWaveFvToFvhh + AmpVertexFvToFvhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvhh = AmpTreeFvToFvhh
 AmpSum2FvToFvhh = AmpTreeFvToFvhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFv(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToFvhh = AmpTreeFvToFvhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFvhh(gt1, gt2, gt3) 
  AmpSum2FvToFvhh = 2._dp*AmpWaveFvToFvhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFvhh(gt1, gt2, gt3) 
  AmpSum2FvToFvhh = 2._dp*AmpVertexFvToFvhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFvhh(gt1, gt2, gt3) 
  AmpSum2FvToFvhh = AmpTreeFvToFvhh + 2._dp*AmpWaveFvToFvhh + 2._dp*AmpVertexFvToFvhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFvhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFvhh = AmpTreeFvToFvhh
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
  AmpSqTreeFvToFvhh(gt1, gt2, gt3) = AmpSqFvToFvhh(gt1, gt2, gt3)  
  AmpSum2FvToFvhh = + 2._dp*AmpWaveFvToFvhh + 2._dp*AmpVertexFvToFvhh
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
  AmpSqFvToFvhh(gt1, gt2, gt3) = AmpSqFvToFvhh(gt1, gt2, gt3) + AmpSqTreeFvToFvhh(gt1, gt2, gt3)  
Else  
  AmpSum2FvToFvhh = AmpTreeFvToFvhh
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
  AmpSqTreeFvToFvhh(gt1, gt2, gt3) = AmpSqFvToFvhh(gt1, gt2, gt3)  
  AmpSum2FvToFvhh = + 2._dp*AmpWaveFvToFvhh + 2._dp*AmpVertexFvToFvhh
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
  AmpSqFvToFvhh(gt1, gt2, gt3) = AmpSqFvToFvhh(gt1, gt2, gt3) + AmpSqTreeFvToFvhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToFvhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),helfactor*AmpSqFvToFvhh(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFv(gt2),Mhh(gt3),helfactor*AmpSqFvToFvhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFvhh(gt1, gt2, gt3) + MRGFvToFvhh(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFvhh(gt1, gt2, gt3) + MRGFvToFvhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,MFv,MVZ,MFv2,MVZ2,           & 
& AmpTreeFvToFvVZ)

  Else 
Call Amplitude_Tree_BLSSM_FvToFvVZ(ZcplFvFvVZL,ZcplFvFvVZR,MFv,MVZ,MFv2,              & 
& MVZ2,AmpTreeFvToFvVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,MFvOS,             & 
& MVZOS,MRPFvToFvVZ,MRGFvToFvVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZ(MLambda,em,gs,ZcplFvFvVZL,ZcplFvFvVZR,MFvOS,           & 
& MVZOS,MRPFvToFvVZ,MRGFvToFvVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,MFv,               & 
& MVZ,MRPFvToFvVZ,MRGFvToFvVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZ(MLambda,em,gs,ZcplFvFvVZL,ZcplFvFvVZR,MFv,             & 
& MVZ,MRPFvToFvVZ,MRGFvToFvVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFvVZ(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,       & 
& cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,           & 
& ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,MVZ,MVZ2,ZfFvm,ZfVPVZ,ZfVZ,              & 
& ZfVZpVZ,AmpWaveFvToFvVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplFvChacSeL,      & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,      & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,cplcHpmVWmVZ,            & 
& cplcVWmVWmVZ,AmpVertexFvToFvVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrFvToFvVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,ZcplFvFvVZL,       & 
& ZcplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,            & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,    & 
& cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosFvToFvVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,ZcplFvFvVZL,ZcplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosFvToFvVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,    & 
& cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosFvToFvVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosFvToFvVZ)

 End if 
 End if 
AmpVertexFvToFvVZ = AmpVertexFvToFvVZ -  AmpVertexIRdrFvToFvVZ! +  AmpVertexIRosFvToFvVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFvVZ=0._dp 
AmpVertexZFvToFvVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvVZ(1,gt2,:) = AmpWaveZFvToFvVZ(1,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZ(1,gt1,:) 
AmpVertexZFvToFvVZ(1,gt2,:)= AmpVertexZFvToFvVZ(1,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZ(1,gt1,:) 
AmpWaveZFvToFvVZ(2,gt2,:) = AmpWaveZFvToFvVZ(2,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZ(2,gt1,:) 
AmpVertexZFvToFvVZ(2,gt2,:)= AmpVertexZFvToFvVZ(2,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvVZ(2,gt1,:) 
AmpWaveZFvToFvVZ(3,gt2,:) = AmpWaveZFvToFvVZ(3,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZ(3,gt1,:) 
AmpVertexZFvToFvVZ(3,gt2,:)= AmpVertexZFvToFvVZ(3,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZ(3,gt1,:) 
AmpWaveZFvToFvVZ(4,gt2,:) = AmpWaveZFvToFvVZ(4,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZ(4,gt1,:) 
AmpVertexZFvToFvVZ(4,gt2,:)= AmpVertexZFvToFvVZ(4,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFvVZ=AmpWaveZFvToFvVZ 
AmpVertexFvToFvVZ= AmpVertexZFvToFvVZ
! Final State 1 
AmpWaveZFvToFvVZ=0._dp 
AmpVertexZFvToFvVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvVZ(1,:,gt2) = AmpWaveZFvToFvVZ(1,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZ(1,:,gt1) 
AmpVertexZFvToFvVZ(1,:,gt2)= AmpVertexZFvToFvVZ(1,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFvToFvVZ(1,:,gt1) 
AmpWaveZFvToFvVZ(2,:,gt2) = AmpWaveZFvToFvVZ(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZ(2,:,gt1) 
AmpVertexZFvToFvVZ(2,:,gt2)= AmpVertexZFvToFvVZ(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZ(2,:,gt1) 
AmpWaveZFvToFvVZ(3,:,gt2) = AmpWaveZFvToFvVZ(3,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZ(3,:,gt1) 
AmpVertexZFvToFvVZ(3,:,gt2)= AmpVertexZFvToFvVZ(3,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFvToFvVZ(3,:,gt1) 
AmpWaveZFvToFvVZ(4,:,gt2) = AmpWaveZFvToFvVZ(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZ(4,:,gt1) 
AmpVertexZFvToFvVZ(4,:,gt2)= AmpVertexZFvToFvVZ(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFvVZ=AmpWaveZFvToFvVZ 
AmpVertexFvToFvVZ= AmpVertexZFvToFvVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFvVZ = AmpVertexFvToFvVZ  +  AmpVertexIRosFvToFvVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ 
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ  
Else 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ + AmpWaveFvToFvVZ + AmpVertexFvToFvVZ
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + AmpWaveFvToFvVZ + AmpVertexFvToFvVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFv(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = 2._dp*AmpWaveFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = 2._dp*AmpVertexFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFvVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqTreeFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2)  
  AmpSum2FvToFvVZ = + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2) + AmpSqTreeFvToFvVZ(gt1, gt2)  
Else  
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqTreeFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2)  
  AmpSum2FvToFvVZ = + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2) + AmpSqTreeFvToFvVZ(gt1, gt2)  
End if  
Else  
  AmpSqFvToFvVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvVZ(gt1, gt2).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MVZOS,helfactor*AmpSqFvToFvVZ(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFv(gt2),MVZ,helfactor*AmpSqFvToFvVZ(gt1, gt2))
End if 
If ((Abs(MRPFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFvVZ(gt1, gt2) + MRGFvToFvVZ(gt1, gt2)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFvVZ(gt1, gt2) + MRGFvToFvVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_FvToFvVZp(cplFvFvVZpL,cplFvFvVZpR,MFv,MVZp,MFv2,            & 
& MVZp2,AmpTreeFvToFvVZp)

  Else 
Call Amplitude_Tree_BLSSM_FvToFvVZp(ZcplFvFvVZpL,ZcplFvFvVZpR,MFv,MVZp,               & 
& MFv2,MVZp2,AmpTreeFvToFvVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZp(MLambda,em,gs,cplFvFvVZpL,cplFvFvVZpR,MFvOS,          & 
& MVZpOS,MRPFvToFvVZp,MRGFvToFvVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZp(MLambda,em,gs,ZcplFvFvVZpL,ZcplFvFvVZpR,              & 
& MFvOS,MVZpOS,MRPFvToFvVZp,MRGFvToFvVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_FvToFvVZp(MLambda,em,gs,cplFvFvVZpL,cplFvFvVZpR,MFv,            & 
& MVZp,MRPFvToFvVZp,MRGFvToFvVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_FvToFvVZp(MLambda,em,gs,ZcplFvFvVZpL,ZcplFvFvVZpR,              & 
& MFv,MVZp,MRPFvToFvVZp,MRGFvToFvVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFvVZp(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,           & 
& ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,MVZp,MVZp2,ZfFvm,ZfVPVZp,ZfVZp,          & 
& ZfVZVZp,AmpWaveFvToFvVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,cplFvChacSeL,     & 
& cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,  & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,               & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,    & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,cplhhVZVZp,             & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,cplcHpmVWmVZp,      & 
& cplcVWmVWmVZp,AmpVertexFvToFvVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRdrFvToFvVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,               & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,cplcFeFvHpmL,               & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosFvToFvVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosFvToFvVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,               & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,    & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,cplhhVZVZp,             & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,cplcHpmVWmVZp,      & 
& cplcVWmVWmVZp,AmpVertexIRosFvToFvVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosFvToFvVZp)

 End if 
 End if 
AmpVertexFvToFvVZp = AmpVertexFvToFvVZp -  AmpVertexIRdrFvToFvVZp! +  AmpVertexIRosFvToFvVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFvVZp=0._dp 
AmpVertexZFvToFvVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvVZp(1,gt2,:) = AmpWaveZFvToFvVZp(1,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZp(1,gt1,:) 
AmpVertexZFvToFvVZp(1,gt2,:)= AmpVertexZFvToFvVZp(1,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZp(1,gt1,:) 
AmpWaveZFvToFvVZp(2,gt2,:) = AmpWaveZFvToFvVZp(2,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZp(2,gt1,:) 
AmpVertexZFvToFvVZp(2,gt2,:)= AmpVertexZFvToFvVZp(2,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvVZp(2,gt1,:) 
AmpWaveZFvToFvVZp(3,gt2,:) = AmpWaveZFvToFvVZp(3,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZp(3,gt1,:) 
AmpVertexZFvToFvVZp(3,gt2,:)= AmpVertexZFvToFvVZp(3,gt2,:) + ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZp(3,gt1,:) 
AmpWaveZFvToFvVZp(4,gt2,:) = AmpWaveZFvToFvVZp(4,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZp(4,gt1,:) 
AmpVertexZFvToFvVZp(4,gt2,:)= AmpVertexZFvToFvVZp(4,gt2,:) + ZRUUV(gt2,gt1)*AmpVertexFvToFvVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFvVZp=AmpWaveZFvToFvVZp 
AmpVertexFvToFvVZp= AmpVertexZFvToFvVZp
! Final State 1 
AmpWaveZFvToFvVZp=0._dp 
AmpVertexZFvToFvVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFvToFvVZp(1,:,gt2) = AmpWaveZFvToFvVZp(1,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZp(1,:,gt1) 
AmpVertexZFvToFvVZp(1,:,gt2)= AmpVertexZFvToFvVZp(1,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFvToFvVZp(1,:,gt1) 
AmpWaveZFvToFvVZp(2,:,gt2) = AmpWaveZFvToFvVZp(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZp(2,:,gt1) 
AmpVertexZFvToFvVZp(2,:,gt2)= AmpVertexZFvToFvVZp(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZp(2,:,gt1) 
AmpWaveZFvToFvVZp(3,:,gt2) = AmpWaveZFvToFvVZp(3,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFvToFvVZp(3,:,gt1) 
AmpVertexZFvToFvVZp(3,:,gt2)= AmpVertexZFvToFvVZp(3,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFvToFvVZp(3,:,gt1) 
AmpWaveZFvToFvVZp(4,:,gt2) = AmpWaveZFvToFvVZp(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFvToFvVZp(4,:,gt1) 
AmpVertexZFvToFvVZp(4,:,gt2)= AmpVertexZFvToFvVZp(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFvToFvVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFvVZp=AmpWaveZFvToFvVZp 
AmpVertexFvToFvVZp= AmpVertexZFvToFvVZp
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFvVZp = AmpVertexFvToFvVZp  +  AmpVertexIRosFvToFvVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFvVZp = AmpTreeFvToFvVZp 
 AmpSum2FvToFvVZp = AmpTreeFvToFvVZp + 2._dp*AmpWaveFvToFvVZp + 2._dp*AmpVertexFvToFvVZp  
Else 
 AmpSumFvToFvVZp = AmpTreeFvToFvVZp + AmpWaveFvToFvVZp + AmpVertexFvToFvVZp
 AmpSum2FvToFvVZp = AmpTreeFvToFvVZp + AmpWaveFvToFvVZp + AmpVertexFvToFvVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvVZp = AmpTreeFvToFvVZp
 AmpSum2FvToFvVZp = AmpTreeFvToFvVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFv(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FvToFvVZp = AmpTreeFvToFvVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFvVZp(gt1, gt2) 
  AmpSum2FvToFvVZp = 2._dp*AmpWaveFvToFvVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFvVZp(gt1, gt2) 
  AmpSum2FvToFvVZp = 2._dp*AmpVertexFvToFvVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFvVZp(gt1, gt2) 
  AmpSum2FvToFvVZp = AmpTreeFvToFvVZp + 2._dp*AmpWaveFvToFvVZp + 2._dp*AmpVertexFvToFvVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFvVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFvVZp = AmpTreeFvToFvVZp
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
  AmpSqTreeFvToFvVZp(gt1, gt2) = AmpSqFvToFvVZp(gt1, gt2)  
  AmpSum2FvToFvVZp = + 2._dp*AmpWaveFvToFvVZp + 2._dp*AmpVertexFvToFvVZp
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZpOS,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
  AmpSqFvToFvVZp(gt1, gt2) = AmpSqFvToFvVZp(gt1, gt2) + AmpSqTreeFvToFvVZp(gt1, gt2)  
Else  
  AmpSum2FvToFvVZp = AmpTreeFvToFvVZp
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
  AmpSqTreeFvToFvVZp(gt1, gt2) = AmpSqFvToFvVZp(gt1, gt2)  
  AmpSum2FvToFvVZp = + 2._dp*AmpWaveFvToFvVZp + 2._dp*AmpVertexFvToFvVZp
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZp,AmpSumFvToFvVZp(:,gt1, gt2),AmpSum2FvToFvVZp(:,gt1, gt2),AmpSqFvToFvVZp(gt1, gt2)) 
  AmpSqFvToFvVZp(gt1, gt2) = AmpSqFvToFvVZp(gt1, gt2) + AmpSqTreeFvToFvVZp(gt1, gt2)  
End if  
Else  
  AmpSqFvToFvVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvVZp(gt1, gt2).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MVZpOS,helfactor*AmpSqFvToFvVZp(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFv(gt2),MVZp,helfactor*AmpSqFvToFvVZp(gt1, gt2))
End if 
If ((Abs(MRPFvToFvVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFvVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFvVZp(gt1, gt2) + MRGFvToFvVZp(gt1, gt2)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFvVZp(gt1, gt2) + MRGFvToFvVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Fv VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_FvToFvVP(ZcplFvFvVPL,ZcplFvFvVPR,ZcplFvFvVZL,               & 
& ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,          & 
& ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,MFvOS,MFv2OS,MVP,MVP2,ZfFvm,ZfVP,             & 
& ZfVZpVP,ZfVZVP,AmpWaveFvToFvVP)

 Else 
Call Amplitude_WAVE_BLSSM_FvToFvVP(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,       & 
& cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,           & 
& ctcplFvFvVZpL,ctcplFvFvVZpR,MFvOS,MFv2OS,MVP,MVP2,ZfFvm,ZfVP,ZfVZpVP,ZfVZVP,           & 
& AmpWaveFvToFvVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_FvToFvVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,MhhOS,           & 
& MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& MVZp2OS,ZcplFvFvAhL,ZcplFvFvAhR,ZcplAhhhVP,ZcplFvChacSeL,ZcplFvChacSeR,ZcplcChaChaVPL, & 
& ZcplcChaChaVPR,ZcplChiChiVPL,ZcplChiChiVPR,ZcplChiFvSvImL,ZcplChiFvSvImR,              & 
& ZcplChiFvSvReL,ZcplChiFvSvReR,ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplFvFecVWmL,               & 
& ZcplFvFecVWmR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplFvFvVPL,           & 
& ZcplFvFvVPR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ZcplcFeFvHpmL,           & 
& ZcplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,ZcplhhVPVZ,      & 
& ZcplhhVPVZp,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSecSeVP,ZcplSvImSvReVP,ZcplcHpmVPVWm,      & 
& ZcplcVWmVPVWm,AmpVertexFvToFvVP)

 Else 
Call Amplitude_VERTEX_BLSSM_FvToFvVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,MhhOS,           & 
& MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& MVZp2OS,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,              & 
& cplSecSeVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexFvToFvVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_FvToFvVP(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,       & 
& cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,           & 
& ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,ZfFvm,ZfVP,ZfVZpVP,ZfVZVP,               & 
& AmpWaveFvToFvVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_FvToFvVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplFvChacSeL,      & 
& cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,      & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,cplhhVPVZp,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,          & 
& AmpVertexFvToFvVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvVP = 0._dp 
 AmpSum2FvToFvVP = 0._dp  
Else 
 AmpSumFvToFvVP = AmpVertexFvToFvVP + AmpWaveFvToFvVP
 AmpSum2FvToFvVP = AmpVertexFvToFvVP + AmpWaveFvToFvVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFv(gt1)).gt.(Abs(MFv(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),0._dp,AmpSumFvToFvVP(:,gt1, gt2),AmpSum2FvToFvVP(:,gt1, gt2),AmpSqFvToFvVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVP,AmpSumFvToFvVP(:,gt1, gt2),AmpSum2FvToFvVP(:,gt1, gt2),AmpSqFvToFvVP(gt1, gt2)) 
End if  
Else  
  AmpSqFvToFvVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvVP(gt1, gt2).eq.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),0._dp,helfactor*AmpSqFvToFvVP(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFv(gt2),MVP,helfactor*AmpSqFvToFvVP(gt1, gt2))
End if 
If ((Abs(MRPFvToFvVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Fv

End Module Wrapper_OneLoopDecay_Fv_BLSSM
