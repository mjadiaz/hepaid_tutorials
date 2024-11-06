! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:14 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Cha_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_Cha_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Cha(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,           & 
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
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),      & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),   & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),              & 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),   & 
& cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFeFeAhL(3,3,4),      & 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVPL(3,3),             & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),           & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),& 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),   & 
& cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),& 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),   & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVWm(4,2),               & 
& cplhhcVWmVWm(4),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6)

Complex(dp),Intent(in) :: cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),         & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),           & 
& cplhhVZVZp(4),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),  & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),              & 
& cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),              & 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSucVWm(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),    & 
& cplSecSeVZp(6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),         & 
& cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),   & 
& cplSucSuVZp(6,6),cplSvImcSeVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),             & 
& cplSvImSvReVZp(6,6),cplSvRecSeVWm(6,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),  & 
& ctcplcChaChaAhL(2,2,4),ctcplcChaChaAhR(2,2,4),ctcplcChaChahhL(2,2,4),ctcplcChaChahhR(2,2,4),& 
& ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZpL(2,2),  & 
& ctcplcChaChaVZpR(2,2),ctcplcChaChaVZR(2,2),ctcplcChaChiHpmL(2,7,2),ctcplcChaChiHpmR(2,7,2),& 
& ctcplcChaChiVWmL(2,7),ctcplcChaChiVWmR(2,7),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),& 
& ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),               & 
& ctcplcChaFeSvReR(2,3,6),ctcplcChaFvSeL(2,6,6),ctcplcChaFvSeR(2,6,6),GcplcChaChiHpmL(2,7,2),& 
& GcplcChaChiHpmR(2,7,2),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GosZcplcChaChiHpmL(2,7,2),    & 
& GosZcplcChaChiHpmR(2,7,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplcChaChiHpmL(2,7,2),& 
& GZcplcChaChiHpmR(2,7,2),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplAhhhVP(4,4),           & 
& ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),ZcplcChaChaAhL(2,2,4),ZcplcChaChaAhR(2,2,4),& 
& ZcplcChaChahhL(2,2,4),ZcplcChaChahhR(2,2,4),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),   & 
& ZcplcChaChaVZL(2,2),ZcplcChaChaVZpL(2,2),ZcplcChaChaVZpR(2,2),ZcplcChaChaVZR(2,2),     & 
& ZcplcChaChiHpmL(2,7,2),ZcplcChaChiHpmR(2,7,2),ZcplcChaChiVWmL(2,7),ZcplcChaChiVWmR(2,7),& 
& ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),ZcplcChaFeSvImL(2,3,6),ZcplcChaFeSvImR(2,3,6),& 
& ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),& 
& ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),         & 
& ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),& 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
& ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplChiChacHpmL(7,2,2),ZcplChiChacHpmR(7,2,2),& 
& ZcplChiChacVWmL(7,2),ZcplChiChacVWmR(7,2),ZcplChiChiVPL(7,7),ZcplChiChiVPR(7,7),       & 
& ZcplcHpmVPVWm(2),ZcplcVWmVPVWm,ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),              & 
& ZcplFvFvVPL(6,6),ZcplFvFvVPR(6,6),ZcplhhVPVZ(4),ZcplhhVPVZp(4),ZcplHpmcHpmVP(2,2),     & 
& ZcplHpmcVWmVP(2),ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVP(6,6),ZcplSvImSvReVP(6,6)

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
Real(dp), Intent(out) :: gP1LCha(2,140) 
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
Real(dp) :: MRPChaToChaAh(2,2,4),MRGChaToChaAh(2,2,4), MRPZChaToChaAh(2,2,4),MRGZChaToChaAh(2,2,4) 
Real(dp) :: MVPChaToChaAh(2,2,4) 
Real(dp) :: RMsqTreeChaToChaAh(2,2,4),RMsqWaveChaToChaAh(2,2,4),RMsqVertexChaToChaAh(2,2,4) 
Complex(dp) :: AmpTreeChaToChaAh(2,2,2,4),AmpWaveChaToChaAh(2,2,2,4)=(0._dp,0._dp),AmpVertexChaToChaAh(2,2,2,4)& 
 & ,AmpVertexIRosChaToChaAh(2,2,2,4),AmpVertexIRdrChaToChaAh(2,2,2,4), AmpSumChaToChaAh(2,2,2,4), AmpSum2ChaToChaAh(2,2,2,4) 
Complex(dp) :: AmpTreeZChaToChaAh(2,2,2,4),AmpWaveZChaToChaAh(2,2,2,4),AmpVertexZChaToChaAh(2,2,2,4) 
Real(dp) :: AmpSqChaToChaAh(2,2,4),  AmpSqTreeChaToChaAh(2,2,4) 
Real(dp) :: MRPChaToChahh(2,2,4),MRGChaToChahh(2,2,4), MRPZChaToChahh(2,2,4),MRGZChaToChahh(2,2,4) 
Real(dp) :: MVPChaToChahh(2,2,4) 
Real(dp) :: RMsqTreeChaToChahh(2,2,4),RMsqWaveChaToChahh(2,2,4),RMsqVertexChaToChahh(2,2,4) 
Complex(dp) :: AmpTreeChaToChahh(2,2,2,4),AmpWaveChaToChahh(2,2,2,4)=(0._dp,0._dp),AmpVertexChaToChahh(2,2,2,4)& 
 & ,AmpVertexIRosChaToChahh(2,2,2,4),AmpVertexIRdrChaToChahh(2,2,2,4), AmpSumChaToChahh(2,2,2,4), AmpSum2ChaToChahh(2,2,2,4) 
