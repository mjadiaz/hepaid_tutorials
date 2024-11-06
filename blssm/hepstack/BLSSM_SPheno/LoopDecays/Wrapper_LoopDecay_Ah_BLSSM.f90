! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:14 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Ah_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_Ah_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Ah(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,            & 
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

Complex(dp),Intent(in) :: cplAhAhAhAh1(4,4,4,4),cplAhAhcVWmVWm1(4,4),cplAhAhhh(4,4,4),cplAhAhhhhh1(4,4,4,4),    & 
& cplAhAhHpmcHpm1(4,4,2,2),cplAhAhSdcSdaa(4,4,6,6),cplAhAhSecSe1(4,4,6,6),               & 
& cplAhAhSucSuaa(4,4,6,6),cplAhAhSvImSvIm1(4,4,6,6),cplAhAhSvImSvRe1(4,4,6,6),           & 
& cplAhAhSvReSvRe1(4,4,6,6),cplAhAhVPVP1(4,4),cplAhAhVPVZ1(4,4),cplAhAhVPVZp1(4,4),      & 
& cplAhAhVZpVZp1(4,4),cplAhAhVZVZ1(4,4),cplAhAhVZVZp1(4,4),cplAhcHpmVPVWm1(4,2),         & 
& cplAhcHpmVWm(4,2),cplAhcHpmVWmVZ1(4,2),cplAhcHpmVWmVZp1(4,2),cplAhhhHpmcHpm1(4,4,2,2), & 
& cplAhhhSvImSvIm1(4,4,6,6),cplAhhhSvImSvRe1(4,4,6,6),cplAhhhSvReSvRe1(4,4,6,6),         & 
& cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),   & 
& cplAhHpmcVWmVP1(4,2),cplAhHpmcVWmVZ1(4,2),cplAhHpmcVWmVZp1(4,2),cplAhHpmSucSdaa(4,2,6,6),& 
& cplAhHpmSvImcSe1(4,2,6,6),cplAhHpmSvRecSe1(4,2,6,6),cplAhSdcHpmcSuaa(4,6,2,6),         & 
& cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSeSvImcHpm1(4,6,6,2),cplAhSeSvRecHpm1(4,6,6,2),& 
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
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcgAgWmcVWm,cplcgAgWpCVWm,      & 
& cplcgWmgAHpm(2),cplcgWmgAVWm,cplcgWmgWmAh(4),cplcgWmgWmhh(4),cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWmgZHpm(2),cplcgWmgZpHpm(2),cplcgWmgZpVWm,             & 
& cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh(4),cplcgWpCgWpChh(4),cplcgWpCgWpCVP,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm(2),cplcgWpCgZcVWm,cplcgWpCgZpcHpm(2)

Complex(dp),Intent(in) :: cplcgWpCgZpcVWm,cplcgZgWmcHpm(2),cplcgZgWmcVWm,cplcgZgWpCHpm(2),cplcgZgWpCVWm,         & 
& cplcgZpgWmcHpm(2),cplcgZpgWmcVWm,cplcgZpgWpCHpm(2),cplcgZpgWpCVWm,cplChaFucSdL(2,3,6), & 
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
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVPVWm1(4,2),            & 
& cplhhcHpmVWm(4,2),cplhhcHpmVWmVZ1(4,2),cplhhcHpmVWmVZp1(4,2),cplhhcVWmVWm(4),          & 
& cplhhhhhh(4,4,4),cplhhhhHpmcHpm1(4,4,2,2),cplhhhhSdcSdaa(4,4,6,6),cplhhhhSecSe1(4,4,6,6),& 
& cplhhhhSucSuaa(4,4,6,6),cplhhhhSvImSvIm1(4,4,6,6),cplhhhhSvImSvRe1(4,4,6,6),           & 
& cplhhhhSvReSvRe1(4,4,6,6),cplhhhhVPVP1(4,4),cplhhhhVPVZ1(4,4),cplhhhhVPVZp1(4,4),      & 
& cplhhhhVZpVZp1(4,4),cplhhhhVZVZ1(4,4),cplhhhhVZVZp1(4,4),cplhhHpmcHpm(4,2,2),          & 
& cplhhHpmcVWm(4,2),cplhhHpmcVWmVP1(4,2),cplhhHpmcVWmVZ1(4,2),cplhhHpmcVWmVZp1(4,2),     & 
& cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),            & 
& cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),   & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVPVP1(2,2),& 
& cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVPVZp1(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),       & 
& cplHpmcHpmVZpVZp1(2,2),cplHpmcHpmVZVZ1(2,2),cplHpmcHpmVZVZp1(2,2),cplHpmcVWmVP(2),     & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmHpmcHpmcHpm1(2,2,2,2),cplHpmSdcHpmcSdaa(2,6,2,6),& 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSucSd(2,6,6),               & 
& cplHpmSvImcSe(2,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),        & 
& cplHpmSvRecSe(2,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdcHpmcSu(6,2,6),cplSdcSdcVWmVWmaa(6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),          & 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSdVZpVZpaa(6,6),cplSdcSdVZVZaa(6,6),            & 
& cplSdcSdVZVZpaa(6,6),cplSdcSucVWm(6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),& 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),cplSecSecVWmVWm1(6,6),         & 
& cplSecSeVP(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),             & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZpVZp1(6,6),cplSecSeVZVZ1(6,6)

