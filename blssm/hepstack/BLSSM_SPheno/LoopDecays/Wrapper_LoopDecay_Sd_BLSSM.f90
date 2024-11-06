! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:13 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Sd_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_Sd_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Sd(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,            & 
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

Complex(dp),Intent(in) :: cplAhAhhh(4,4,4),cplAhAhSdcSdaa(4,4,6,6),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),            & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhHpmSucSdaa(4,2,6,6),& 
& cplAhSdcHpmcSuaa(4,6,2,6),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),       & 
& cplAhSvImSvIm(4,6,6),cplAhSvReSvRe(4,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),   & 
& cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),   & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),    & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),              & 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,2),        & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,4),         & 
& cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3), & 
& cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),& 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),   & 
& cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcHpmVPVWm(2),           & 
& cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,              & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplGluGluVGL,cplGluGluVGR,cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhhhhh(4,4,4),          & 
& cplhhhhSdcSdaa(4,4,6,6),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhHpmSucSdaa(4,2,6,6),& 
& cplhhSdcHpmcSuaa(4,6,2,6),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),       & 
& cplhhSvImSvIm(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),   & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),     & 
& cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmSdcHpmcSdaa(2,6,2,6),           & 
& cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVGVPLamct3ct2ct1(6,6),          & 
& cplSdcSdVGVZLamct3ct2ct1(6,6),cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSdVP(6,6),          & 
& cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdVZ(6,6),          & 
& cplSdcSdVZp(6,6),cplSdcSdVZpVZpaa(6,6),cplSdcSdVZVZaa(6,6),cplSdcSdVZVZpaa(6,6)

Complex(dp),Intent(in) :: cplSdcSucVWm(6,6),cplSdcSucVWmVGLamct4ct2ct1(6,6),cplSdcSucVWmVPaa(6,6),               & 
& cplSdcSucVWmVZaa(6,6),cplSdcSucVWmVZpaa(6,6),cplSdSdcSdcSdabab(6,6,6,6),               & 
& cplSdSdcSdcSdabba(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSeSuSvImcSdaa(6,6,6,6),cplSeSuSvRecSdaa(6,6,6,6),cplSucSdVGVWmLamct3ct2ct1(6,6),    & 
& cplSucSdVPVWmaa(6,6),cplSucSdVWm(6,6),cplSucSdVWmVZaa(6,6),cplSucSdVWmVZpaa(6,6),      & 
& cplSucSucVWmVWmaa(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),& 
& cplVGVGVG,ctcplAhSdcSd(4,6,6),ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),             & 
& ctcplChiFdcSdL(7,3,6),ctcplChiFdcSdR(7,3,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),   & 
& ctcplhhSdcSd(4,6,6),ctcplHpmSucSd(2,6,6),ctcplSdcSdVG(6,6),ctcplSdcSdVP(6,6),          & 
& ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6),ctcplSucSdVWm(6,6),GcplcHpmVPVWm(2),              & 
& GcplHpmcVWmVP(2),GcplHpmSucSd(2,6,6),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),          & 
& GosZcplHpmSucSd(2,6,6),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplHpmSucSd(2,6,6),       & 
& ZcplAhSdcSd(4,6,6),ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplChiFdcSdL(7,3,6),     & 
& ZcplChiFdcSdR(7,3,6),ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),ZcplhhSdcSd(4,6,6),         & 
& ZcplHpmSucSd(2,6,6),ZcplSdcSdVZ(6,6),ZcplSdcSdVZp(6,6),ZcplSucSdVWm(6,6)

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
Real(dp), Intent(out) :: gP1LSd(6,102) 
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
Real(dp) :: MRPSdToSdAh(6,6,4),MRGSdToSdAh(6,6,4), MRPZSdToSdAh(6,6,4),MRGZSdToSdAh(6,6,4) 
Real(dp) :: MVPSdToSdAh(6,6,4) 
Real(dp) :: RMsqTreeSdToSdAh(6,6,4),RMsqWaveSdToSdAh(6,6,4),RMsqVertexSdToSdAh(6,6,4) 
Complex(dp) :: AmpTreeSdToSdAh(6,6,4),AmpWaveSdToSdAh(6,6,4)=(0._dp,0._dp),AmpVertexSdToSdAh(6,6,4)& 
 & ,AmpVertexIRosSdToSdAh(6,6,4),AmpVertexIRdrSdToSdAh(6,6,4), AmpSumSdToSdAh(6,6,4), AmpSum2SdToSdAh(6,6,4) 
Complex(dp) :: AmpTreeZSdToSdAh(6,6,4),AmpWaveZSdToSdAh(6,6,4),AmpVertexZSdToSdAh(6,6,4) 
Real(dp) :: AmpSqSdToSdAh(6,6,4),  AmpSqTreeSdToSdAh(6,6,4) 
Real(dp) :: MRPSdToFuCha(6,3,2),MRGSdToFuCha(6,3,2), MRPZSdToFuCha(6,3,2),MRGZSdToFuCha(6,3,2) 
Real(dp) :: MVPSdToFuCha(6,3,2) 
Real(dp) :: RMsqTreeSdToFuCha(6,3,2),RMsqWaveSdToFuCha(6,3,2),RMsqVertexSdToFuCha(6,3,2) 
Complex(dp) :: AmpTreeSdToFuCha(2,6,3,2),AmpWaveSdToFuCha(2,6,3,2)=(0._dp,0._dp),AmpVertexSdToFuCha(2,6,3,2)& 
 & ,AmpVertexIRosSdToFuCha(2,6,3,2),AmpVertexIRdrSdToFuCha(2,6,3,2), AmpSumSdToFuCha(2,6,3,2), AmpSum2SdToFuCha(2,6,3,2) 
Complex(dp) :: AmpTreeZSdToFuCha(2,6,3,2),AmpWaveZSdToFuCha(2,6,3,2),AmpVertexZSdToFuCha(2,6,3,2) 
Real(dp) :: AmpSqSdToFuCha(6,3,2),  AmpSqTreeSdToFuCha(6,3,2) 
Real(dp) :: MRPSdToFdChi(6,3,7),MRGSdToFdChi(6,3,7), MRPZSdToFdChi(6,3,7),MRGZSdToFdChi(6,3,7) 
Real(dp) :: MVPSdToFdChi(6,3,7) 
Real(dp) :: RMsqTreeSdToFdChi(6,3,7),RMsqWaveSdToFdChi(6,3,7),RMsqVertexSdToFdChi(6,3,7) 
Complex(dp) :: AmpTreeSdToFdChi(2,6,3,7),AmpWaveSdToFdChi(2,6,3,7)=(0._dp,0._dp),AmpVertexSdToFdChi(2,6,3,7)& 
 & ,AmpVertexIRosSdToFdChi(2,6,3,7),AmpVertexIRdrSdToFdChi(2,6,3,7), AmpSumSdToFdChi(2,6,3,7), AmpSum2SdToFdChi(2,6,3,7) 
Complex(dp) :: AmpTreeZSdToFdChi(2,6,3,7),AmpWaveZSdToFdChi(2,6,3,7),AmpVertexZSdToFdChi(2,6,3,7) 
Real(dp) :: AmpSqSdToFdChi(6,3,7),  AmpSqTreeSdToFdChi(6,3,7) 
Real(dp) :: MRPSdToGluFd(6,3),MRGSdToGluFd(6,3), MRPZSdToGluFd(6,3),MRGZSdToGluFd(6,3) 
Real(dp) :: MVPSdToGluFd(6,3) 
Real(dp) :: RMsqTreeSdToGluFd(6,3),RMsqWaveSdToGluFd(6,3),RMsqVertexSdToGluFd(6,3) 
Complex(dp) :: AmpTreeSdToGluFd(2,6,3),AmpWaveSdToGluFd(2,6,3)=(0._dp,0._dp),AmpVertexSdToGluFd(2,6,3)& 
 & ,AmpVertexIRosSdToGluFd(2,6,3),AmpVertexIRdrSdToGluFd(2,6,3), AmpSumSdToGluFd(2,6,3), AmpSum2SdToGluFd(2,6,3) 
Complex(dp) :: AmpTreeZSdToGluFd(2,6,3),AmpWaveZSdToGluFd(2,6,3),AmpVertexZSdToGluFd(2,6,3) 
Real(dp) :: AmpSqSdToGluFd(6,3),  AmpSqTreeSdToGluFd(6,3) 
Real(dp) :: MRPSdToSdhh(6,6,4),MRGSdToSdhh(6,6,4), MRPZSdToSdhh(6,6,4),MRGZSdToSdhh(6,6,4) 
Real(dp) :: MVPSdToSdhh(6,6,4) 
Real(dp) :: RMsqTreeSdToSdhh(6,6,4),RMsqWaveSdToSdhh(6,6,4),RMsqVertexSdToSdhh(6,6,4) 
Complex(dp) :: AmpTreeSdToSdhh(6,6,4),AmpWaveSdToSdhh(6,6,4)=(0._dp,0._dp),AmpVertexSdToSdhh(6,6,4)& 
 & ,AmpVertexIRosSdToSdhh(6,6,4),AmpVertexIRdrSdToSdhh(6,6,4), AmpSumSdToSdhh(6,6,4), AmpSum2SdToSdhh(6,6,4) 
Complex(dp) :: AmpTreeZSdToSdhh(6,6,4),AmpWaveZSdToSdhh(6,6,4),AmpVertexZSdToSdhh(6,6,4) 
Real(dp) :: AmpSqSdToSdhh(6,6,4),  AmpSqTreeSdToSdhh(6,6,4) 
Real(dp) :: MRPSdToSuHpm(6,6,2),MRGSdToSuHpm(6,6,2), MRPZSdToSuHpm(6,6,2),MRGZSdToSuHpm(6,6,2) 
Real(dp) :: MVPSdToSuHpm(6,6,2) 
Real(dp) :: RMsqTreeSdToSuHpm(6,6,2),RMsqWaveSdToSuHpm(6,6,2),RMsqVertexSdToSuHpm(6,6,2) 
Complex(dp) :: AmpTreeSdToSuHpm(6,6,2),AmpWaveSdToSuHpm(6,6,2)=(0._dp,0._dp),AmpVertexSdToSuHpm(6,6,2)& 
 & ,AmpVertexIRosSdToSuHpm(6,6,2),AmpVertexIRdrSdToSuHpm(6,6,2), AmpSumSdToSuHpm(6,6,2), AmpSum2SdToSuHpm(6,6,2) 