Complex(dp) :: AmpTreeZChaToChahh(2,2,2,4),AmpWaveZChaToChahh(2,2,2,4),AmpVertexZChaToChahh(2,2,2,4) 
Real(dp) :: AmpSqChaToChahh(2,2,4),  AmpSqTreeChaToChahh(2,2,4) 
Real(dp) :: MRPChaToChaVZ(2,2),MRGChaToChaVZ(2,2), MRPZChaToChaVZ(2,2),MRGZChaToChaVZ(2,2) 
Real(dp) :: MVPChaToChaVZ(2,2) 
Real(dp) :: RMsqTreeChaToChaVZ(2,2),RMsqWaveChaToChaVZ(2,2),RMsqVertexChaToChaVZ(2,2) 
Complex(dp) :: AmpTreeChaToChaVZ(4,2,2),AmpWaveChaToChaVZ(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVZ(4,2,2)& 
 & ,AmpVertexIRosChaToChaVZ(4,2,2),AmpVertexIRdrChaToChaVZ(4,2,2), AmpSumChaToChaVZ(4,2,2), AmpSum2ChaToChaVZ(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVZ(4,2,2),AmpWaveZChaToChaVZ(4,2,2),AmpVertexZChaToChaVZ(4,2,2) 
Real(dp) :: AmpSqChaToChaVZ(2,2),  AmpSqTreeChaToChaVZ(2,2) 
Real(dp) :: MRPChaToChaVZp(2,2),MRGChaToChaVZp(2,2), MRPZChaToChaVZp(2,2),MRGZChaToChaVZp(2,2) 
Real(dp) :: MVPChaToChaVZp(2,2) 
Real(dp) :: RMsqTreeChaToChaVZp(2,2),RMsqWaveChaToChaVZp(2,2),RMsqVertexChaToChaVZp(2,2) 
Complex(dp) :: AmpTreeChaToChaVZp(4,2,2),AmpWaveChaToChaVZp(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVZp(4,2,2)& 
 & ,AmpVertexIRosChaToChaVZp(4,2,2),AmpVertexIRdrChaToChaVZp(4,2,2), AmpSumChaToChaVZp(4,2,2), AmpSum2ChaToChaVZp(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVZp(4,2,2),AmpWaveZChaToChaVZp(4,2,2),AmpVertexZChaToChaVZp(4,2,2) 
Real(dp) :: AmpSqChaToChaVZp(2,2),  AmpSqTreeChaToChaVZp(2,2) 
Real(dp) :: MRPChaToChiHpm(2,7,2),MRGChaToChiHpm(2,7,2), MRPZChaToChiHpm(2,7,2),MRGZChaToChiHpm(2,7,2) 
Real(dp) :: MVPChaToChiHpm(2,7,2) 
Real(dp) :: RMsqTreeChaToChiHpm(2,7,2),RMsqWaveChaToChiHpm(2,7,2),RMsqVertexChaToChiHpm(2,7,2) 
Complex(dp) :: AmpTreeChaToChiHpm(2,2,7,2),AmpWaveChaToChiHpm(2,2,7,2)=(0._dp,0._dp),AmpVertexChaToChiHpm(2,2,7,2)& 
 & ,AmpVertexIRosChaToChiHpm(2,2,7,2),AmpVertexIRdrChaToChiHpm(2,2,7,2), AmpSumChaToChiHpm(2,2,7,2), AmpSum2ChaToChiHpm(2,2,7,2) 
Complex(dp) :: AmpTreeZChaToChiHpm(2,2,7,2),AmpWaveZChaToChiHpm(2,2,7,2),AmpVertexZChaToChiHpm(2,2,7,2) 
Real(dp) :: AmpSqChaToChiHpm(2,7,2),  AmpSqTreeChaToChiHpm(2,7,2) 
Real(dp) :: MRPChaToChiVWm(2,7),MRGChaToChiVWm(2,7), MRPZChaToChiVWm(2,7),MRGZChaToChiVWm(2,7) 
Real(dp) :: MVPChaToChiVWm(2,7) 
Real(dp) :: RMsqTreeChaToChiVWm(2,7),RMsqWaveChaToChiVWm(2,7),RMsqVertexChaToChiVWm(2,7) 
Complex(dp) :: AmpTreeChaToChiVWm(4,2,7),AmpWaveChaToChiVWm(4,2,7)=(0._dp,0._dp),AmpVertexChaToChiVWm(4,2,7)& 
 & ,AmpVertexIRosChaToChiVWm(4,2,7),AmpVertexIRdrChaToChiVWm(4,2,7), AmpSumChaToChiVWm(4,2,7), AmpSum2ChaToChiVWm(4,2,7) 
Complex(dp) :: AmpTreeZChaToChiVWm(4,2,7),AmpWaveZChaToChiVWm(4,2,7),AmpVertexZChaToChiVWm(4,2,7) 
Real(dp) :: AmpSqChaToChiVWm(2,7),  AmpSqTreeChaToChiVWm(2,7) 
Real(dp) :: MRPChaToFdcSu(2,3,6),MRGChaToFdcSu(2,3,6), MRPZChaToFdcSu(2,3,6),MRGZChaToFdcSu(2,3,6) 
Real(dp) :: MVPChaToFdcSu(2,3,6) 
Real(dp) :: RMsqTreeChaToFdcSu(2,3,6),RMsqWaveChaToFdcSu(2,3,6),RMsqVertexChaToFdcSu(2,3,6) 
Complex(dp) :: AmpTreeChaToFdcSu(2,2,3,6),AmpWaveChaToFdcSu(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFdcSu(2,2,3,6)& 
 & ,AmpVertexIRosChaToFdcSu(2,2,3,6),AmpVertexIRdrChaToFdcSu(2,2,3,6), AmpSumChaToFdcSu(2,2,3,6), AmpSum2ChaToFdcSu(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFdcSu(2,2,3,6),AmpWaveZChaToFdcSu(2,2,3,6),AmpVertexZChaToFdcSu(2,2,3,6) 
Real(dp) :: AmpSqChaToFdcSu(2,3,6),  AmpSqTreeChaToFdcSu(2,3,6) 
Real(dp) :: MRPChaToFeSvIm(2,3,6),MRGChaToFeSvIm(2,3,6), MRPZChaToFeSvIm(2,3,6),MRGZChaToFeSvIm(2,3,6) 
Real(dp) :: MVPChaToFeSvIm(2,3,6) 
Real(dp) :: RMsqTreeChaToFeSvIm(2,3,6),RMsqWaveChaToFeSvIm(2,3,6),RMsqVertexChaToFeSvIm(2,3,6) 
Complex(dp) :: AmpTreeChaToFeSvIm(2,2,3,6),AmpWaveChaToFeSvIm(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFeSvIm(2,2,3,6)& 
 & ,AmpVertexIRosChaToFeSvIm(2,2,3,6),AmpVertexIRdrChaToFeSvIm(2,2,3,6), AmpSumChaToFeSvIm(2,2,3,6), AmpSum2ChaToFeSvIm(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFeSvIm(2,2,3,6),AmpWaveZChaToFeSvIm(2,2,3,6),AmpVertexZChaToFeSvIm(2,2,3,6) 
Real(dp) :: AmpSqChaToFeSvIm(2,3,6),  AmpSqTreeChaToFeSvIm(2,3,6) 
Real(dp) :: MRPChaToFeSvRe(2,3,6),MRGChaToFeSvRe(2,3,6), MRPZChaToFeSvRe(2,3,6),MRGZChaToFeSvRe(2,3,6) 
Real(dp) :: MVPChaToFeSvRe(2,3,6) 
Real(dp) :: RMsqTreeChaToFeSvRe(2,3,6),RMsqWaveChaToFeSvRe(2,3,6),RMsqVertexChaToFeSvRe(2,3,6) 
Complex(dp) :: AmpTreeChaToFeSvRe(2,2,3,6),AmpWaveChaToFeSvRe(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFeSvRe(2,2,3,6)& 
 & ,AmpVertexIRosChaToFeSvRe(2,2,3,6),AmpVertexIRdrChaToFeSvRe(2,2,3,6), AmpSumChaToFeSvRe(2,2,3,6), AmpSum2ChaToFeSvRe(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFeSvRe(2,2,3,6),AmpWaveZChaToFeSvRe(2,2,3,6),AmpVertexZChaToFeSvRe(2,2,3,6) 
Real(dp) :: AmpSqChaToFeSvRe(2,3,6),  AmpSqTreeChaToFeSvRe(2,3,6) 
Real(dp) :: MRPChaToFvSe(2,6,6),MRGChaToFvSe(2,6,6), MRPZChaToFvSe(2,6,6),MRGZChaToFvSe(2,6,6) 
Real(dp) :: MVPChaToFvSe(2,6,6) 
Real(dp) :: RMsqTreeChaToFvSe(2,6,6),RMsqWaveChaToFvSe(2,6,6),RMsqVertexChaToFvSe(2,6,6) 
Complex(dp) :: AmpTreeChaToFvSe(2,2,6,6),AmpWaveChaToFvSe(2,2,6,6)=(0._dp,0._dp),AmpVertexChaToFvSe(2,2,6,6)& 
 & ,AmpVertexIRosChaToFvSe(2,2,6,6),AmpVertexIRdrChaToFvSe(2,2,6,6), AmpSumChaToFvSe(2,2,6,6), AmpSum2ChaToFvSe(2,2,6,6) 
Complex(dp) :: AmpTreeZChaToFvSe(2,2,6,6),AmpWaveZChaToFvSe(2,2,6,6),AmpVertexZChaToFvSe(2,2,6,6) 
Real(dp) :: AmpSqChaToFvSe(2,6,6),  AmpSqTreeChaToFvSe(2,6,6) 
Real(dp) :: MRPChaTocFuSd(2,3,6),MRGChaTocFuSd(2,3,6), MRPZChaTocFuSd(2,3,6),MRGZChaTocFuSd(2,3,6) 
Real(dp) :: MVPChaTocFuSd(2,3,6) 
Real(dp) :: RMsqTreeChaTocFuSd(2,3,6),RMsqWaveChaTocFuSd(2,3,6),RMsqVertexChaTocFuSd(2,3,6) 
Complex(dp) :: AmpTreeChaTocFuSd(2,2,3,6),AmpWaveChaTocFuSd(2,2,3,6)=(0._dp,0._dp),AmpVertexChaTocFuSd(2,2,3,6)& 
 & ,AmpVertexIRosChaTocFuSd(2,2,3,6),AmpVertexIRdrChaTocFuSd(2,2,3,6), AmpSumChaTocFuSd(2,2,3,6), AmpSum2ChaTocFuSd(2,2,3,6) 
Complex(dp) :: AmpTreeZChaTocFuSd(2,2,3,6),AmpWaveZChaTocFuSd(2,2,3,6),AmpVertexZChaTocFuSd(2,2,3,6) 
Real(dp) :: AmpSqChaTocFuSd(2,3,6),  AmpSqTreeChaTocFuSd(2,3,6) 
Real(dp) :: MRPChaToChaVP(2,2),MRGChaToChaVP(2,2), MRPZChaToChaVP(2,2),MRGZChaToChaVP(2,2) 
Real(dp) :: MVPChaToChaVP(2,2) 
Real(dp) :: RMsqTreeChaToChaVP(2,2),RMsqWaveChaToChaVP(2,2),RMsqVertexChaToChaVP(2,2) 
Complex(dp) :: AmpTreeChaToChaVP(4,2,2),AmpWaveChaToChaVP(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVP(4,2,2)& 
 & ,AmpVertexIRosChaToChaVP(4,2,2),AmpVertexIRdrChaToChaVP(4,2,2), AmpSumChaToChaVP(4,2,2), AmpSum2ChaToChaVP(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVP(4,2,2),AmpWaveZChaToChaVP(4,2,2),AmpVertexZChaToChaVP(4,2,2) 
Real(dp) :: AmpSqChaToChaVP(2,2),  AmpSqTreeChaToChaVP(2,2) 
Write(*,*) "Calculating one-loop decays of Cha " 
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
! Cha Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,MAh,MCha,            & 
& MAh2,MCha2,AmpTreeChaToChaAh)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChaAh(ZcplcChaChaAhL,ZcplcChaChaAhR,MAh,               & 
& MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,           & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,         & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,           & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,         & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL,     & 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveChaToChaAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChaAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChaAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 End if 
AmpVertexChaToChaAh = AmpVertexChaToChaAh -  AmpVertexIRdrChaToChaAh! +  AmpVertexIRosChaToChaAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,gt2,:,:) = AmpWaveZChaToChaAh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaAh(1,gt1,:,:) 
AmpVertexZChaToChaAh(1,gt2,:,:)= AmpVertexZChaToChaAh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaAh(1,gt1,:,:) 
AmpWaveZChaToChaAh(2,gt2,:,:) = AmpWaveZChaToChaAh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaAh(2,gt1,:,:) 
AmpVertexZChaToChaAh(2,gt2,:,:)= AmpVertexZChaToChaAh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 1 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,:,gt2,:) = AmpWaveZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChaAh(1,:,gt1,:) 
AmpVertexZChaToChaAh(1,:,gt2,:)= AmpVertexZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChaAh(1,:,gt1,:) 
AmpWaveZChaToChaAh(2,:,gt2,:) = AmpWaveZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaAh(2,:,gt1,:) 
AmpVertexZChaToChaAh(2,:,gt2,:)= AmpVertexZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 2 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChaToChaAh(:,:,:,gt2) = AmpWaveZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChaToChaAh(:,:,:,gt1) 
AmpVertexZChaToChaAh(:,:,:,gt2)= AmpVertexZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChaToChaAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaAh = AmpVertexChaToChaAh  +  AmpVertexIRosChaToChaAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh 
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh  
Else 
 AmpSumChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpWaveChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChaAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MAh(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,MCha,Mhh,            & 
& MCha2,Mhh2,AmpTreeChaToChahh)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChahh(ZcplcChaChahhL,ZcplcChaChahhR,MCha,              & 
& Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,           & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,         & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,           & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,         & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,ctcplcChaChahhL,     & 
& ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWaveChaToChahh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChahh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChahh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,       & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 End if 
AmpVertexChaToChahh = AmpVertexChaToChahh -  AmpVertexIRdrChaToChahh! +  AmpVertexIRosChaToChahh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,gt2,:,:) = AmpWaveZChaToChahh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChahh(1,gt1,:,:) 
AmpVertexZChaToChahh(1,gt2,:,:)= AmpVertexZChaToChahh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChahh(1,gt1,:,:) 
AmpWaveZChaToChahh(2,gt2,:,:) = AmpWaveZChaToChahh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChahh(2,gt1,:,:) 
AmpVertexZChaToChahh(2,gt2,:,:)= AmpVertexZChaToChahh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChahh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 1 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,:,gt2,:) = AmpWaveZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChahh(1,:,gt1,:) 
AmpVertexZChaToChahh(1,:,gt2,:)= AmpVertexZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChahh(1,:,gt1,:) 
AmpWaveZChaToChahh(2,:,gt2,:) = AmpWaveZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChahh(2,:,gt1,:) 
AmpVertexZChaToChahh(2,:,gt2,:)= AmpVertexZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChahh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 2 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChaToChahh(:,:,:,gt2) = AmpWaveZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChaToChahh(:,:,:,gt1) 
AmpVertexZChaToChahh(:,:,:,gt2)= AmpVertexZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChaToChahh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChahh = AmpVertexChaToChahh  +  AmpVertexIRosChaToChahh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh 
 AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh  
Else 
 AmpSumChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpWaveChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChahh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChahh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChahh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),Mhh(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,MCha,MVZ,            & 
& MCha2,MVZ2,AmpTreeChaToChaVZ)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChaVZ(ZcplcChaChaVZL,ZcplcChaChaVZR,MCha,              & 
& MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,           & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,         & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,           & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,         & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveChaToChaVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChaToChaVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChaToChaVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,cplcChaChaVZpL,              & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,              & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,   & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,           & 
& AmpVertexIRosChaToChaVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 End if 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ -  AmpVertexIRdrChaToChaVZ! +  AmpVertexIRosChaToChaVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,gt2,:) = AmpWaveZChaToChaVZ(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(1,gt1,:) 
AmpVertexZChaToChaVZ(1,gt2,:)= AmpVertexZChaToChaVZ(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(1,gt1,:) 
AmpWaveZChaToChaVZ(2,gt2,:) = AmpWaveZChaToChaVZ(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(2,gt1,:) 
AmpVertexZChaToChaVZ(2,gt2,:)= AmpVertexZChaToChaVZ(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(2,gt1,:) 
AmpWaveZChaToChaVZ(3,gt2,:) = AmpWaveZChaToChaVZ(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(3,gt1,:) 
AmpVertexZChaToChaVZ(3,gt2,:)= AmpVertexZChaToChaVZ(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(3,gt1,:) 
AmpWaveZChaToChaVZ(4,gt2,:) = AmpWaveZChaToChaVZ(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(4,gt1,:) 
AmpVertexZChaToChaVZ(4,gt2,:)= AmpVertexZChaToChaVZ(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
! Final State 1 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,:,gt2) = AmpWaveZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(1,:,gt1) 
AmpVertexZChaToChaVZ(1,:,gt2)= AmpVertexZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(1,:,gt1) 
AmpWaveZChaToChaVZ(2,:,gt2) = AmpWaveZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(2,:,gt1) 
AmpVertexZChaToChaVZ(2,:,gt2)= AmpVertexZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(2,:,gt1) 
AmpWaveZChaToChaVZ(3,:,gt2) = AmpWaveZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(3,:,gt1) 
AmpVertexZChaToChaVZ(3,:,gt2)= AmpVertexZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(3,:,gt1) 
AmpWaveZChaToChaVZ(4,:,gt2) = AmpWaveZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(4,:,gt1) 
AmpVertexZChaToChaVZ(4,:,gt2)= AmpVertexZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ  +  AmpVertexIRosChaToChaVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ 
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ  
Else 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpWaveChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZ(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZOS,helfactor*AmpSqChaToChaVZ(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZ,helfactor*AmpSqChaToChaVZ(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChaVZp(cplcChaChaVZpL,cplcChaChaVZpR,MCha,             & 
& MVZp,MCha2,MVZp2,AmpTreeChaToChaVZp)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChaVZp(ZcplcChaChaVZpL,ZcplcChaChaVZpR,MCha,           & 
& MVZp,MCha2,MVZp2,AmpTreeChaToChaVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,cplcChaChaVZpR,        & 
& MChaOS,MVZpOS,MRPChaToChaVZp,MRGChaToChaVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZp(MLambda,em,gs,ZcplcChaChaVZpL,ZcplcChaChaVZpR,      & 
& MChaOS,MVZpOS,MRPChaToChaVZp,MRGChaToChaVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,cplcChaChaVZpR,        & 
& MCha,MVZp,MRPChaToChaVZp,MRGChaToChaVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChaVZp(MLambda,em,gs,ZcplcChaChaVZpL,ZcplcChaChaVZpR,      & 
& MCha,MVZp,MRPChaToChaVZp,MRGChaToChaVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChaVZp(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,MVZp,MVZp2,ZfLm,ZfLp,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveChaToChaVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,        & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexChaToChaVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,        & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRdrChaToChaVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,ZcplcChaChaVZpL,               & 
& ZcplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,        & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,ZcplcChaChaVZpL,& 
& ZcplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,        & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,   & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,   & 
& cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZp,             & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,      & 
& AmpVertexIRosChaToChaVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,        & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

 End if 
 End if 
AmpVertexChaToChaVZp = AmpVertexChaToChaVZp -  AmpVertexIRdrChaToChaVZp! +  AmpVertexIRosChaToChaVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZp=0._dp 
AmpVertexZChaToChaVZp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZp(1,gt2,:) = AmpWaveZChaToChaVZp(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZp(1,gt1,:) 
AmpVertexZChaToChaVZp(1,gt2,:)= AmpVertexZChaToChaVZp(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZp(1,gt1,:) 
AmpWaveZChaToChaVZp(2,gt2,:) = AmpWaveZChaToChaVZp(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZp(2,gt1,:) 
AmpVertexZChaToChaVZp(2,gt2,:)= AmpVertexZChaToChaVZp(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZp(2,gt1,:) 
AmpWaveZChaToChaVZp(3,gt2,:) = AmpWaveZChaToChaVZp(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZp(3,gt1,:) 
AmpVertexZChaToChaVZp(3,gt2,:)= AmpVertexZChaToChaVZp(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZp(3,gt1,:) 
AmpWaveZChaToChaVZp(4,gt2,:) = AmpWaveZChaToChaVZp(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZp(4,gt1,:) 
AmpVertexZChaToChaVZp(4,gt2,:)= AmpVertexZChaToChaVZp(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZp=AmpWaveZChaToChaVZp 
AmpVertexChaToChaVZp= AmpVertexZChaToChaVZp
! Final State 1 
AmpWaveZChaToChaVZp=0._dp 
AmpVertexZChaToChaVZp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZp(1,:,gt2) = AmpWaveZChaToChaVZp(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZp(1,:,gt1) 
AmpVertexZChaToChaVZp(1,:,gt2)= AmpVertexZChaToChaVZp(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZp(1,:,gt1) 
AmpWaveZChaToChaVZp(2,:,gt2) = AmpWaveZChaToChaVZp(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZp(2,:,gt1) 
AmpVertexZChaToChaVZp(2,:,gt2)= AmpVertexZChaToChaVZp(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZp(2,:,gt1) 
AmpWaveZChaToChaVZp(3,:,gt2) = AmpWaveZChaToChaVZp(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZp(3,:,gt1) 
AmpVertexZChaToChaVZp(3,:,gt2)= AmpVertexZChaToChaVZp(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZp(3,:,gt1) 
AmpWaveZChaToChaVZp(4,:,gt2) = AmpWaveZChaToChaVZp(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZp(4,:,gt1) 
AmpVertexZChaToChaVZp(4,:,gt2)= AmpVertexZChaToChaVZp(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZp=AmpWaveZChaToChaVZp 
AmpVertexChaToChaVZp= AmpVertexZChaToChaVZp
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZp = AmpVertexChaToChaVZp  +  AmpVertexIRosChaToChaVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp 
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp  
Else 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp + AmpWaveChaToChaVZp + AmpVertexChaToChaVZp
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + AmpWaveChaToChaVZp + AmpVertexChaToChaVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = 2._dp*AmpWaveChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = 2._dp*AmpVertexChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqTreeChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2)  
  AmpSum2ChaToChaVZp = + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2) + AmpSqTreeChaToChaVZp(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqTreeChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2)  
  AmpSum2ChaToChaVZp = + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2) + AmpSqTreeChaToChaVZp(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZp(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZpOS,helfactor*AmpSqChaToChaVZp(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZp,helfactor*AmpSqChaToChaVZp(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZp(gt1, gt2) + MRGChaToChaVZp(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZp(gt1, gt2) + MRGChaToChaVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,MCha,             & 
& MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChiHpm(ZcplcChaChiHpmL,ZcplcChaChiHpmR,MCha,           & 
& MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,        & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,      & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,        & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,      & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,ctcplcChaChiHpmL, & 
& ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,ZfL0,ZfLm,ZfLp,AmpWaveChaToChiHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,      & 
& cplcChacFuSdR,AmpVertexChaToChiHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,      & 
& cplcChacFuSdR,AmpVertexIRdrChaToChiHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,     & 
& AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,       & 
& cplcChaFvSeR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,     & 
& AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,      & 
& cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 End if 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm -  AmpVertexIRdrChaToChiHpm! +  AmpVertexIRosChaToChiHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(1,gt2,:,:) = AmpWaveZChaToChiHpm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiHpm(1,gt1,:,:) 
AmpVertexZChaToChiHpm(1,gt2,:,:)= AmpVertexZChaToChiHpm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiHpm(1,gt1,:,:) 
AmpWaveZChaToChiHpm(2,gt2,:,:) = AmpWaveZChaToChiHpm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiHpm(2,gt1,:,:) 
AmpVertexZChaToChiHpm(2,gt2,:,:)= AmpVertexZChaToChiHpm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 1 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZChaToChiHpm(1,:,gt2,:) = AmpWaveZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChaToChiHpm(1,:,gt1,:) 
AmpVertexZChaToChiHpm(1,:,gt2,:)= AmpVertexZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChaToChiHpm(1,:,gt1,:) 
AmpWaveZChaToChiHpm(2,:,gt2,:) = AmpWaveZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiHpm(2,:,gt1,:) 
AmpVertexZChaToChiHpm(2,:,gt2,:)= AmpVertexZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 2 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(:,:,:,gt2) = AmpWaveZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChaToChiHpm(:,:,:,gt1) 
AmpVertexZChaToChiHpm(:,:,:,gt2)= AmpVertexZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChaToChiHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm  +  AmpVertexIRosChaToChiHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm 
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm  
Else 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,7
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MChi(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpWaveChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChiHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MHpm(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,MCha,             & 
& MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  Else 
Call Amplitude_Tree_BLSSM_ChaToChiVWm(ZcplcChaChiVWmL,ZcplcChaChiVWmR,MCha,           & 
& MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,        & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,      & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,        & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,      & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,ctcplcChaChiVWmL, & 
& ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,ZfLm,ZfLp,ZfVWm,AmpWaveChaToChiVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,       & 
& AmpVertexChaToChiVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,       & 
& AmpVertexIRdrChaToChiVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& GosZcplcChaChiHpmL,GosZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,          & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,  & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,   & 
& cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& GZcplcChaChiHpmL,GZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,  & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,     & 
& cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,      & 
& AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,       & 
& AmpVertexIRosChaToChiVWm)

 End if 
 End if 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm -  AmpVertexIRdrChaToChiVWm! +  AmpVertexIRosChaToChiVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiVWm(1,gt2,:) = AmpWaveZChaToChiVWm(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(1,gt1,:) 
AmpVertexZChaToChiVWm(1,gt2,:)= AmpVertexZChaToChiVWm(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(1,gt1,:) 
AmpWaveZChaToChiVWm(2,gt2,:) = AmpWaveZChaToChiVWm(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(2,gt1,:) 
AmpVertexZChaToChiVWm(2,gt2,:)= AmpVertexZChaToChiVWm(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(2,gt1,:) 
AmpWaveZChaToChiVWm(3,gt2,:) = AmpWaveZChaToChiVWm(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(3,gt1,:) 
AmpVertexZChaToChiVWm(3,gt2,:)= AmpVertexZChaToChiVWm(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(3,gt1,:) 
AmpWaveZChaToChiVWm(4,gt2,:) = AmpWaveZChaToChiVWm(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(4,gt1,:) 
AmpVertexZChaToChiVWm(4,gt2,:)= AmpVertexZChaToChiVWm(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
! Final State 1 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZChaToChiVWm(1,:,gt2) = AmpWaveZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(1,:,gt1) 
AmpVertexZChaToChiVWm(1,:,gt2)= AmpVertexZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(1,:,gt1) 
AmpWaveZChaToChiVWm(2,:,gt2) = AmpWaveZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(2,:,gt1) 
AmpVertexZChaToChiVWm(2,:,gt2)= AmpVertexZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(2,:,gt1) 
AmpWaveZChaToChiVWm(3,:,gt2) = AmpWaveZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(3,:,gt1) 
AmpVertexZChaToChiVWm(3,:,gt2)= AmpVertexZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(3,:,gt1) 
AmpWaveZChaToChiVWm(4,:,gt2) = AmpWaveZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(4,:,gt1) 
AmpVertexZChaToChiVWm(4,:,gt2)= AmpVertexZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm  +  AmpVertexIRosChaToChiVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm 
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm  
Else 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,7
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MChi(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpWaveChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
Else  
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
End if  
Else  
  AmpSqChaToChiVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiVWm(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MVWmOS,helfactor*AmpSqChaToChiVWm(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MVWm,helfactor*AmpSqChaToChiVWm(gt1, gt2))
End if 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,MCha,MFd,            & 
& MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  Else 
Call Amplitude_Tree_BLSSM_ChaToFdcSu(ZcplcChaFdcSuL,ZcplcChaFdcSuR,MCha,              & 
& MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,         & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,         & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,ctcplcChaFdcSuL,     & 
& ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,ZfLm,ZfLp,ZfSu,               & 
& AmpWaveChaToFdcSu)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexChaToFdcSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRdrChaToFdcSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ZcplcChaFdcSuL,          & 
& ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,   & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& ZcplcChaFdcSuL,ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,               & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

 End if 
 End if 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu -  AmpVertexIRdrChaToFdcSu! +  AmpVertexIRosChaToFdcSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFdcSu(1,gt2,:,:) = AmpWaveZChaToFdcSu(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFdcSu(1,gt1,:,:) 
AmpVertexZChaToFdcSu(1,gt2,:,:)= AmpVertexZChaToFdcSu(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFdcSu(1,gt1,:,:) 
AmpWaveZChaToFdcSu(2,gt2,:,:) = AmpWaveZChaToFdcSu(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFdcSu(2,gt1,:,:) 
AmpVertexZChaToFdcSu(2,gt2,:,:)= AmpVertexZChaToFdcSu(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFdcSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 1 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFdcSu(1,:,gt2,:) = AmpWaveZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChaToFdcSu(1,:,gt1,:) 
AmpVertexZChaToFdcSu(1,:,gt2,:)= AmpVertexZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChaToFdcSu(1,:,gt1,:) 
AmpWaveZChaToFdcSu(2,:,gt2,:) = AmpWaveZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChaToFdcSu(2,:,gt1,:) 
AmpVertexZChaToFdcSu(2,:,gt2,:)= AmpVertexZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChaToFdcSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 2 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFdcSu(:,:,:,gt2) = AmpWaveZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChaToFdcSu(:,:,:,gt1) 
AmpVertexZChaToFdcSu(:,:,:,gt2)= AmpVertexZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChaToFdcSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu  +  AmpVertexIRosChaToFdcSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fd conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu 
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu  
Else 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFd(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpWaveChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFdcSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFdcSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFd(gt2),MSu(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,MCha,             & 
& MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeChaToFeSvIm)

  Else 
Call Amplitude_Tree_BLSSM_ChaToFeSvIm(ZcplcChaFeSvImL,ZcplcChaFeSvImR,MCha,           & 
& MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeChaToFeSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvIm(MLambda,em,gs,cplcChaFeSvImL,cplcChaFeSvImR,        & 
& MChaOS,MFeOS,MSvImOS,MRPChaToFeSvIm,MRGChaToFeSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvIm(MLambda,em,gs,ZcplcChaFeSvImL,ZcplcChaFeSvImR,      & 
& MChaOS,MFeOS,MSvImOS,MRPChaToFeSvIm,MRGChaToFeSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToFeSvIm(MLambda,em,gs,cplcChaFeSvImL,cplcChaFeSvImR,        & 
& MCha,MFe,MSvIm,MRPChaToFeSvIm,MRGChaToFeSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvIm(MLambda,em,gs,ZcplcChaFeSvImL,ZcplcChaFeSvImR,      & 
& MCha,MFe,MSvIm,MRPChaToFeSvIm,MRGChaToFeSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,ctcplcChaFeSvImL, & 
& ctcplcChaFeSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,ZfFER,ZfLm,ZfLp,               & 
& ZfSvIm,AmpWaveChaToFeSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& AmpVertexChaToFeSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& AmpVertexIRdrChaToFeSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,cplcChaFeSvReL,   & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& AmpVertexIRosChaToFeSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& AmpVertexIRosChaToFeSvIm)

 End if 
 End if 
AmpVertexChaToFeSvIm = AmpVertexChaToFeSvIm -  AmpVertexIRdrChaToFeSvIm! +  AmpVertexIRosChaToFeSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFeSvIm(1,gt2,:,:) = AmpWaveZChaToFeSvIm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFeSvIm(1,gt1,:,:) 
AmpVertexZChaToFeSvIm(1,gt2,:,:)= AmpVertexZChaToFeSvIm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFeSvIm(1,gt1,:,:) 
AmpWaveZChaToFeSvIm(2,gt2,:,:) = AmpWaveZChaToFeSvIm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFeSvIm(2,gt1,:,:) 
AmpVertexZChaToFeSvIm(2,gt2,:,:)= AmpVertexZChaToFeSvIm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFeSvIm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
! Final State 1 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFeSvIm(1,:,gt2,:) = AmpWaveZChaToFeSvIm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChaToFeSvIm(1,:,gt1,:) 
AmpVertexZChaToFeSvIm(1,:,gt2,:)= AmpVertexZChaToFeSvIm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChaToFeSvIm(1,:,gt1,:) 
AmpWaveZChaToFeSvIm(2,:,gt2,:) = AmpWaveZChaToFeSvIm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChaToFeSvIm(2,:,gt1,:) 
AmpVertexZChaToFeSvIm(2,:,gt2,:)= AmpVertexZChaToFeSvIm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChaToFeSvIm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
! Final State 2 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFeSvIm(:,:,:,gt2) = AmpWaveZChaToFeSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveChaToFeSvIm(:,:,:,gt1) 
AmpVertexZChaToFeSvIm(:,:,:,gt2)= AmpVertexZChaToFeSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexChaToFeSvIm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFeSvIm = AmpVertexChaToFeSvIm  +  AmpVertexIRosChaToFeSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fe SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm 
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm  
Else 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm + AmpWaveChaToFeSvIm + AmpVertexChaToFeSvIm
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + AmpWaveChaToFeSvIm + AmpVertexChaToFeSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFe(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = 2._dp*AmpWaveChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = 2._dp*AmpVertexChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvIm = + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3) + AmpSqTreeChaToFeSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvIm = + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3) + AmpSqTreeChaToFeSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFeSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),helfactor*AmpSqChaToFeSvIm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFe(gt2),MSvIm(gt3),helfactor*AmpSqChaToFeSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvIm(gt1, gt2, gt3) + MRGChaToFeSvIm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvIm(gt1, gt2, gt3) + MRGChaToFeSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,MCha,             & 
& MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeChaToFeSvRe)

  Else 
Call Amplitude_Tree_BLSSM_ChaToFeSvRe(ZcplcChaFeSvReL,ZcplcChaFeSvReR,MCha,           & 
& MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeChaToFeSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvRe(MLambda,em,gs,cplcChaFeSvReL,cplcChaFeSvReR,        & 
& MChaOS,MFeOS,MSvReOS,MRPChaToFeSvRe,MRGChaToFeSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvRe(MLambda,em,gs,ZcplcChaFeSvReL,ZcplcChaFeSvReR,      & 
& MChaOS,MFeOS,MSvReOS,MRPChaToFeSvRe,MRGChaToFeSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToFeSvRe(MLambda,em,gs,cplcChaFeSvReL,cplcChaFeSvReR,        & 
& MCha,MFe,MSvRe,MRPChaToFeSvRe,MRGChaToFeSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToFeSvRe(MLambda,em,gs,ZcplcChaFeSvReL,ZcplcChaFeSvReR,      & 
& MCha,MFe,MSvRe,MRPChaToFeSvRe,MRGChaToFeSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,ctcplcChaFeSvReL, & 
& ctcplcChaFeSvReR,MCha,MCha2,MFe,MFe2,MSvRe,MSvRe2,ZfFEL,ZfFER,ZfLm,ZfLp,               & 
& ZfSvRe,AmpWaveChaToFeSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,  & 
& AmpVertexChaToFeSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,  & 
& AmpVertexIRdrChaToFeSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,      & 
& cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,ZcplcChaFeSvReL,ZcplcChaFeSvReR, & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,ZcplcChaFeSvReL,    & 
& ZcplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,          & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,  & 
& AmpVertexIRosChaToFeSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,      & 
& cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,  & 
& AmpVertexIRosChaToFeSvRe)

 End if 
 End if 
AmpVertexChaToFeSvRe = AmpVertexChaToFeSvRe -  AmpVertexIRdrChaToFeSvRe! +  AmpVertexIRosChaToFeSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFeSvRe(1,gt2,:,:) = AmpWaveZChaToFeSvRe(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFeSvRe(1,gt1,:,:) 
AmpVertexZChaToFeSvRe(1,gt2,:,:)= AmpVertexZChaToFeSvRe(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFeSvRe(1,gt1,:,:) 
AmpWaveZChaToFeSvRe(2,gt2,:,:) = AmpWaveZChaToFeSvRe(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFeSvRe(2,gt1,:,:) 
AmpVertexZChaToFeSvRe(2,gt2,:,:)= AmpVertexZChaToFeSvRe(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFeSvRe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
! Final State 1 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFeSvRe(1,:,gt2,:) = AmpWaveZChaToFeSvRe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChaToFeSvRe(1,:,gt1,:) 
AmpVertexZChaToFeSvRe(1,:,gt2,:)= AmpVertexZChaToFeSvRe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChaToFeSvRe(1,:,gt1,:) 
AmpWaveZChaToFeSvRe(2,:,gt2,:) = AmpWaveZChaToFeSvRe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChaToFeSvRe(2,:,gt1,:) 
AmpVertexZChaToFeSvRe(2,:,gt2,:)= AmpVertexZChaToFeSvRe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChaToFeSvRe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
! Final State 2 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFeSvRe(:,:,:,gt2) = AmpWaveZChaToFeSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveChaToFeSvRe(:,:,:,gt1) 
AmpVertexZChaToFeSvRe(:,:,:,gt2)= AmpVertexZChaToFeSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexChaToFeSvRe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFeSvRe = AmpVertexChaToFeSvRe  +  AmpVertexIRosChaToFeSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fe SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe 
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe  
Else 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe + AmpWaveChaToFeSvRe + AmpVertexChaToFeSvRe
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + AmpWaveChaToFeSvRe + AmpVertexChaToFeSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MSvReOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFe(gt2))+Abs(MSvRe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = 2._dp*AmpWaveChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = 2._dp*AmpVertexChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvRe = + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3) + AmpSqTreeChaToFeSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvRe = + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3) + AmpSqTreeChaToFeSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFeSvRe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),helfactor*AmpSqChaToFeSvRe(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFe(gt2),MSvRe(gt3),helfactor*AmpSqChaToFeSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvRe(gt1, gt2, gt3) + MRGChaToFeSvRe(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvRe(gt1, gt2, gt3) + MRGChaToFeSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,MCha,MFv,               & 
& MSe,MCha2,MFv2,MSe2,AmpTreeChaToFvSe)

  Else 
Call Amplitude_Tree_BLSSM_ChaToFvSe(ZcplcChaFvSeL,ZcplcChaFvSeR,MCha,MFv,             & 
& MSe,MCha2,MFv2,MSe2,AmpTreeChaToFvSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaToFvSe(MLambda,em,gs,cplcChaFvSeL,cplcChaFvSeR,              & 
& MChaOS,MFvOS,MSeOS,MRPChaToFvSe,MRGChaToFvSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaToFvSe(MLambda,em,gs,ZcplcChaFvSeL,ZcplcChaFvSeR,            & 
& MChaOS,MFvOS,MSeOS,MRPChaToFvSe,MRGChaToFvSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaToFvSe(MLambda,em,gs,cplcChaFvSeL,cplcChaFvSeR,              & 
& MCha,MFv,MSe,MRPChaToFvSe,MRGChaToFvSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaToFvSe(MLambda,em,gs,ZcplcChaFvSeL,ZcplcChaFvSeR,            & 
& MCha,MFv,MSe,MRPChaToFvSe,MRGChaToFvSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,ctcplcChaFvSeL,         & 
& ctcplcChaFvSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFvm,ZfLm,ZfLp,ZfSe,AmpWaveChaToFvSe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexChaToFvSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexIRdrChaToFvSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,           & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,cplcFeFvVWmL,        & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexIRosChaToFvSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,cplcFeFvVWmL,        & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexIRosChaToFvSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,           & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexIRosChaToFvSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,AmpVertexIRosChaToFvSe)

 End if 
 End if 
AmpVertexChaToFvSe = AmpVertexChaToFvSe -  AmpVertexIRdrChaToFvSe! +  AmpVertexIRosChaToFvSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFvSe(1,gt2,:,:) = AmpWaveZChaToFvSe(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFvSe(1,gt1,:,:) 
AmpVertexZChaToFvSe(1,gt2,:,:)= AmpVertexZChaToFvSe(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFvSe(1,gt1,:,:) 
AmpWaveZChaToFvSe(2,gt2,:,:) = AmpWaveZChaToFvSe(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFvSe(2,gt1,:,:) 
AmpVertexZChaToFvSe(2,gt2,:,:)= AmpVertexZChaToFvSe(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFvSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
! Final State 1 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFvSe(1,:,gt2,:) = AmpWaveZChaToFvSe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveChaToFvSe(1,:,gt1,:) 
AmpVertexZChaToFvSe(1,:,gt2,:)= AmpVertexZChaToFvSe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexChaToFvSe(1,:,gt1,:) 
AmpWaveZChaToFvSe(2,:,gt2,:) = AmpWaveZChaToFvSe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveChaToFvSe(2,:,gt1,:) 
AmpVertexZChaToFvSe(2,:,gt2,:)= AmpVertexZChaToFvSe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexChaToFvSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
! Final State 2 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFvSe(:,:,:,gt2) = AmpWaveZChaToFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveChaToFvSe(:,:,:,gt1) 
AmpVertexZChaToFvSe(:,:,:,gt2)= AmpVertexZChaToFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexChaToFvSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFvSe = AmpVertexChaToFvSe  +  AmpVertexIRosChaToFvSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fv Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFvSe = AmpTreeChaToFvSe 
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe  
Else 
 AmpSumChaToFvSe = AmpTreeChaToFvSe + AmpWaveChaToFvSe + AmpVertexChaToFvSe
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe + AmpWaveChaToFvSe + AmpVertexChaToFvSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFvSe = AmpTreeChaToFvSe
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFv(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = 2._dp*AmpWaveChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = 2._dp*AmpVertexChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFvSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3)  
  AmpSum2ChaToFvSe = + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3) + AmpSqTreeChaToFvSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3)  
  AmpSum2ChaToFvSe = + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3) + AmpSqTreeChaToFvSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFvSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFvSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),helfactor*AmpSqChaToFvSe(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFv(gt2),MSe(gt3),helfactor*AmpSqChaToFvSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFvSe(gt1, gt2, gt3) + MRGChaToFvSe(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFvSe(gt1, gt2, gt3) + MRGChaToFvSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,MCha,MFu,            & 
& MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  Else 
Call Amplitude_Tree_BLSSM_ChaTocFuSd(ZcplcChacFuSdL,ZcplcChacFuSdR,MCha,              & 
& MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,           & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,         & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,           & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,         & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,ctcplcChacFuSdL,     & 
& ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,ZfLm,ZfLp,ZfSd,               & 
& AmpWaveChaTocFuSd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& AmpVertexChaTocFuSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& AmpVertexIRdrChaTocFuSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,              & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ZcplcChacFuSdL,   & 
& ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplSdcSdVZp,ZcplcChacFuSdL,ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,        & 
& AmpVertexIRosChaTocFuSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,              & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& AmpVertexIRosChaTocFuSd)

 End if 
 End if 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd -  AmpVertexIRdrChaTocFuSd! +  AmpVertexIRosChaTocFuSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaTocFuSd(1,gt2,:,:) = AmpWaveZChaTocFuSd(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaTocFuSd(1,gt1,:,:) 
AmpVertexZChaTocFuSd(1,gt2,:,:)= AmpVertexZChaTocFuSd(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaTocFuSd(1,gt1,:,:) 
AmpWaveZChaTocFuSd(2,gt2,:,:) = AmpWaveZChaTocFuSd(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaTocFuSd(2,gt1,:,:) 
AmpVertexZChaTocFuSd(2,gt2,:,:)= AmpVertexZChaTocFuSd(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaTocFuSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 1 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaTocFuSd(1,:,gt2,:) = AmpWaveZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveChaTocFuSd(1,:,gt1,:) 
AmpVertexZChaTocFuSd(1,:,gt2,:)= AmpVertexZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexChaTocFuSd(1,:,gt1,:) 
AmpWaveZChaTocFuSd(2,:,gt2,:) = AmpWaveZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveChaTocFuSd(2,:,gt1,:) 
AmpVertexZChaTocFuSd(2,:,gt2,:)= AmpVertexZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexChaTocFuSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 2 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaTocFuSd(:,:,:,gt2) = AmpWaveZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveChaTocFuSd(:,:,:,gt1) 
AmpVertexZChaTocFuSd(:,:,:,gt2)= AmpVertexZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexChaTocFuSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
End if
If (ShiftIRdiv) Then 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd  +  AmpVertexIRosChaTocFuSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->bar[Fu] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd 
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd  
Else 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFu(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpWaveChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaTocFuSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaTocFuSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFu(gt2),MSd(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! Cha VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_ChaToChaVP(ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,    & 
& ZcplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,        & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MChaOS,              & 
& MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)

 Else 
Call Amplitude_WAVE_BLSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MChaOS,              & 
& MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,ZcplcChaChaAhL,     & 
& ZcplcChaChaAhR,ZcplAhhhVP,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,             & 
& ZcplChiChacVWmR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,ZcplFvChacSeR,               & 
& ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,ZcplcFeChaSvImL,             & 
& ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplcChaChaVPL,ZcplcChaChaVPR,         & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,ZcplChiChiVPL,           & 
& ZcplChiChiVPR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,         & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcChaFeSvImL,               & 
& ZcplcChaFeSvImR,ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplcFeFeVPL,ZcplcFeFeVPR,             & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplFvFvVPL,ZcplFvFvVPR,ZcplcChaFvSeL,ZcplcChaFvSeR,         & 
& ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplcChacFuSdL,         & 
& ZcplcChacFuSdR,ZcplSecSeVP,ZcplSucSuVP,ZcplSvImSvReVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,     & 
& AmpVertexChaToChaVP)

 Else 
Call Amplitude_VERTEX_BLSSM_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChiVPL,cplChiChiVPR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,         & 
& cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,     & 
& cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVP,cplSucSuVP,             & 
& cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,      & 
& cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZ,cplhhVPVZp,      & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVP,           & 
& cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVP = 0._dp 
 AmpSum2ChaToChaVP = 0._dp  
Else 
 AmpSumChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP
 AmpSum2ChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),0._dp,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVP,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
End if  
Else  
  AmpSqChaToChaVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVP(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),0._dp,helfactor*AmpSqChaToChaVP(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVP,helfactor*AmpSqChaToChaVP(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_Cha

End Module Wrapper_OneLoopDecay_Cha_BLSSM