Complex(dp),Intent(in) :: cplSecSeVZVZp1(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvImcHpm(6,6,2),& 
& cplSeSvImcVWm(6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),              & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSucSdVWm(6,6),   & 
& cplSucSucVWmVWmaa(6,6),cplSucSuVG(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6), & 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVP(6,6),cplSucSuVPVPaa(6,6),    & 
& cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),             & 
& cplSucSuVZpVZpaa(6,6),cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6),cplSuSucSucSuabab(6,6,6,6),& 
& cplSuSucSucSuabba(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),    & 
& cplSuSvReSvRecSuaa(6,6,6,6),cplSvImcSeVWm(6,6),cplSvImSvImcVWmVWm1(6,6),               & 
& cplSvImSvImSvImSvIm1(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvImVPVP1(6,6),cplSvImSvImVPVZ1(6,6),cplSvImSvImVPVZp1(6,6),cplSvImSvImVZpVZp1(6,6),& 
& cplSvImSvImVZVZ1(6,6),cplSvImSvImVZVZp1(6,6),cplSvImSvReSvReSvRe1(6,6,6,6),            & 
& cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),cplSvRecSeVWm(6,6),          & 
& cplSvReSvRecVWmVWm1(6,6),cplSvReSvReSvReSvRe1(6,6,6,6),cplSvReSvReVPVP1(6,6),          & 
& cplSvReSvReVPVZ1(6,6),cplSvReSvReVPVZp1(6,6),cplSvReSvReVZpVZp1(6,6),cplSvReSvReVZVZ1(6,6),& 
& cplSvReSvReVZVZp1(6,6),ctcplAhAhhh(4,4,4),ctcplAhhhVP(4,4),ctcplAhhhVZ(4,4),           & 
& ctcplAhhhVZp(4,4),ctcplAhHpmcHpm(4,2,2),ctcplAhHpmcVWm(4,2),ctcplAhSdcSd(4,6,6),       & 
& ctcplAhSecSe(4,6,6),ctcplAhSucSu(4,6,6),ctcplAhSvImSvIm(4,6,6),ctcplAhSvImSvRe(4,6,6), & 
& ctcplAhSvReSvRe(4,6,6),ctcplcChaChaAhL(2,2,4),ctcplcChaChaAhR(2,2,4),ctcplcFdFdAhL(3,3,4),& 
& ctcplcFdFdAhR(3,3,4),ctcplcFeFeAhL(3,3,4),ctcplcFeFeAhR(3,3,4),ctcplcFuFuAhL(3,3,4),   & 
& ctcplcFuFuAhR(3,3,4),ctcplChiChiAhL(7,7,4),ctcplChiChiAhR(7,7,4),ctcplFvFvAhL(6,6,4),  & 
& ctcplFvFvAhR(6,6,4),GcplAhHpmcHpm(4,2,2),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),            & 
& GosZcplAhHpmcHpm(4,2,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplAhHpmcHpm(4,2,2), & 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplAhAhhh(4,4,4),ZcplAhhhVZ(4,4),ZcplAhhhVZp(4,4),& 
& ZcplAhHpmcHpm(4,2,2),ZcplAhHpmcVWm(4,2),ZcplAhSdcSd(4,6,6),ZcplAhSecSe(4,6,6),         & 
& ZcplAhSucSu(4,6,6),ZcplAhSvImSvIm(4,6,6),ZcplAhSvImSvRe(4,6,6),ZcplAhSvReSvRe(4,6,6),  & 
& ZcplcChaChaAhL(2,2,4),ZcplcChaChaAhR(2,2,4),ZcplcFdFdAhL(3,3,4),ZcplcFdFdAhR(3,3,4),   & 
& ZcplcFeFeAhL(3,3,4),ZcplcFeFeAhR(3,3,4),ZcplcFuFuAhL(3,3,4),ZcplcFuFuAhR(3,3,4),       & 
& ZcplChiChiAhL(7,7,4),ZcplChiChiAhR(7,7,4),ZcplFvFvAhL(6,6,4),ZcplFvFvAhR(6,6,4)

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
Real(dp), Intent(out) :: gP1LAh(4,318) 
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
Real(dp) :: MRPAhTohhAh(4,4,4),MRGAhTohhAh(4,4,4), MRPZAhTohhAh(4,4,4),MRGZAhTohhAh(4,4,4) 
Real(dp) :: MVPAhTohhAh(4,4,4) 
Real(dp) :: RMsqTreeAhTohhAh(4,4,4),RMsqWaveAhTohhAh(4,4,4),RMsqVertexAhTohhAh(4,4,4) 
Complex(dp) :: AmpTreeAhTohhAh(4,4,4),AmpWaveAhTohhAh(4,4,4)=(0._dp,0._dp),AmpVertexAhTohhAh(4,4,4)& 
 & ,AmpVertexIRosAhTohhAh(4,4,4),AmpVertexIRdrAhTohhAh(4,4,4), AmpSumAhTohhAh(4,4,4), AmpSum2AhTohhAh(4,4,4) 
Complex(dp) :: AmpTreeZAhTohhAh(4,4,4),AmpWaveZAhTohhAh(4,4,4),AmpVertexZAhTohhAh(4,4,4) 
Real(dp) :: AmpSqAhTohhAh(4,4,4),  AmpSqTreeAhTohhAh(4,4,4) 
Real(dp) :: MRPAhTocChaCha(4,2,2),MRGAhTocChaCha(4,2,2), MRPZAhTocChaCha(4,2,2),MRGZAhTocChaCha(4,2,2) 
Real(dp) :: MVPAhTocChaCha(4,2,2) 
Real(dp) :: RMsqTreeAhTocChaCha(4,2,2),RMsqWaveAhTocChaCha(4,2,2),RMsqVertexAhTocChaCha(4,2,2) 
Complex(dp) :: AmpTreeAhTocChaCha(2,4,2,2),AmpWaveAhTocChaCha(2,4,2,2)=(0._dp,0._dp),AmpVertexAhTocChaCha(2,4,2,2)& 
 & ,AmpVertexIRosAhTocChaCha(2,4,2,2),AmpVertexIRdrAhTocChaCha(2,4,2,2), AmpSumAhTocChaCha(2,4,2,2), AmpSum2AhTocChaCha(2,4,2,2) 
Complex(dp) :: AmpTreeZAhTocChaCha(2,4,2,2),AmpWaveZAhTocChaCha(2,4,2,2),AmpVertexZAhTocChaCha(2,4,2,2) 
Real(dp) :: AmpSqAhTocChaCha(4,2,2),  AmpSqTreeAhTocChaCha(4,2,2) 
Real(dp) :: MRPAhToChiChi(4,7,7),MRGAhToChiChi(4,7,7), MRPZAhToChiChi(4,7,7),MRGZAhToChiChi(4,7,7) 
Real(dp) :: MVPAhToChiChi(4,7,7) 
Real(dp) :: RMsqTreeAhToChiChi(4,7,7),RMsqWaveAhToChiChi(4,7,7),RMsqVertexAhToChiChi(4,7,7) 
Complex(dp) :: AmpTreeAhToChiChi(2,4,7,7),AmpWaveAhToChiChi(2,4,7,7)=(0._dp,0._dp),AmpVertexAhToChiChi(2,4,7,7)& 
 & ,AmpVertexIRosAhToChiChi(2,4,7,7),AmpVertexIRdrAhToChiChi(2,4,7,7), AmpSumAhToChiChi(2,4,7,7), AmpSum2AhToChiChi(2,4,7,7) 
Complex(dp) :: AmpTreeZAhToChiChi(2,4,7,7),AmpWaveZAhToChiChi(2,4,7,7),AmpVertexZAhToChiChi(2,4,7,7) 
Real(dp) :: AmpSqAhToChiChi(4,7,7),  AmpSqTreeAhToChiChi(4,7,7) 
Real(dp) :: MRPAhTocFdFd(4,3,3),MRGAhTocFdFd(4,3,3), MRPZAhTocFdFd(4,3,3),MRGZAhTocFdFd(4,3,3) 
Real(dp) :: MVPAhTocFdFd(4,3,3) 
Real(dp) :: RMsqTreeAhTocFdFd(4,3,3),RMsqWaveAhTocFdFd(4,3,3),RMsqVertexAhTocFdFd(4,3,3) 
Complex(dp) :: AmpTreeAhTocFdFd(2,4,3,3),AmpWaveAhTocFdFd(2,4,3,3)=(0._dp,0._dp),AmpVertexAhTocFdFd(2,4,3,3)& 
 & ,AmpVertexIRosAhTocFdFd(2,4,3,3),AmpVertexIRdrAhTocFdFd(2,4,3,3), AmpSumAhTocFdFd(2,4,3,3), AmpSum2AhTocFdFd(2,4,3,3) 
Complex(dp) :: AmpTreeZAhTocFdFd(2,4,3,3),AmpWaveZAhTocFdFd(2,4,3,3),AmpVertexZAhTocFdFd(2,4,3,3) 
Real(dp) :: AmpSqAhTocFdFd(4,3,3),  AmpSqTreeAhTocFdFd(4,3,3) 
Real(dp) :: MRPAhTocFeFe(4,3,3),MRGAhTocFeFe(4,3,3), MRPZAhTocFeFe(4,3,3),MRGZAhTocFeFe(4,3,3) 
Real(dp) :: MVPAhTocFeFe(4,3,3) 
Real(dp) :: RMsqTreeAhTocFeFe(4,3,3),RMsqWaveAhTocFeFe(4,3,3),RMsqVertexAhTocFeFe(4,3,3) 
Complex(dp) :: AmpTreeAhTocFeFe(2,4,3,3),AmpWaveAhTocFeFe(2,4,3,3)=(0._dp,0._dp),AmpVertexAhTocFeFe(2,4,3,3)& 
 & ,AmpVertexIRosAhTocFeFe(2,4,3,3),AmpVertexIRdrAhTocFeFe(2,4,3,3), AmpSumAhTocFeFe(2,4,3,3), AmpSum2AhTocFeFe(2,4,3,3) 
Complex(dp) :: AmpTreeZAhTocFeFe(2,4,3,3),AmpWaveZAhTocFeFe(2,4,3,3),AmpVertexZAhTocFeFe(2,4,3,3) 
Real(dp) :: AmpSqAhTocFeFe(4,3,3),  AmpSqTreeAhTocFeFe(4,3,3) 
Real(dp) :: MRPAhTocFuFu(4,3,3),MRGAhTocFuFu(4,3,3), MRPZAhTocFuFu(4,3,3),MRGZAhTocFuFu(4,3,3) 
Real(dp) :: MVPAhTocFuFu(4,3,3) 
Real(dp) :: RMsqTreeAhTocFuFu(4,3,3),RMsqWaveAhTocFuFu(4,3,3),RMsqVertexAhTocFuFu(4,3,3) 
Complex(dp) :: AmpTreeAhTocFuFu(2,4,3,3),AmpWaveAhTocFuFu(2,4,3,3)=(0._dp,0._dp),AmpVertexAhTocFuFu(2,4,3,3)& 
 & ,AmpVertexIRosAhTocFuFu(2,4,3,3),AmpVertexIRdrAhTocFuFu(2,4,3,3), AmpSumAhTocFuFu(2,4,3,3), AmpSum2AhTocFuFu(2,4,3,3) 
Complex(dp) :: AmpTreeZAhTocFuFu(2,4,3,3),AmpWaveZAhTocFuFu(2,4,3,3),AmpVertexZAhTocFuFu(2,4,3,3) 
Real(dp) :: AmpSqAhTocFuFu(4,3,3),  AmpSqTreeAhTocFuFu(4,3,3) 
Real(dp) :: MRPAhToFvFv(4,6,6),MRGAhToFvFv(4,6,6), MRPZAhToFvFv(4,6,6),MRGZAhToFvFv(4,6,6) 
Real(dp) :: MVPAhToFvFv(4,6,6) 
Real(dp) :: RMsqTreeAhToFvFv(4,6,6),RMsqWaveAhToFvFv(4,6,6),RMsqVertexAhToFvFv(4,6,6) 
Complex(dp) :: AmpTreeAhToFvFv(2,4,6,6),AmpWaveAhToFvFv(2,4,6,6)=(0._dp,0._dp),AmpVertexAhToFvFv(2,4,6,6)& 
 & ,AmpVertexIRosAhToFvFv(2,4,6,6),AmpVertexIRdrAhToFvFv(2,4,6,6), AmpSumAhToFvFv(2,4,6,6), AmpSum2AhToFvFv(2,4,6,6) 
Complex(dp) :: AmpTreeZAhToFvFv(2,4,6,6),AmpWaveZAhToFvFv(2,4,6,6),AmpVertexZAhToFvFv(2,4,6,6) 
Real(dp) :: AmpSqAhToFvFv(4,6,6),  AmpSqTreeAhToFvFv(4,6,6) 
Real(dp) :: MRPAhTohhVZ(4,4),MRGAhTohhVZ(4,4), MRPZAhTohhVZ(4,4),MRGZAhTohhVZ(4,4) 
Real(dp) :: MVPAhTohhVZ(4,4) 
Real(dp) :: RMsqTreeAhTohhVZ(4,4),RMsqWaveAhTohhVZ(4,4),RMsqVertexAhTohhVZ(4,4) 
Complex(dp) :: AmpTreeAhTohhVZ(2,4,4),AmpWaveAhTohhVZ(2,4,4)=(0._dp,0._dp),AmpVertexAhTohhVZ(2,4,4)& 
 & ,AmpVertexIRosAhTohhVZ(2,4,4),AmpVertexIRdrAhTohhVZ(2,4,4), AmpSumAhTohhVZ(2,4,4), AmpSum2AhTohhVZ(2,4,4) 
Complex(dp) :: AmpTreeZAhTohhVZ(2,4,4),AmpWaveZAhTohhVZ(2,4,4),AmpVertexZAhTohhVZ(2,4,4) 
Real(dp) :: AmpSqAhTohhVZ(4,4),  AmpSqTreeAhTohhVZ(4,4) 
Real(dp) :: MRPAhTohhVZp(4,4),MRGAhTohhVZp(4,4), MRPZAhTohhVZp(4,4),MRGZAhTohhVZp(4,4) 
Real(dp) :: MVPAhTohhVZp(4,4) 
Real(dp) :: RMsqTreeAhTohhVZp(4,4),RMsqWaveAhTohhVZp(4,4),RMsqVertexAhTohhVZp(4,4) 
Complex(dp) :: AmpTreeAhTohhVZp(2,4,4),AmpWaveAhTohhVZp(2,4,4)=(0._dp,0._dp),AmpVertexAhTohhVZp(2,4,4)& 
 & ,AmpVertexIRosAhTohhVZp(2,4,4),AmpVertexIRdrAhTohhVZp(2,4,4), AmpSumAhTohhVZp(2,4,4), AmpSum2AhTohhVZp(2,4,4) 
Complex(dp) :: AmpTreeZAhTohhVZp(2,4,4),AmpWaveZAhTohhVZp(2,4,4),AmpVertexZAhTohhVZp(2,4,4) 
Real(dp) :: AmpSqAhTohhVZp(4,4),  AmpSqTreeAhTohhVZp(4,4) 
Real(dp) :: MRPAhTocHpmHpm(4,2,2),MRGAhTocHpmHpm(4,2,2), MRPZAhTocHpmHpm(4,2,2),MRGZAhTocHpmHpm(4,2,2) 
Real(dp) :: MVPAhTocHpmHpm(4,2,2) 
Real(dp) :: RMsqTreeAhTocHpmHpm(4,2,2),RMsqWaveAhTocHpmHpm(4,2,2),RMsqVertexAhTocHpmHpm(4,2,2) 
Complex(dp) :: AmpTreeAhTocHpmHpm(4,2,2),AmpWaveAhTocHpmHpm(4,2,2)=(0._dp,0._dp),AmpVertexAhTocHpmHpm(4,2,2)& 
 & ,AmpVertexIRosAhTocHpmHpm(4,2,2),AmpVertexIRdrAhTocHpmHpm(4,2,2), AmpSumAhTocHpmHpm(4,2,2), AmpSum2AhTocHpmHpm(4,2,2) 
Complex(dp) :: AmpTreeZAhTocHpmHpm(4,2,2),AmpWaveZAhTocHpmHpm(4,2,2),AmpVertexZAhTocHpmHpm(4,2,2) 
Real(dp) :: AmpSqAhTocHpmHpm(4,2,2),  AmpSqTreeAhTocHpmHpm(4,2,2) 
Real(dp) :: MRPAhToHpmcVWm(4,2),MRGAhToHpmcVWm(4,2), MRPZAhToHpmcVWm(4,2),MRGZAhToHpmcVWm(4,2) 
Real(dp) :: MVPAhToHpmcVWm(4,2) 
Real(dp) :: RMsqTreeAhToHpmcVWm(4,2),RMsqWaveAhToHpmcVWm(4,2),RMsqVertexAhToHpmcVWm(4,2) 
Complex(dp) :: AmpTreeAhToHpmcVWm(2,4,2),AmpWaveAhToHpmcVWm(2,4,2)=(0._dp,0._dp),AmpVertexAhToHpmcVWm(2,4,2)& 
 & ,AmpVertexIRosAhToHpmcVWm(2,4,2),AmpVertexIRdrAhToHpmcVWm(2,4,2), AmpSumAhToHpmcVWm(2,4,2), AmpSum2AhToHpmcVWm(2,4,2) 
Complex(dp) :: AmpTreeZAhToHpmcVWm(2,4,2),AmpWaveZAhToHpmcVWm(2,4,2),AmpVertexZAhToHpmcVWm(2,4,2) 
Real(dp) :: AmpSqAhToHpmcVWm(4,2),  AmpSqTreeAhToHpmcVWm(4,2) 
Real(dp) :: MRPAhTocSdSd(4,6,6),MRGAhTocSdSd(4,6,6), MRPZAhTocSdSd(4,6,6),MRGZAhTocSdSd(4,6,6) 
Real(dp) :: MVPAhTocSdSd(4,6,6) 
Real(dp) :: RMsqTreeAhTocSdSd(4,6,6),RMsqWaveAhTocSdSd(4,6,6),RMsqVertexAhTocSdSd(4,6,6) 
Complex(dp) :: AmpTreeAhTocSdSd(4,6,6),AmpWaveAhTocSdSd(4,6,6)=(0._dp,0._dp),AmpVertexAhTocSdSd(4,6,6)& 
 & ,AmpVertexIRosAhTocSdSd(4,6,6),AmpVertexIRdrAhTocSdSd(4,6,6), AmpSumAhTocSdSd(4,6,6), AmpSum2AhTocSdSd(4,6,6) 
Complex(dp) :: AmpTreeZAhTocSdSd(4,6,6),AmpWaveZAhTocSdSd(4,6,6),AmpVertexZAhTocSdSd(4,6,6) 
Real(dp) :: AmpSqAhTocSdSd(4,6,6),  AmpSqTreeAhTocSdSd(4,6,6) 
Real(dp) :: MRPAhTocSeSe(4,6,6),MRGAhTocSeSe(4,6,6), MRPZAhTocSeSe(4,6,6),MRGZAhTocSeSe(4,6,6) 
Real(dp) :: MVPAhTocSeSe(4,6,6) 
Real(dp) :: RMsqTreeAhTocSeSe(4,6,6),RMsqWaveAhTocSeSe(4,6,6),RMsqVertexAhTocSeSe(4,6,6) 
Complex(dp) :: AmpTreeAhTocSeSe(4,6,6),AmpWaveAhTocSeSe(4,6,6)=(0._dp,0._dp),AmpVertexAhTocSeSe(4,6,6)& 
 & ,AmpVertexIRosAhTocSeSe(4,6,6),AmpVertexIRdrAhTocSeSe(4,6,6), AmpSumAhTocSeSe(4,6,6), AmpSum2AhTocSeSe(4,6,6) 
Complex(dp) :: AmpTreeZAhTocSeSe(4,6,6),AmpWaveZAhTocSeSe(4,6,6),AmpVertexZAhTocSeSe(4,6,6) 
Real(dp) :: AmpSqAhTocSeSe(4,6,6),  AmpSqTreeAhTocSeSe(4,6,6) 
Real(dp) :: MRPAhTocSuSu(4,6,6),MRGAhTocSuSu(4,6,6), MRPZAhTocSuSu(4,6,6),MRGZAhTocSuSu(4,6,6) 
Real(dp) :: MVPAhTocSuSu(4,6,6) 
Real(dp) :: RMsqTreeAhTocSuSu(4,6,6),RMsqWaveAhTocSuSu(4,6,6),RMsqVertexAhTocSuSu(4,6,6) 
Complex(dp) :: AmpTreeAhTocSuSu(4,6,6),AmpWaveAhTocSuSu(4,6,6)=(0._dp,0._dp),AmpVertexAhTocSuSu(4,6,6)& 
 & ,AmpVertexIRosAhTocSuSu(4,6,6),AmpVertexIRdrAhTocSuSu(4,6,6), AmpSumAhTocSuSu(4,6,6), AmpSum2AhTocSuSu(4,6,6) 
Complex(dp) :: AmpTreeZAhTocSuSu(4,6,6),AmpWaveZAhTocSuSu(4,6,6),AmpVertexZAhTocSuSu(4,6,6) 
Real(dp) :: AmpSqAhTocSuSu(4,6,6),  AmpSqTreeAhTocSuSu(4,6,6) 
Real(dp) :: MRPAhToSvImSvIm(4,6,6),MRGAhToSvImSvIm(4,6,6), MRPZAhToSvImSvIm(4,6,6),MRGZAhToSvImSvIm(4,6,6) 
Real(dp) :: MVPAhToSvImSvIm(4,6,6) 
Real(dp) :: RMsqTreeAhToSvImSvIm(4,6,6),RMsqWaveAhToSvImSvIm(4,6,6),RMsqVertexAhToSvImSvIm(4,6,6) 
Complex(dp) :: AmpTreeAhToSvImSvIm(4,6,6),AmpWaveAhToSvImSvIm(4,6,6)=(0._dp,0._dp),AmpVertexAhToSvImSvIm(4,6,6)& 
 & ,AmpVertexIRosAhToSvImSvIm(4,6,6),AmpVertexIRdrAhToSvImSvIm(4,6,6), AmpSumAhToSvImSvIm(4,6,6), AmpSum2AhToSvImSvIm(4,6,6) 
Complex(dp) :: AmpTreeZAhToSvImSvIm(4,6,6),AmpWaveZAhToSvImSvIm(4,6,6),AmpVertexZAhToSvImSvIm(4,6,6) 
Real(dp) :: AmpSqAhToSvImSvIm(4,6,6),  AmpSqTreeAhToSvImSvIm(4,6,6) 
Real(dp) :: MRPAhToSvReSvIm(4,6,6),MRGAhToSvReSvIm(4,6,6), MRPZAhToSvReSvIm(4,6,6),MRGZAhToSvReSvIm(4,6,6) 
Real(dp) :: MVPAhToSvReSvIm(4,6,6) 
Real(dp) :: RMsqTreeAhToSvReSvIm(4,6,6),RMsqWaveAhToSvReSvIm(4,6,6),RMsqVertexAhToSvReSvIm(4,6,6) 
Complex(dp) :: AmpTreeAhToSvReSvIm(4,6,6),AmpWaveAhToSvReSvIm(4,6,6)=(0._dp,0._dp),AmpVertexAhToSvReSvIm(4,6,6)& 
 & ,AmpVertexIRosAhToSvReSvIm(4,6,6),AmpVertexIRdrAhToSvReSvIm(4,6,6), AmpSumAhToSvReSvIm(4,6,6), AmpSum2AhToSvReSvIm(4,6,6) 
Complex(dp) :: AmpTreeZAhToSvReSvIm(4,6,6),AmpWaveZAhToSvReSvIm(4,6,6),AmpVertexZAhToSvReSvIm(4,6,6) 
Real(dp) :: AmpSqAhToSvReSvIm(4,6,6),  AmpSqTreeAhToSvReSvIm(4,6,6) 
Real(dp) :: MRPAhToSvReSvRe(4,6,6),MRGAhToSvReSvRe(4,6,6), MRPZAhToSvReSvRe(4,6,6),MRGZAhToSvReSvRe(4,6,6) 
Real(dp) :: MVPAhToSvReSvRe(4,6,6) 
Real(dp) :: RMsqTreeAhToSvReSvRe(4,6,6),RMsqWaveAhToSvReSvRe(4,6,6),RMsqVertexAhToSvReSvRe(4,6,6) 
Complex(dp) :: AmpTreeAhToSvReSvRe(4,6,6),AmpWaveAhToSvReSvRe(4,6,6)=(0._dp,0._dp),AmpVertexAhToSvReSvRe(4,6,6)& 
 & ,AmpVertexIRosAhToSvReSvRe(4,6,6),AmpVertexIRdrAhToSvReSvRe(4,6,6), AmpSumAhToSvReSvRe(4,6,6), AmpSum2AhToSvReSvRe(4,6,6) 
Complex(dp) :: AmpTreeZAhToSvReSvRe(4,6,6),AmpWaveZAhToSvReSvRe(4,6,6),AmpVertexZAhToSvReSvRe(4,6,6) 
Real(dp) :: AmpSqAhToSvReSvRe(4,6,6),  AmpSqTreeAhToSvReSvRe(4,6,6) 
Real(dp) :: MRPAhToAhAh(4,4,4),MRGAhToAhAh(4,4,4), MRPZAhToAhAh(4,4,4),MRGZAhToAhAh(4,4,4) 
Real(dp) :: MVPAhToAhAh(4,4,4) 
Real(dp) :: RMsqTreeAhToAhAh(4,4,4),RMsqWaveAhToAhAh(4,4,4),RMsqVertexAhToAhAh(4,4,4) 
Complex(dp) :: AmpTreeAhToAhAh(4,4,4),AmpWaveAhToAhAh(4,4,4)=(0._dp,0._dp),AmpVertexAhToAhAh(4,4,4)& 
 & ,AmpVertexIRosAhToAhAh(4,4,4),AmpVertexIRdrAhToAhAh(4,4,4), AmpSumAhToAhAh(4,4,4), AmpSum2AhToAhAh(4,4,4) 
Complex(dp) :: AmpTreeZAhToAhAh(4,4,4),AmpWaveZAhToAhAh(4,4,4),AmpVertexZAhToAhAh(4,4,4) 
Real(dp) :: AmpSqAhToAhAh(4,4,4),  AmpSqTreeAhToAhAh(4,4,4) 
Real(dp) :: MRPAhToAhVP(4,4),MRGAhToAhVP(4,4), MRPZAhToAhVP(4,4),MRGZAhToAhVP(4,4) 
Real(dp) :: MVPAhToAhVP(4,4) 
Real(dp) :: RMsqTreeAhToAhVP(4,4),RMsqWaveAhToAhVP(4,4),RMsqVertexAhToAhVP(4,4) 
Complex(dp) :: AmpTreeAhToAhVP(2,4,4),AmpWaveAhToAhVP(2,4,4)=(0._dp,0._dp),AmpVertexAhToAhVP(2,4,4)& 
 & ,AmpVertexIRosAhToAhVP(2,4,4),AmpVertexIRdrAhToAhVP(2,4,4), AmpSumAhToAhVP(2,4,4), AmpSum2AhToAhVP(2,4,4) 
Complex(dp) :: AmpTreeZAhToAhVP(2,4,4),AmpWaveZAhToAhVP(2,4,4),AmpVertexZAhToAhVP(2,4,4) 
Real(dp) :: AmpSqAhToAhVP(4,4),  AmpSqTreeAhToAhVP(4,4) 
Real(dp) :: MRPAhToAhVZ(4,4),MRGAhToAhVZ(4,4), MRPZAhToAhVZ(4,4),MRGZAhToAhVZ(4,4) 
Real(dp) :: MVPAhToAhVZ(4,4) 
Real(dp) :: RMsqTreeAhToAhVZ(4,4),RMsqWaveAhToAhVZ(4,4),RMsqVertexAhToAhVZ(4,4) 
Complex(dp) :: AmpTreeAhToAhVZ(2,4,4),AmpWaveAhToAhVZ(2,4,4)=(0._dp,0._dp),AmpVertexAhToAhVZ(2,4,4)& 
 & ,AmpVertexIRosAhToAhVZ(2,4,4),AmpVertexIRdrAhToAhVZ(2,4,4), AmpSumAhToAhVZ(2,4,4), AmpSum2AhToAhVZ(2,4,4) 
Complex(dp) :: AmpTreeZAhToAhVZ(2,4,4),AmpWaveZAhToAhVZ(2,4,4),AmpVertexZAhToAhVZ(2,4,4) 
Real(dp) :: AmpSqAhToAhVZ(4,4),  AmpSqTreeAhToAhVZ(4,4) 
Real(dp) :: MRPAhToAhVZp(4,4),MRGAhToAhVZp(4,4), MRPZAhToAhVZp(4,4),MRGZAhToAhVZp(4,4) 
Real(dp) :: MVPAhToAhVZp(4,4) 
Real(dp) :: RMsqTreeAhToAhVZp(4,4),RMsqWaveAhToAhVZp(4,4),RMsqVertexAhToAhVZp(4,4) 
Complex(dp) :: AmpTreeAhToAhVZp(2,4,4),AmpWaveAhToAhVZp(2,4,4)=(0._dp,0._dp),AmpVertexAhToAhVZp(2,4,4)& 
 & ,AmpVertexIRosAhToAhVZp(2,4,4),AmpVertexIRdrAhToAhVZp(2,4,4), AmpSumAhToAhVZp(2,4,4), AmpSum2AhToAhVZp(2,4,4) 
Complex(dp) :: AmpTreeZAhToAhVZp(2,4,4),AmpWaveZAhToAhVZp(2,4,4),AmpVertexZAhToAhVZp(2,4,4) 
Real(dp) :: AmpSqAhToAhVZp(4,4),  AmpSqTreeAhToAhVZp(4,4) 
Real(dp) :: MRPAhToGluGlu(4),MRGAhToGluGlu(4), MRPZAhToGluGlu(4),MRGZAhToGluGlu(4) 
Real(dp) :: MVPAhToGluGlu(4) 
Real(dp) :: RMsqTreeAhToGluGlu(4),RMsqWaveAhToGluGlu(4),RMsqVertexAhToGluGlu(4) 
Complex(dp) :: AmpTreeAhToGluGlu(2,4),AmpWaveAhToGluGlu(2,4)=(0._dp,0._dp),AmpVertexAhToGluGlu(2,4)& 
 & ,AmpVertexIRosAhToGluGlu(2,4),AmpVertexIRdrAhToGluGlu(2,4), AmpSumAhToGluGlu(2,4), AmpSum2AhToGluGlu(2,4) 
Complex(dp) :: AmpTreeZAhToGluGlu(2,4),AmpWaveZAhToGluGlu(2,4),AmpVertexZAhToGluGlu(2,4) 
Real(dp) :: AmpSqAhToGluGlu(4),  AmpSqTreeAhToGluGlu(4) 
Real(dp) :: MRPAhTohhhh(4,4,4),MRGAhTohhhh(4,4,4), MRPZAhTohhhh(4,4,4),MRGZAhTohhhh(4,4,4) 
Real(dp) :: MVPAhTohhhh(4,4,4) 
Real(dp) :: RMsqTreeAhTohhhh(4,4,4),RMsqWaveAhTohhhh(4,4,4),RMsqVertexAhTohhhh(4,4,4) 
Complex(dp) :: AmpTreeAhTohhhh(4,4,4),AmpWaveAhTohhhh(4,4,4)=(0._dp,0._dp),AmpVertexAhTohhhh(4,4,4)& 
 & ,AmpVertexIRosAhTohhhh(4,4,4),AmpVertexIRdrAhTohhhh(4,4,4), AmpSumAhTohhhh(4,4,4), AmpSum2AhTohhhh(4,4,4) 
Complex(dp) :: AmpTreeZAhTohhhh(4,4,4),AmpWaveZAhTohhhh(4,4,4),AmpVertexZAhTohhhh(4,4,4) 
Real(dp) :: AmpSqAhTohhhh(4,4,4),  AmpSqTreeAhTohhhh(4,4,4) 
Real(dp) :: MRPAhTohhVP(4,4),MRGAhTohhVP(4,4), MRPZAhTohhVP(4,4),MRGZAhTohhVP(4,4) 
Real(dp) :: MVPAhTohhVP(4,4) 
Real(dp) :: RMsqTreeAhTohhVP(4,4),RMsqWaveAhTohhVP(4,4),RMsqVertexAhTohhVP(4,4) 
Complex(dp) :: AmpTreeAhTohhVP(2,4,4),AmpWaveAhTohhVP(2,4,4)=(0._dp,0._dp),AmpVertexAhTohhVP(2,4,4)& 
 & ,AmpVertexIRosAhTohhVP(2,4,4),AmpVertexIRdrAhTohhVP(2,4,4), AmpSumAhTohhVP(2,4,4), AmpSum2AhTohhVP(2,4,4) 
Complex(dp) :: AmpTreeZAhTohhVP(2,4,4),AmpWaveZAhTohhVP(2,4,4),AmpVertexZAhTohhVP(2,4,4) 
Real(dp) :: AmpSqAhTohhVP(4,4),  AmpSqTreeAhTohhVP(4,4) 
Real(dp) :: MRPAhToVGVG(4),MRGAhToVGVG(4), MRPZAhToVGVG(4),MRGZAhToVGVG(4) 
Real(dp) :: MVPAhToVGVG(4) 
Real(dp) :: RMsqTreeAhToVGVG(4),RMsqWaveAhToVGVG(4),RMsqVertexAhToVGVG(4) 
Complex(dp) :: AmpTreeAhToVGVG(2,4),AmpWaveAhToVGVG(2,4)=(0._dp,0._dp),AmpVertexAhToVGVG(2,4)& 
 & ,AmpVertexIRosAhToVGVG(2,4),AmpVertexIRdrAhToVGVG(2,4), AmpSumAhToVGVG(2,4), AmpSum2AhToVGVG(2,4) 
Complex(dp) :: AmpTreeZAhToVGVG(2,4),AmpWaveZAhToVGVG(2,4),AmpVertexZAhToVGVG(2,4) 
Real(dp) :: AmpSqAhToVGVG(4),  AmpSqTreeAhToVGVG(4) 
Real(dp) :: MRPAhToVPVP(4),MRGAhToVPVP(4), MRPZAhToVPVP(4),MRGZAhToVPVP(4) 
Real(dp) :: MVPAhToVPVP(4) 
Real(dp) :: RMsqTreeAhToVPVP(4),RMsqWaveAhToVPVP(4),RMsqVertexAhToVPVP(4) 
Complex(dp) :: AmpTreeAhToVPVP(2,4),AmpWaveAhToVPVP(2,4)=(0._dp,0._dp),AmpVertexAhToVPVP(2,4)& 
 & ,AmpVertexIRosAhToVPVP(2,4),AmpVertexIRdrAhToVPVP(2,4), AmpSumAhToVPVP(2,4), AmpSum2AhToVPVP(2,4) 
Complex(dp) :: AmpTreeZAhToVPVP(2,4),AmpWaveZAhToVPVP(2,4),AmpVertexZAhToVPVP(2,4) 
Real(dp) :: AmpSqAhToVPVP(4),  AmpSqTreeAhToVPVP(4) 
Real(dp) :: MRPAhToVPVZ(4),MRGAhToVPVZ(4), MRPZAhToVPVZ(4),MRGZAhToVPVZ(4) 
Real(dp) :: MVPAhToVPVZ(4) 
Real(dp) :: RMsqTreeAhToVPVZ(4),RMsqWaveAhToVPVZ(4),RMsqVertexAhToVPVZ(4) 
Complex(dp) :: AmpTreeAhToVPVZ(2,4),AmpWaveAhToVPVZ(2,4)=(0._dp,0._dp),AmpVertexAhToVPVZ(2,4)& 
 & ,AmpVertexIRosAhToVPVZ(2,4),AmpVertexIRdrAhToVPVZ(2,4), AmpSumAhToVPVZ(2,4), AmpSum2AhToVPVZ(2,4) 
Complex(dp) :: AmpTreeZAhToVPVZ(2,4),AmpWaveZAhToVPVZ(2,4),AmpVertexZAhToVPVZ(2,4) 
Real(dp) :: AmpSqAhToVPVZ(4),  AmpSqTreeAhToVPVZ(4) 
Real(dp) :: MRPAhToVPVZp(4),MRGAhToVPVZp(4), MRPZAhToVPVZp(4),MRGZAhToVPVZp(4) 
Real(dp) :: MVPAhToVPVZp(4) 
Real(dp) :: RMsqTreeAhToVPVZp(4),RMsqWaveAhToVPVZp(4),RMsqVertexAhToVPVZp(4) 
Complex(dp) :: AmpTreeAhToVPVZp(2,4),AmpWaveAhToVPVZp(2,4)=(0._dp,0._dp),AmpVertexAhToVPVZp(2,4)& 
 & ,AmpVertexIRosAhToVPVZp(2,4),AmpVertexIRdrAhToVPVZp(2,4), AmpSumAhToVPVZp(2,4), AmpSum2AhToVPVZp(2,4) 
Complex(dp) :: AmpTreeZAhToVPVZp(2,4),AmpWaveZAhToVPVZp(2,4),AmpVertexZAhToVPVZp(2,4) 
Real(dp) :: AmpSqAhToVPVZp(4),  AmpSqTreeAhToVPVZp(4) 
Real(dp) :: MRPAhToVWmcVWm(4),MRGAhToVWmcVWm(4), MRPZAhToVWmcVWm(4),MRGZAhToVWmcVWm(4) 
Real(dp) :: MVPAhToVWmcVWm(4) 
Real(dp) :: RMsqTreeAhToVWmcVWm(4),RMsqWaveAhToVWmcVWm(4),RMsqVertexAhToVWmcVWm(4) 
Complex(dp) :: AmpTreeAhToVWmcVWm(2,4),AmpWaveAhToVWmcVWm(2,4)=(0._dp,0._dp),AmpVertexAhToVWmcVWm(2,4)& 
 & ,AmpVertexIRosAhToVWmcVWm(2,4),AmpVertexIRdrAhToVWmcVWm(2,4), AmpSumAhToVWmcVWm(2,4), AmpSum2AhToVWmcVWm(2,4) 
Complex(dp) :: AmpTreeZAhToVWmcVWm(2,4),AmpWaveZAhToVWmcVWm(2,4),AmpVertexZAhToVWmcVWm(2,4) 
Real(dp) :: AmpSqAhToVWmcVWm(4),  AmpSqTreeAhToVWmcVWm(4) 
Real(dp) :: MRPAhToVZVZ(4),MRGAhToVZVZ(4), MRPZAhToVZVZ(4),MRGZAhToVZVZ(4) 
Real(dp) :: MVPAhToVZVZ(4) 
Real(dp) :: RMsqTreeAhToVZVZ(4),RMsqWaveAhToVZVZ(4),RMsqVertexAhToVZVZ(4) 
Complex(dp) :: AmpTreeAhToVZVZ(2,4),AmpWaveAhToVZVZ(2,4)=(0._dp,0._dp),AmpVertexAhToVZVZ(2,4)& 
 & ,AmpVertexIRosAhToVZVZ(2,4),AmpVertexIRdrAhToVZVZ(2,4), AmpSumAhToVZVZ(2,4), AmpSum2AhToVZVZ(2,4) 
Complex(dp) :: AmpTreeZAhToVZVZ(2,4),AmpWaveZAhToVZVZ(2,4),AmpVertexZAhToVZVZ(2,4) 
Real(dp) :: AmpSqAhToVZVZ(4),  AmpSqTreeAhToVZVZ(4) 
Real(dp) :: MRPAhToVZVZp(4),MRGAhToVZVZp(4), MRPZAhToVZVZp(4),MRGZAhToVZVZp(4) 
Real(dp) :: MVPAhToVZVZp(4) 
Real(dp) :: RMsqTreeAhToVZVZp(4),RMsqWaveAhToVZVZp(4),RMsqVertexAhToVZVZp(4) 
Complex(dp) :: AmpTreeAhToVZVZp(2,4),AmpWaveAhToVZVZp(2,4)=(0._dp,0._dp),AmpVertexAhToVZVZp(2,4)& 
 & ,AmpVertexIRosAhToVZVZp(2,4),AmpVertexIRdrAhToVZVZp(2,4), AmpSumAhToVZVZp(2,4), AmpSum2AhToVZVZp(2,4) 
Complex(dp) :: AmpTreeZAhToVZVZp(2,4),AmpWaveZAhToVZVZp(2,4),AmpVertexZAhToVZVZp(2,4) 
Real(dp) :: AmpSqAhToVZVZp(4),  AmpSqTreeAhToVZVZp(4) 
Real(dp) :: MRPAhToVZpVZp(4),MRGAhToVZpVZp(4), MRPZAhToVZpVZp(4),MRGZAhToVZpVZp(4) 
Real(dp) :: MVPAhToVZpVZp(4) 
Real(dp) :: RMsqTreeAhToVZpVZp(4),RMsqWaveAhToVZpVZp(4),RMsqVertexAhToVZpVZp(4) 
Complex(dp) :: AmpTreeAhToVZpVZp(2,4),AmpWaveAhToVZpVZp(2,4)=(0._dp,0._dp),AmpVertexAhToVZpVZp(2,4)& 
 & ,AmpVertexIRosAhToVZpVZp(2,4),AmpVertexIRdrAhToVZpVZp(2,4), AmpSumAhToVZpVZp(2,4), AmpSum2AhToVZpVZp(2,4) 
Complex(dp) :: AmpTreeZAhToVZpVZp(2,4),AmpWaveZAhToVZpVZp(2,4),AmpVertexZAhToVZpVZp(2,4) 
Real(dp) :: AmpSqAhToVZpVZp(4),  AmpSqTreeAhToVZpVZp(4) 
Write(*,*) "Calculating one-loop decays of Ah " 
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
isave = 3

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTohhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  Else 
Call Amplitude_Tree_BLSSM_AhTohhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,MRPAhTohhAh,       & 
& MRGAhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,MRPAhTohhAh,      & 
& MRGAhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPAhTohhAh,           & 
& MRGAhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPAhTohhAh,          & 
& MRGAhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTohhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,Mhh2,           & 
& ZfAh,Zfhh,AmpWaveAhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,    & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,        & 
& cplAhAhVPVZp1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexAhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,    & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,        & 
& cplAhAhVPVZp1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRdrAhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,ZcplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,    & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,cplAhAhVPVZp1,         & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhhhHpmcHpm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& ZcplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,    & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,        & 
& cplAhAhVPVZp1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRosAhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,    & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,cplAhAhVPVZp1,         & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhhhHpmcHpm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,    & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVPVZ1,        & 
& cplAhAhVPVZp1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRosAhTohhAh)

 End if 
 End if 