Complex(dp) :: AmpTreeZSdToSuHpm(6,6,2),AmpWaveZSdToSuHpm(6,6,2),AmpVertexZSdToSuHpm(6,6,2) 
Real(dp) :: AmpSqSdToSuHpm(6,6,2),  AmpSqTreeSdToSuHpm(6,6,2) 
Real(dp) :: MRPSdToSdVZ(6,6),MRGSdToSdVZ(6,6), MRPZSdToSdVZ(6,6),MRGZSdToSdVZ(6,6) 
Real(dp) :: MVPSdToSdVZ(6,6) 
Real(dp) :: RMsqTreeSdToSdVZ(6,6),RMsqWaveSdToSdVZ(6,6),RMsqVertexSdToSdVZ(6,6) 
Complex(dp) :: AmpTreeSdToSdVZ(2,6,6),AmpWaveSdToSdVZ(2,6,6)=(0._dp,0._dp),AmpVertexSdToSdVZ(2,6,6)& 
 & ,AmpVertexIRosSdToSdVZ(2,6,6),AmpVertexIRdrSdToSdVZ(2,6,6), AmpSumSdToSdVZ(2,6,6), AmpSum2SdToSdVZ(2,6,6) 
Complex(dp) :: AmpTreeZSdToSdVZ(2,6,6),AmpWaveZSdToSdVZ(2,6,6),AmpVertexZSdToSdVZ(2,6,6) 
Real(dp) :: AmpSqSdToSdVZ(6,6),  AmpSqTreeSdToSdVZ(6,6) 
Real(dp) :: MRPSdToSdVZp(6,6),MRGSdToSdVZp(6,6), MRPZSdToSdVZp(6,6),MRGZSdToSdVZp(6,6) 
Real(dp) :: MVPSdToSdVZp(6,6) 
Real(dp) :: RMsqTreeSdToSdVZp(6,6),RMsqWaveSdToSdVZp(6,6),RMsqVertexSdToSdVZp(6,6) 
Complex(dp) :: AmpTreeSdToSdVZp(2,6,6),AmpWaveSdToSdVZp(2,6,6)=(0._dp,0._dp),AmpVertexSdToSdVZp(2,6,6)& 
 & ,AmpVertexIRosSdToSdVZp(2,6,6),AmpVertexIRdrSdToSdVZp(2,6,6), AmpSumSdToSdVZp(2,6,6), AmpSum2SdToSdVZp(2,6,6) 
Complex(dp) :: AmpTreeZSdToSdVZp(2,6,6),AmpWaveZSdToSdVZp(2,6,6),AmpVertexZSdToSdVZp(2,6,6) 
Real(dp) :: AmpSqSdToSdVZp(6,6),  AmpSqTreeSdToSdVZp(6,6) 
Real(dp) :: MRPSdToSuVWm(6,6),MRGSdToSuVWm(6,6), MRPZSdToSuVWm(6,6),MRGZSdToSuVWm(6,6) 
Real(dp) :: MVPSdToSuVWm(6,6) 
Real(dp) :: RMsqTreeSdToSuVWm(6,6),RMsqWaveSdToSuVWm(6,6),RMsqVertexSdToSuVWm(6,6) 
Complex(dp) :: AmpTreeSdToSuVWm(2,6,6),AmpWaveSdToSuVWm(2,6,6)=(0._dp,0._dp),AmpVertexSdToSuVWm(2,6,6)& 
 & ,AmpVertexIRosSdToSuVWm(2,6,6),AmpVertexIRdrSdToSuVWm(2,6,6), AmpSumSdToSuVWm(2,6,6), AmpSum2SdToSuVWm(2,6,6) 
Complex(dp) :: AmpTreeZSdToSuVWm(2,6,6),AmpWaveZSdToSuVWm(2,6,6),AmpVertexZSdToSuVWm(2,6,6) 
Real(dp) :: AmpSqSdToSuVWm(6,6),  AmpSqTreeSdToSuVWm(6,6) 
Real(dp) :: MRPSdToSdVG(6,6),MRGSdToSdVG(6,6), MRPZSdToSdVG(6,6),MRGZSdToSdVG(6,6) 
Real(dp) :: MVPSdToSdVG(6,6) 
Real(dp) :: RMsqTreeSdToSdVG(6,6),RMsqWaveSdToSdVG(6,6),RMsqVertexSdToSdVG(6,6) 
Complex(dp) :: AmpTreeSdToSdVG(2,6,6),AmpWaveSdToSdVG(2,6,6)=(0._dp,0._dp),AmpVertexSdToSdVG(2,6,6)& 
 & ,AmpVertexIRosSdToSdVG(2,6,6),AmpVertexIRdrSdToSdVG(2,6,6), AmpSumSdToSdVG(2,6,6), AmpSum2SdToSdVG(2,6,6) 
Complex(dp) :: AmpTreeZSdToSdVG(2,6,6),AmpWaveZSdToSdVG(2,6,6),AmpVertexZSdToSdVG(2,6,6) 
Real(dp) :: AmpSqSdToSdVG(6,6),  AmpSqTreeSdToSdVG(6,6) 
Real(dp) :: MRPSdToSdVP(6,6),MRGSdToSdVP(6,6), MRPZSdToSdVP(6,6),MRGZSdToSdVP(6,6) 
Real(dp) :: MVPSdToSdVP(6,6) 
Real(dp) :: RMsqTreeSdToSdVP(6,6),RMsqWaveSdToSdVP(6,6),RMsqVertexSdToSdVP(6,6) 
Complex(dp) :: AmpTreeSdToSdVP(2,6,6),AmpWaveSdToSdVP(2,6,6)=(0._dp,0._dp),AmpVertexSdToSdVP(2,6,6)& 
 & ,AmpVertexIRosSdToSdVP(2,6,6),AmpVertexIRdrSdToSdVP(2,6,6), AmpSumSdToSdVP(2,6,6), AmpSum2SdToSdVP(2,6,6) 
Complex(dp) :: AmpTreeZSdToSdVP(2,6,6),AmpWaveZSdToSdVP(2,6,6),AmpVertexZSdToSdVP(2,6,6) 
Real(dp) :: AmpSqSdToSdVP(6,6),  AmpSqTreeSdToSdVP(6,6) 
Write(*,*) "Calculating one-loop decays of Sd " 
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
! Sd Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSdAh(cplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeSdToSdAh)

  Else 
Call Amplitude_Tree_BLSSM_SdToSdAh(ZcplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeSdToSdAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSdAh(MLambda,em,gs,cplAhSdcSd,MAhOS,MSdOS,MRPSdToSdAh,      & 
& MRGSdToSdAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSdAh(MLambda,em,gs,ZcplAhSdcSd,MAhOS,MSdOS,MRPSdToSdAh,     & 
& MRGSdToSdAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSdAh(MLambda,em,gs,cplAhSdcSd,MAh,MSd,MRPSdToSdAh,          & 
& MRGSdToSdAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSdAh(MLambda,em,gs,ZcplAhSdcSd,MAh,MSd,MRPSdToSdAh,         & 
& MRGSdToSdAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdAh(cplAhSdcSd,ctcplAhSdcSd,MAh,MAh2,MSd,              & 
& MSd2,ZfAh,ZfSd,AmpWaveSdToSdAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexSdToSdAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRdrSdToSdAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& ZcplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,            & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosSdToSdAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,ZcplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosSdToSdAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosSdToSdAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosSdToSdAh)

 End if 
 End if 
AmpVertexSdToSdAh = AmpVertexSdToSdAh -  AmpVertexIRdrSdToSdAh! +  AmpVertexIRosSdToSdAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSdAh=0._dp 
AmpVertexZSdToSdAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdAh(gt2,:,:) = AmpWaveZSdToSdAh(gt2,:,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSdAh(gt1,:,:) 
AmpVertexZSdToSdAh(gt2,:,:)= AmpVertexZSdToSdAh(gt2,:,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSdAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSdToSdAh=AmpWaveZSdToSdAh 
AmpVertexSdToSdAh= AmpVertexZSdToSdAh
! Final State 1 
AmpWaveZSdToSdAh=0._dp 
AmpVertexZSdToSdAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdAh(:,gt2,:) = AmpWaveZSdToSdAh(:,gt2,:)+ZRUZD(gt2,gt1)*AmpWaveSdToSdAh(:,gt1,:) 
AmpVertexZSdToSdAh(:,gt2,:)= AmpVertexZSdToSdAh(:,gt2,:)+ZRUZD(gt2,gt1)*AmpVertexSdToSdAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSdAh=AmpWaveZSdToSdAh 
AmpVertexSdToSdAh= AmpVertexZSdToSdAh
! Final State 2 
AmpWaveZSdToSdAh=0._dp 
AmpVertexZSdToSdAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSdToSdAh(:,:,gt2) = AmpWaveZSdToSdAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSdToSdAh(:,:,gt1) 
AmpVertexZSdToSdAh(:,:,gt2)= AmpVertexZSdToSdAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSdToSdAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSdAh=AmpWaveZSdToSdAh 
AmpVertexSdToSdAh= AmpVertexZSdToSdAh
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSdAh = AmpVertexSdToSdAh  +  AmpVertexIRosSdToSdAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSdAh = AmpTreeSdToSdAh 
 AmpSum2SdToSdAh = AmpTreeSdToSdAh + 2._dp*AmpWaveSdToSdAh + 2._dp*AmpVertexSdToSdAh  
Else 
 AmpSumSdToSdAh = AmpTreeSdToSdAh + AmpWaveSdToSdAh + AmpVertexSdToSdAh
 AmpSum2SdToSdAh = AmpTreeSdToSdAh + AmpWaveSdToSdAh + AmpVertexSdToSdAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdAh = AmpTreeSdToSdAh
 AmpSum2SdToSdAh = AmpTreeSdToSdAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SdToSdAh = AmpTreeSdToSdAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSdAh(gt1, gt2, gt3) 
  AmpSum2SdToSdAh = 2._dp*AmpWaveSdToSdAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSdAh(gt1, gt2, gt3) 
  AmpSum2SdToSdAh = 2._dp*AmpVertexSdToSdAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSdAh(gt1, gt2, gt3) 
  AmpSum2SdToSdAh = AmpTreeSdToSdAh + 2._dp*AmpWaveSdToSdAh + 2._dp*AmpVertexSdToSdAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSdAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSdAh = AmpTreeSdToSdAh
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
  AmpSqTreeSdToSdAh(gt1, gt2, gt3) = AmpSqSdToSdAh(gt1, gt2, gt3)  
  AmpSum2SdToSdAh = + 2._dp*AmpWaveSdToSdAh + 2._dp*AmpVertexSdToSdAh
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
  AmpSqSdToSdAh(gt1, gt2, gt3) = AmpSqSdToSdAh(gt1, gt2, gt3) + AmpSqTreeSdToSdAh(gt1, gt2, gt3)  
Else  
  AmpSum2SdToSdAh = AmpTreeSdToSdAh
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
  AmpSqTreeSdToSdAh(gt1, gt2, gt3) = AmpSqSdToSdAh(gt1, gt2, gt3)  
  AmpSum2SdToSdAh = + 2._dp*AmpWaveSdToSdAh + 2._dp*AmpVertexSdToSdAh
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),MAh(gt3),AmpSumSdToSdAh(gt1, gt2, gt3),AmpSum2SdToSdAh(gt1, gt2, gt3),AmpSqSdToSdAh(gt1, gt2, gt3)) 
  AmpSqSdToSdAh(gt1, gt2, gt3) = AmpSqSdToSdAh(gt1, gt2, gt3) + AmpSqTreeSdToSdAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSdToSdAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),MAhOS(gt3),helfactor*AmpSqSdToSdAh(gt1, gt2, gt3))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSd(gt2),MAh(gt3),helfactor*AmpSqSdToSdAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSdToSdAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSdAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToSdAh(gt1, gt2, gt3) + MRGSdToSdAh(gt1, gt2, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToSdAh(gt1, gt2, gt3) + MRGSdToSdAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Fu Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToFuCha(cplChaFucSdL,cplChaFucSdR,MCha,MFu,               & 
& MSd,MCha2,MFu2,MSd2,AmpTreeSdToFuCha)

  Else 
Call Amplitude_Tree_BLSSM_SdToFuCha(ZcplChaFucSdL,ZcplChaFucSdR,MCha,MFu,             & 
& MSd,MCha2,MFu2,MSd2,AmpTreeSdToFuCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToFuCha(MLambda,em,gs,cplChaFucSdL,cplChaFucSdR,              & 
& MChaOS,MFuOS,MSdOS,MRPSdToFuCha,MRGSdToFuCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToFuCha(MLambda,em,gs,ZcplChaFucSdL,ZcplChaFucSdR,            & 
& MChaOS,MFuOS,MSdOS,MRPSdToFuCha,MRGSdToFuCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToFuCha(MLambda,em,gs,cplChaFucSdL,cplChaFucSdR,              & 
& MCha,MFu,MSd,MRPSdToFuCha,MRGSdToFuCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToFuCha(MLambda,em,gs,ZcplChaFucSdL,ZcplChaFucSdR,            & 
& MCha,MFu,MSd,MRPSdToFuCha,MRGSdToFuCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToFuCha(cplChaFucSdL,cplChaFucSdR,ctcplChaFucSdL,         & 
& ctcplChaFucSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,ZfLm,ZfLp,ZfSd,AmpWaveSdToFuCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexSdToFuCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRdrSdToFuCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,ZcplChaFucSdL,             & 
& ZcplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,     & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFuCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& ZcplChaFucSdL,ZcplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFuCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFuCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,cplHpmSucSd,              & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFuCha)

 End if 
 End if 
AmpVertexSdToFuCha = AmpVertexSdToFuCha -  AmpVertexIRdrSdToFuCha! +  AmpVertexIRosSdToFuCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToFuCha=0._dp 
AmpVertexZSdToFuCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToFuCha(:,gt2,:,:) = AmpWaveZSdToFuCha(:,gt2,:,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToFuCha(:,gt1,:,:) 
AmpVertexZSdToFuCha(:,gt2,:,:)= AmpVertexZSdToFuCha(:,gt2,:,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToFuCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSdToFuCha=AmpWaveZSdToFuCha 
AmpVertexSdToFuCha= AmpVertexZSdToFuCha
! Final State 1 
AmpWaveZSdToFuCha=0._dp 
AmpVertexZSdToFuCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSdToFuCha(1,:,gt2,:) = AmpWaveZSdToFuCha(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpWaveSdToFuCha(1,:,gt1,:) 
AmpVertexZSdToFuCha(1,:,gt2,:)= AmpVertexZSdToFuCha(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpVertexSdToFuCha(1,:,gt1,:) 
AmpWaveZSdToFuCha(2,:,gt2,:) = AmpWaveZSdToFuCha(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpWaveSdToFuCha(2,:,gt1,:) 
AmpVertexZSdToFuCha(2,:,gt2,:)= AmpVertexZSdToFuCha(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpVertexSdToFuCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToFuCha=AmpWaveZSdToFuCha 
AmpVertexSdToFuCha= AmpVertexZSdToFuCha
! Final State 2 
AmpWaveZSdToFuCha=0._dp 
AmpVertexZSdToFuCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSdToFuCha(1,:,:,gt2) = AmpWaveZSdToFuCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSdToFuCha(1,:,:,gt1) 
AmpVertexZSdToFuCha(1,:,:,gt2)= AmpVertexZSdToFuCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSdToFuCha(1,:,:,gt1) 
AmpWaveZSdToFuCha(2,:,:,gt2) = AmpWaveZSdToFuCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSdToFuCha(2,:,:,gt1) 
AmpVertexZSdToFuCha(2,:,:,gt2)= AmpVertexZSdToFuCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSdToFuCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToFuCha=AmpWaveZSdToFuCha 
AmpVertexSdToFuCha= AmpVertexZSdToFuCha
End if
If (ShiftIRdiv) Then 
AmpVertexSdToFuCha = AmpVertexSdToFuCha  +  AmpVertexIRosSdToFuCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Fu Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToFuCha = AmpTreeSdToFuCha 
 AmpSum2SdToFuCha = AmpTreeSdToFuCha + 2._dp*AmpWaveSdToFuCha + 2._dp*AmpVertexSdToFuCha  
Else 
 AmpSumSdToFuCha = AmpTreeSdToFuCha + AmpWaveSdToFuCha + AmpVertexSdToFuCha
 AmpSum2SdToFuCha = AmpTreeSdToFuCha + AmpWaveSdToFuCha + AmpVertexSdToFuCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToFuCha = AmpTreeSdToFuCha
 AmpSum2SdToFuCha = AmpTreeSdToFuCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MFu(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SdToFuCha = AmpTreeSdToFuCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToFuCha(gt1, gt2, gt3) 
  AmpSum2SdToFuCha = 2._dp*AmpWaveSdToFuCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToFuCha(gt1, gt2, gt3) 
  AmpSum2SdToFuCha = 2._dp*AmpVertexSdToFuCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToFuCha(gt1, gt2, gt3) 
  AmpSum2SdToFuCha = AmpTreeSdToFuCha + 2._dp*AmpWaveSdToFuCha + 2._dp*AmpVertexSdToFuCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToFuCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToFuCha = AmpTreeSdToFuCha
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
  AmpSqTreeSdToFuCha(gt1, gt2, gt3) = AmpSqSdToFuCha(gt1, gt2, gt3)  
  AmpSum2SdToFuCha = + 2._dp*AmpWaveSdToFuCha + 2._dp*AmpVertexSdToFuCha
  Call SquareAmp_StoFF(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
  AmpSqSdToFuCha(gt1, gt2, gt3) = AmpSqSdToFuCha(gt1, gt2, gt3) + AmpSqTreeSdToFuCha(gt1, gt2, gt3)  
Else  
  AmpSum2SdToFuCha = AmpTreeSdToFuCha
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
  AmpSqTreeSdToFuCha(gt1, gt2, gt3) = AmpSqSdToFuCha(gt1, gt2, gt3)  
  AmpSum2SdToFuCha = + 2._dp*AmpWaveSdToFuCha + 2._dp*AmpVertexSdToFuCha
  Call SquareAmp_StoFF(MSd(gt1),MFu(gt2),MCha(gt3),AmpSumSdToFuCha(:,gt1, gt2, gt3),AmpSum2SdToFuCha(:,gt1, gt2, gt3),AmpSqSdToFuCha(gt1, gt2, gt3)) 
  AmpSqSdToFuCha(gt1, gt2, gt3) = AmpSqSdToFuCha(gt1, gt2, gt3) + AmpSqTreeSdToFuCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSdToFuCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSdToFuCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MFuOS(gt2),MChaOS(gt3),helfactor*AmpSqSdToFuCha(gt1, gt2, gt3))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MFu(gt2),MCha(gt3),helfactor*AmpSqSdToFuCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSdToFuCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToFuCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToFuCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToFuCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToFuCha(gt1, gt2, gt3) + MRGSdToFuCha(gt1, gt2, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToFuCha(gt1, gt2, gt3) + MRGSdToFuCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Fd Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToFdChi(cplChiFdcSdL,cplChiFdcSdR,MChi,MFd,               & 
& MSd,MChi2,MFd2,MSd2,AmpTreeSdToFdChi)

  Else 
Call Amplitude_Tree_BLSSM_SdToFdChi(ZcplChiFdcSdL,ZcplChiFdcSdR,MChi,MFd,             & 
& MSd,MChi2,MFd2,MSd2,AmpTreeSdToFdChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToFdChi(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,              & 
& MChiOS,MFdOS,MSdOS,MRPSdToFdChi,MRGSdToFdChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToFdChi(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,            & 
& MChiOS,MFdOS,MSdOS,MRPSdToFdChi,MRGSdToFdChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToFdChi(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,              & 
& MChi,MFd,MSd,MRPSdToFdChi,MRGSdToFdChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToFdChi(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,            & 
& MChi,MFd,MSd,MRPSdToFdChi,MRGSdToFdChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToFdChi(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL,         & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,AmpWaveSdToFdChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexSdToFdChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRdrSdToFdChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,     & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,           & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFdChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFdcSdL,ZcplChiFdcSdR,     & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFdChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,           & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFdChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToFdChi)

 End if 
 End if 
AmpVertexSdToFdChi = AmpVertexSdToFdChi -  AmpVertexIRdrSdToFdChi! +  AmpVertexIRosSdToFdChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToFdChi=0._dp 
AmpVertexZSdToFdChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToFdChi(:,gt2,:,:) = AmpWaveZSdToFdChi(:,gt2,:,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToFdChi(:,gt1,:,:) 
AmpVertexZSdToFdChi(:,gt2,:,:)= AmpVertexZSdToFdChi(:,gt2,:,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToFdChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSdToFdChi=AmpWaveZSdToFdChi 
AmpVertexSdToFdChi= AmpVertexZSdToFdChi
! Final State 1 
AmpWaveZSdToFdChi=0._dp 
AmpVertexZSdToFdChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSdToFdChi(1,:,gt2,:) = AmpWaveZSdToFdChi(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveSdToFdChi(1,:,gt1,:) 
AmpVertexZSdToFdChi(1,:,gt2,:)= AmpVertexZSdToFdChi(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexSdToFdChi(1,:,gt1,:) 
AmpWaveZSdToFdChi(2,:,gt2,:) = AmpWaveZSdToFdChi(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveSdToFdChi(2,:,gt1,:) 
AmpVertexZSdToFdChi(2,:,gt2,:)= AmpVertexZSdToFdChi(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexSdToFdChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToFdChi=AmpWaveZSdToFdChi 
AmpVertexSdToFdChi= AmpVertexZSdToFdChi
! Final State 2 
AmpWaveZSdToFdChi=0._dp 
AmpVertexZSdToFdChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZSdToFdChi(1,:,:,gt2) = AmpWaveZSdToFdChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSdToFdChi(1,:,:,gt1) 
AmpVertexZSdToFdChi(1,:,:,gt2)= AmpVertexZSdToFdChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSdToFdChi(1,:,:,gt1) 
AmpWaveZSdToFdChi(2,:,:,gt2) = AmpWaveZSdToFdChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSdToFdChi(2,:,:,gt1) 
AmpVertexZSdToFdChi(2,:,:,gt2)= AmpVertexZSdToFdChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSdToFdChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToFdChi=AmpWaveZSdToFdChi 
AmpVertexSdToFdChi= AmpVertexZSdToFdChi
End if
If (ShiftIRdiv) Then 
AmpVertexSdToFdChi = AmpVertexSdToFdChi  +  AmpVertexIRosSdToFdChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Fd Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToFdChi = AmpTreeSdToFdChi 
 AmpSum2SdToFdChi = AmpTreeSdToFdChi + 2._dp*AmpWaveSdToFdChi + 2._dp*AmpVertexSdToFdChi  
Else 
 AmpSumSdToFdChi = AmpTreeSdToFdChi + AmpWaveSdToFdChi + AmpVertexSdToFdChi
 AmpSum2SdToFdChi = AmpTreeSdToFdChi + AmpWaveSdToFdChi + AmpVertexSdToFdChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToFdChi = AmpTreeSdToFdChi
 AmpSum2SdToFdChi = AmpTreeSdToFdChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,7
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MFd(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SdToFdChi = AmpTreeSdToFdChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToFdChi(gt1, gt2, gt3) 
  AmpSum2SdToFdChi = 2._dp*AmpWaveSdToFdChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToFdChi(gt1, gt2, gt3) 
  AmpSum2SdToFdChi = 2._dp*AmpVertexSdToFdChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToFdChi(gt1, gt2, gt3) 
  AmpSum2SdToFdChi = AmpTreeSdToFdChi + 2._dp*AmpWaveSdToFdChi + 2._dp*AmpVertexSdToFdChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToFdChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToFdChi = AmpTreeSdToFdChi
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
  AmpSqTreeSdToFdChi(gt1, gt2, gt3) = AmpSqSdToFdChi(gt1, gt2, gt3)  
  AmpSum2SdToFdChi = + 2._dp*AmpWaveSdToFdChi + 2._dp*AmpVertexSdToFdChi
  Call SquareAmp_StoFF(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
  AmpSqSdToFdChi(gt1, gt2, gt3) = AmpSqSdToFdChi(gt1, gt2, gt3) + AmpSqTreeSdToFdChi(gt1, gt2, gt3)  
Else  
  AmpSum2SdToFdChi = AmpTreeSdToFdChi
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
  AmpSqTreeSdToFdChi(gt1, gt2, gt3) = AmpSqSdToFdChi(gt1, gt2, gt3)  
  AmpSum2SdToFdChi = + 2._dp*AmpWaveSdToFdChi + 2._dp*AmpVertexSdToFdChi
  Call SquareAmp_StoFF(MSd(gt1),MFd(gt2),MChi(gt3),AmpSumSdToFdChi(:,gt1, gt2, gt3),AmpSum2SdToFdChi(:,gt1, gt2, gt3),AmpSqSdToFdChi(gt1, gt2, gt3)) 
  AmpSqSdToFdChi(gt1, gt2, gt3) = AmpSqSdToFdChi(gt1, gt2, gt3) + AmpSqTreeSdToFdChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSdToFdChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSdToFdChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MFdOS(gt2),MChiOS(gt3),helfactor*AmpSqSdToFdChi(gt1, gt2, gt3))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MFd(gt2),MChi(gt3),helfactor*AmpSqSdToFdChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSdToFdChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToFdChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToFdChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToFdChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToFdChi(gt1, gt2, gt3) + MRGSdToFdChi(gt1, gt2, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToFdChi(gt1, gt2, gt3) + MRGSdToFdChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Glu Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToGluFd(cplGluFdcSdL,cplGluFdcSdR,MFd,MGlu,               & 
& MSd,MFd2,MGlu2,MSd2,AmpTreeSdToGluFd)

  Else 
Call Amplitude_Tree_BLSSM_SdToGluFd(ZcplGluFdcSdL,ZcplGluFdcSdR,MFd,MGlu,             & 
& MSd,MFd2,MGlu2,MSd2,AmpTreeSdToGluFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToGluFd(MLambda,em,gs,cplGluFdcSdL,cplGluFdcSdR,              & 
& MFdOS,MGluOS,MSdOS,MRPSdToGluFd,MRGSdToGluFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToGluFd(MLambda,em,gs,ZcplGluFdcSdL,ZcplGluFdcSdR,            & 
& MFdOS,MGluOS,MSdOS,MRPSdToGluFd,MRGSdToGluFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToGluFd(MLambda,em,gs,cplGluFdcSdL,cplGluFdcSdR,              & 
& MFd,MGlu,MSd,MRPSdToGluFd,MRGSdToGluFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToGluFd(MLambda,em,gs,ZcplGluFdcSdL,ZcplGluFdcSdR,            & 
& MFd,MGlu,MSd,MRPSdToGluFd,MRGSdToGluFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToGluFd(cplGluFdcSdL,cplGluFdcSdR,ctcplGluFdcSdL,         & 
& ctcplGluFdcSdR,MFd,MFd2,MGlu,MGlu2,MSd,MSd2,ZfFDL,ZfFDR,ZffG,ZfSd,AmpWaveSdToGluFd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,               & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,       & 
& AmpVertexSdToGluFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,         & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,       & 
& AmpVertexIRdrSdToGluFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,           & 
& cplChiFdcSdL,cplChiFdcSdR,ZcplGluFdcSdL,ZcplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,       & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToGluFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,         & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,ZcplGluFdcSdL,ZcplGluFdcSdR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,       & 
& AmpVertexIRosSdToGluFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,           & 
& cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,       & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosSdToGluFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,         & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,       & 
& AmpVertexIRosSdToGluFd)

 End if 
 End if 
AmpVertexSdToGluFd = AmpVertexSdToGluFd -  AmpVertexIRdrSdToGluFd! +  AmpVertexIRosSdToGluFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToGluFd=0._dp 
AmpVertexZSdToGluFd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToGluFd(:,gt2,:) = AmpWaveZSdToGluFd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToGluFd(:,gt1,:) 
AmpVertexZSdToGluFd(:,gt2,:)= AmpVertexZSdToGluFd(:,gt2,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToGluFd(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToGluFd=AmpWaveZSdToGluFd 
AmpVertexSdToGluFd= AmpVertexZSdToGluFd
! Final State 2 
AmpWaveZSdToGluFd=0._dp 
AmpVertexZSdToGluFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSdToGluFd(1,:,gt2) = AmpWaveZSdToGluFd(1,:,gt2)+ZRUZDL(gt2,gt1)*AmpWaveSdToGluFd(1,:,gt1) 
AmpVertexZSdToGluFd(1,:,gt2)= AmpVertexZSdToGluFd(1,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexSdToGluFd(1,:,gt1) 
AmpWaveZSdToGluFd(2,:,gt2) = AmpWaveZSdToGluFd(2,:,gt2)+ZRUZDR(gt2,gt1)*AmpWaveSdToGluFd(2,:,gt1) 
AmpVertexZSdToGluFd(2,:,gt2)= AmpVertexZSdToGluFd(2,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexSdToGluFd(2,:,gt1) 
 End Do 
End Do 
AmpWaveSdToGluFd=AmpWaveZSdToGluFd 
AmpVertexSdToGluFd= AmpVertexZSdToGluFd
End if
If (ShiftIRdiv) Then 
AmpVertexSdToGluFd = AmpVertexSdToGluFd  +  AmpVertexIRosSdToGluFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Glu Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToGluFd = AmpTreeSdToGluFd 
 AmpSum2SdToGluFd = AmpTreeSdToGluFd + 2._dp*AmpWaveSdToGluFd + 2._dp*AmpVertexSdToGluFd  
Else 
 AmpSumSdToGluFd = AmpTreeSdToGluFd + AmpWaveSdToGluFd + AmpVertexSdToGluFd
 AmpSum2SdToGluFd = AmpTreeSdToGluFd + AmpWaveSdToGluFd + AmpVertexSdToGluFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToGluFd = AmpTreeSdToGluFd
 AmpSum2SdToGluFd = AmpTreeSdToGluFd 
End if 
Do gt1=1,6
i4 = isave 
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MGluOS)+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MGlu)+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt3 
  AmpSum2SdToGluFd = AmpTreeSdToGluFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToGluFd(gt1, gt3) 
  AmpSum2SdToGluFd = 2._dp*AmpWaveSdToGluFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToGluFd(gt1, gt3) 
  AmpSum2SdToGluFd = 2._dp*AmpVertexSdToGluFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToGluFd(gt1, gt3) 
  AmpSum2SdToGluFd = AmpTreeSdToGluFd + 2._dp*AmpWaveSdToGluFd + 2._dp*AmpVertexSdToGluFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
Else  
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToGluFd(gt1, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToGluFd = AmpTreeSdToGluFd
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
  AmpSqTreeSdToGluFd(gt1, gt3) = AmpSqSdToGluFd(gt1, gt3)  
  AmpSum2SdToGluFd = + 2._dp*AmpWaveSdToGluFd + 2._dp*AmpVertexSdToGluFd
  Call SquareAmp_StoFF(MSdOS(gt1),MGluOS,MFdOS(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
  AmpSqSdToGluFd(gt1, gt3) = AmpSqSdToGluFd(gt1, gt3) + AmpSqTreeSdToGluFd(gt1, gt3)  
Else  
  AmpSum2SdToGluFd = AmpTreeSdToGluFd
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
  AmpSqTreeSdToGluFd(gt1, gt3) = AmpSqSdToGluFd(gt1, gt3)  
  AmpSum2SdToGluFd = + 2._dp*AmpWaveSdToGluFd + 2._dp*AmpVertexSdToGluFd
  Call SquareAmp_StoFF(MSd(gt1),MGlu,MFd(gt3),AmpSumSdToGluFd(:,gt1, gt3),AmpSum2SdToGluFd(:,gt1, gt3),AmpSqSdToGluFd(gt1, gt3)) 
  AmpSqSdToGluFd(gt1, gt3) = AmpSqSdToGluFd(gt1, gt3) + AmpSqTreeSdToGluFd(gt1, gt3)  
End if  
Else  
  AmpSqSdToGluFd(gt1, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSdToGluFd(gt1, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 4._dp/3._dp*GammaTPS(MSdOS(gt1),MGluOS,MFdOS(gt3),helfactor*AmpSqSdToGluFd(gt1, gt3))
Else 
  gP1LSd(gt1,i4) = 4._dp/3._dp*GammaTPS(MSd(gt1),MGlu,MFd(gt3),helfactor*AmpSqSdToGluFd(gt1, gt3))
End if 
If ((Abs(MRPSdToGluFd(gt1, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToGluFd(gt1, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToGluFd(gt1, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToGluFd(gt1, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToGluFd(gt1, gt3) + MRGSdToGluFd(gt1, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToGluFd(gt1, gt3) + MRGSdToGluFd(gt1, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Sd hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSdhh(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreeSdToSdhh)

  Else 
Call Amplitude_Tree_BLSSM_SdToSdhh(ZcplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreeSdToSdhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSdhh(MLambda,em,gs,cplhhSdcSd,MhhOS,MSdOS,MRPSdToSdhh,      & 
& MRGSdToSdhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSdhh(MLambda,em,gs,ZcplhhSdcSd,MhhOS,MSdOS,MRPSdToSdhh,     & 
& MRGSdToSdhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSdhh(MLambda,em,gs,cplhhSdcSd,Mhh,MSd,MRPSdToSdhh,          & 
& MRGSdToSdhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSdhh(MLambda,em,gs,ZcplhhSdcSd,Mhh,MSd,MRPSdToSdhh,         & 
& MRGSdToSdhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdhh(cplhhSdcSd,ctcplhhSdcSd,Mhh,Mhh2,MSd,              & 
& MSd2,Zfhh,ZfSd,AmpWaveSdToSdhh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,         & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,AmpVertexSdToSdhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,AmpVertexIRdrSdToSdhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& ZcplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,               & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,AmpVertexIRosSdToSdhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,ZcplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,AmpVertexIRosSdToSdhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,     & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,& 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,& 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,AmpVertexIRosSdToSdhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,AmpVertexIRosSdToSdhh)

 End if 
 End if 
AmpVertexSdToSdhh = AmpVertexSdToSdhh -  AmpVertexIRdrSdToSdhh! +  AmpVertexIRosSdToSdhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSdhh=0._dp 
AmpVertexZSdToSdhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdhh(gt2,:,:) = AmpWaveZSdToSdhh(gt2,:,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSdhh(gt1,:,:) 
AmpVertexZSdToSdhh(gt2,:,:)= AmpVertexZSdToSdhh(gt2,:,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSdhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSdToSdhh=AmpWaveZSdToSdhh 
AmpVertexSdToSdhh= AmpVertexZSdToSdhh
! Final State 1 
AmpWaveZSdToSdhh=0._dp 
AmpVertexZSdToSdhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdhh(:,gt2,:) = AmpWaveZSdToSdhh(:,gt2,:)+ZRUZD(gt2,gt1)*AmpWaveSdToSdhh(:,gt1,:) 
AmpVertexZSdToSdhh(:,gt2,:)= AmpVertexZSdToSdhh(:,gt2,:)+ZRUZD(gt2,gt1)*AmpVertexSdToSdhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSdhh=AmpWaveZSdToSdhh 
AmpVertexSdToSdhh= AmpVertexZSdToSdhh
! Final State 2 
AmpWaveZSdToSdhh=0._dp 
AmpVertexZSdToSdhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSdToSdhh(:,:,gt2) = AmpWaveZSdToSdhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSdToSdhh(:,:,gt1) 
AmpVertexZSdToSdhh(:,:,gt2)= AmpVertexZSdToSdhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSdToSdhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSdhh=AmpWaveZSdToSdhh 
AmpVertexSdToSdhh= AmpVertexZSdToSdhh
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSdhh = AmpVertexSdToSdhh  +  AmpVertexIRosSdToSdhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSdhh = AmpTreeSdToSdhh 
 AmpSum2SdToSdhh = AmpTreeSdToSdhh + 2._dp*AmpWaveSdToSdhh + 2._dp*AmpVertexSdToSdhh  
Else 
 AmpSumSdToSdhh = AmpTreeSdToSdhh + AmpWaveSdToSdhh + AmpVertexSdToSdhh
 AmpSum2SdToSdhh = AmpTreeSdToSdhh + AmpWaveSdToSdhh + AmpVertexSdToSdhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdhh = AmpTreeSdToSdhh
 AmpSum2SdToSdhh = AmpTreeSdToSdhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SdToSdhh = AmpTreeSdToSdhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSdhh(gt1, gt2, gt3) 
  AmpSum2SdToSdhh = 2._dp*AmpWaveSdToSdhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSdhh(gt1, gt2, gt3) 
  AmpSum2SdToSdhh = 2._dp*AmpVertexSdToSdhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSdhh(gt1, gt2, gt3) 
  AmpSum2SdToSdhh = AmpTreeSdToSdhh + 2._dp*AmpWaveSdToSdhh + 2._dp*AmpVertexSdToSdhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSdhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSdhh = AmpTreeSdToSdhh
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
  AmpSqTreeSdToSdhh(gt1, gt2, gt3) = AmpSqSdToSdhh(gt1, gt2, gt3)  
  AmpSum2SdToSdhh = + 2._dp*AmpWaveSdToSdhh + 2._dp*AmpVertexSdToSdhh
  Call SquareAmp_StoSS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
  AmpSqSdToSdhh(gt1, gt2, gt3) = AmpSqSdToSdhh(gt1, gt2, gt3) + AmpSqTreeSdToSdhh(gt1, gt2, gt3)  
Else  
  AmpSum2SdToSdhh = AmpTreeSdToSdhh
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
  AmpSqTreeSdToSdhh(gt1, gt2, gt3) = AmpSqSdToSdhh(gt1, gt2, gt3)  
  AmpSum2SdToSdhh = + 2._dp*AmpWaveSdToSdhh + 2._dp*AmpVertexSdToSdhh
  Call SquareAmp_StoSS(MSd(gt1),MSd(gt2),Mhh(gt3),AmpSumSdToSdhh(gt1, gt2, gt3),AmpSum2SdToSdhh(gt1, gt2, gt3),AmpSqSdToSdhh(gt1, gt2, gt3)) 
  AmpSqSdToSdhh(gt1, gt2, gt3) = AmpSqSdToSdhh(gt1, gt2, gt3) + AmpSqTreeSdToSdhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSdToSdhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),MhhOS(gt3),helfactor*AmpSqSdToSdhh(gt1, gt2, gt3))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSd(gt2),Mhh(gt3),helfactor*AmpSqSdToSdhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSdToSdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToSdhh(gt1, gt2, gt3) + MRGSdToSdhh(gt1, gt2, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToSdhh(gt1, gt2, gt3) + MRGSdToSdhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Su Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSuHpm(cplHpmSucSd,MHpm,MSd,MSu,MHpm2,MSd2,              & 
& MSu2,AmpTreeSdToSuHpm)

  Else 
Call Amplitude_Tree_BLSSM_SdToSuHpm(ZcplHpmSucSd,MHpm,MSd,MSu,MHpm2,MSd2,             & 
& MSu2,AmpTreeSdToSuHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSuHpm(MLambda,em,gs,cplHpmSucSd,MHpmOS,MSdOS,               & 
& MSuOS,MRPSdToSuHpm,MRGSdToSuHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSuHpm(MLambda,em,gs,ZcplHpmSucSd,MHpmOS,MSdOS,              & 
& MSuOS,MRPSdToSuHpm,MRGSdToSuHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSuHpm(MLambda,em,gs,cplHpmSucSd,MHpm,MSd,MSu,               & 
& MRPSdToSuHpm,MRGSdToSuHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSuHpm(MLambda,em,gs,ZcplHpmSucSd,MHpm,MSd,MSu,              & 
& MRPSdToSuHpm,MRGSdToSuHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSuHpm(cplHpmSucSd,ctcplHpmSucSd,MHpm,MHpm2,             & 
& MSd,MSd2,MSu,MSu2,ZfHpm,ZfSd,ZfSu,AmpWaveSdToSuHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,  & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexSdToSuHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,  & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexIRdrSdToSuHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,ZcplHpmSucSd,             & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,              & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,              & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexIRosSdToSuHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& ZcplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,  & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexIRosSdToSuHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplHpmSucSd,              & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,              & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,              & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexIRosSdToSuHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,cplChaFucSdR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhHpmSucSdaa,  & 
& cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,    & 
& AmpVertexIRosSdToSuHpm)

 End if 
 End if 
AmpVertexSdToSuHpm = AmpVertexSdToSuHpm -  AmpVertexIRdrSdToSuHpm! +  AmpVertexIRosSdToSuHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSuHpm=0._dp 
AmpVertexZSdToSuHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSuHpm(gt2,:,:) = AmpWaveZSdToSuHpm(gt2,:,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSuHpm(gt1,:,:) 
AmpVertexZSdToSuHpm(gt2,:,:)= AmpVertexZSdToSuHpm(gt2,:,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSuHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSdToSuHpm=AmpWaveZSdToSuHpm 
AmpVertexSdToSuHpm= AmpVertexZSdToSuHpm
! Final State 1 
AmpWaveZSdToSuHpm=0._dp 
AmpVertexZSdToSuHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSuHpm(:,gt2,:) = AmpWaveZSdToSuHpm(:,gt2,:)+ZRUZU(gt2,gt1)*AmpWaveSdToSuHpm(:,gt1,:) 
AmpVertexZSdToSuHpm(:,gt2,:)= AmpVertexZSdToSuHpm(:,gt2,:)+ZRUZU(gt2,gt1)*AmpVertexSdToSuHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSuHpm=AmpWaveZSdToSuHpm 
AmpVertexSdToSuHpm= AmpVertexZSdToSuHpm
! Final State 2 
AmpWaveZSdToSuHpm=0._dp 
AmpVertexZSdToSuHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSdToSuHpm(:,:,gt2) = AmpWaveZSdToSuHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSdToSuHpm(:,:,gt1) 
AmpVertexZSdToSuHpm(:,:,gt2)= AmpVertexZSdToSuHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSdToSuHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSuHpm=AmpWaveZSdToSuHpm 
AmpVertexSdToSuHpm= AmpVertexZSdToSuHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSuHpm = AmpVertexSdToSuHpm  +  AmpVertexIRosSdToSuHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Su Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSuHpm = AmpTreeSdToSuHpm 
 AmpSum2SdToSuHpm = AmpTreeSdToSuHpm + 2._dp*AmpWaveSdToSuHpm + 2._dp*AmpVertexSdToSuHpm  
Else 
 AmpSumSdToSuHpm = AmpTreeSdToSuHpm + AmpWaveSdToSuHpm + AmpVertexSdToSuHpm
 AmpSum2SdToSuHpm = AmpTreeSdToSuHpm + AmpWaveSdToSuHpm + AmpVertexSdToSuHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSuHpm = AmpTreeSdToSuHpm
 AmpSum2SdToSuHpm = AmpTreeSdToSuHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSu(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SdToSuHpm = AmpTreeSdToSuHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSuHpm(gt1, gt2, gt3) 
  AmpSum2SdToSuHpm = 2._dp*AmpWaveSdToSuHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSuHpm(gt1, gt2, gt3) 
  AmpSum2SdToSuHpm = 2._dp*AmpVertexSdToSuHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSuHpm(gt1, gt2, gt3) 
  AmpSum2SdToSuHpm = AmpTreeSdToSuHpm + 2._dp*AmpWaveSdToSuHpm + 2._dp*AmpVertexSdToSuHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSuHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSuHpm = AmpTreeSdToSuHpm
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
  AmpSqTreeSdToSuHpm(gt1, gt2, gt3) = AmpSqSdToSuHpm(gt1, gt2, gt3)  
  AmpSum2SdToSuHpm = + 2._dp*AmpWaveSdToSuHpm + 2._dp*AmpVertexSdToSuHpm
  Call SquareAmp_StoSS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
  AmpSqSdToSuHpm(gt1, gt2, gt3) = AmpSqSdToSuHpm(gt1, gt2, gt3) + AmpSqTreeSdToSuHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SdToSuHpm = AmpTreeSdToSuHpm
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
  AmpSqTreeSdToSuHpm(gt1, gt2, gt3) = AmpSqSdToSuHpm(gt1, gt2, gt3)  
  AmpSum2SdToSuHpm = + 2._dp*AmpWaveSdToSuHpm + 2._dp*AmpVertexSdToSuHpm
  Call SquareAmp_StoSS(MSd(gt1),MSu(gt2),MHpm(gt3),AmpSumSdToSuHpm(gt1, gt2, gt3),AmpSum2SdToSuHpm(gt1, gt2, gt3),AmpSqSdToSuHpm(gt1, gt2, gt3)) 
  AmpSqSdToSuHpm(gt1, gt2, gt3) = AmpSqSdToSuHpm(gt1, gt2, gt3) + AmpSqTreeSdToSuHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSdToSuHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSuHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSuOS(gt2),MHpmOS(gt3),helfactor*AmpSqSdToSuHpm(gt1, gt2, gt3))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSu(gt2),MHpm(gt3),helfactor*AmpSqSdToSuHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSdToSuHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSuHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSuHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSdToSuHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSdToSuHpm(gt1, gt2, gt3) + MRGSdToSuHpm(gt1, gt2, gt3)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSdToSuHpm(gt1, gt2, gt3) + MRGSdToSuHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Sd VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSdVZ(cplSdcSdVZ,MSd,MVZ,MSd2,MVZ2,AmpTreeSdToSdVZ)

  Else 
Call Amplitude_Tree_BLSSM_SdToSdVZ(ZcplSdcSdVZ,MSd,MVZ,MSd2,MVZ2,AmpTreeSdToSdVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZ(MLambda,em,gs,cplSdcSdVZ,MSdOS,MVZOS,MRPSdToSdVZ,      & 
& MRGSdToSdVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZ(MLambda,em,gs,ZcplSdcSdVZ,MSdOS,MVZOS,MRPSdToSdVZ,     & 
& MRGSdToSdVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSdVZ(MLambda,em,gs,cplSdcSdVZ,MSd,MVZ,MRPSdToSdVZ,          & 
& MRGSdToSdVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZ(MLambda,em,gs,ZcplSdcSdVZ,MSd,MVZ,MRPSdToSdVZ,         & 
& MRGSdToSdVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdVZ(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ctcplSdcSdVP,    & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,MVZ,MVZ2,ZfSd,ZfVPVZ,ZfVZ,ZfVZpVZ,        & 
& AmpWaveSdToSdVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,             & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVZVZ,      & 
& cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,         & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,cplSdcSdVPVZaa,          & 
& cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,AmpVertexSdToSdVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,          & 
& cplChaFucSdR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,       & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVPVZaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,        & 
& AmpVertexIRdrSdToSdVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,       & 
& cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,cplSdcSdVP,ZcplSdcSdVZ,               & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,         & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,cplSdcSdVPVZaa,          & 
& cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,AmpVertexIRosSdToSdVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,          & 
& cplChaFucSdR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,       & 
& cplSdcSdVP,ZcplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,           & 
& cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVPVZaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,        & 
& AmpVertexIRosSdToSdVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,       & 
& cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,          & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,cplSdcSdVPVZaa,cplSdcSdVZVZaa,      & 
& cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,AmpVertexIRosSdToSdVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,          & 
& cplChaFucSdR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,       & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVPVZaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,        & 
& AmpVertexIRosSdToSdVZ)

 End if 
 End if 
AmpVertexSdToSdVZ = AmpVertexSdToSdVZ -  AmpVertexIRdrSdToSdVZ! +  AmpVertexIRosSdToSdVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSdVZ=0._dp 
AmpVertexZSdToSdVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdVZ(:,gt2,:) = AmpWaveZSdToSdVZ(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSdVZ(:,gt1,:) 
AmpVertexZSdToSdVZ(:,gt2,:)= AmpVertexZSdToSdVZ(:,gt2,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSdVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSdVZ=AmpWaveZSdToSdVZ 
AmpVertexSdToSdVZ= AmpVertexZSdToSdVZ
! Final State 1 
AmpWaveZSdToSdVZ=0._dp 
AmpVertexZSdToSdVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdVZ(:,:,gt2) = AmpWaveZSdToSdVZ(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveSdToSdVZ(:,:,gt1) 
AmpVertexZSdToSdVZ(:,:,gt2)= AmpVertexZSdToSdVZ(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexSdToSdVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSdVZ=AmpWaveZSdToSdVZ 
AmpVertexSdToSdVZ= AmpVertexZSdToSdVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSdVZ = AmpVertexSdToSdVZ  +  AmpVertexIRosSdToSdVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSdVZ = AmpTreeSdToSdVZ 
 AmpSum2SdToSdVZ = AmpTreeSdToSdVZ + 2._dp*AmpWaveSdToSdVZ + 2._dp*AmpVertexSdToSdVZ  
Else 
 AmpSumSdToSdVZ = AmpTreeSdToSdVZ + AmpWaveSdToSdVZ + AmpVertexSdToSdVZ
 AmpSum2SdToSdVZ = AmpTreeSdToSdVZ + AmpWaveSdToSdVZ + AmpVertexSdToSdVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdVZ = AmpTreeSdToSdVZ
 AmpSum2SdToSdVZ = AmpTreeSdToSdVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SdToSdVZ = AmpTreeSdToSdVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSdVZ(gt1, gt2) 
  AmpSum2SdToSdVZ = 2._dp*AmpWaveSdToSdVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSdVZ(gt1, gt2) 
  AmpSum2SdToSdVZ = 2._dp*AmpVertexSdToSdVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSdVZ(gt1, gt2) 
  AmpSum2SdToSdVZ = AmpTreeSdToSdVZ + 2._dp*AmpWaveSdToSdVZ + 2._dp*AmpVertexSdToSdVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSdVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSdVZ = AmpTreeSdToSdVZ
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
  AmpSqTreeSdToSdVZ(gt1, gt2) = AmpSqSdToSdVZ(gt1, gt2)  
  AmpSum2SdToSdVZ = + 2._dp*AmpWaveSdToSdVZ + 2._dp*AmpVertexSdToSdVZ
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZOS,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
  AmpSqSdToSdVZ(gt1, gt2) = AmpSqSdToSdVZ(gt1, gt2) + AmpSqTreeSdToSdVZ(gt1, gt2)  
Else  
  AmpSum2SdToSdVZ = AmpTreeSdToSdVZ
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
  AmpSqTreeSdToSdVZ(gt1, gt2) = AmpSqSdToSdVZ(gt1, gt2)  
  AmpSum2SdToSdVZ = + 2._dp*AmpWaveSdToSdVZ + 2._dp*AmpVertexSdToSdVZ
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZ,AmpSumSdToSdVZ(:,gt1, gt2),AmpSum2SdToSdVZ(:,gt1, gt2),AmpSqSdToSdVZ(gt1, gt2)) 
  AmpSqSdToSdVZ(gt1, gt2) = AmpSqSdToSdVZ(gt1, gt2) + AmpSqTreeSdToSdVZ(gt1, gt2)  
End if  
Else  
  AmpSqSdToSdVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),MVZOS,helfactor*AmpSqSdToSdVZ(gt1, gt2))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSd(gt2),MVZ,helfactor*AmpSqSdToSdVZ(gt1, gt2))
End if 
If ((Abs(MRPSdToSdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSdToSdVZ(gt1, gt2) + MRGSdToSdVZ(gt1, gt2)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSdToSdVZ(gt1, gt2) + MRGSdToSdVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Sd VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSdVZp(cplSdcSdVZp,MSd,MVZp,MSd2,MVZp2,AmpTreeSdToSdVZp)

  Else 
Call Amplitude_Tree_BLSSM_SdToSdVZp(ZcplSdcSdVZp,MSd,MVZp,MSd2,MVZp2,AmpTreeSdToSdVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZp(MLambda,em,gs,cplSdcSdVZp,MSdOS,MVZpOS,               & 
& MRPSdToSdVZp,MRGSdToSdVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZp(MLambda,em,gs,ZcplSdcSdVZp,MSdOS,MVZpOS,              & 
& MRPSdToSdVZp,MRGSdToSdVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSdVZp(MLambda,em,gs,cplSdcSdVZp,MSd,MVZp,MRPSdToSdVZp,      & 
& MRGSdToSdVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSdVZp(MLambda,em,gs,ZcplSdcSdVZp,MSd,MVZp,MRPSdToSdVZp,     & 
& MRGSdToSdVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdVZp(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ctcplSdcSdVP,   & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,MVZp,MVZp2,ZfSd,ZfVPVZp,ZfVZp,            & 
& ZfVZVZp,AmpWaveSdToSdVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,               & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,AmpVertexSdToSdVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,         & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,AmpVertexIRdrSdToSdVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,         & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZp,cplhhVZVZp,               & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,             & 
& cplSdcSdVZ,ZcplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdVGVZpLamct3ct2ct1,         & 
& cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,   & 
& AmpVertexIRosSdToSdVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,         & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,ZcplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,             & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,AmpVertexIRosSdToSdVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,         & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZp,cplhhVZVZp,               & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,             & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdVGVZpLamct3ct2ct1,         & 
& cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,   & 
& AmpVertexIRosSdToSdVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,         & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,AmpVertexIRosSdToSdVZp)

 End if 
 End if 
AmpVertexSdToSdVZp = AmpVertexSdToSdVZp -  AmpVertexIRdrSdToSdVZp! +  AmpVertexIRosSdToSdVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSdVZp=0._dp 
AmpVertexZSdToSdVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdVZp(:,gt2,:) = AmpWaveZSdToSdVZp(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSdVZp(:,gt1,:) 
AmpVertexZSdToSdVZp(:,gt2,:)= AmpVertexZSdToSdVZp(:,gt2,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSdVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSdVZp=AmpWaveZSdToSdVZp 
AmpVertexSdToSdVZp= AmpVertexZSdToSdVZp
! Final State 1 
AmpWaveZSdToSdVZp=0._dp 
AmpVertexZSdToSdVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSdVZp(:,:,gt2) = AmpWaveZSdToSdVZp(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveSdToSdVZp(:,:,gt1) 
AmpVertexZSdToSdVZp(:,:,gt2)= AmpVertexZSdToSdVZp(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexSdToSdVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSdVZp=AmpWaveZSdToSdVZp 
AmpVertexSdToSdVZp= AmpVertexZSdToSdVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSdVZp = AmpVertexSdToSdVZp  +  AmpVertexIRosSdToSdVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSdVZp = AmpTreeSdToSdVZp 
 AmpSum2SdToSdVZp = AmpTreeSdToSdVZp + 2._dp*AmpWaveSdToSdVZp + 2._dp*AmpVertexSdToSdVZp  
Else 
 AmpSumSdToSdVZp = AmpTreeSdToSdVZp + AmpWaveSdToSdVZp + AmpVertexSdToSdVZp
 AmpSum2SdToSdVZp = AmpTreeSdToSdVZp + AmpWaveSdToSdVZp + AmpVertexSdToSdVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdVZp = AmpTreeSdToSdVZp
 AmpSum2SdToSdVZp = AmpTreeSdToSdVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SdToSdVZp = AmpTreeSdToSdVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSdVZp(gt1, gt2) 
  AmpSum2SdToSdVZp = 2._dp*AmpWaveSdToSdVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSdVZp(gt1, gt2) 
  AmpSum2SdToSdVZp = 2._dp*AmpVertexSdToSdVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSdVZp(gt1, gt2) 
  AmpSum2SdToSdVZp = AmpTreeSdToSdVZp + 2._dp*AmpWaveSdToSdVZp + 2._dp*AmpVertexSdToSdVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSdVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSdVZp = AmpTreeSdToSdVZp
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
  AmpSqTreeSdToSdVZp(gt1, gt2) = AmpSqSdToSdVZp(gt1, gt2)  
  AmpSum2SdToSdVZp = + 2._dp*AmpWaveSdToSdVZp + 2._dp*AmpVertexSdToSdVZp
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),MVZpOS,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
  AmpSqSdToSdVZp(gt1, gt2) = AmpSqSdToSdVZp(gt1, gt2) + AmpSqTreeSdToSdVZp(gt1, gt2)  
Else  
  AmpSum2SdToSdVZp = AmpTreeSdToSdVZp
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
  AmpSqTreeSdToSdVZp(gt1, gt2) = AmpSqSdToSdVZp(gt1, gt2)  
  AmpSum2SdToSdVZp = + 2._dp*AmpWaveSdToSdVZp + 2._dp*AmpVertexSdToSdVZp
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVZp,AmpSumSdToSdVZp(:,gt1, gt2),AmpSum2SdToSdVZp(:,gt1, gt2),AmpSqSdToSdVZp(gt1, gt2)) 
  AmpSqSdToSdVZp(gt1, gt2) = AmpSqSdToSdVZp(gt1, gt2) + AmpSqTreeSdToSdVZp(gt1, gt2)  
End if  
Else  
  AmpSqSdToSdVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),MVZpOS,helfactor*AmpSqSdToSdVZp(gt1, gt2))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSd(gt2),MVZp,helfactor*AmpSqSdToSdVZp(gt1, gt2))
End if 
If ((Abs(MRPSdToSdVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSdVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSdToSdVZp(gt1, gt2) + MRGSdToSdVZp(gt1, gt2)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSdToSdVZp(gt1, gt2) + MRGSdToSdVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
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
! Su VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SdToSuVWm(cplSucSdVWm,MSd,MSu,MVWm,MSd2,MSu2,               & 
& MVWm2,AmpTreeSdToSuVWm)

  Else 
Call Amplitude_Tree_BLSSM_SdToSuVWm(ZcplSucSdVWm,MSd,MSu,MVWm,MSd2,MSu2,              & 
& MVWm2,AmpTreeSdToSuVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SdToSuVWm(MLambda,em,gs,cplSucSdVWm,MSdOS,MSuOS,MVWmOS,         & 
& MRPSdToSuVWm,MRGSdToSuVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SdToSuVWm(MLambda,em,gs,ZcplSucSdVWm,MSdOS,MSuOS,               & 
& MVWmOS,MRPSdToSuVWm,MRGSdToSuVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SdToSuVWm(MLambda,em,gs,cplSucSdVWm,MSd,MSu,MVWm,               & 
& MRPSdToSuVWm,MRGSdToSuVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SdToSuVWm(MLambda,em,gs,ZcplSucSdVWm,MSd,MSu,MVWm,              & 
& MRPSdToSuVWm,MRGSdToSuVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSuVWm(cplSucSdVWm,ctcplSucSdVWm,MSd,MSd2,               & 
& MSu,MSu2,MVWm,MVWm2,ZfSd,ZfSu,ZfVWm,AmpWaveSdToSuVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,               & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,AmpVertexSdToSuVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,         & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,AmpVertexIRdrSdToSuVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,           & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuVWmL,cplcFdFuVWmR,     & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& GosZcplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSuVG,               & 
& cplSucSuVP,ZcplSucSdVWm,cplSucSuVZ,cplSucSuVZp,GosZcplcHpmVPVWm,cplcVWmVPVWm,          & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,AmpVertexIRosSdToSuVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,         & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,GZcplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,              & 
& cplSdcSdVZp,cplSucSuVG,cplSucSuVP,ZcplSucSdVWm,cplSucSuVZ,cplSucSuVZp,GZcplcHpmVPVWm,  & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,  & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,AmpVertexIRosSdToSuVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,           & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuVWmL,cplcFdFuVWmR,     & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& GcplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSuVG,cplSucSuVP,       & 
& cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,            & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,cplSucSdVGVWmLamct3ct2ct1,  & 
& cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,cplSucSucVWmVWmaa,AmpVertexIRosSdToSuVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,         & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,AmpVertexIRosSdToSuVWm)

 End if 
 End if 
AmpVertexSdToSuVWm = AmpVertexSdToSuVWm -  AmpVertexIRdrSdToSuVWm! +  AmpVertexIRosSdToSuVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSdToSuVWm=0._dp 
AmpVertexZSdToSuVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSuVWm(:,gt2,:) = AmpWaveZSdToSuVWm(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveSdToSuVWm(:,gt1,:) 
AmpVertexZSdToSuVWm(:,gt2,:)= AmpVertexZSdToSuVWm(:,gt2,:) + ZRUZDc(gt2,gt1)*AmpVertexSdToSuVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSdToSuVWm=AmpWaveZSdToSuVWm 
AmpVertexSdToSuVWm= AmpVertexZSdToSuVWm
! Final State 1 
AmpWaveZSdToSuVWm=0._dp 
AmpVertexZSdToSuVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSdToSuVWm(:,:,gt2) = AmpWaveZSdToSuVWm(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWaveSdToSuVWm(:,:,gt1) 
AmpVertexZSdToSuVWm(:,:,gt2)= AmpVertexZSdToSuVWm(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexSdToSuVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSdToSuVWm=AmpWaveZSdToSuVWm 
AmpVertexSdToSuVWm= AmpVertexZSdToSuVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSdToSuVWm = AmpVertexSdToSuVWm  +  AmpVertexIRosSdToSuVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Su VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSdToSuVWm = AmpTreeSdToSuVWm 
 AmpSum2SdToSuVWm = AmpTreeSdToSuVWm + 2._dp*AmpWaveSdToSuVWm + 2._dp*AmpVertexSdToSuVWm  
Else 
 AmpSumSdToSuVWm = AmpTreeSdToSuVWm + AmpWaveSdToSuVWm + AmpVertexSdToSuVWm
 AmpSum2SdToSuVWm = AmpTreeSdToSuVWm + AmpWaveSdToSuVWm + AmpVertexSdToSuVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSuVWm = AmpTreeSdToSuVWm
 AmpSum2SdToSuVWm = AmpTreeSdToSuVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSu(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SdToSuVWm = AmpTreeSdToSuVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSdToSuVWm(gt1, gt2) 
  AmpSum2SdToSuVWm = 2._dp*AmpWaveSdToSuVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSdToSuVWm(gt1, gt2) 
  AmpSum2SdToSuVWm = 2._dp*AmpVertexSdToSuVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSdToSuVWm(gt1, gt2) 
  AmpSum2SdToSuVWm = AmpTreeSdToSuVWm + 2._dp*AmpWaveSdToSuVWm + 2._dp*AmpVertexSdToSuVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSdToSuVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SdToSuVWm = AmpTreeSdToSuVWm
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
  AmpSqTreeSdToSuVWm(gt1, gt2) = AmpSqSdToSuVWm(gt1, gt2)  
  AmpSum2SdToSuVWm = + 2._dp*AmpWaveSdToSuVWm + 2._dp*AmpVertexSdToSuVWm
  Call SquareAmp_StoSV(MSdOS(gt1),MSuOS(gt2),MVWmOS,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
  AmpSqSdToSuVWm(gt1, gt2) = AmpSqSdToSuVWm(gt1, gt2) + AmpSqTreeSdToSuVWm(gt1, gt2)  
Else  
  AmpSum2SdToSuVWm = AmpTreeSdToSuVWm
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
  AmpSqTreeSdToSuVWm(gt1, gt2) = AmpSqSdToSuVWm(gt1, gt2)  
  AmpSum2SdToSuVWm = + 2._dp*AmpWaveSdToSuVWm + 2._dp*AmpVertexSdToSuVWm
  Call SquareAmp_StoSV(MSd(gt1),MSu(gt2),MVWm,AmpSumSdToSuVWm(:,gt1, gt2),AmpSum2SdToSuVWm(:,gt1, gt2),AmpSqSdToSuVWm(gt1, gt2)) 
  AmpSqSdToSuVWm(gt1, gt2) = AmpSqSdToSuVWm(gt1, gt2) + AmpSqTreeSdToSuVWm(gt1, gt2)  
End if  
Else  
  AmpSqSdToSuVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSuVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSuOS(gt2),MVWmOS,helfactor*AmpSqSdToSuVWm(gt1, gt2))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSu(gt2),MVWm,helfactor*AmpSqSdToSuVWm(gt1, gt2))
End if 
If ((Abs(MRPSdToSuVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSuVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSdToSuVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSuVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSdToSuVWm(gt1, gt2) + MRGSdToSuVWm(gt1, gt2)) 
  gP1LSd(gt1,i4) = gP1LSd(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSdToSuVWm(gt1, gt2) + MRGSdToSuVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSd(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Sd VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_SdToSdVG(cplSdcSdVG,ctcplSdcSdVG,MSdOS,MSd2OS,              & 
& MVG,MVG2,ZfSd,ZfVG,AmpWaveSdToSdVG)

 Else 
Call Amplitude_WAVE_BLSSM_SdToSdVG(cplSdcSdVG,ctcplSdcSdVG,MSdOS,MSd2OS,              & 
& MVG,MVG2,ZfSd,ZfVG,AmpWaveSdToSdVG)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SdToSdVG(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MGluOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& MVZp2OS,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,   & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,            & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSdVWm,cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSucVWmVGLamct4ct2ct1,cplSucSdVGVWmLamct3ct2ct1,        & 
& AmpVertexSdToSdVG)

 Else 
Call Amplitude_VERTEX_BLSSM_SdToSdVG(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MGluOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& MVZp2OS,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,   & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,            & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSdVWm,cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSucVWmVGLamct4ct2ct1,cplSucSdVGVWmLamct3ct2ct1,        & 
& AmpVertexSdToSdVG)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdVG(cplSdcSdVG,ctcplSdcSdVG,MSd,MSd2,MVG,              & 
& MVG2,ZfSd,ZfVG,AmpWaveSdToSdVG)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdVG(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,             & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,          & 
& cplSucSdVWm,cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,cplSdcSdVGVZpLamct3ct2ct1,           & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSucSdVGVWmLamct3ct2ct1,AmpVertexSdToSdVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdVG = 0._dp 
 AmpSum2SdToSdVG = 0._dp  
Else 
 AmpSumSdToSdVG = AmpVertexSdToSdVG + AmpWaveSdToSdVG
 AmpSum2SdToSdVG = AmpVertexSdToSdVG + AmpWaveSdToSdVG 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),0._dp,AmpSumSdToSdVG(:,gt1, gt2),AmpSum2SdToSdVG(:,gt1, gt2),AmpSqSdToSdVG(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVG,AmpSumSdToSdVG(:,gt1, gt2),AmpSum2SdToSdVG(:,gt1, gt2),AmpSqSdToSdVG(gt1, gt2)) 
End if  
Else  
  AmpSqSdToSdVG(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdVG(gt1, gt2).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 4._dp/3._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),0._dp,helfactor*AmpSqSdToSdVG(gt1, gt2))
Else 
  gP1LSd(gt1,i4) = 4._dp/3._dp*GammaTPS(MSd(gt1),MSd(gt2),MVG,helfactor*AmpSqSdToSdVG(gt1, gt2))
End if 
If ((Abs(MRPSdToSdVG(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVG(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Sd VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_SdToSdVP(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ctcplSdcSdVP,    & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,MSdOS,MSd2OS,MVP,MVP2,ZfSd,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSdToSdVP)

 Else 
Call Amplitude_WAVE_BLSSM_SdToSdVP(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ctcplSdcSdVP,    & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,MSdOS,MSd2OS,MVP,MVP2,ZfSd,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSdToSdVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SdToSdVP(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MGluOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& MVZp2OS,cplAhhhVP,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChiVPL,cplChiChiVPR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,               & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVP,cplSucSdVWm,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,   & 
& cplSdcSucVWmVPaa,cplSucSdVPVWmaa,AmpVertexSdToSdVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SdToSdVP(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MGluOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& MVZp2OS,cplAhhhVP,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChiVPL,cplChiChiVPR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,               & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVP,cplSucSdVWm,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,   & 
& cplSdcSucVWmVPaa,cplSucSdVPVWmaa,AmpVertexSdToSdVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SdToSdVP(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ctcplSdcSdVP,    & 
& ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,ZfSd,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSdToSdVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SdToSdVP(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,             & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplhhVPVZ,cplhhVPVZp,     & 
& cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVP,cplSucSdVWm,          & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVPVPaa,cplSdcSdVPVZaa,      & 
& cplSdcSdVPVZpaa,cplSdcSucVWmVPaa,cplSucSdVPVWmaa,AmpVertexSdToSdVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sd->Sd VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSdToSdVP = 0._dp 
 AmpSum2SdToSdVP = 0._dp  
Else 
 AmpSumSdToSdVP = AmpVertexSdToSdVP + AmpWaveSdToSdVP
 AmpSum2SdToSdVP = AmpVertexSdToSdVP + AmpWaveSdToSdVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSdOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSd(gt1)).gt.(Abs(MSd(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSdOS(gt1),MSdOS(gt2),0._dp,AmpSumSdToSdVP(:,gt1, gt2),AmpSum2SdToSdVP(:,gt1, gt2),AmpSqSdToSdVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSd(gt1),MSd(gt2),MVP,AmpSumSdToSdVP(:,gt1, gt2),AmpSum2SdToSdVP(:,gt1, gt2),AmpSqSdToSdVP(gt1, gt2)) 
End if  
Else  
  AmpSqSdToSdVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSdToSdVP(gt1, gt2).eq.0._dp) Then 
  gP1LSd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSdOS(gt1),MSdOS(gt2),0._dp,helfactor*AmpSqSdToSdVP(gt1, gt2))
Else 
  gP1LSd(gt1,i4) = 1._dp*GammaTPS(MSd(gt1),MSd(gt2),MVP,helfactor*AmpSqSdToSdVP(gt1, gt2))
End if 
If ((Abs(MRPSdToSdVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSdToSdVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Sd

End Module Wrapper_OneLoopDecay_Sd_BLSSM