AmpVertexAhTohhAh = AmpVertexAhTohhAh -  AmpVertexIRdrAhTohhAh! +  AmpVertexIRosAhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhAh(gt2,:,:) = AmpWaveZAhTohhAh(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(gt1,:,:) 
AmpVertexZAhTohhAh(gt2,:,:)= AmpVertexZAhTohhAh(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 1 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhAh(:,gt2,:) = AmpWaveZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWaveAhTohhAh(:,gt1,:) 
AmpVertexZAhTohhAh(:,gt2,:)= AmpVertexZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexAhTohhAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 2 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhAh(:,:,gt2) = AmpWaveZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(:,:,gt1) 
AmpVertexZAhTohhAh(:,:,gt2)= AmpVertexZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhAh = AmpVertexAhTohhAh  +  AmpVertexIRosAhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh 
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh  
Else 
 AmpSumAhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpWaveAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
Else  
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTohhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MAh(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,MAh,MCha,           & 
& MAh2,MCha2,AmpTreeAhTocChaCha)

  Else 
Call Amplitude_Tree_BLSSM_AhTocChaCha(ZcplcChaChaAhL,ZcplcChaChaAhR,MAh,              & 
& MCha,MAh2,MCha2,AmpTreeAhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,          & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,        & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,          & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,        & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL,    & 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveAhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexAhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrAhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
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
& cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
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
& cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

 End if 
 End if 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha -  AmpVertexIRdrAhTocChaCha! +  AmpVertexIRosAhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocChaCha(:,gt2,:,:) = AmpWaveZAhTocChaCha(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocChaCha(:,gt1,:,:) 
AmpVertexZAhTocChaCha(:,gt2,:,:)= AmpVertexZAhTocChaCha(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 1 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocChaCha(1,:,gt2,:) = AmpWaveZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(1,:,gt1,:) 
AmpVertexZAhTocChaCha(1,:,gt2,:)= AmpVertexZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(1,:,gt1,:) 
AmpWaveZAhTocChaCha(2,:,gt2,:) = AmpWaveZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveAhTocChaCha(2,:,gt1,:) 
AmpVertexZAhTocChaCha(2,:,gt2,:)= AmpVertexZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexAhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 2 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocChaCha(1,:,:,gt2) = AmpWaveZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveAhTocChaCha(1,:,:,gt1) 
AmpVertexZAhTocChaCha(1,:,:,gt2)= AmpVertexZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexAhTocChaCha(1,:,:,gt1) 
AmpWaveZAhTocChaCha(2,:,:,gt2) = AmpWaveZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(2,:,:,gt1) 
AmpVertexZAhTocChaCha(2,:,:,gt2)= AmpVertexZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha  +  AmpVertexIRosAhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha 
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha  
Else 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,2
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MCha(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpWaveAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocChaCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToChiChi(cplChiChiAhL,cplChiChiAhR,MAh,MChi,              & 
& MAh2,MChi2,AmpTreeAhToChiChi)

  Else 
Call Amplitude_Tree_BLSSM_AhToChiChi(ZcplChiChiAhL,ZcplChiChiAhR,MAh,MChi,            & 
& MAh2,MChi2,AmpTreeAhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,             & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,           & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,             & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,           & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToChiChi(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,        & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveAhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexAhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrAhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& AmpVertexIRosAhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& AmpVertexIRosAhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 End if 
AmpVertexAhToChiChi = AmpVertexAhToChiChi -  AmpVertexIRdrAhToChiChi! +  AmpVertexIRosAhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToChiChi(:,gt2,:,:) = AmpWaveZAhToChiChi(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToChiChi(:,gt1,:,:) 
AmpVertexZAhToChiChi(:,gt2,:,:)= AmpVertexZAhToChiChi(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 1 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZAhToChiChi(1,:,gt2,:) = AmpWaveZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,gt1,:) 
AmpVertexZAhToChiChi(1,:,gt2,:)= AmpVertexZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,gt1,:) 
AmpWaveZAhToChiChi(2,:,gt2,:) = AmpWaveZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveAhToChiChi(2,:,gt1,:) 
AmpVertexZAhToChiChi(2,:,gt2,:)= AmpVertexZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexAhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 2 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZAhToChiChi(1,:,:,gt2) = AmpWaveZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,:,gt1) 
AmpVertexZAhToChiChi(1,:,:,gt2)= AmpVertexZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,:,gt1) 
AmpWaveZAhToChiChi(2,:,:,gt2) = AmpWaveZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(2,:,:,gt1) 
AmpVertexZAhToChiChi(2,:,:,gt2)= AmpVertexZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexAhToChiChi = AmpVertexAhToChiChi  +  AmpVertexIRosAhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi 
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi  
Else 
 AmpSumAhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,7
    Do gt3=gt2,7
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MChi(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpWaveAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToChiChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,MAh,MFd,MAh2,             & 
& MFd2,AmpTreeAhTocFdFd)

  Else 
Call Amplitude_Tree_BLSSM_AhTocFdFd(ZcplcFdFdAhL,ZcplcFdFdAhR,MAh,MFd,MAh2,           & 
& MFd2,AmpTreeAhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,MAhOS,          & 
& MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,              & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,MAh,            & 
& MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,              & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,ctcplcFdFdAhL,            & 
& ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfFDL,ZfFDR,AmpWaveAhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexAhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRdrAhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,    & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,    & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 End if 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd -  AmpVertexIRdrAhTocFdFd! +  AmpVertexIRosAhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocFdFd(:,gt2,:,:) = AmpWaveZAhTocFdFd(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFdFd(:,gt1,:,:) 
AmpVertexZAhTocFdFd(:,gt2,:,:)= AmpVertexZAhTocFdFd(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 1 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,gt2,:) = AmpWaveZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(1,:,gt1,:) 
AmpVertexZAhTocFdFd(1,:,gt2,:)= AmpVertexZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(1,:,gt1,:) 
AmpWaveZAhTocFdFd(2,:,gt2,:) = AmpWaveZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWaveAhTocFdFd(2,:,gt1,:) 
AmpVertexZAhTocFdFd(2,:,gt2,:)= AmpVertexZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexAhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 2 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,:,gt2) = AmpWaveZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWaveAhTocFdFd(1,:,:,gt1) 
AmpVertexZAhTocFdFd(1,:,:,gt2)= AmpVertexZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexAhTocFdFd(1,:,:,gt1) 
AmpWaveZAhTocFdFd(2,:,:,gt2) = AmpWaveZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(2,:,:,gt1) 
AmpVertexZAhTocFdFd(2,:,:,gt2)= AmpVertexZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd  +  AmpVertexIRosAhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd 
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd  
Else 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFd(gt2))+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpWaveAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,MAh,MFe,MAh2,             & 
& MFe2,AmpTreeAhTocFeFe)

  Else 
Call Amplitude_Tree_BLSSM_AhTocFeFe(ZcplcFeFeAhL,ZcplcFeFeAhR,MAh,MFe,MAh2,           & 
& MFe2,AmpTreeAhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,MAhOS,          & 
& MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,              & 
& MAhOS,MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,MAh,            & 
& MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,              & 
& MAh,MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,ctcplcFeFeAhL,            & 
& ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfFEL,ZfFER,AmpWaveAhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,             & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,AmpVertexAhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,AmpVertexIRdrAhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,          & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 End if 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe -  AmpVertexIRdrAhTocFeFe! +  AmpVertexIRosAhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocFeFe(:,gt2,:,:) = AmpWaveZAhTocFeFe(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFeFe(:,gt1,:,:) 
AmpVertexZAhTocFeFe(:,gt2,:,:)= AmpVertexZAhTocFeFe(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
! Final State 1 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,:,gt2,:) = AmpWaveZAhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWaveAhTocFeFe(1,:,gt1,:) 
AmpVertexZAhTocFeFe(1,:,gt2,:)= AmpVertexZAhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexAhTocFeFe(1,:,gt1,:) 
AmpWaveZAhTocFeFe(2,:,gt2,:) = AmpWaveZAhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWaveAhTocFeFe(2,:,gt1,:) 
AmpVertexZAhTocFeFe(2,:,gt2,:)= AmpVertexZAhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexAhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
! Final State 2 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,:,:,gt2) = AmpWaveZAhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveAhTocFeFe(1,:,:,gt1) 
AmpVertexZAhTocFeFe(1,:,:,gt2)= AmpVertexZAhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexAhTocFeFe(1,:,:,gt1) 
AmpWaveZAhTocFeFe(2,:,:,gt2) = AmpWaveZAhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWaveAhTocFeFe(2,:,:,gt1) 
AmpVertexZAhTocFeFe(2,:,:,gt2)= AmpVertexZAhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexAhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe  +  AmpVertexIRosAhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe 
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe  
Else 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFe(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpWaveAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3) + AmpSqTreeAhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3) + AmpSqTreeAhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFeFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqAhTocFeFe(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqAhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt1, gt2, gt3) + MRGAhTocFeFe(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt1, gt2, gt3) + MRGAhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,MAh,MFu,MAh2,             & 
& MFu2,AmpTreeAhTocFuFu)

  Else 
Call Amplitude_Tree_BLSSM_AhTocFuFu(ZcplcFuFuAhL,ZcplcFuFuAhR,MAh,MFu,MAh2,           & 
& MFu2,AmpTreeAhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,MAhOS,          & 
& MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,              & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,MAh,            & 
& MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,              & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,ctcplcFuFuAhL,            & 
& ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfFUL,ZfFUR,AmpWaveAhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexAhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRdrAhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,             & 
& cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,             & 
& cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 End if 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu -  AmpVertexIRdrAhTocFuFu! +  AmpVertexIRosAhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocFuFu(:,gt2,:,:) = AmpWaveZAhTocFuFu(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFuFu(:,gt1,:,:) 
AmpVertexZAhTocFuFu(:,gt2,:,:)= AmpVertexZAhTocFuFu(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 1 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,gt2,:) = AmpWaveZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(1,:,gt1,:) 
AmpVertexZAhTocFuFu(1,:,gt2,:)= AmpVertexZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(1,:,gt1,:) 
AmpWaveZAhTocFuFu(2,:,gt2,:) = AmpWaveZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveAhTocFuFu(2,:,gt1,:) 
AmpVertexZAhTocFuFu(2,:,gt2,:)= AmpVertexZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexAhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 2 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,:,gt2) = AmpWaveZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWaveAhTocFuFu(1,:,:,gt1) 
AmpVertexZAhTocFuFu(1,:,:,gt2)= AmpVertexZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexAhTocFuFu(1,:,:,gt1) 
AmpWaveZAhTocFuFu(2,:,:,gt2) = AmpWaveZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(2,:,:,gt1) 
AmpVertexZAhTocFuFu(2,:,:,gt2)= AmpVertexZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu  +  AmpVertexIRosAhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu 
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu  
Else 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MFuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFu(gt2))+Abs(MFu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpWaveAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Fv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToFvFv(cplFvFvAhL,cplFvFvAhR,MAh,MFv,MAh2,MFv2,           & 
& AmpTreeAhToFvFv)

  Else 
Call Amplitude_Tree_BLSSM_AhToFvFv(ZcplFvFvAhL,ZcplFvFvAhR,MAh,MFv,MAh2,              & 
& MFv2,AmpTreeAhToFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToFvFv(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,MAhOS,             & 
& MFvOS,MRPAhToFvFv,MRGAhToFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToFvFv(MLambda,em,gs,ZcplFvFvAhL,ZcplFvFvAhR,MAhOS,           & 
& MFvOS,MRPAhToFvFv,MRGAhToFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToFvFv(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,MAh,               & 
& MFv,MRPAhToFvFv,MRGAhToFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToFvFv(MLambda,em,gs,ZcplFvFvAhL,ZcplFvFvAhR,MAh,             & 
& MFv,MRPAhToFvFv,MRGAhToFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToFvFv(cplFvFvAhL,cplFvFvAhR,ctcplFvFvAhL,ctcplFvFvAhR,   & 
& MAh,MAh2,MFv,MFv2,ZfAh,ZfFvm,AmpWaveAhToFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,             & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexAhToFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRdrAhToFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,ZcplFvFvAhL,ZcplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosAhToFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,ZcplFvFvAhL,ZcplFvFvAhR,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhToFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,          & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexIRosAhToFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhToFvFv)

 End if 
 End if 
AmpVertexAhToFvFv = AmpVertexAhToFvFv -  AmpVertexIRdrAhToFvFv! +  AmpVertexIRosAhToFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToFvFv=0._dp 
AmpVertexZAhToFvFv=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToFvFv(:,gt2,:,:) = AmpWaveZAhToFvFv(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToFvFv(:,gt1,:,:) 
AmpVertexZAhToFvFv(:,gt2,:,:)= AmpVertexZAhToFvFv(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToFvFv=AmpWaveZAhToFvFv 
AmpVertexAhToFvFv= AmpVertexZAhToFvFv
! Final State 1 
AmpWaveZAhToFvFv=0._dp 
AmpVertexZAhToFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToFvFv(1,:,gt2,:) = AmpWaveZAhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveAhToFvFv(1,:,gt1,:) 
AmpVertexZAhToFvFv(1,:,gt2,:)= AmpVertexZAhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexAhToFvFv(1,:,gt1,:) 
AmpWaveZAhToFvFv(2,:,gt2,:) = AmpWaveZAhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveAhToFvFv(2,:,gt1,:) 
AmpVertexZAhToFvFv(2,:,gt2,:)= AmpVertexZAhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexAhToFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToFvFv=AmpWaveZAhToFvFv 
AmpVertexAhToFvFv= AmpVertexZAhToFvFv
! Final State 2 
AmpWaveZAhToFvFv=0._dp 
AmpVertexZAhToFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToFvFv(1,:,:,gt2) = AmpWaveZAhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveAhToFvFv(1,:,:,gt1) 
AmpVertexZAhToFvFv(1,:,:,gt2)= AmpVertexZAhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexAhToFvFv(1,:,:,gt1) 
AmpWaveZAhToFvFv(2,:,:,gt2) = AmpWaveZAhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveAhToFvFv(2,:,:,gt1) 
AmpVertexZAhToFvFv(2,:,:,gt2)= AmpVertexZAhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexAhToFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToFvFv=AmpWaveZAhToFvFv 
AmpVertexAhToFvFv= AmpVertexZAhToFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexAhToFvFv = AmpVertexAhToFvFv  +  AmpVertexIRosAhToFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Fv Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToFvFv = AmpTreeAhToFvFv 
 AmpSum2AhToFvFv = AmpTreeAhToFvFv + 2._dp*AmpWaveAhToFvFv + 2._dp*AmpVertexAhToFvFv  
Else 
 AmpSumAhToFvFv = AmpTreeAhToFvFv + AmpWaveAhToFvFv + AmpVertexAhToFvFv
 AmpSum2AhToFvFv = AmpTreeAhToFvFv + AmpWaveAhToFvFv + AmpVertexAhToFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToFvFv = AmpTreeAhToFvFv
 AmpSum2AhToFvFv = AmpTreeAhToFvFv 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MFvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFv(gt2))+Abs(MFv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToFvFv = AmpTreeAhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToFvFv(gt1, gt2, gt3) 
  AmpSum2AhToFvFv = 2._dp*AmpWaveAhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToFvFv(gt1, gt2, gt3) 
  AmpSum2AhToFvFv = 2._dp*AmpVertexAhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToFvFv(gt1, gt2, gt3) 
  AmpSum2AhToFvFv = AmpTreeAhToFvFv + 2._dp*AmpWaveAhToFvFv + 2._dp*AmpVertexAhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToFvFv = AmpTreeAhToFvFv
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreeAhToFvFv(gt1, gt2, gt3) = AmpSqAhToFvFv(gt1, gt2, gt3)  
  AmpSum2AhToFvFv = + 2._dp*AmpWaveAhToFvFv + 2._dp*AmpVertexAhToFvFv
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
  AmpSqAhToFvFv(gt1, gt2, gt3) = AmpSqAhToFvFv(gt1, gt2, gt3) + AmpSqTreeAhToFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2AhToFvFv = AmpTreeAhToFvFv
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreeAhToFvFv(gt1, gt2, gt3) = AmpSqAhToFvFv(gt1, gt2, gt3)  
  AmpSum2AhToFvFv = + 2._dp*AmpWaveAhToFvFv + 2._dp*AmpVertexAhToFvFv
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhToFvFv(:,gt1, gt2, gt3),AmpSum2AhToFvFv(:,gt1, gt2, gt3),AmpSqAhToFvFv(gt1, gt2, gt3)) 
  AmpSqAhToFvFv(gt1, gt2, gt3) = AmpSqAhToFvFv(gt1, gt2, gt3) + AmpSqTreeAhToFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToFvFv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqAhToFvFv(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqAhToFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToFvFv(gt1, gt2, gt3) + MRGAhToFvFv(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToFvFv(gt1, gt2, gt3) + MRGAhToFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTohhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,              & 
& AmpTreeAhTohhVZ)

  Else 
Call Amplitude_Tree_BLSSM_AhTohhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,             & 
& AmpTreeAhTohhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,MVZOS,             & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,MVZOS,            & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,MRPAhTohhVZ,       & 
& MRGAhTohhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,MRPAhTohhVZ,      & 
& MRGAhTohhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTohhVZ(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVPVZ,         & 
& ZfVZ,ZfVZpVZ,AmpWaveAhTohhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,          & 
& cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,               & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexAhTohhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,          & 
& cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,               & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRdrAhTohhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,ZcplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,     & 
& cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,               & 
& cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,ZcplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,          & 
& cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,               & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,     & 
& cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,               & 
& cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,          & 
& cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,               & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 End if 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ -  AmpVertexIRdrAhTohhVZ! +  AmpVertexIRosAhTohhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhVZ(:,gt2,:) = AmpWaveZAhTohhVZ(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhVZ(:,gt1,:) 
AmpVertexZAhTohhVZ(:,gt2,:)= AmpVertexZAhTohhVZ(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
! Final State 1 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhVZ(:,:,gt2) = AmpWaveZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZ(:,:,gt1) 
AmpVertexZAhTohhVZ(:,:,gt2)= AmpVertexZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ  +  AmpVertexIRosAhTohhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ 
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ  
Else 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpWaveAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
Else  
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
End if  
Else  
  AmpSqAhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqAhTohhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqAhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTohhVZp(cplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,MVZp2,          & 
& AmpTreeAhTohhVZp)

  Else 
Call Amplitude_Tree_BLSSM_AhTohhVZp(ZcplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,               & 
& MVZp2,AmpTreeAhTohhVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZp(MLambda,em,gs,cplAhhhVZp,MAhOS,MhhOS,MVZpOS,          & 
& MRPAhTohhVZp,MRGAhTohhVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZp(MLambda,em,gs,ZcplAhhhVZp,MAhOS,MhhOS,MVZpOS,         & 
& MRPAhTohhVZp,MRGAhTohhVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTohhVZp(MLambda,em,gs,cplAhhhVZp,MAh,Mhh,MVZp,MRPAhTohhVZp,   & 
& MRGAhTohhVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTohhVZp(MLambda,em,gs,ZcplAhhhVZp,MAh,Mhh,MVZp,               & 
& MRPAhTohhVZp,MRGAhTohhVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTohhVZp(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,       & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZp,MVZp2,ZfAh,Zfhh,              & 
& ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveAhTohhVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexAhTohhVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRdrAhTohhVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,ZcplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,ZcplAhhhVZp,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,      & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVPVZp1,          & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

 End if 
 End if 
AmpVertexAhTohhVZp = AmpVertexAhTohhVZp -  AmpVertexIRdrAhTohhVZp! +  AmpVertexIRosAhTohhVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhVZp=0._dp 
AmpVertexZAhTohhVZp=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhVZp(:,gt2,:) = AmpWaveZAhTohhVZp(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhVZp(:,gt1,:) 
AmpVertexZAhTohhVZp(:,gt2,:)= AmpVertexZAhTohhVZp(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhVZp=AmpWaveZAhTohhVZp 
AmpVertexAhTohhVZp= AmpVertexZAhTohhVZp
! Final State 1 
AmpWaveZAhTohhVZp=0._dp 
AmpVertexZAhTohhVZp=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTohhVZp(:,:,gt2) = AmpWaveZAhTohhVZp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZp(:,:,gt1) 
AmpVertexZAhTohhVZp(:,:,gt2)= AmpVertexZAhTohhVZp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZp=AmpWaveZAhTohhVZp 
AmpVertexAhTohhVZp= AmpVertexZAhTohhVZp
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZp = AmpVertexAhTohhVZp  +  AmpVertexIRosAhTohhVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp 
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp  
Else 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp + AmpWaveAhTohhVZp + AmpVertexAhTohhVZp
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + AmpWaveAhTohhVZp + AmpVertexAhTohhVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = 2._dp*AmpWaveAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = 2._dp*AmpVertexAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqTreeAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2)  
  AmpSum2AhTohhVZp = + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2) + AmpSqTreeAhTohhVZp(gt1, gt2)  
Else  
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqTreeAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2)  
  AmpSum2AhTohhVZp = + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2) + AmpSqTreeAhTohhVZp(gt1, gt2)  
End if  
Else  
  AmpSqAhTohhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZp(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MVZpOS,helfactor*AmpSqAhTohhVZp(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVZp,helfactor*AmpSqAhTohhVZp(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPAhTohhVZp(gt1, gt2) + MRGAhTohhVZp(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPAhTohhVZp(gt1, gt2) + MRGAhTohhVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocHpmHpm(cplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,               & 
& AmpTreeAhTocHpmHpm)

  Else 
Call Amplitude_Tree_BLSSM_AhTocHpmHpm(ZcplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,              & 
& AmpTreeAhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAhOS,MHpmOS,            & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAhOS,MHpmOS,           & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAh,MHpm,MRPAhTocHpmHpm, & 
& MRGAhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAh,MHpm,               & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocHpmHpm(cplAhHpmcHpm,ctcplAhHpmcHpm,MAh,MAh2,           & 
& MHpm,MHpm2,ZfAh,ZfHpm,AmpWaveAhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,     & 
& cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,     & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,    & 
& cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,  & 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexAhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,     & 
& cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,     & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,    & 
& cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,  & 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRdrAhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ZcplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,   & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,      & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1, & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,   & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ZcplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,     & 
& cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,     & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,    & 
& cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,  & 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosAhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,   & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,      & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1, & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,   & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,     & 
& cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgWmgZpHpm,cplcgWpCgZpcHpm,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,      & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,     & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,    & 
& cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,  & 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosAhTocHpmHpm)

 End if 
 End if 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm -  AmpVertexIRdrAhTocHpmHpm! +  AmpVertexIRosAhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocHpmHpm(gt2,:,:) = AmpWaveZAhTocHpmHpm(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocHpmHpm(gt1,:,:) 
AmpVertexZAhTocHpmHpm(gt2,:,:)= AmpVertexZAhTocHpmHpm(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 1 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHpmHpm(:,gt2,:) = AmpWaveZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,gt1,:) 
AmpVertexZAhTocHpmHpm(:,gt2,:)= AmpVertexZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 2 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHpmHpm(:,:,gt2) = AmpWaveZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,:,gt1) 
AmpVertexZAhTocHpmHpm(:,:,gt2)= AmpVertexZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm  +  AmpVertexIRosAhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm 
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm  
Else 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpWaveAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocHpmHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToHpmcVWm(cplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,MHpm2,          & 
& MVWm2,AmpTreeAhToHpmcVWm)

  Else 
Call Amplitude_Tree_BLSSM_AhToHpmcVWm(ZcplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,               & 
& MHpm2,MVWm2,AmpTreeAhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAhOS,MHpmOS,            & 
& MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAhOS,MHpmOS,           & 
& MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAh,MHpm,MVWm,           & 
& MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAh,MHpm,               & 
& MVWm,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToHpmcVWm(cplAhHpmcVWm,ctcplAhHpmcVWm,MAh,MAh2,           & 
& MHpm,MHpm2,MVWm,MVWm2,ZfAh,ZfHpm,ZfVWm,AmpWaveAhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,               & 
& cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,     & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,  & 
& AmpVertexAhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,               & 
& cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,     & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,  & 
& AmpVertexIRdrAhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GosZcplAhHpmcHpm,ZcplAhHpmcVWm,          & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,     & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,& 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,GosZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,   & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GZcplAhHpmcHpm,             & 
& ZcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,            & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,               & 
& cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,GZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,     & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,  & 
& AmpVertexIRosAhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,     & 
& cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,& 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,GcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,               & 
& cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,     & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,  & 
& AmpVertexIRosAhToHpmcVWm)

 End if 
 End if 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm -  AmpVertexIRdrAhToHpmcVWm! +  AmpVertexIRosAhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToHpmcVWm(:,gt2,:) = AmpWaveZAhToHpmcVWm(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhToHpmcVWm(:,gt1,:) 
AmpVertexZAhToHpmcVWm(:,gt2,:)= AmpVertexZAhToHpmcVWm(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
! Final State 1 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhToHpmcVWm(:,:,gt2) = AmpWaveZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhToHpmcVWm(:,:,gt1) 
AmpVertexZAhToHpmcVWm(:,:,gt2)= AmpVertexZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm  +  AmpVertexIRosAhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm 
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm  
Else 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpWaveAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqAhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToHpmcVWm(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Sd) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocSdSd(cplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  Else 
Call Amplitude_Tree_BLSSM_AhTocSdSd(ZcplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAhOS,MSdOS,MRPAhTocSdSd,    & 
& MRGAhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAhOS,MSdOS,MRPAhTocSdSd,   & 
& MRGAhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAh,MSd,MRPAhTocSdSd,        & 
& MRGAhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAh,MSd,MRPAhTocSdSd,       & 
& MRGAhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocSdSd(cplAhSdcSd,ctcplAhSdcSd,MAh,MAh2,MSd,             & 
& MSd2,ZfAh,ZfSd,AmpWaveAhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexAhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRdrAhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosAhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,AmpVertexIRosAhTocSdSd)

 End if 
 End if 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd -  AmpVertexIRdrAhTocSdSd! +  AmpVertexIRosAhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocSdSd(gt2,:,:) = AmpWaveZAhTocSdSd(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSdSd(gt1,:,:) 
AmpVertexZAhTocSdSd(gt2,:,:)= AmpVertexZAhTocSdSd(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 1 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,gt2,:) = AmpWaveZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveAhTocSdSd(:,gt1,:) 
AmpVertexZAhTocSdSd(:,gt2,:)= AmpVertexZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexAhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 2 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,:,gt2) = AmpWaveZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveAhTocSdSd(:,:,gt1) 
AmpVertexZAhTocSdSd(:,:,gt2)= AmpVertexZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexAhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd  +  AmpVertexIRosAhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd 
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd  
Else 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSd(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpWaveAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSdSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Se) Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocSeSe(cplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeAhTocSeSe)

  Else 
Call Amplitude_Tree_BLSSM_AhTocSeSe(ZcplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeAhTocSeSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocSeSe(MLambda,em,gs,cplAhSecSe,MAhOS,MSeOS,MRPAhTocSeSe,    & 
& MRGAhTocSeSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocSeSe(MLambda,em,gs,ZcplAhSecSe,MAhOS,MSeOS,MRPAhTocSeSe,   & 
& MRGAhTocSeSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocSeSe(MLambda,em,gs,cplAhSecSe,MAh,MSe,MRPAhTocSeSe,        & 
& MRGAhTocSeSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocSeSe(MLambda,em,gs,ZcplAhSecSe,MAh,MSe,MRPAhTocSeSe,       & 
& MRGAhTocSeSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocSeSe(cplAhSecSe,ctcplAhSecSe,MAh,MAh2,MSe,             & 
& MSe2,ZfAh,ZfSe,AmpWaveAhTocSeSe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSd,             & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,            & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,     & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexAhTocSeSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,     & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRdrAhTocSeSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,ZcplAhSecSe,       & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,           & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,      & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosAhTocSeSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& ZcplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,         & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,     & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosAhTocSeSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,           & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,      & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosAhTocSeSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,     & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosAhTocSeSe)

 End if 
 End if 
AmpVertexAhTocSeSe = AmpVertexAhTocSeSe -  AmpVertexIRdrAhTocSeSe! +  AmpVertexIRosAhTocSeSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocSeSe(gt2,:,:) = AmpWaveZAhTocSeSe(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSeSe(gt1,:,:) 
AmpVertexZAhTocSeSe(gt2,:,:)= AmpVertexZAhTocSeSe(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSeSe(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
! Final State 1 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSeSe(:,gt2,:) = AmpWaveZAhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveAhTocSeSe(:,gt1,:) 
AmpVertexZAhTocSeSe(:,gt2,:)= AmpVertexZAhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexAhTocSeSe(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
! Final State 2 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSeSe(:,:,gt2) = AmpWaveZAhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveAhTocSeSe(:,:,gt1) 
AmpVertexZAhTocSeSe(:,:,gt2)= AmpVertexZAhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexAhTocSeSe(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSeSe = AmpVertexAhTocSeSe  +  AmpVertexIRosAhTocSeSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Se] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe 
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe  
Else 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe + AmpWaveAhTocSeSe + AmpVertexAhTocSeSe
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + AmpWaveAhTocSeSe + AmpVertexAhTocSeSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSe(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = 2._dp*AmpWaveAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = 2._dp*AmpVertexAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3)  
  AmpSum2AhTocSeSe = + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3) + AmpSqTreeAhTocSeSe(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3)  
  AmpSum2AhTocSeSe = + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3) + AmpSqTreeAhTocSeSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSeSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSeSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),helfactor*AmpSqAhTocSeSe(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MSe(gt2),MSe(gt3),helfactor*AmpSqAhTocSeSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSeSe(gt1, gt2, gt3) + MRGAhTocSeSe(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSeSe(gt1, gt2, gt3) + MRGAhTocSeSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Su) Su
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhTocSuSu(cplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  Else 
Call Amplitude_Tree_BLSSM_AhTocSuSu(ZcplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAhOS,MSuOS,MRPAhTocSuSu,    & 
& MRGAhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAhOS,MSuOS,MRPAhTocSuSu,   & 
& MRGAhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAh,MSu,MRPAhTocSuSu,        & 
& MRGAhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAh,MSu,MRPAhTocSuSu,       & 
& MRGAhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTocSuSu(cplAhSucSu,ctcplAhSucSu,MAh,MAh2,MSu,             & 
& MSu2,ZfAh,ZfSu,AmpWaveAhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,AmpVertexAhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,AmpVertexIRdrAhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSecSe,ZcplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,           & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,       & 
& cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,              & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhHpmSucSdaa,          & 
& cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,             & 
& cplSuSvReSvRecSuaa,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,ZcplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,            & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,AmpVertexIRosAhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,       & 
& cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,              & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhHpmSucSdaa,          & 
& cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,             & 
& cplSuSvReSvRecSuaa,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,AmpVertexIRosAhTocSuSu)

 End if 
 End if 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu -  AmpVertexIRdrAhTocSuSu! +  AmpVertexIRosAhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhTocSuSu(gt2,:,:) = AmpWaveZAhTocSuSu(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSuSu(gt1,:,:) 
AmpVertexZAhTocSuSu(gt2,:,:)= AmpVertexZAhTocSuSu(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 1 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,gt2,:) = AmpWaveZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWaveAhTocSuSu(:,gt1,:) 
AmpVertexZAhTocSuSu(:,gt2,:)= AmpVertexZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexAhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 2 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,:,gt2) = AmpWaveZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWaveAhTocSuSu(:,:,gt1) 
AmpVertexZAhTocSuSu(:,:,gt2)= AmpVertexZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexAhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu  +  AmpVertexIRosAhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu 
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu  
Else 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSu(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpWaveAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSuSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToSvImSvIm(cplAhSvImSvIm,MAh,MSvIm,MAh2,MSvIm2,           & 
& AmpTreeAhToSvImSvIm)

  Else 
Call Amplitude_Tree_BLSSM_AhToSvImSvIm(ZcplAhSvImSvIm,MAh,MSvIm,MAh2,MSvIm2,          & 
& AmpTreeAhToSvImSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToSvImSvIm(MLambda,em,gs,cplAhSvImSvIm,MAhOS,MSvImOS,         & 
& MRPAhToSvImSvIm,MRGAhToSvImSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToSvImSvIm(MLambda,em,gs,ZcplAhSvImSvIm,MAhOS,MSvImOS,        & 
& MRPAhToSvImSvIm,MRGAhToSvImSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToSvImSvIm(MLambda,em,gs,cplAhSvImSvIm,MAh,MSvIm,             & 
& MRPAhToSvImSvIm,MRGAhToSvImSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToSvImSvIm(MLambda,em,gs,ZcplAhSvImSvIm,MAh,MSvIm,            & 
& MRPAhToSvImSvIm,MRGAhToSvImSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToSvImSvIm(cplAhSvImSvIm,ctcplAhSvImSvIm,MAh,             & 
& MAh2,MSvIm,MSvIm2,ZfAh,ZfSvIm,AmpWaveAhToSvImSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexAhToSvImSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRdrAhToSvImSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,ZcplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,          & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplHpmSvImSvImcHpm1,& 
& cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,          & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosAhToSvImSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,ZcplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,         & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosAhToSvImSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,          & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplHpmSvImSvImcHpm1,& 
& cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,          & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosAhToSvImSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosAhToSvImSvIm)

 End if 
 End if 
AmpVertexAhToSvImSvIm = AmpVertexAhToSvImSvIm -  AmpVertexIRdrAhToSvImSvIm! +  AmpVertexIRosAhToSvImSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToSvImSvIm=0._dp 
AmpVertexZAhToSvImSvIm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToSvImSvIm(gt2,:,:) = AmpWaveZAhToSvImSvIm(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToSvImSvIm(gt1,:,:) 
AmpVertexZAhToSvImSvIm(gt2,:,:)= AmpVertexZAhToSvImSvIm(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToSvImSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToSvImSvIm=AmpWaveZAhToSvImSvIm 
AmpVertexAhToSvImSvIm= AmpVertexZAhToSvImSvIm
! Final State 1 
AmpWaveZAhToSvImSvIm=0._dp 
AmpVertexZAhToSvImSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvImSvIm(:,gt2,:) = AmpWaveZAhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveAhToSvImSvIm(:,gt1,:) 
AmpVertexZAhToSvImSvIm(:,gt2,:)= AmpVertexZAhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexAhToSvImSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToSvImSvIm=AmpWaveZAhToSvImSvIm 
AmpVertexAhToSvImSvIm= AmpVertexZAhToSvImSvIm
! Final State 2 
AmpWaveZAhToSvImSvIm=0._dp 
AmpVertexZAhToSvImSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvImSvIm(:,:,gt2) = AmpWaveZAhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveAhToSvImSvIm(:,:,gt1) 
AmpVertexZAhToSvImSvIm(:,:,gt2)= AmpVertexZAhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexAhToSvImSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToSvImSvIm=AmpWaveZAhToSvImSvIm 
AmpVertexAhToSvImSvIm= AmpVertexZAhToSvImSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToSvImSvIm = AmpVertexAhToSvImSvIm  +  AmpVertexIRosAhToSvImSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->SvIm SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToSvImSvIm = AmpTreeAhToSvImSvIm 
 AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm + 2._dp*AmpWaveAhToSvImSvIm + 2._dp*AmpVertexAhToSvImSvIm  
Else 
 AmpSumAhToSvImSvIm = AmpTreeAhToSvImSvIm + AmpWaveAhToSvImSvIm + AmpVertexAhToSvImSvIm
 AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm + AmpWaveAhToSvImSvIm + AmpVertexAhToSvImSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToSvImSvIm = AmpTreeAhToSvImSvIm
 AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvImSvIm = 2._dp*AmpWaveAhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvImSvIm = 2._dp*AmpVertexAhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm + 2._dp*AmpWaveAhToSvImSvIm + 2._dp*AmpVertexAhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToSvImSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvImSvIm(gt1, gt2, gt3) = AmpSqAhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2AhToSvImSvIm = + 2._dp*AmpWaveAhToSvImSvIm + 2._dp*AmpVertexAhToSvImSvIm
  Call SquareAmp_StoSS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqAhToSvImSvIm(gt1, gt2, gt3) = AmpSqAhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreeAhToSvImSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2AhToSvImSvIm = AmpTreeAhToSvImSvIm
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvImSvIm(gt1, gt2, gt3) = AmpSqAhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2AhToSvImSvIm = + 2._dp*AmpWaveAhToSvImSvIm + 2._dp*AmpVertexAhToSvImSvIm
  Call SquareAmp_StoSS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumAhToSvImSvIm(gt1, gt2, gt3),AmpSum2AhToSvImSvIm(gt1, gt2, gt3),AmpSqAhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqAhToSvImSvIm(gt1, gt2, gt3) = AmpSqAhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreeAhToSvImSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToSvImSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToSvImSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),helfactor*AmpSqAhToSvImSvIm(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MSvIm(gt2),MSvIm(gt3),helfactor*AmpSqAhToSvImSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToSvImSvIm(gt1, gt2, gt3) + MRGAhToSvImSvIm(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToSvImSvIm(gt1, gt2, gt3) + MRGAhToSvImSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToSvReSvIm(cplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,            & 
& MSvIm2,MSvRe2,AmpTreeAhToSvReSvIm)

  Else 
Call Amplitude_Tree_BLSSM_AhToSvReSvIm(ZcplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,           & 
& MSvIm2,MSvRe2,AmpTreeAhToSvReSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvIm(MLambda,em,gs,cplAhSvImSvRe,MAhOS,MSvImOS,         & 
& MSvReOS,MRPAhToSvReSvIm,MRGAhToSvReSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvIm(MLambda,em,gs,ZcplAhSvImSvRe,MAhOS,MSvImOS,        & 
& MSvReOS,MRPAhToSvReSvIm,MRGAhToSvReSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToSvReSvIm(MLambda,em,gs,cplAhSvImSvRe,MAh,MSvIm,             & 
& MSvRe,MRPAhToSvReSvIm,MRGAhToSvReSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvIm(MLambda,em,gs,ZcplAhSvImSvRe,MAh,MSvIm,            & 
& MSvRe,MRPAhToSvReSvIm,MRGAhToSvReSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToSvReSvIm(cplAhSvImSvRe,ctcplAhSvImSvRe,MAh,             & 
& MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,AmpWaveAhToSvReSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,        & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,  & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexAhToSvReSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,        & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,  & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRdrAhToSvReSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,          & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,        & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& ZcplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,        & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,  & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRosAhToSvReSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,ZcplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,        & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,  & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRosAhToSvReSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,          & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,        & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,  & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,  & 
& cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosAhToSvReSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,        & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,  & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRosAhToSvReSvIm)

 End if 
 End if 
AmpVertexAhToSvReSvIm = AmpVertexAhToSvReSvIm -  AmpVertexIRdrAhToSvReSvIm! +  AmpVertexIRosAhToSvReSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToSvReSvIm=0._dp 
AmpVertexZAhToSvReSvIm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToSvReSvIm(gt2,:,:) = AmpWaveZAhToSvReSvIm(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToSvReSvIm(gt1,:,:) 
AmpVertexZAhToSvReSvIm(gt2,:,:)= AmpVertexZAhToSvReSvIm(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToSvReSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToSvReSvIm=AmpWaveZAhToSvReSvIm 
AmpVertexAhToSvReSvIm= AmpVertexZAhToSvReSvIm
! Final State 1 
AmpWaveZAhToSvReSvIm=0._dp 
AmpVertexZAhToSvReSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvReSvIm(:,gt2,:) = AmpWaveZAhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveAhToSvReSvIm(:,gt1,:) 
AmpVertexZAhToSvReSvIm(:,gt2,:)= AmpVertexZAhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexAhToSvReSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToSvReSvIm=AmpWaveZAhToSvReSvIm 
AmpVertexAhToSvReSvIm= AmpVertexZAhToSvReSvIm
! Final State 2 
AmpWaveZAhToSvReSvIm=0._dp 
AmpVertexZAhToSvReSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvReSvIm(:,:,gt2) = AmpWaveZAhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveAhToSvReSvIm(:,:,gt1) 
AmpVertexZAhToSvReSvIm(:,:,gt2)= AmpVertexZAhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexAhToSvReSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToSvReSvIm=AmpWaveZAhToSvReSvIm 
AmpVertexAhToSvReSvIm= AmpVertexZAhToSvReSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToSvReSvIm = AmpVertexAhToSvReSvIm  +  AmpVertexIRosAhToSvReSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->SvRe SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToSvReSvIm = AmpTreeAhToSvReSvIm 
 AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm + 2._dp*AmpWaveAhToSvReSvIm + 2._dp*AmpVertexAhToSvReSvIm  
Else 
 AmpSumAhToSvReSvIm = AmpTreeAhToSvReSvIm + AmpWaveAhToSvReSvIm + AmpVertexAhToSvReSvIm
 AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm + AmpWaveAhToSvReSvIm + AmpVertexAhToSvReSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToSvReSvIm = AmpTreeAhToSvReSvIm
 AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvIm = 2._dp*AmpWaveAhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvIm = 2._dp*AmpVertexAhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm + 2._dp*AmpWaveAhToSvReSvIm + 2._dp*AmpVertexAhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToSvReSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvReSvIm(gt1, gt2, gt3) = AmpSqAhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2AhToSvReSvIm = + 2._dp*AmpWaveAhToSvReSvIm + 2._dp*AmpVertexAhToSvReSvIm
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqAhToSvReSvIm(gt1, gt2, gt3) = AmpSqAhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreeAhToSvReSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2AhToSvReSvIm = AmpTreeAhToSvReSvIm
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvReSvIm(gt1, gt2, gt3) = AmpSqAhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2AhToSvReSvIm = + 2._dp*AmpWaveAhToSvReSvIm + 2._dp*AmpVertexAhToSvReSvIm
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumAhToSvReSvIm(gt1, gt2, gt3),AmpSum2AhToSvReSvIm(gt1, gt2, gt3),AmpSqAhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqAhToSvReSvIm(gt1, gt2, gt3) = AmpSqAhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreeAhToSvReSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToSvReSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToSvReSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),helfactor*AmpSqAhToSvReSvIm(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MSvRe(gt2),MSvIm(gt3),helfactor*AmpSqAhToSvReSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhToSvReSvIm(gt1, gt2, gt3) + MRGAhToSvReSvIm(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhToSvReSvIm(gt1, gt2, gt3) + MRGAhToSvReSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_AhToSvReSvRe(cplAhSvReSvRe,MAh,MSvRe,MAh2,MSvRe2,           & 
& AmpTreeAhToSvReSvRe)

  Else 
Call Amplitude_Tree_BLSSM_AhToSvReSvRe(ZcplAhSvReSvRe,MAh,MSvRe,MAh2,MSvRe2,          & 
& AmpTreeAhToSvReSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvRe(MLambda,em,gs,cplAhSvReSvRe,MAhOS,MSvReOS,         & 
& MRPAhToSvReSvRe,MRGAhToSvReSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvRe(MLambda,em,gs,ZcplAhSvReSvRe,MAhOS,MSvReOS,        & 
& MRPAhToSvReSvRe,MRGAhToSvReSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_AhToSvReSvRe(MLambda,em,gs,cplAhSvReSvRe,MAh,MSvRe,             & 
& MRPAhToSvReSvRe,MRGAhToSvReSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_AhToSvReSvRe(MLambda,em,gs,ZcplAhSvReSvRe,MAh,MSvRe,            & 
& MRPAhToSvReSvRe,MRGAhToSvReSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhToSvReSvRe(cplAhSvReSvRe,ctcplAhSvReSvRe,MAh,             & 
& MAh2,MSvRe,MSvRe2,ZfAh,ZfSvRe,AmpWaveAhToSvReSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexAhToSvReSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRdrAhToSvReSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,ZcplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvReL,     & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,          & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,cplHpmSvReSvRecHpm1,& 
& cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,          & 
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosAhToSvReSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,ZcplAhSvReSvRe,cplAhcHpmVWm,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosAhToSvReSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvReL,      & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,          & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,cplHpmSvReSvRecHpm1,& 
& cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,          & 
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosAhToSvReSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_AhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,  & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosAhToSvReSvRe)

 End if 
 End if 
AmpVertexAhToSvReSvRe = AmpVertexAhToSvReSvRe -  AmpVertexIRdrAhToSvReSvRe! +  AmpVertexIRosAhToSvReSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToSvReSvRe=0._dp 
AmpVertexZAhToSvReSvRe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZAhToSvReSvRe(gt2,:,:) = AmpWaveZAhToSvReSvRe(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToSvReSvRe(gt1,:,:) 
AmpVertexZAhToSvReSvRe(gt2,:,:)= AmpVertexZAhToSvReSvRe(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToSvReSvRe(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToSvReSvRe=AmpWaveZAhToSvReSvRe 
AmpVertexAhToSvReSvRe= AmpVertexZAhToSvReSvRe
! Final State 1 
AmpWaveZAhToSvReSvRe=0._dp 
AmpVertexZAhToSvReSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvReSvRe(:,gt2,:) = AmpWaveZAhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveAhToSvReSvRe(:,gt1,:) 
AmpVertexZAhToSvReSvRe(:,gt2,:)= AmpVertexZAhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexAhToSvReSvRe(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToSvReSvRe=AmpWaveZAhToSvReSvRe 
AmpVertexAhToSvReSvRe= AmpVertexZAhToSvReSvRe
! Final State 2 
AmpWaveZAhToSvReSvRe=0._dp 
AmpVertexZAhToSvReSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToSvReSvRe(:,:,gt2) = AmpWaveZAhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveAhToSvReSvRe(:,:,gt1) 
AmpVertexZAhToSvReSvRe(:,:,gt2)= AmpVertexZAhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexAhToSvReSvRe(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToSvReSvRe=AmpWaveZAhToSvReSvRe 
AmpVertexAhToSvReSvRe= AmpVertexZAhToSvReSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexAhToSvReSvRe = AmpVertexAhToSvReSvRe  +  AmpVertexIRosAhToSvReSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->SvRe SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToSvReSvRe = AmpTreeAhToSvReSvRe 
 AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe + 2._dp*AmpWaveAhToSvReSvRe + 2._dp*AmpVertexAhToSvReSvRe  
Else 
 AmpSumAhToSvReSvRe = AmpTreeAhToSvReSvRe + AmpWaveAhToSvReSvRe + AmpVertexAhToSvReSvRe
 AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe + AmpWaveAhToSvReSvRe + AmpVertexAhToSvReSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToSvReSvRe = AmpTreeAhToSvReSvRe
 AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MSvReOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MSvRe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvRe = 2._dp*AmpWaveAhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvRe = 2._dp*AmpVertexAhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe + 2._dp*AmpWaveAhToSvReSvRe + 2._dp*AmpVertexAhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToSvReSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvReSvRe(gt1, gt2, gt3) = AmpSqAhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2AhToSvReSvRe = + 2._dp*AmpWaveAhToSvReSvRe + 2._dp*AmpVertexAhToSvReSvRe
  Call SquareAmp_StoSS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqAhToSvReSvRe(gt1, gt2, gt3) = AmpSqAhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreeAhToSvReSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2AhToSvReSvRe = AmpTreeAhToSvReSvRe
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreeAhToSvReSvRe(gt1, gt2, gt3) = AmpSqAhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2AhToSvReSvRe = + 2._dp*AmpWaveAhToSvReSvRe + 2._dp*AmpVertexAhToSvReSvRe
  Call SquareAmp_StoSS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumAhToSvReSvRe(gt1, gt2, gt3),AmpSum2AhToSvReSvRe(gt1, gt2, gt3),AmpSqAhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqAhToSvReSvRe(gt1, gt2, gt3) = AmpSqAhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreeAhToSvReSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToSvReSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToSvReSvRe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),helfactor*AmpSqAhToSvReSvRe(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MSvRe(gt2),MSvRe(gt3),helfactor*AmpSqAhToSvReSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToSvReSvRe(gt1, gt2, gt3) + MRGAhToSvReSvRe(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToSvReSvRe(gt1, gt2, gt3) + MRGAhToSvReSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
!---------------- 
! Ah Ah
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,            & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplAhAhHpmcHpm1,     & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,AmpVertexAhToAhAh)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,            & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplAhAhHpmcHpm1,     & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,AmpVertexAhToAhAh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,               & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,AmpVertexAhToAhAh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah Ah -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhAh = 0._dp 
 AmpSum2AhToAhAh = 0._dp  
Else 
 AmpSumAhToAhAh = AmpVertexAhToAhAh + AmpWaveAhToAhAh
 AmpSum2AhToAhAh = AmpVertexAhToAhAh + AmpWaveAhToAhAh 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
    Do gt3=gt2,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MAh(gt3)))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqAhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToAhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToAhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,        & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,           & 
& cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,    & 
& AmpVertexAhToAhVP)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToAhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,        & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,           & 
& cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,    & 
& AmpVertexAhToAhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToAhVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,      & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,      & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,           & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,              & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,AmpVertexAhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVP = 0._dp 
 AmpSum2AhToAhVP = 0._dp  
Else 
 AmpSumAhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP
 AmpSum2AhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),0._dp,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVP,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqAhToAhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVP,helfactor*AmpSqAhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! Ah VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,    & 
& AmpVertexAhToAhVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,    & 
& AmpVertexAhToAhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,      & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,           & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZ = 0._dp 
 AmpSum2AhToAhVZ = 0._dp  
Else 
 AmpSumAhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ
 AmpSum2AhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),MVZOS,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVZ,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqAhToAhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVZ,helfactor*AmpSqAhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! Ah VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,     & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,AmpVertexAhToAhVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,     & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,AmpVertexAhToAhVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,     & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,AmpVertexAhToAhVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZp = 0._dp 
 AmpSum2AhToAhVZp = 0._dp  
Else 
 AmpSumAhToAhVZp = AmpVertexAhToAhVZp + AmpWaveAhToAhVZp
 AmpSum2AhToAhVZp = AmpVertexAhToAhVZp + AmpWaveAhToAhVZp 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumAhToAhVZp(:,gt1, gt2),AmpSum2AhToAhVZp(:,gt1, gt2),AmpSqAhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVZp,AmpSumAhToAhVZp(:,gt1, gt2),AmpSum2AhToAhVZp(:,gt1, gt2),AmpSqAhToAhVZp(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZp(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MVZpOS,helfactor*AmpSqAhToAhVZp(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVZp,helfactor*AmpSqAhToAhVZp(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! Glu Glu
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,MSuOS,          & 
& MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,        & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,              & 
& cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,AmpVertexAhToGluGlu)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,MSuOS,          & 
& MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,        & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,              & 
& cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,AmpVertexAhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToGluGlu(MAh,MFd,MFu,MGlu,MSd,MSu,MAh2,MFd2,            & 
& MFu2,MGlu2,MSd2,MSu2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,       & 
& cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,           & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,AmpVertexAhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToGluGlu = 0._dp 
 AmpSum2AhToGluGlu = 0._dp  
Else 
 AmpSumAhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu
 AmpSum2AhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MGluOS)+Abs(MGluOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MGlu)+Abs(MGlu))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MGluOS,MGluOS,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MGlu,MGlu,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
End if  
Else  
  AmpSqAhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhToGluGlu(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqAhToGluGlu(gt1))
Else 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAh(gt1),MGlu,MGlu,helfactor*AmpSqAhToGluGlu(gt1))
End if 
If ((Abs(MRPAhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! hh hh
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,               & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,           & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhHpmcHpm1,    & 
& cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,         & 
& cplhhhhSvReSvRe1,AmpVertexAhTohhhh)

 Else 
Call Amplitude_VERTEX_BLSSM_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,               & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,           & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhHpmcHpm1,    & 
& cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,         & 
& cplhhhhSvReSvRe1,AmpVertexAhTohhhh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,Mhh2,           & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,          & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexAhTohhhh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh hh -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhhh = 0._dp 
 AmpSum2AhTohhhh = 0._dp  
Else 
 AmpSumAhTohhhh = AmpVertexAhTohhhh + AmpWaveAhTohhhh
 AmpSum2AhTohhhh = AmpVertexAhTohhhh + AmpWaveAhTohhhh 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
    Do gt3=gt2,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(Mhh(gt3)))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqAhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_AhTohhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,ZfAh,Zfhh,ZfVP,            & 
& ZfVZpVP,ZfVZVP,AmpWaveAhTohhVP)

 Else 
Call Amplitude_WAVE_BLSSM_AhTohhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,ZfAh,Zfhh,ZfVP,            & 
& ZfVZpVP,ZfVZVP,AmpWaveAhTohhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhTohhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh, & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,       & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,      & 
& cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,     & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,              & 
& cplcVWmVPVWm,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,  & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,               & 
& AmpVertexAhTohhVP)

 Else 
Call Amplitude_VERTEX_BLSSM_AhTohhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh, & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,       & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,      & 
& cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,     & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,              & 
& cplcVWmVPVWm,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,  & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,               & 
& AmpVertexAhTohhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_AhTohhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,ZfAh,Zfhh,ZfVP,ZfVZpVP,            & 
& ZfVZVP,AmpWaveAhTohhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhTohhVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,      & 
& cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhAhVPVP1,cplAhAhVPVZ1,          & 
& cplAhAhVPVZp1,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhhhVPVP1,cplhhhhVPVZ1,               & 
& cplhhhhVPVZp1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexAhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVP = 0._dp 
 AmpSum2AhTohhVP = 0._dp  
Else 
 AmpSumAhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP
 AmpSum2AhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),0._dp,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVP,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqAhTohhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVP,helfactor*AmpSqAhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,MVG,               & 
& MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,MVG,               & 
& MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVGVG(MAh,MFd,MFu,MSd,MSu,MVG,MAh2,MFd2,               & 
& MFu2,MSd2,MSu2,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,        & 
& cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplSdcSdVG,cplSucSuVG,      & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVGVG = 0._dp 
 AmpSum2AhToVGVG = 0._dp  
Else 
 AmpSumAhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG
 AmpSum2AhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVG)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVG,MVG,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
End if  
Else  
  AmpSqAhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVGVG(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVGVG(gt1))
Else 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAh(gt1),MVG,MVG,helfactor*AmpSqAhToVGVG(gt1))
End if 
If ((Abs(MRPAhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVPVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,    & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,               & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,cplSvImSvImVPVP1,          & 
& cplSvReSvReVPVP1,AmpVertexAhToVPVP)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVPVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,    & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,               & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,cplSvImSvImVPVP1,          & 
& cplSvReSvReVPVP1,AmpVertexAhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVPVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,      & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,        & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,           & 
& cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,    & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,cplSvImSvImVPVP1,          & 
& cplSvReSvReVPVP1,AmpVertexAhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVP = 0._dp 
 AmpSum2AhToVPVP = 0._dp  
Else 
 AmpSumAhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP
 AmpSum2AhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVP,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
End if  
Else  
  AmpSqAhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVP(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVPVP(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVP,MVP,helfactor*AmpSqAhToVPVP(gt1))
End if 
If ((Abs(MRPAhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVPVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,        & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVP,      & 
& cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,     & 
& cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,        & 
& cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplSvImSvImVPVZ1,cplSvReSvReVPVZ1,         & 
& AmpVertexAhToVPVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVPVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,        & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVP,      & 
& cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,     & 
& cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,        & 
& cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplSvImSvImVPVZ1,cplSvReSvReVPVZ1,         & 
& AmpVertexAhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVPVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,    & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,       & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,             & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,& 
& cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,           & 
& cplSvImSvImVPVZ1,cplSvReSvReVPVZ1,AmpVertexAhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZ = 0._dp 
 AmpSum2AhToVPVZ = 0._dp  
Else 
 AmpSumAhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ
 AmpSum2AhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,MVZOS,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVZ,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
End if  
Else  
  AmpSqAhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),0._dp,MVZOS,helfactor*AmpSqAhToVPVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVP,MVZ,helfactor*AmpSqAhToVPVZ(gt1))
End if 
If ((Abs(MRPAhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVPVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,       & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,            & 
& cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,             & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,      & 
& cplSucSuVPVZpaa,cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,AmpVertexAhToVPVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVPVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,       & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplHpmcHpmVP,    & 
& cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,            & 
& cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,             & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,      & 
& cplSucSuVPVZpaa,cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,AmpVertexAhToVPVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVPVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVPL,cplcFdFdVPR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,     & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,          & 
& cplSecSeVP,cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,            & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,& 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,      & 
& cplSucSuVPVZpaa,cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,AmpVertexAhToVPVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZp = 0._dp 
 AmpSum2AhToVPVZp = 0._dp  
Else 
 AmpSumAhToVPVZp = AmpVertexAhToVPVZp + AmpWaveAhToVPVZp
 AmpSum2AhToVPVZp = AmpVertexAhToVPVZp + AmpWaveAhToVPVZp 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,MVZpOS,AmpSumAhToVPVZp(:,gt1),AmpSum2AhToVPVZp(:,gt1),AmpSqAhToVPVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVZp,AmpSumAhToVPVZp(:,gt1),AmpSum2AhToVPVZp(:,gt1),AmpSqAhToVPVZp(gt1)) 
End if  
Else  
  AmpSqAhToVPVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),0._dp,MVZpOS,helfactor*AmpSqAhToVPVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVP,MVZp,helfactor*AmpSqAhToVPVZp(gt1))
End if 
If ((Abs(MRPAhToVPVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VWm Conjg(VWm)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgZpgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,     & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,          & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa, & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,            & 
& AmpVertexAhToVWmcVWm)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgZpgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,     & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,          & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa, & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,            & 
& AmpVertexAhToVWmcVWm)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVWmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,               & 
& cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuVWmL,     & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,      & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,               & 
& cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1, & 
& cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,  & 
& cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,              & 
& cplSvReSvRecVWmVWm1,AmpVertexAhToVWmcVWm)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VWm conj[VWm] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVWmcVWm = 0._dp 
 AmpSum2AhToVWmcVWm = 0._dp  
Else 
 AmpSumAhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm
 AmpSum2AhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVWmOS)+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVWm)+Abs(MVWm))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVWmOS,MVWmOS,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVWm,MVWm,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
End if  
Else  
  AmpSqAhToVWmcVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVWmcVWm(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqAhToVWmcVWm(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVWm,MVWm,helfactor*AmpSqAhToVWmcVWm(gt1))
End if 
If ((Abs(MRPAhToVWmcVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVWmcVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VZ VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,             & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,               & 
& cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,          & 
& cplSvReSvReVZVZ1,AmpVertexAhToVZVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,             & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,             & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,               & 
& cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,          & 
& cplSvReSvReVZVZ1,AmpVertexAhToVZVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,      & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,    & 
& cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,          & 
& cplSvReSvReVZVZ1,AmpVertexAhToVZVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZ = 0._dp 
 AmpSum2AhToVZVZ = 0._dp  
Else 
 AmpSumAhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ
 AmpSum2AhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZ)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZOS,MVZOS,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZ,MVZ,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
End if  
Else  
  AmpSqAhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqAhToVZVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVZ,MVZ,helfactor*AmpSqAhToVZVZ(gt1))
End if 
If ((Abs(MRPAhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VZ VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVZVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplHpmcHpmVZ,    & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,             & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,      & 
& cplSucSuVZVZpaa,cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,AmpVertexAhToVZVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVZVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplHpmcHpmVZ,    & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,             & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,      & 
& cplSucSuVZVZpaa,cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,AmpVertexAhToVZVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVZVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZL,cplFvFvVZR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,     & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,          & 
& cplSecSeVZ,cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,& 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,      & 
& cplSucSuVZVZpaa,cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,AmpVertexAhToVZVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZp = 0._dp 
 AmpSum2AhToVZVZp = 0._dp  
Else 
 AmpSumAhToVZVZp = AmpVertexAhToVZVZp + AmpWaveAhToVZVZp
 AmpSum2AhToVZVZp = AmpVertexAhToVZVZp + AmpWaveAhToVZVZp 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZ)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZOS,MVZpOS,AmpSumAhToVZVZp(:,gt1),AmpSum2AhToVZVZp(:,gt1),AmpSqAhToVZVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZ,MVZp,AmpSumAhToVZVZp(:,gt1),AmpSum2AhToVZVZp(:,gt1),AmpSqAhToVZVZp(gt1)) 
End if  
Else  
  AmpSqAhToVZVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MVZOS,MVZpOS,helfactor*AmpSqAhToVZVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVZ,MVZp,helfactor*AmpSqAhToVZVZp(gt1))
End if 
If ((Abs(MRPAhToVZVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VZp VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_AhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,            & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,     & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,AmpVertexAhToVZpVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_AhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSvIm2OS,MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,            & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,     & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,AmpVertexAhToVZpVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_AhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,MHpm,            & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,            & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,     & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,AmpVertexAhToVZpVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZp VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZpVZp = 0._dp 
 AmpSum2AhToVZpVZp = 0._dp  
Else 
 AmpSumAhToVZpVZp = AmpVertexAhToVZpVZp + AmpWaveAhToVZpVZp
 AmpSum2AhToVZpVZp = AmpVertexAhToVZpVZp + AmpWaveAhToVZpVZp 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZp)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZpOS,MVZpOS,AmpSumAhToVZpVZp(:,gt1),AmpSum2AhToVZpVZp(:,gt1),AmpSqAhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZp,MVZp,AmpSumAhToVZpVZp(:,gt1),AmpSum2AhToVZpVZp(:,gt1),AmpSqAhToVZpVZp(gt1)) 
End if  
Else  
  AmpSqAhToVZpVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZpVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MVZpOS,MVZpOS,helfactor*AmpSqAhToVZpVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVZp,MVZp,helfactor*AmpSqAhToVZpVZp(gt1))
End if 
If ((Abs(MRPAhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End Subroutine OneLoopDecay_Ah

End Module Wrapper_OneLoopDecay_Ah_BLSSM
