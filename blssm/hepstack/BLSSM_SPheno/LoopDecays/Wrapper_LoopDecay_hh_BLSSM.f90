! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:13 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_hh_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,            & 
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
& cplAhHpmcVWmVP1(4,2),cplAhHpmcVWmVZ1(4,2),cplAhHpmcVWmVZp1(4,2),cplAhSdcSd(4,6,6),     & 
& cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),         & 
& cplAhSvReSvRe(4,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),   & 
& cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),     & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),    & 
& cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),   & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),          & 
& cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),& 
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
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm(2),cplcgWpCgZcVWm,cplcgWpCgZpcHpm(2),    & 
& cplcgWpCgZpcVWm,cplcgZgAhh(4),cplcgZgWmcHpm(2),cplcgZgWmcVWm,cplcgZgWpCHpm(2),         & 
& cplcgZgWpCVWm,cplcgZgZhh(4),cplcgZgZphh(4),cplcgZpgAhh(4),cplcgZpgWmcHpm(2)

Complex(dp),Intent(in) :: cplcgZpgWmcVWm,cplcgZpgWpCHpm(2),cplcgZpgWpCVWm,cplcgZpgZhh(4),cplcgZpgZphh(4),        & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),   & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),       & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),             & 
& cplcHpmVWmVZp(2),cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,          & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,& 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,   & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp3Q,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),         & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),   & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVPVWm1(4,2),            & 
& cplhhcHpmVWm(4,2),cplhhcHpmVWmVZ1(4,2),cplhhcHpmVWmVZp1(4,2),cplhhcVWmVWm(4),          & 
& cplhhhhcVWmVWm1(4,4),cplhhhhhh(4,4,4),cplhhhhhhhh1(4,4,4,4),cplhhhhHpmcHpm1(4,4,2,2),  & 
& cplhhhhSdcSdaa(4,4,6,6),cplhhhhSecSe1(4,4,6,6),cplhhhhSucSuaa(4,4,6,6),cplhhhhSvImSvIm1(4,4,6,6),& 
& cplhhhhSvImSvRe1(4,4,6,6),cplhhhhSvReSvRe1(4,4,6,6),cplhhhhVPVP1(4,4),cplhhhhVPVZ1(4,4),& 
& cplhhhhVPVZp1(4,4),cplhhhhVZpVZp1(4,4),cplhhhhVZVZ1(4,4),cplhhhhVZVZp1(4,4),           & 
& cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhHpmcVWmVP1(4,2),cplhhHpmcVWmVZ1(4,2),       & 
& cplhhHpmcVWmVZp1(4,2),cplhhHpmSucSdaa(4,2,6,6),cplhhHpmSvImcSe1(4,2,6,6),              & 
& cplhhHpmSvRecSe1(4,2,6,6),cplhhSdcHpmcSuaa(4,6,2,6),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),& 
& cplhhSeSvImcHpm1(4,6,6,2),cplhhSeSvRecHpm1(4,6,6,2),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),& 
& cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),   & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVPVP1(2,2),& 
& cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVPVZp1(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),       & 
& cplHpmcHpmVZpVZp1(2,2),cplHpmcHpmVZVZ1(2,2),cplHpmcHpmVZVZp1(2,2),cplHpmcVWmVP(2),     & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmHpmcHpmcHpm1(2,2,2,2),cplHpmSdcHpmcSdaa(2,6,2,6),& 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSucSd(2,6,6),               & 
& cplHpmSvImcSe(2,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),        & 
& cplHpmSvRecSe(2,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdcHpmcSu(6,2,6),cplSdcSdcVWmVWmaa(6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6)

Complex(dp),Intent(in) :: cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSdVZpVZpaa(6,6),cplSdcSdVZVZaa(6,6),            & 
& cplSdcSdVZVZpaa(6,6),cplSdcSucVWm(6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),& 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),cplSecSecVWmVWm1(6,6),         & 
& cplSecSeVP(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),             & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZpVZp1(6,6),cplSecSeVZVZ1(6,6),              & 
& cplSecSeVZVZp1(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvImcHpm(6,6,2),& 
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
& ctcplAhhhVZp(4,4),ctcplcChaChahhL(2,2,4),ctcplcChaChahhR(2,2,4),ctcplcFdFdhhL(3,3,4),  & 
& ctcplcFdFdhhR(3,3,4),ctcplcFeFehhL(3,3,4),ctcplcFeFehhR(3,3,4),ctcplcFuFuhhL(3,3,4),   & 
& ctcplcFuFuhhR(3,3,4),ctcplChiChihhL(7,7,4),ctcplChiChihhR(7,7,4),ctcplFvFvhhL(6,6,4),  & 
& ctcplFvFvhhR(6,6,4),ctcplhhcVWmVWm(4),ctcplhhhhhh(4,4,4),ctcplhhHpmcHpm(4,2,2),        & 
& ctcplhhHpmcVWm(4,2),ctcplhhSdcSd(4,6,6),ctcplhhSecSe(4,6,6),ctcplhhSucSu(4,6,6),       & 
& ctcplhhSvImSvIm(4,6,6),ctcplhhSvImSvRe(4,6,6),ctcplhhSvReSvRe(4,6,6),ctcplhhVPVZ(4),   & 
& ctcplhhVPVZp(4),ctcplhhVZpVZp(4),ctcplhhVZVZ(4),ctcplhhVZVZp(4),GcplcHpmVPVWm(2),      & 
& GcplhhcHpmVWm(4,2),GcplhhHpmcHpm(4,2,2),GcplHpmcVWmVP(2),GosZcplcHpmVPVWm(2),          & 
& GosZcplhhcHpmVWm(4,2),GosZcplhhHpmcHpm(4,2,2),GosZcplHpmcVWmVP(2),GZcplcHpmVPVWm(2),   & 
& GZcplhhcHpmVWm(4,2),GZcplhhHpmcHpm(4,2,2),GZcplHpmcVWmVP(2),ZcplAhAhhh(4,4,4),         & 
& ZcplAhhhVZ(4,4),ZcplAhhhVZp(4,4),ZcplcChaChahhL(2,2,4),ZcplcChaChahhR(2,2,4),          & 
& ZcplcFdFdhhL(3,3,4),ZcplcFdFdhhR(3,3,4),ZcplcFeFehhL(3,3,4),ZcplcFeFehhR(3,3,4),       & 
& ZcplcFuFuhhL(3,3,4),ZcplcFuFuhhR(3,3,4),ZcplChiChihhL(7,7,4),ZcplChiChihhR(7,7,4),     & 
& ZcplFvFvhhL(6,6,4),ZcplFvFvhhR(6,6,4),ZcplhhcVWmVWm(4),Zcplhhhhhh(4,4,4),              & 
& ZcplhhHpmcHpm(4,2,2),ZcplhhHpmcVWm(4,2),ZcplhhSdcSd(4,6,6),ZcplhhSecSe(4,6,6)

Complex(dp),Intent(in) :: ZcplhhSucSu(4,6,6),ZcplhhSvImSvIm(4,6,6),ZcplhhSvImSvRe(4,6,6),ZcplhhSvReSvRe(4,6,6),  & 
& ZcplhhVZpVZp(4),ZcplhhVZVZ(4),ZcplhhVZVZp(4)

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
Real(dp), Intent(out) :: gP1Lhh(4,320) 
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
Real(dp) :: MRPhhToAhAh(4,4,4),MRGhhToAhAh(4,4,4), MRPZhhToAhAh(4,4,4),MRGZhhToAhAh(4,4,4) 
Real(dp) :: MVPhhToAhAh(4,4,4) 
Real(dp) :: RMsqTreehhToAhAh(4,4,4),RMsqWavehhToAhAh(4,4,4),RMsqVertexhhToAhAh(4,4,4) 
Complex(dp) :: AmpTreehhToAhAh(4,4,4),AmpWavehhToAhAh(4,4,4)=(0._dp,0._dp),AmpVertexhhToAhAh(4,4,4)& 
 & ,AmpVertexIRoshhToAhAh(4,4,4),AmpVertexIRdrhhToAhAh(4,4,4), AmpSumhhToAhAh(4,4,4), AmpSum2hhToAhAh(4,4,4) 
Complex(dp) :: AmpTreeZhhToAhAh(4,4,4),AmpWaveZhhToAhAh(4,4,4),AmpVertexZhhToAhAh(4,4,4) 
Real(dp) :: AmpSqhhToAhAh(4,4,4),  AmpSqTreehhToAhAh(4,4,4) 
Real(dp) :: MRPhhToAhVZ(4,4),MRGhhToAhVZ(4,4), MRPZhhToAhVZ(4,4),MRGZhhToAhVZ(4,4) 
Real(dp) :: MVPhhToAhVZ(4,4) 
Real(dp) :: RMsqTreehhToAhVZ(4,4),RMsqWavehhToAhVZ(4,4),RMsqVertexhhToAhVZ(4,4) 
Complex(dp) :: AmpTreehhToAhVZ(2,4,4),AmpWavehhToAhVZ(2,4,4)=(0._dp,0._dp),AmpVertexhhToAhVZ(2,4,4)& 
 & ,AmpVertexIRoshhToAhVZ(2,4,4),AmpVertexIRdrhhToAhVZ(2,4,4), AmpSumhhToAhVZ(2,4,4), AmpSum2hhToAhVZ(2,4,4) 
Complex(dp) :: AmpTreeZhhToAhVZ(2,4,4),AmpWaveZhhToAhVZ(2,4,4),AmpVertexZhhToAhVZ(2,4,4) 
Real(dp) :: AmpSqhhToAhVZ(4,4),  AmpSqTreehhToAhVZ(4,4) 
Real(dp) :: MRPhhToAhVZp(4,4),MRGhhToAhVZp(4,4), MRPZhhToAhVZp(4,4),MRGZhhToAhVZp(4,4) 
Real(dp) :: MVPhhToAhVZp(4,4) 
Real(dp) :: RMsqTreehhToAhVZp(4,4),RMsqWavehhToAhVZp(4,4),RMsqVertexhhToAhVZp(4,4) 
Complex(dp) :: AmpTreehhToAhVZp(2,4,4),AmpWavehhToAhVZp(2,4,4)=(0._dp,0._dp),AmpVertexhhToAhVZp(2,4,4)& 
 & ,AmpVertexIRoshhToAhVZp(2,4,4),AmpVertexIRdrhhToAhVZp(2,4,4), AmpSumhhToAhVZp(2,4,4), AmpSum2hhToAhVZp(2,4,4) 
Complex(dp) :: AmpTreeZhhToAhVZp(2,4,4),AmpWaveZhhToAhVZp(2,4,4),AmpVertexZhhToAhVZp(2,4,4) 
Real(dp) :: AmpSqhhToAhVZp(4,4),  AmpSqTreehhToAhVZp(4,4) 
Real(dp) :: MRPhhTocChaCha(4,2,2),MRGhhTocChaCha(4,2,2), MRPZhhTocChaCha(4,2,2),MRGZhhTocChaCha(4,2,2) 
Real(dp) :: MVPhhTocChaCha(4,2,2) 
Real(dp) :: RMsqTreehhTocChaCha(4,2,2),RMsqWavehhTocChaCha(4,2,2),RMsqVertexhhTocChaCha(4,2,2) 
Complex(dp) :: AmpTreehhTocChaCha(2,4,2,2),AmpWavehhTocChaCha(2,4,2,2)=(0._dp,0._dp),AmpVertexhhTocChaCha(2,4,2,2)& 
 & ,AmpVertexIRoshhTocChaCha(2,4,2,2),AmpVertexIRdrhhTocChaCha(2,4,2,2), AmpSumhhTocChaCha(2,4,2,2), AmpSum2hhTocChaCha(2,4,2,2) 
Complex(dp) :: AmpTreeZhhTocChaCha(2,4,2,2),AmpWaveZhhTocChaCha(2,4,2,2),AmpVertexZhhTocChaCha(2,4,2,2) 
Real(dp) :: AmpSqhhTocChaCha(4,2,2),  AmpSqTreehhTocChaCha(4,2,2) 
Real(dp) :: MRPhhToChiChi(4,7,7),MRGhhToChiChi(4,7,7), MRPZhhToChiChi(4,7,7),MRGZhhToChiChi(4,7,7) 
Real(dp) :: MVPhhToChiChi(4,7,7) 
Real(dp) :: RMsqTreehhToChiChi(4,7,7),RMsqWavehhToChiChi(4,7,7),RMsqVertexhhToChiChi(4,7,7) 
Complex(dp) :: AmpTreehhToChiChi(2,4,7,7),AmpWavehhToChiChi(2,4,7,7)=(0._dp,0._dp),AmpVertexhhToChiChi(2,4,7,7)& 
 & ,AmpVertexIRoshhToChiChi(2,4,7,7),AmpVertexIRdrhhToChiChi(2,4,7,7), AmpSumhhToChiChi(2,4,7,7), AmpSum2hhToChiChi(2,4,7,7) 
Complex(dp) :: AmpTreeZhhToChiChi(2,4,7,7),AmpWaveZhhToChiChi(2,4,7,7),AmpVertexZhhToChiChi(2,4,7,7) 
Real(dp) :: AmpSqhhToChiChi(4,7,7),  AmpSqTreehhToChiChi(4,7,7) 
Real(dp) :: MRPhhTocFdFd(4,3,3),MRGhhTocFdFd(4,3,3), MRPZhhTocFdFd(4,3,3),MRGZhhTocFdFd(4,3,3) 
Real(dp) :: MVPhhTocFdFd(4,3,3) 
Real(dp) :: RMsqTreehhTocFdFd(4,3,3),RMsqWavehhTocFdFd(4,3,3),RMsqVertexhhTocFdFd(4,3,3) 
Complex(dp) :: AmpTreehhTocFdFd(2,4,3,3),AmpWavehhTocFdFd(2,4,3,3)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,4,3,3)& 
 & ,AmpVertexIRoshhTocFdFd(2,4,3,3),AmpVertexIRdrhhTocFdFd(2,4,3,3), AmpSumhhTocFdFd(2,4,3,3), AmpSum2hhTocFdFd(2,4,3,3) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,4,3,3),AmpWaveZhhTocFdFd(2,4,3,3),AmpVertexZhhTocFdFd(2,4,3,3) 
Real(dp) :: AmpSqhhTocFdFd(4,3,3),  AmpSqTreehhTocFdFd(4,3,3) 
Real(dp) :: MRPhhTocFeFe(4,3,3),MRGhhTocFeFe(4,3,3), MRPZhhTocFeFe(4,3,3),MRGZhhTocFeFe(4,3,3) 
Real(dp) :: MVPhhTocFeFe(4,3,3) 
Real(dp) :: RMsqTreehhTocFeFe(4,3,3),RMsqWavehhTocFeFe(4,3,3),RMsqVertexhhTocFeFe(4,3,3) 
Complex(dp) :: AmpTreehhTocFeFe(2,4,3,3),AmpWavehhTocFeFe(2,4,3,3)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,4,3,3)& 
 & ,AmpVertexIRoshhTocFeFe(2,4,3,3),AmpVertexIRdrhhTocFeFe(2,4,3,3), AmpSumhhTocFeFe(2,4,3,3), AmpSum2hhTocFeFe(2,4,3,3) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,4,3,3),AmpWaveZhhTocFeFe(2,4,3,3),AmpVertexZhhTocFeFe(2,4,3,3) 
Real(dp) :: AmpSqhhTocFeFe(4,3,3),  AmpSqTreehhTocFeFe(4,3,3) 
Real(dp) :: MRPhhTocFuFu(4,3,3),MRGhhTocFuFu(4,3,3), MRPZhhTocFuFu(4,3,3),MRGZhhTocFuFu(4,3,3) 
Real(dp) :: MVPhhTocFuFu(4,3,3) 
Real(dp) :: RMsqTreehhTocFuFu(4,3,3),RMsqWavehhTocFuFu(4,3,3),RMsqVertexhhTocFuFu(4,3,3) 
Complex(dp) :: AmpTreehhTocFuFu(2,4,3,3),AmpWavehhTocFuFu(2,4,3,3)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,4,3,3)& 
 & ,AmpVertexIRoshhTocFuFu(2,4,3,3),AmpVertexIRdrhhTocFuFu(2,4,3,3), AmpSumhhTocFuFu(2,4,3,3), AmpSum2hhTocFuFu(2,4,3,3) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,4,3,3),AmpWaveZhhTocFuFu(2,4,3,3),AmpVertexZhhTocFuFu(2,4,3,3) 
Real(dp) :: AmpSqhhTocFuFu(4,3,3),  AmpSqTreehhTocFuFu(4,3,3) 
Real(dp) :: MRPhhToFvFv(4,6,6),MRGhhToFvFv(4,6,6), MRPZhhToFvFv(4,6,6),MRGZhhToFvFv(4,6,6) 
Real(dp) :: MVPhhToFvFv(4,6,6) 
Real(dp) :: RMsqTreehhToFvFv(4,6,6),RMsqWavehhToFvFv(4,6,6),RMsqVertexhhToFvFv(4,6,6) 
Complex(dp) :: AmpTreehhToFvFv(2,4,6,6),AmpWavehhToFvFv(2,4,6,6)=(0._dp,0._dp),AmpVertexhhToFvFv(2,4,6,6)& 
 & ,AmpVertexIRoshhToFvFv(2,4,6,6),AmpVertexIRdrhhToFvFv(2,4,6,6), AmpSumhhToFvFv(2,4,6,6), AmpSum2hhToFvFv(2,4,6,6) 
Complex(dp) :: AmpTreeZhhToFvFv(2,4,6,6),AmpWaveZhhToFvFv(2,4,6,6),AmpVertexZhhToFvFv(2,4,6,6) 
Real(dp) :: AmpSqhhToFvFv(4,6,6),  AmpSqTreehhToFvFv(4,6,6) 
Real(dp) :: MRPhhTohhhh(4,4,4),MRGhhTohhhh(4,4,4), MRPZhhTohhhh(4,4,4),MRGZhhTohhhh(4,4,4) 
Real(dp) :: MVPhhTohhhh(4,4,4) 
Real(dp) :: RMsqTreehhTohhhh(4,4,4),RMsqWavehhTohhhh(4,4,4),RMsqVertexhhTohhhh(4,4,4) 
Complex(dp) :: AmpTreehhTohhhh(4,4,4),AmpWavehhTohhhh(4,4,4)=(0._dp,0._dp),AmpVertexhhTohhhh(4,4,4)& 
 & ,AmpVertexIRoshhTohhhh(4,4,4),AmpVertexIRdrhhTohhhh(4,4,4), AmpSumhhTohhhh(4,4,4), AmpSum2hhTohhhh(4,4,4) 
Complex(dp) :: AmpTreeZhhTohhhh(4,4,4),AmpWaveZhhTohhhh(4,4,4),AmpVertexZhhTohhhh(4,4,4) 
Real(dp) :: AmpSqhhTohhhh(4,4,4),  AmpSqTreehhTohhhh(4,4,4) 
Real(dp) :: MRPhhTocHpmHpm(4,2,2),MRGhhTocHpmHpm(4,2,2), MRPZhhTocHpmHpm(4,2,2),MRGZhhTocHpmHpm(4,2,2) 
Real(dp) :: MVPhhTocHpmHpm(4,2,2) 
Real(dp) :: RMsqTreehhTocHpmHpm(4,2,2),RMsqWavehhTocHpmHpm(4,2,2),RMsqVertexhhTocHpmHpm(4,2,2) 
Complex(dp) :: AmpTreehhTocHpmHpm(4,2,2),AmpWavehhTocHpmHpm(4,2,2)=(0._dp,0._dp),AmpVertexhhTocHpmHpm(4,2,2)& 
 & ,AmpVertexIRoshhTocHpmHpm(4,2,2),AmpVertexIRdrhhTocHpmHpm(4,2,2), AmpSumhhTocHpmHpm(4,2,2), AmpSum2hhTocHpmHpm(4,2,2) 
Complex(dp) :: AmpTreeZhhTocHpmHpm(4,2,2),AmpWaveZhhTocHpmHpm(4,2,2),AmpVertexZhhTocHpmHpm(4,2,2) 
Real(dp) :: AmpSqhhTocHpmHpm(4,2,2),  AmpSqTreehhTocHpmHpm(4,2,2) 
Real(dp) :: MRPhhToHpmcVWm(4,2),MRGhhToHpmcVWm(4,2), MRPZhhToHpmcVWm(4,2),MRGZhhToHpmcVWm(4,2) 
Real(dp) :: MVPhhToHpmcVWm(4,2) 
Real(dp) :: RMsqTreehhToHpmcVWm(4,2),RMsqWavehhToHpmcVWm(4,2),RMsqVertexhhToHpmcVWm(4,2) 
Complex(dp) :: AmpTreehhToHpmcVWm(2,4,2),AmpWavehhToHpmcVWm(2,4,2)=(0._dp,0._dp),AmpVertexhhToHpmcVWm(2,4,2)& 
 & ,AmpVertexIRoshhToHpmcVWm(2,4,2),AmpVertexIRdrhhToHpmcVWm(2,4,2), AmpSumhhToHpmcVWm(2,4,2), AmpSum2hhToHpmcVWm(2,4,2) 
Complex(dp) :: AmpTreeZhhToHpmcVWm(2,4,2),AmpWaveZhhToHpmcVWm(2,4,2),AmpVertexZhhToHpmcVWm(2,4,2) 
Real(dp) :: AmpSqhhToHpmcVWm(4,2),  AmpSqTreehhToHpmcVWm(4,2) 
Real(dp) :: MRPhhTocSdSd(4,6,6),MRGhhTocSdSd(4,6,6), MRPZhhTocSdSd(4,6,6),MRGZhhTocSdSd(4,6,6) 
Real(dp) :: MVPhhTocSdSd(4,6,6) 
Real(dp) :: RMsqTreehhTocSdSd(4,6,6),RMsqWavehhTocSdSd(4,6,6),RMsqVertexhhTocSdSd(4,6,6) 
Complex(dp) :: AmpTreehhTocSdSd(4,6,6),AmpWavehhTocSdSd(4,6,6)=(0._dp,0._dp),AmpVertexhhTocSdSd(4,6,6)& 
 & ,AmpVertexIRoshhTocSdSd(4,6,6),AmpVertexIRdrhhTocSdSd(4,6,6), AmpSumhhTocSdSd(4,6,6), AmpSum2hhTocSdSd(4,6,6) 
Complex(dp) :: AmpTreeZhhTocSdSd(4,6,6),AmpWaveZhhTocSdSd(4,6,6),AmpVertexZhhTocSdSd(4,6,6) 
Real(dp) :: AmpSqhhTocSdSd(4,6,6),  AmpSqTreehhTocSdSd(4,6,6) 
Real(dp) :: MRPhhTocSeSe(4,6,6),MRGhhTocSeSe(4,6,6), MRPZhhTocSeSe(4,6,6),MRGZhhTocSeSe(4,6,6) 
Real(dp) :: MVPhhTocSeSe(4,6,6) 
Real(dp) :: RMsqTreehhTocSeSe(4,6,6),RMsqWavehhTocSeSe(4,6,6),RMsqVertexhhTocSeSe(4,6,6) 
Complex(dp) :: AmpTreehhTocSeSe(4,6,6),AmpWavehhTocSeSe(4,6,6)=(0._dp,0._dp),AmpVertexhhTocSeSe(4,6,6)& 
 & ,AmpVertexIRoshhTocSeSe(4,6,6),AmpVertexIRdrhhTocSeSe(4,6,6), AmpSumhhTocSeSe(4,6,6), AmpSum2hhTocSeSe(4,6,6) 
Complex(dp) :: AmpTreeZhhTocSeSe(4,6,6),AmpWaveZhhTocSeSe(4,6,6),AmpVertexZhhTocSeSe(4,6,6) 
Real(dp) :: AmpSqhhTocSeSe(4,6,6),  AmpSqTreehhTocSeSe(4,6,6) 
Real(dp) :: MRPhhTocSuSu(4,6,6),MRGhhTocSuSu(4,6,6), MRPZhhTocSuSu(4,6,6),MRGZhhTocSuSu(4,6,6) 
Real(dp) :: MVPhhTocSuSu(4,6,6) 
Real(dp) :: RMsqTreehhTocSuSu(4,6,6),RMsqWavehhTocSuSu(4,6,6),RMsqVertexhhTocSuSu(4,6,6) 
Complex(dp) :: AmpTreehhTocSuSu(4,6,6),AmpWavehhTocSuSu(4,6,6)=(0._dp,0._dp),AmpVertexhhTocSuSu(4,6,6)& 
 & ,AmpVertexIRoshhTocSuSu(4,6,6),AmpVertexIRdrhhTocSuSu(4,6,6), AmpSumhhTocSuSu(4,6,6), AmpSum2hhTocSuSu(4,6,6) 
Complex(dp) :: AmpTreeZhhTocSuSu(4,6,6),AmpWaveZhhTocSuSu(4,6,6),AmpVertexZhhTocSuSu(4,6,6) 
Real(dp) :: AmpSqhhTocSuSu(4,6,6),  AmpSqTreehhTocSuSu(4,6,6) 
Real(dp) :: MRPhhToSvImSvIm(4,6,6),MRGhhToSvImSvIm(4,6,6), MRPZhhToSvImSvIm(4,6,6),MRGZhhToSvImSvIm(4,6,6) 
Real(dp) :: MVPhhToSvImSvIm(4,6,6) 
Real(dp) :: RMsqTreehhToSvImSvIm(4,6,6),RMsqWavehhToSvImSvIm(4,6,6),RMsqVertexhhToSvImSvIm(4,6,6) 
Complex(dp) :: AmpTreehhToSvImSvIm(4,6,6),AmpWavehhToSvImSvIm(4,6,6)=(0._dp,0._dp),AmpVertexhhToSvImSvIm(4,6,6)& 
 & ,AmpVertexIRoshhToSvImSvIm(4,6,6),AmpVertexIRdrhhToSvImSvIm(4,6,6), AmpSumhhToSvImSvIm(4,6,6), AmpSum2hhToSvImSvIm(4,6,6) 
Complex(dp) :: AmpTreeZhhToSvImSvIm(4,6,6),AmpWaveZhhToSvImSvIm(4,6,6),AmpVertexZhhToSvImSvIm(4,6,6) 
Real(dp) :: AmpSqhhToSvImSvIm(4,6,6),  AmpSqTreehhToSvImSvIm(4,6,6) 
Real(dp) :: MRPhhToSvReSvIm(4,6,6),MRGhhToSvReSvIm(4,6,6), MRPZhhToSvReSvIm(4,6,6),MRGZhhToSvReSvIm(4,6,6) 
Real(dp) :: MVPhhToSvReSvIm(4,6,6) 
Real(dp) :: RMsqTreehhToSvReSvIm(4,6,6),RMsqWavehhToSvReSvIm(4,6,6),RMsqVertexhhToSvReSvIm(4,6,6) 
Complex(dp) :: AmpTreehhToSvReSvIm(4,6,6),AmpWavehhToSvReSvIm(4,6,6)=(0._dp,0._dp),AmpVertexhhToSvReSvIm(4,6,6)& 
 & ,AmpVertexIRoshhToSvReSvIm(4,6,6),AmpVertexIRdrhhToSvReSvIm(4,6,6), AmpSumhhToSvReSvIm(4,6,6), AmpSum2hhToSvReSvIm(4,6,6) 
Complex(dp) :: AmpTreeZhhToSvReSvIm(4,6,6),AmpWaveZhhToSvReSvIm(4,6,6),AmpVertexZhhToSvReSvIm(4,6,6) 
Real(dp) :: AmpSqhhToSvReSvIm(4,6,6),  AmpSqTreehhToSvReSvIm(4,6,6) 
Real(dp) :: MRPhhToSvReSvRe(4,6,6),MRGhhToSvReSvRe(4,6,6), MRPZhhToSvReSvRe(4,6,6),MRGZhhToSvReSvRe(4,6,6) 
Real(dp) :: MVPhhToSvReSvRe(4,6,6) 
Real(dp) :: RMsqTreehhToSvReSvRe(4,6,6),RMsqWavehhToSvReSvRe(4,6,6),RMsqVertexhhToSvReSvRe(4,6,6) 
Complex(dp) :: AmpTreehhToSvReSvRe(4,6,6),AmpWavehhToSvReSvRe(4,6,6)=(0._dp,0._dp),AmpVertexhhToSvReSvRe(4,6,6)& 
 & ,AmpVertexIRoshhToSvReSvRe(4,6,6),AmpVertexIRdrhhToSvReSvRe(4,6,6), AmpSumhhToSvReSvRe(4,6,6), AmpSum2hhToSvReSvRe(4,6,6) 
Complex(dp) :: AmpTreeZhhToSvReSvRe(4,6,6),AmpWaveZhhToSvReSvRe(4,6,6),AmpVertexZhhToSvReSvRe(4,6,6) 
Real(dp) :: AmpSqhhToSvReSvRe(4,6,6),  AmpSqTreehhToSvReSvRe(4,6,6) 
Real(dp) :: MRPhhTocVWmVWm(4),MRGhhTocVWmVWm(4), MRPZhhTocVWmVWm(4),MRGZhhTocVWmVWm(4) 
Real(dp) :: MVPhhTocVWmVWm(4) 
Real(dp) :: RMsqTreehhTocVWmVWm(4),RMsqWavehhTocVWmVWm(4),RMsqVertexhhTocVWmVWm(4) 
Complex(dp) :: AmpTreehhTocVWmVWm(2,4),AmpWavehhTocVWmVWm(2,4)=(0._dp,0._dp),AmpVertexhhTocVWmVWm(2,4)& 
 & ,AmpVertexIRoshhTocVWmVWm(2,4),AmpVertexIRdrhhTocVWmVWm(2,4), AmpSumhhTocVWmVWm(2,4), AmpSum2hhTocVWmVWm(2,4) 
Complex(dp) :: AmpTreeZhhTocVWmVWm(2,4),AmpWaveZhhTocVWmVWm(2,4),AmpVertexZhhTocVWmVWm(2,4) 
Real(dp) :: AmpSqhhTocVWmVWm(4),  AmpSqTreehhTocVWmVWm(4) 
Real(dp) :: MRPhhToVZVZ(4),MRGhhToVZVZ(4), MRPZhhToVZVZ(4),MRGZhhToVZVZ(4) 
Real(dp) :: MVPhhToVZVZ(4) 
Real(dp) :: RMsqTreehhToVZVZ(4),RMsqWavehhToVZVZ(4),RMsqVertexhhToVZVZ(4) 
Complex(dp) :: AmpTreehhToVZVZ(2,4),AmpWavehhToVZVZ(2,4)=(0._dp,0._dp),AmpVertexhhToVZVZ(2,4)& 
 & ,AmpVertexIRoshhToVZVZ(2,4),AmpVertexIRdrhhToVZVZ(2,4), AmpSumhhToVZVZ(2,4), AmpSum2hhToVZVZ(2,4) 
Complex(dp) :: AmpTreeZhhToVZVZ(2,4),AmpWaveZhhToVZVZ(2,4),AmpVertexZhhToVZVZ(2,4) 
Real(dp) :: AmpSqhhToVZVZ(4),  AmpSqTreehhToVZVZ(4) 
Real(dp) :: MRPhhToVZpVZ(4),MRGhhToVZpVZ(4), MRPZhhToVZpVZ(4),MRGZhhToVZpVZ(4) 
Real(dp) :: MVPhhToVZpVZ(4) 
Real(dp) :: RMsqTreehhToVZpVZ(4),RMsqWavehhToVZpVZ(4),RMsqVertexhhToVZpVZ(4) 
Complex(dp) :: AmpTreehhToVZpVZ(2,4),AmpWavehhToVZpVZ(2,4)=(0._dp,0._dp),AmpVertexhhToVZpVZ(2,4)& 
 & ,AmpVertexIRoshhToVZpVZ(2,4),AmpVertexIRdrhhToVZpVZ(2,4), AmpSumhhToVZpVZ(2,4), AmpSum2hhToVZpVZ(2,4) 
Complex(dp) :: AmpTreeZhhToVZpVZ(2,4),AmpWaveZhhToVZpVZ(2,4),AmpVertexZhhToVZpVZ(2,4) 
Real(dp) :: AmpSqhhToVZpVZ(4),  AmpSqTreehhToVZpVZ(4) 
Real(dp) :: MRPhhToVZpVZp(4),MRGhhToVZpVZp(4), MRPZhhToVZpVZp(4),MRGZhhToVZpVZp(4) 
Real(dp) :: MVPhhToVZpVZp(4) 
Real(dp) :: RMsqTreehhToVZpVZp(4),RMsqWavehhToVZpVZp(4),RMsqVertexhhToVZpVZp(4) 
Complex(dp) :: AmpTreehhToVZpVZp(2,4),AmpWavehhToVZpVZp(2,4)=(0._dp,0._dp),AmpVertexhhToVZpVZp(2,4)& 
 & ,AmpVertexIRoshhToVZpVZp(2,4),AmpVertexIRdrhhToVZpVZp(2,4), AmpSumhhToVZpVZp(2,4), AmpSum2hhToVZpVZp(2,4) 
Complex(dp) :: AmpTreeZhhToVZpVZp(2,4),AmpWaveZhhToVZpVZp(2,4),AmpVertexZhhToVZpVZp(2,4) 
Real(dp) :: AmpSqhhToVZpVZp(4),  AmpSqTreehhToVZpVZp(4) 
Real(dp) :: MRPhhToAhhh(4,4,4),MRGhhToAhhh(4,4,4), MRPZhhToAhhh(4,4,4),MRGZhhToAhhh(4,4,4) 
Real(dp) :: MVPhhToAhhh(4,4,4) 
Real(dp) :: RMsqTreehhToAhhh(4,4,4),RMsqWavehhToAhhh(4,4,4),RMsqVertexhhToAhhh(4,4,4) 
Complex(dp) :: AmpTreehhToAhhh(4,4,4),AmpWavehhToAhhh(4,4,4)=(0._dp,0._dp),AmpVertexhhToAhhh(4,4,4)& 
 & ,AmpVertexIRoshhToAhhh(4,4,4),AmpVertexIRdrhhToAhhh(4,4,4), AmpSumhhToAhhh(4,4,4), AmpSum2hhToAhhh(4,4,4) 
Complex(dp) :: AmpTreeZhhToAhhh(4,4,4),AmpWaveZhhToAhhh(4,4,4),AmpVertexZhhToAhhh(4,4,4) 
Real(dp) :: AmpSqhhToAhhh(4,4,4),  AmpSqTreehhToAhhh(4,4,4) 
Real(dp) :: MRPhhToAhVP(4,4),MRGhhToAhVP(4,4), MRPZhhToAhVP(4,4),MRGZhhToAhVP(4,4) 
Real(dp) :: MVPhhToAhVP(4,4) 
Real(dp) :: RMsqTreehhToAhVP(4,4),RMsqWavehhToAhVP(4,4),RMsqVertexhhToAhVP(4,4) 
Complex(dp) :: AmpTreehhToAhVP(2,4,4),AmpWavehhToAhVP(2,4,4)=(0._dp,0._dp),AmpVertexhhToAhVP(2,4,4)& 
 & ,AmpVertexIRoshhToAhVP(2,4,4),AmpVertexIRdrhhToAhVP(2,4,4), AmpSumhhToAhVP(2,4,4), AmpSum2hhToAhVP(2,4,4) 
Complex(dp) :: AmpTreeZhhToAhVP(2,4,4),AmpWaveZhhToAhVP(2,4,4),AmpVertexZhhToAhVP(2,4,4) 
Real(dp) :: AmpSqhhToAhVP(4,4),  AmpSqTreehhToAhVP(4,4) 
Real(dp) :: MRPhhToGluGlu(4),MRGhhToGluGlu(4), MRPZhhToGluGlu(4),MRGZhhToGluGlu(4) 
Real(dp) :: MVPhhToGluGlu(4) 
Real(dp) :: RMsqTreehhToGluGlu(4),RMsqWavehhToGluGlu(4),RMsqVertexhhToGluGlu(4) 
Complex(dp) :: AmpTreehhToGluGlu(2,4),AmpWavehhToGluGlu(2,4)=(0._dp,0._dp),AmpVertexhhToGluGlu(2,4)& 
 & ,AmpVertexIRoshhToGluGlu(2,4),AmpVertexIRdrhhToGluGlu(2,4), AmpSumhhToGluGlu(2,4), AmpSum2hhToGluGlu(2,4) 
Complex(dp) :: AmpTreeZhhToGluGlu(2,4),AmpWaveZhhToGluGlu(2,4),AmpVertexZhhToGluGlu(2,4) 
Real(dp) :: AmpSqhhToGluGlu(4),  AmpSqTreehhToGluGlu(4) 
Real(dp) :: MRPhhTohhVP(4,4),MRGhhTohhVP(4,4), MRPZhhTohhVP(4,4),MRGZhhTohhVP(4,4) 
Real(dp) :: MVPhhTohhVP(4,4) 
Real(dp) :: RMsqTreehhTohhVP(4,4),RMsqWavehhTohhVP(4,4),RMsqVertexhhTohhVP(4,4) 
Complex(dp) :: AmpTreehhTohhVP(2,4,4),AmpWavehhTohhVP(2,4,4)=(0._dp,0._dp),AmpVertexhhTohhVP(2,4,4)& 
 & ,AmpVertexIRoshhTohhVP(2,4,4),AmpVertexIRdrhhTohhVP(2,4,4), AmpSumhhTohhVP(2,4,4), AmpSum2hhTohhVP(2,4,4) 
Complex(dp) :: AmpTreeZhhTohhVP(2,4,4),AmpWaveZhhTohhVP(2,4,4),AmpVertexZhhTohhVP(2,4,4) 
Real(dp) :: AmpSqhhTohhVP(4,4),  AmpSqTreehhTohhVP(4,4) 
Real(dp) :: MRPhhTohhVZ(4,4),MRGhhTohhVZ(4,4), MRPZhhTohhVZ(4,4),MRGZhhTohhVZ(4,4) 
Real(dp) :: MVPhhTohhVZ(4,4) 
Real(dp) :: RMsqTreehhTohhVZ(4,4),RMsqWavehhTohhVZ(4,4),RMsqVertexhhTohhVZ(4,4) 
Complex(dp) :: AmpTreehhTohhVZ(2,4,4),AmpWavehhTohhVZ(2,4,4)=(0._dp,0._dp),AmpVertexhhTohhVZ(2,4,4)& 
 & ,AmpVertexIRoshhTohhVZ(2,4,4),AmpVertexIRdrhhTohhVZ(2,4,4), AmpSumhhTohhVZ(2,4,4), AmpSum2hhTohhVZ(2,4,4) 
Complex(dp) :: AmpTreeZhhTohhVZ(2,4,4),AmpWaveZhhTohhVZ(2,4,4),AmpVertexZhhTohhVZ(2,4,4) 
Real(dp) :: AmpSqhhTohhVZ(4,4),  AmpSqTreehhTohhVZ(4,4) 
Real(dp) :: MRPhhTohhVZp(4,4),MRGhhTohhVZp(4,4), MRPZhhTohhVZp(4,4),MRGZhhTohhVZp(4,4) 
Real(dp) :: MVPhhTohhVZp(4,4) 
Real(dp) :: RMsqTreehhTohhVZp(4,4),RMsqWavehhTohhVZp(4,4),RMsqVertexhhTohhVZp(4,4) 
Complex(dp) :: AmpTreehhTohhVZp(2,4,4),AmpWavehhTohhVZp(2,4,4)=(0._dp,0._dp),AmpVertexhhTohhVZp(2,4,4)& 
 & ,AmpVertexIRoshhTohhVZp(2,4,4),AmpVertexIRdrhhTohhVZp(2,4,4), AmpSumhhTohhVZp(2,4,4), AmpSum2hhTohhVZp(2,4,4) 
Complex(dp) :: AmpTreeZhhTohhVZp(2,4,4),AmpWaveZhhTohhVZp(2,4,4),AmpVertexZhhTohhVZp(2,4,4) 
Real(dp) :: AmpSqhhTohhVZp(4,4),  AmpSqTreehhTohhVZp(4,4) 
Real(dp) :: MRPhhToVGVG(4),MRGhhToVGVG(4), MRPZhhToVGVG(4),MRGZhhToVGVG(4) 
Real(dp) :: MVPhhToVGVG(4) 
Real(dp) :: RMsqTreehhToVGVG(4),RMsqWavehhToVGVG(4),RMsqVertexhhToVGVG(4) 
Complex(dp) :: AmpTreehhToVGVG(2,4),AmpWavehhToVGVG(2,4)=(0._dp,0._dp),AmpVertexhhToVGVG(2,4)& 
 & ,AmpVertexIRoshhToVGVG(2,4),AmpVertexIRdrhhToVGVG(2,4), AmpSumhhToVGVG(2,4), AmpSum2hhToVGVG(2,4) 
Complex(dp) :: AmpTreeZhhToVGVG(2,4),AmpWaveZhhToVGVG(2,4),AmpVertexZhhToVGVG(2,4) 
Real(dp) :: AmpSqhhToVGVG(4),  AmpSqTreehhToVGVG(4) 
Real(dp) :: MRPhhToVPVP(4),MRGhhToVPVP(4), MRPZhhToVPVP(4),MRGZhhToVPVP(4) 
Real(dp) :: MVPhhToVPVP(4) 
Real(dp) :: RMsqTreehhToVPVP(4),RMsqWavehhToVPVP(4),RMsqVertexhhToVPVP(4) 
Complex(dp) :: AmpTreehhToVPVP(2,4),AmpWavehhToVPVP(2,4)=(0._dp,0._dp),AmpVertexhhToVPVP(2,4)& 
 & ,AmpVertexIRoshhToVPVP(2,4),AmpVertexIRdrhhToVPVP(2,4), AmpSumhhToVPVP(2,4), AmpSum2hhToVPVP(2,4) 
Complex(dp) :: AmpTreeZhhToVPVP(2,4),AmpWaveZhhToVPVP(2,4),AmpVertexZhhToVPVP(2,4) 
Real(dp) :: AmpSqhhToVPVP(4),  AmpSqTreehhToVPVP(4) 
Real(dp) :: MRPhhToVPVZ(4),MRGhhToVPVZ(4), MRPZhhToVPVZ(4),MRGZhhToVPVZ(4) 
Real(dp) :: MVPhhToVPVZ(4) 
Real(dp) :: RMsqTreehhToVPVZ(4),RMsqWavehhToVPVZ(4),RMsqVertexhhToVPVZ(4) 
Complex(dp) :: AmpTreehhToVPVZ(2,4),AmpWavehhToVPVZ(2,4)=(0._dp,0._dp),AmpVertexhhToVPVZ(2,4)& 
 & ,AmpVertexIRoshhToVPVZ(2,4),AmpVertexIRdrhhToVPVZ(2,4), AmpSumhhToVPVZ(2,4), AmpSum2hhToVPVZ(2,4) 
Complex(dp) :: AmpTreeZhhToVPVZ(2,4),AmpWaveZhhToVPVZ(2,4),AmpVertexZhhToVPVZ(2,4) 
Real(dp) :: AmpSqhhToVPVZ(4),  AmpSqTreehhToVPVZ(4) 
Real(dp) :: MRPhhToVPVZp(4),MRGhhToVPVZp(4), MRPZhhToVPVZp(4),MRGZhhToVPVZp(4) 
Real(dp) :: MVPhhToVPVZp(4) 
Real(dp) :: RMsqTreehhToVPVZp(4),RMsqWavehhToVPVZp(4),RMsqVertexhhToVPVZp(4) 
Complex(dp) :: AmpTreehhToVPVZp(2,4),AmpWavehhToVPVZp(2,4)=(0._dp,0._dp),AmpVertexhhToVPVZp(2,4)& 
 & ,AmpVertexIRoshhToVPVZp(2,4),AmpVertexIRdrhhToVPVZp(2,4), AmpSumhhToVPVZp(2,4), AmpSum2hhToVPVZp(2,4) 
Complex(dp) :: AmpTreeZhhToVPVZp(2,4),AmpWaveZhhToVPVZp(2,4),AmpVertexZhhToVPVZp(2,4) 
Real(dp) :: AmpSqhhToVPVZp(4),  AmpSqTreehhToVPVZp(4) 
Write(*,*) "Calculating one-loop decays of hh " 
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
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  Else 
Call Amplitude_Tree_BLSSM_hhToAhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,MRPhhToAhAh,       & 
& MRGhhToAhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,MRPhhToAhAh,      & 
& MRGhhToAhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPhhToAhAh,           & 
& MRGhhToAhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPhhToAhAh,          & 
& MRGhhToAhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,Mhh2,           & 
& ZfAh,Zfhh,AmpWavehhToAhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
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
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexhhToAhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRdrhhToAhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
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
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRoshhToAhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRoshhToAhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
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
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRoshhToAhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplAhhhHpmcHpm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,AmpVertexIRoshhToAhAh)

 End if 
 End if 
AmpVertexhhToAhAh = AmpVertexhhToAhAh -  AmpVertexIRdrhhToAhAh! +  AmpVertexIRoshhToAhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhAh(gt2,:,:) = AmpWaveZhhToAhAh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhAh(gt1,:,:) 
AmpVertexZhhToAhAh(gt2,:,:)= AmpVertexZhhToAhAh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhAh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 1 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhAh(:,gt2,:) = AmpWaveZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,gt1,:) 
AmpVertexZhhToAhAh(:,gt2,:)= AmpVertexZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 2 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhAh(:,:,gt2) = AmpWaveZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,:,gt1) 
AmpVertexZhhToAhAh(:,:,gt2)= AmpVertexZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhAh = AmpVertexhhToAhAh  +  AmpVertexIRoshhToAhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh 
 AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh  
Else 
 AmpSumhhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
    Do gt3=gt2,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpWavehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
Else  
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToAhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! Ah VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,              & 
& AmpTreehhToAhVZ)

  Else 
Call Amplitude_Tree_BLSSM_hhToAhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,             & 
& AmpTreehhToAhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,MVZOS,             & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,MVZOS,            & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,MRPhhToAhVZ,       & 
& MRGhhToAhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,MRPhhToAhVZ,      & 
& MRGhhToAhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToAhVZ(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVPVZ,         & 
& ZfVZ,ZfVZpVZ,AmpWavehhToAhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
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
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhToAhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRdrhhToAhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
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
& cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
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
& cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

 End if 
 End if 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ -  AmpVertexIRdrhhToAhVZ! +  AmpVertexIRoshhToAhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhVZ(:,gt2,:) = AmpWaveZhhToAhVZ(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhVZ(:,gt1,:) 
AmpVertexZhhToAhVZ(:,gt2,:)= AmpVertexZhhToAhVZ(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
! Final State 1 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhVZ(:,:,gt2) = AmpWaveZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhVZ(:,:,gt1) 
AmpVertexZhhToAhVZ(:,:,gt2)= AmpVertexZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ  +  AmpVertexIRoshhToAhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ 
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ  
Else 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpWavehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
Else  
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
End if  
Else  
  AmpSqhhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVZ(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqhhToAhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVZ,helfactor*AmpSqhhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! Ah VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToAhVZp(cplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,MVZp2,          & 
& AmpTreehhToAhVZp)

  Else 
Call Amplitude_Tree_BLSSM_hhToAhVZp(ZcplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,               & 
& MVZp2,AmpTreehhToAhVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZp(MLambda,em,gs,cplAhhhVZp,MAhOS,MhhOS,MVZpOS,          & 
& MRPhhToAhVZp,MRGhhToAhVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZp(MLambda,em,gs,ZcplAhhhVZp,MAhOS,MhhOS,MVZpOS,         & 
& MRPhhToAhVZp,MRGhhToAhVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToAhVZp(MLambda,em,gs,cplAhhhVZp,MAh,Mhh,MVZp,MRPhhToAhVZp,   & 
& MRGhhToAhVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToAhVZp(MLambda,em,gs,ZcplAhhhVZp,MAh,Mhh,MVZp,               & 
& MRPhhToAhVZp,MRGhhToAhVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToAhVZp(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,       & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZp,MVZp2,ZfAh,Zfhh,              & 
& ZfVPVZp,ZfVZp,ZfVZVZp,AmpWavehhToAhVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,              & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexhhToAhVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRdrhhToAhVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

 End if 
 End if 
AmpVertexhhToAhVZp = AmpVertexhhToAhVZp -  AmpVertexIRdrhhToAhVZp! +  AmpVertexIRoshhToAhVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhVZp=0._dp 
AmpVertexZhhToAhVZp=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhVZp(:,gt2,:) = AmpWaveZhhToAhVZp(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhVZp(:,gt1,:) 
AmpVertexZhhToAhVZp(:,gt2,:)= AmpVertexZhhToAhVZp(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhVZp(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhVZp=AmpWaveZhhToAhVZp 
AmpVertexhhToAhVZp= AmpVertexZhhToAhVZp
! Final State 1 
AmpWaveZhhToAhVZp=0._dp 
AmpVertexZhhToAhVZp=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToAhVZp(:,:,gt2) = AmpWaveZhhToAhVZp(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhVZp(:,:,gt1) 
AmpVertexZhhToAhVZp(:,:,gt2)= AmpVertexZhhToAhVZp(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhVZp(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhVZp=AmpWaveZhhToAhVZp 
AmpVertexhhToAhVZp= AmpVertexZhhToAhVZp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhVZp = AmpVertexhhToAhVZp  +  AmpVertexIRoshhToAhVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp 
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp  
Else 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp + AmpWavehhToAhVZp + AmpVertexhhToAhVZp
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp + AmpWavehhToAhVZp + AmpVertexhhToAhVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = 2._dp*AmpWavehhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = 2._dp*AmpVertexhhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqTreehhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2)  
  AmpSum2hhToAhVZp = + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqhhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2) + AmpSqTreehhToAhVZp(gt1, gt2)  
Else  
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqTreehhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2)  
  AmpSum2hhToAhVZp = + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqhhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2) + AmpSqTreehhToAhVZp(gt1, gt2)  
End if  
Else  
  AmpSqhhToAhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVZp(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MVZpOS,helfactor*AmpSqhhToAhVZp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVZp,helfactor*AmpSqhhToAhVZp(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToAhVZp(gt1, gt2) + MRGhhToAhVZp(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToAhVZp(gt1, gt2) + MRGhhToAhVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,MCha,               & 
& Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  Else 
Call Amplitude_Tree_BLSSM_hhTocChaCha(ZcplcChaChahhL,ZcplcChaChahhR,MCha,             & 
& Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,          & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,        & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,          & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,        & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,ctcplcChaChahhL,    & 
& ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWavehhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexhhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrhhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

 End if 
 End if 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha -  AmpVertexIRdrhhTocChaCha! +  AmpVertexIRoshhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocChaCha(:,gt2,:,:) = AmpWaveZhhTocChaCha(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocChaCha(:,gt1,:,:) 
AmpVertexZhhTocChaCha(:,gt2,:,:)= AmpVertexZhhTocChaCha(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 1 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,gt2,:) = AmpWaveZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(1,:,gt1,:) 
AmpVertexZhhTocChaCha(1,:,gt2,:)= AmpVertexZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(1,:,gt1,:) 
AmpWaveZhhTocChaCha(2,:,gt2,:) = AmpWaveZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWavehhTocChaCha(2,:,gt1,:) 
AmpVertexZhhTocChaCha(2,:,gt2,:)= AmpVertexZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexhhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 2 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,:,gt2) = AmpWaveZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWavehhTocChaCha(1,:,:,gt1) 
AmpVertexZhhTocChaCha(1,:,:,gt2)= AmpVertexZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexhhTocChaCha(1,:,:,gt1) 
AmpWaveZhhTocChaCha(2,:,:,gt2) = AmpWaveZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(2,:,:,gt1) 
AmpVertexZhhTocChaCha(2,:,:,gt2)= AmpVertexZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha  +  AmpVertexIRoshhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha 
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha  
Else 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,2
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MCha(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpWavehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocChaCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToChiChi(cplChiChihhL,cplChiChihhR,MChi,Mhh,              & 
& MChi2,Mhh2,AmpTreehhToChiChi)

  Else 
Call Amplitude_Tree_BLSSM_hhToChiChi(ZcplChiChihhL,ZcplChiChihhR,MChi,Mhh,            & 
& MChi2,Mhh2,AmpTreehhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,             & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,           & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,             & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,           & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToChiChi(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,        & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWavehhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexhhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,               & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& ZcplChiChihhL,ZcplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& ZcplChiChihhL,ZcplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,               & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

 End if 
 End if 
AmpVertexhhToChiChi = AmpVertexhhToChiChi -  AmpVertexIRdrhhToChiChi! +  AmpVertexIRoshhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToChiChi(:,gt2,:,:) = AmpWaveZhhToChiChi(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToChiChi(:,gt1,:,:) 
AmpVertexZhhToChiChi(:,gt2,:,:)= AmpVertexZhhToChiChi(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 1 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZhhToChiChi(1,:,gt2,:) = AmpWaveZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,gt1,:) 
AmpVertexZhhToChiChi(1,:,gt2,:)= AmpVertexZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,gt1,:) 
AmpWaveZhhToChiChi(2,:,gt2,:) = AmpWaveZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWavehhToChiChi(2,:,gt1,:) 
AmpVertexZhhToChiChi(2,:,gt2,:)= AmpVertexZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexhhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 2 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZhhToChiChi(1,:,:,gt2) = AmpWaveZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,:,gt1) 
AmpVertexZhhToChiChi(1,:,:,gt2)= AmpVertexZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,:,gt1) 
AmpWaveZhhToChiChi(2,:,:,gt2) = AmpWaveZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(2,:,:,gt1) 
AmpVertexZhhToChiChi(2,:,:,gt2)= AmpVertexZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexhhToChiChi = AmpVertexhhToChiChi  +  AmpVertexIRoshhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi 
 AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi  
Else 
 AmpSumhhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,7
    Do gt3=gt2,7
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MChi(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpWavehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToChiChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,MFd2,             & 
& Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_BLSSM_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,Mhh,MFd2,           & 
& Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFdOS,          & 
& MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,              & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFd,            & 
& Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,              & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,            & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfFDL,ZfFDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocFdFd(:,gt2,:,:) = AmpWaveZhhTocFdFd(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFdFd(:,gt1,:,:) 
AmpVertexZhhTocFdFd(:,gt2,:,:)= AmpVertexZhhTocFdFd(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,gt2,:) = AmpWaveZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1,:) 
AmpVertexZhhTocFdFd(1,:,gt2,:)= AmpVertexZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1,:) 
AmpWaveZhhTocFdFd(2,:,gt2,:) = AmpWaveZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1,:) 
AmpVertexZhhTocFdFd(2,:,gt2,:)= AmpVertexZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,:,gt2) = AmpWaveZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWavehhTocFdFd(1,:,:,gt1) 
AmpVertexZhhTocFdFd(1,:,:,gt2)= AmpVertexZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexhhTocFdFd(1,:,:,gt1) 
AmpWaveZhhTocFdFd(2,:,:,gt2) = AmpWaveZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(2,:,:,gt1) 
AmpVertexZhhTocFdFd(2,:,:,gt2)= AmpVertexZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFd(gt2))+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,MFe2,             & 
& Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_BLSSM_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,MFe,Mhh,MFe2,           & 
& Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFeOS,          & 
& MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,              & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFe,            & 
& Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,              & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,            & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfFEL,ZfFER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,        & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,             & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,             & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,         & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,             & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,ZcplcFeFehhL,         & 
& ZcplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,             & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,             & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,         & 
& cplFvFecVWmR,ZcplcFeFehhL,ZcplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,   & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,             & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,             & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,             & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,         & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,             & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocFeFe(:,gt2,:,:) = AmpWaveZhhTocFeFe(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFeFe(:,gt1,:,:) 
AmpVertexZhhTocFeFe(:,gt2,:,:)= AmpVertexZhhTocFeFe(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,gt2,:) = AmpWaveZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1,:) 
AmpVertexZhhTocFeFe(1,:,gt2,:)= AmpVertexZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1,:) 
AmpWaveZhhTocFeFe(2,:,gt2,:) = AmpWaveZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1,:) 
AmpVertexZhhTocFeFe(2,:,gt2,:)= AmpVertexZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,:,gt2) = AmpWaveZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWavehhTocFeFe(1,:,:,gt1) 
AmpVertexZhhTocFeFe(1,:,:,gt2)= AmpVertexZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexhhTocFeFe(1,:,:,gt1) 
AmpWaveZhhTocFeFe(2,:,:,gt2) = AmpWaveZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(2,:,:,gt1) 
AmpVertexZhhTocFeFe(2,:,:,gt2)= AmpVertexZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFe(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,MFu2,             & 
& Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_BLSSM_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,Mhh,MFu2,           & 
& Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFuOS,          & 
& MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,              & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFu,            & 
& Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,              & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,            & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,ZfFUL,ZfFUR,Zfhh,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,     & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,     & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocFuFu(:,gt2,:,:) = AmpWaveZhhTocFuFu(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFuFu(:,gt1,:,:) 
AmpVertexZhhTocFuFu(:,gt2,:,:)= AmpVertexZhhTocFuFu(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,gt2,:) = AmpWaveZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1,:) 
AmpVertexZhhTocFuFu(1,:,gt2,:)= AmpVertexZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1,:) 
AmpWaveZhhTocFuFu(2,:,gt2,:) = AmpWaveZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1,:) 
AmpVertexZhhTocFuFu(2,:,gt2,:)= AmpVertexZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,:,gt2) = AmpWaveZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWavehhTocFuFu(1,:,:,gt1) 
AmpVertexZhhTocFuFu(1,:,:,gt2)= AmpVertexZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexhhTocFuFu(1,:,:,gt1) 
AmpWaveZhhTocFuFu(2,:,:,gt2) = AmpWaveZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(2,:,:,gt1) 
AmpVertexZhhTocFuFu(2,:,:,gt2)= AmpVertexZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MFuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFu(gt2))+Abs(MFu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToFvFv(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,MFv2,Mhh2,           & 
& AmpTreehhToFvFv)

  Else 
Call Amplitude_Tree_BLSSM_hhToFvFv(ZcplFvFvhhL,ZcplFvFvhhR,MFv,Mhh,MFv2,              & 
& Mhh2,AmpTreehhToFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFvOS,             & 
& MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFvOS,           & 
& MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFv,               & 
& Mhh,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFv,             & 
& Mhh,MRPhhToFvFv,MRGhhToFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToFvFv(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,ctcplFvFvhhR,   & 
& MFv,MFv2,Mhh,Mhh2,ZfFvm,Zfhh,AmpWavehhToFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,         & 
& cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexhhToFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhToFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& AmpVertexIRoshhToFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& ZcplFvFvhhL,ZcplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,       & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& AmpVertexIRoshhToFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToFvFv)

 End if 
 End if 
AmpVertexhhToFvFv = AmpVertexhhToFvFv -  AmpVertexIRdrhhToFvFv! +  AmpVertexIRoshhToFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToFvFv(:,gt2,:,:) = AmpWaveZhhToFvFv(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToFvFv(:,gt1,:,:) 
AmpVertexZhhToFvFv(:,gt2,:,:)= AmpVertexZhhToFvFv(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 1 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToFvFv(1,:,gt2,:) = AmpWaveZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,gt1,:) 
AmpVertexZhhToFvFv(1,:,gt2,:)= AmpVertexZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,gt1,:) 
AmpWaveZhhToFvFv(2,:,gt2,:) = AmpWaveZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWavehhToFvFv(2,:,gt1,:) 
AmpVertexZhhToFvFv(2,:,gt2,:)= AmpVertexZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexhhToFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 2 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToFvFv(1,:,:,gt2) = AmpWaveZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,:,gt1) 
AmpVertexZhhToFvFv(1,:,:,gt2)= AmpVertexZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,:,gt1) 
AmpWaveZhhToFvFv(2,:,:,gt2) = AmpWaveZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(2,:,:,gt1) 
AmpVertexZhhToFvFv(2,:,:,gt2)= AmpVertexZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexhhToFvFv = AmpVertexhhToFvFv  +  AmpVertexIRoshhToFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fv Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv 
 AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv  
Else 
 AmpSumhhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MFvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFv(gt2))+Abs(MFv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpWavehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToFvFv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_BLSSM_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,MRPhhTohhhh,             & 
& MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,MRPhhTohhhh,            & 
& MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,MRPhhTohhhh,               & 
& MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,MRPhhTohhhh,              & 
& MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,Zfhh,               & 
& AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,     & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,     & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,               & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,     & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,               & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,     & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,              & 
& cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVPVZ1,cplhhhhVPVZp1,         & 
& cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTohhhh(gt2,:,:) = AmpWaveZhhTohhhh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(gt1,:,:) 
AmpVertexZhhTohhhh(gt2,:,:)= AmpVertexZhhTohhhh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 1 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTohhhh(:,gt2,:) = AmpWaveZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,gt1,:) 
AmpVertexZhhTohhhh(:,gt2,:)= AmpVertexZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 2 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTohhhh(:,:,gt2) = AmpWaveZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,:,gt1) 
AmpVertexZhhTohhhh(:,:,gt2)= AmpVertexZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
    Do gt3=gt2,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhTocHpmHpm(cplhhHpmcHpm,Mhh,MHpm,Mhh2,MHpm2,               & 
& AmpTreehhTocHpmHpm)

  Else 
Call Amplitude_Tree_BLSSM_hhTocHpmHpm(ZcplhhHpmcHpm,Mhh,MHpm,Mhh2,MHpm2,              & 
& AmpTreehhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,MhhOS,MHpmOS,            & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,MhhOS,MHpmOS,           & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,Mhh,MHpm,MRPhhTocHpmHpm, & 
& MRGhhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,Mhh,MHpm,               & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocHpmHpm(cplhhHpmcHpm,ctcplhhHpmcHpm,Mhh,Mhh2,           & 
& MHpm,MHpm2,Zfhh,ZfHpm,AmpWavehhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm, & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexhhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm, & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexIRdrhhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,             & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm, & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexIRoshhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,             & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm, & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,     & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,     & 
& cplhhHpmcVWmVZp1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhcHpmVPVWm1,   & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,& 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,  & 
& cplHpmcHpmVZpVZp1,AmpVertexIRoshhTocHpmHpm)

 End if 
 End if 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm -  AmpVertexIRdrhhTocHpmHpm! +  AmpVertexIRoshhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocHpmHpm(gt2,:,:) = AmpWaveZhhTocHpmHpm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocHpmHpm(gt1,:,:) 
AmpVertexZhhTocHpmHpm(gt2,:,:)= AmpVertexZhhTocHpmHpm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 1 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,gt2,:) = AmpWaveZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,gt1,:) 
AmpVertexZhhTocHpmHpm(:,gt2,:)= AmpVertexZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 2 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,:,gt2) = AmpWaveZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,:,gt1) 
AmpVertexZhhTocHpmHpm(:,:,gt2)= AmpVertexZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm  +  AmpVertexIRoshhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm 
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm  
Else 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpWavehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocHpmHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToHpmcVWm(cplhhHpmcVWm,Mhh,MHpm,MVWm,Mhh2,MHpm2,          & 
& MVWm2,AmpTreehhToHpmcVWm)

  Else 
Call Amplitude_Tree_BLSSM_hhToHpmcVWm(ZcplhhHpmcVWm,Mhh,MHpm,MVWm,Mhh2,               & 
& MHpm2,MVWm2,AmpTreehhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,MhhOS,MHpmOS,            & 
& MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,MhhOS,MHpmOS,           & 
& MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,Mhh,MHpm,MVWm,           & 
& MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,Mhh,MHpm,               & 
& MVWm,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToHpmcVWm(cplhhHpmcVWm,ctcplhhHpmcVWm,Mhh,Mhh2,           & 
& MHpm,MHpm2,MVWm,MVWm2,Zfhh,ZfHpm,ZfVWm,AmpWavehhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexhhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRdrhhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& GosZcplhhHpmcHpm,ZcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,         & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,GosZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,   & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& GZcplhhHpmcHpm,ZcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,           & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,GZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,     & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& GcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,GcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAHpm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,       & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,      & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

 End if 
 End if 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm -  AmpVertexIRdrhhToHpmcVWm! +  AmpVertexIRoshhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToHpmcVWm(:,gt2,:) = AmpWaveZhhToHpmcVWm(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToHpmcVWm(:,gt1,:) 
AmpVertexZhhToHpmcVWm(:,gt2,:)= AmpVertexZhhToHpmcVWm(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
! Final State 1 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToHpmcVWm(:,:,gt2) = AmpWaveZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhToHpmcVWm(:,:,gt1) 
AmpVertexZhhToHpmcVWm(:,:,gt2)= AmpVertexZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm  +  AmpVertexIRoshhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm 
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm  
Else 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpWavehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqhhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToHpmcVWm(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocSdSd(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreehhTocSdSd)

  Else 
Call Amplitude_Tree_BLSSM_hhTocSdSd(ZcplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreehhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,MhhOS,MSdOS,MRPhhTocSdSd,    & 
& MRGhhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,MhhOS,MSdOS,MRPhhTocSdSd,   & 
& MRGhhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,Mhh,MSd,MRPhhTocSdSd,        & 
& MRGhhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,Mhh,MSd,MRPhhTocSdSd,       & 
& MRGhhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocSdSd(cplhhSdcSd,ctcplhhSdcSd,Mhh,Mhh2,MSd,             & 
& MSd2,Zfhh,ZfSd,AmpWavehhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
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
& cplSdcSdVZpVZpaa,AmpVertexhhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdcSdVZpVZpaa,AmpVertexIRdrhhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
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
& cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
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
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
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
& cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

 End if 
 End if 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd -  AmpVertexIRdrhhTocSdSd! +  AmpVertexIRoshhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocSdSd(gt2,:,:) = AmpWaveZhhTocSdSd(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSdSd(gt1,:,:) 
AmpVertexZhhTocSdSd(gt2,:,:)= AmpVertexZhhTocSdSd(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 1 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,gt2,:) = AmpWaveZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWavehhTocSdSd(:,gt1,:) 
AmpVertexZhhTocSdSd(:,gt2,:)= AmpVertexZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexhhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 2 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,:,gt2) = AmpWaveZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWavehhTocSdSd(:,:,gt1) 
AmpVertexZhhTocSdSd(:,:,gt2)= AmpVertexZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexhhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd  +  AmpVertexIRoshhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd 
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd  
Else 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSd(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpWavehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSdSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocSeSe(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreehhTocSeSe)

  Else 
Call Amplitude_Tree_BLSSM_hhTocSeSe(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreehhTocSeSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocSeSe(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,MRPhhTocSeSe,    & 
& MRGhhTocSeSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,MRPhhTocSeSe,   & 
& MRGhhTocSeSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocSeSe(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPhhTocSeSe,        & 
& MRGhhTocSeSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,MRPhhTocSeSe,       & 
& MRGhhTocSeSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocSeSe(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,MSe,             & 
& MSe2,Zfhh,ZfSe,AmpWavehhTocSeSe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSd,             & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,            & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,              & 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,            & 
& cplSecSeVZpVZp1,AmpVertexhhTocSeSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,               & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,             & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,  & 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,            & 
& cplSecSeVZpVZp1,AmpVertexIRdrhhTocSeSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,           & 
& cplAhAhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,        & 
& cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,      & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSecSeVPVZ1,cplSecSeVPVZp1,    & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,               & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,ZcplhhSecSe,               & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,              & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplhhhhSecSe1,        & 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,    & 
& cplSeSvReSvRecSe1,cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSecVWmVWm1,cplSecSeVZVZ1,         & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,           & 
& cplAhAhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,        & 
& cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,      & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSecSeVPVZ1,cplSecSeVPVZp1,    & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,               & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,             & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,  & 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,            & 
& cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

 End if 
 End if 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe -  AmpVertexIRdrhhTocSeSe! +  AmpVertexIRoshhTocSeSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocSeSe(gt2,:,:) = AmpWaveZhhTocSeSe(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSeSe(gt1,:,:) 
AmpVertexZhhTocSeSe(gt2,:,:)= AmpVertexZhhTocSeSe(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSeSe(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 1 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,gt2,:) = AmpWaveZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWavehhTocSeSe(:,gt1,:) 
AmpVertexZhhTocSeSe(:,gt2,:)= AmpVertexZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexhhTocSeSe(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 2 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,:,gt2) = AmpWaveZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWavehhTocSeSe(:,:,gt1) 
AmpVertexZhhTocSeSe(:,:,gt2)= AmpVertexZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexhhTocSeSe(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe  +  AmpVertexIRoshhTocSeSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Se] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe 
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe  
Else 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSe(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpWavehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSeSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSeSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSe(gt2),MSe(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhTocSuSu(cplhhSucSu,Mhh,MSu,Mhh2,MSu2,AmpTreehhTocSuSu)

  Else 
Call Amplitude_Tree_BLSSM_hhTocSuSu(ZcplhhSucSu,Mhh,MSu,Mhh2,MSu2,AmpTreehhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocSuSu(MLambda,em,gs,cplhhSucSu,MhhOS,MSuOS,MRPhhTocSuSu,    & 
& MRGhhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,MhhOS,MSuOS,MRPhhTocSuSu,   & 
& MRGhhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocSuSu(MLambda,em,gs,cplhhSucSu,Mhh,MSu,MRPhhTocSuSu,        & 
& MRGhhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,Mhh,MSu,MRPhhTocSuSu,       & 
& MRGhhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocSuSu(cplhhSucSu,ctcplhhSucSu,Mhh,Mhh2,MSu,             & 
& MSu2,Zfhh,ZfSu,AmpWavehhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,            & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,     & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplhhhhSucSuaa,           & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,    & 
& cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexhhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,               & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,& 
& cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRdrhhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,     & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplhhhhSucSuaa,           & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,    & 
& cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,               & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,    & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,& 
& cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,MVZOS,            & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,     & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplhhhhSucSuaa,           & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,    & 
& cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,               & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,& 
& cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

 End if 
 End if 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu -  AmpVertexIRdrhhTocSuSu! +  AmpVertexIRoshhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocSuSu(gt2,:,:) = AmpWaveZhhTocSuSu(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSuSu(gt1,:,:) 
AmpVertexZhhTocSuSu(gt2,:,:)= AmpVertexZhhTocSuSu(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 1 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,gt2,:) = AmpWaveZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWavehhTocSuSu(:,gt1,:) 
AmpVertexZhhTocSuSu(:,gt2,:)= AmpVertexZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexhhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 2 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,:,gt2) = AmpWaveZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWavehhTocSuSu(:,:,gt1) 
AmpVertexZhhTocSuSu(:,:,gt2)= AmpVertexZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexhhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu  +  AmpVertexIRoshhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu 
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu  
Else 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSu(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpWavehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSuSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToSvImSvIm(cplhhSvImSvIm,Mhh,MSvIm,Mhh2,MSvIm2,           & 
& AmpTreehhToSvImSvIm)

  Else 
Call Amplitude_Tree_BLSSM_hhToSvImSvIm(ZcplhhSvImSvIm,Mhh,MSvIm,Mhh2,MSvIm2,          & 
& AmpTreehhToSvImSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToSvImSvIm(MLambda,em,gs,cplhhSvImSvIm,MhhOS,MSvImOS,         & 
& MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToSvImSvIm(MLambda,em,gs,ZcplhhSvImSvIm,MhhOS,MSvImOS,        & 
& MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToSvImSvIm(MLambda,em,gs,cplhhSvImSvIm,Mhh,MSvIm,             & 
& MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToSvImSvIm(MLambda,em,gs,ZcplhhSvImSvIm,Mhh,MSvIm,            & 
& MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToSvImSvIm(cplhhSvImSvIm,ctcplhhSvImSvIm,Mhh,             & 
& Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,AmpWavehhToSvImSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,  & 
& cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,             & 
& cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,     & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,               & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexhhToSvImSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,  & 
& cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,             & 
& cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,     & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,               & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRdrhhToSvImSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,     & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,       & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,& 
& cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,          & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,          & 
& cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,             & 
& AmpVertexIRoshhToSvImSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,  & 
& cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,             & 
& cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,     & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,               & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRoshhToSvImSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,     & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,       & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,& 
& cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,          & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,          & 
& cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,             & 
& AmpVertexIRoshhToSvImSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplAhAhSvImSvIm1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,  & 
& cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,             & 
& cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,     & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,               & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRoshhToSvImSvIm)

 End if 
 End if 
AmpVertexhhToSvImSvIm = AmpVertexhhToSvImSvIm -  AmpVertexIRdrhhToSvImSvIm! +  AmpVertexIRoshhToSvImSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToSvImSvIm(gt2,:,:) = AmpWaveZhhToSvImSvIm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvImSvIm(gt1,:,:) 
AmpVertexZhhToSvImSvIm(gt2,:,:)= AmpVertexZhhToSvImSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvImSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
! Final State 1 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvImSvIm(:,gt2,:) = AmpWaveZhhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWavehhToSvImSvIm(:,gt1,:) 
AmpVertexZhhToSvImSvIm(:,gt2,:)= AmpVertexZhhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvImSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
! Final State 2 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvImSvIm(:,:,gt2) = AmpWaveZhhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWavehhToSvImSvIm(:,:,gt1) 
AmpVertexZhhToSvImSvIm(:,:,gt2)= AmpVertexZhhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvImSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvImSvIm = AmpVertexhhToSvImSvIm  +  AmpVertexIRoshhToSvImSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvIm SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm 
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm  
Else 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm + AmpWavehhToSvImSvIm + AmpVertexhhToSvImSvIm
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + AmpWavehhToSvImSvIm + AmpVertexhhToSvImSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = 2._dp*AmpWavehhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = 2._dp*AmpVertexhhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvImSvIm = + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvImSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvImSvIm = + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvImSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToSvImSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),helfactor*AmpSqhhToSvImSvIm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),helfactor*AmpSqhhToSvImSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvImSvIm(gt1, gt2, gt3) + MRGhhToSvImSvIm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvImSvIm(gt1, gt2, gt3) + MRGhhToSvImSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToSvReSvIm(cplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,            & 
& MSvIm2,MSvRe2,AmpTreehhToSvReSvIm)

  Else 
Call Amplitude_Tree_BLSSM_hhToSvReSvIm(ZcplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,           & 
& MSvIm2,MSvRe2,AmpTreehhToSvReSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvIm(MLambda,em,gs,cplhhSvImSvRe,MhhOS,MSvImOS,         & 
& MSvReOS,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvIm(MLambda,em,gs,ZcplhhSvImSvRe,MhhOS,MSvImOS,        & 
& MSvReOS,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToSvReSvIm(MLambda,em,gs,cplhhSvImSvRe,Mhh,MSvIm,             & 
& MSvRe,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvIm(MLambda,em,gs,ZcplhhSvImSvRe,Mhh,MSvIm,            & 
& MSvRe,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToSvReSvIm(cplhhSvImSvRe,ctcplhhSvImSvRe,Mhh,             & 
& Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,AmpWavehhToSvReSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,           & 
& cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,      & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,     & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexhhToSvReSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,           & 
& cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,      & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,     & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrhhToSvReSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,          & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,ZcplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,     & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRoshhToSvReSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,           & 
& cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,      & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,ZcplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,    & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,          & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,          & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,  & 
& cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,     & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,               & 
& cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,     & 
& AmpVertexIRoshhToSvReSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,           & 
& cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,      & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,     & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,   & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,             & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

 End if 
 End if 
AmpVertexhhToSvReSvIm = AmpVertexhhToSvReSvIm -  AmpVertexIRdrhhToSvReSvIm! +  AmpVertexIRoshhToSvReSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToSvReSvIm(gt2,:,:) = AmpWaveZhhToSvReSvIm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvReSvIm(gt1,:,:) 
AmpVertexZhhToSvReSvIm(gt2,:,:)= AmpVertexZhhToSvReSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvReSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
! Final State 1 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvReSvIm(:,gt2,:) = AmpWaveZhhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvIm(:,gt1,:) 
AmpVertexZhhToSvReSvIm(:,gt2,:)= AmpVertexZhhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
! Final State 2 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvReSvIm(:,:,gt2) = AmpWaveZhhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWavehhToSvReSvIm(:,:,gt1) 
AmpVertexZhhToSvReSvIm(:,:,gt2)= AmpVertexZhhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvReSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvReSvIm = AmpVertexhhToSvReSvIm  +  AmpVertexIRoshhToSvReSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvRe SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm 
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm  
Else 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm + AmpWavehhToSvReSvIm + AmpVertexhhToSvReSvIm
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + AmpWavehhToSvReSvIm + AmpVertexhhToSvReSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MSvImOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MSvIm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = 2._dp*AmpWavehhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = 2._dp*AmpVertexhhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvIm = + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvReSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvIm = + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvReSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToSvReSvIm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),helfactor*AmpSqhhToSvReSvIm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),helfactor*AmpSqhhToSvReSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhToSvReSvIm(gt1, gt2, gt3) + MRGhhToSvReSvIm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhToSvReSvIm(gt1, gt2, gt3) + MRGhhToSvReSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_hhToSvReSvRe(cplhhSvReSvRe,Mhh,MSvRe,Mhh2,MSvRe2,           & 
& AmpTreehhToSvReSvRe)

  Else 
Call Amplitude_Tree_BLSSM_hhToSvReSvRe(ZcplhhSvReSvRe,Mhh,MSvRe,Mhh2,MSvRe2,          & 
& AmpTreehhToSvReSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvRe(MLambda,em,gs,cplhhSvReSvRe,MhhOS,MSvReOS,         & 
& MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvRe(MLambda,em,gs,ZcplhhSvReSvRe,MhhOS,MSvReOS,        & 
& MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToSvReSvRe(MLambda,em,gs,cplhhSvReSvRe,Mhh,MSvRe,             & 
& MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToSvReSvRe(MLambda,em,gs,ZcplhhSvReSvRe,Mhh,MSvRe,            & 
& MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToSvReSvRe(cplhhSvReSvRe,ctcplhhSvReSvRe,Mhh,             & 
& Mhh2,MSvRe,MSvRe2,Zfhh,ZfSvRe,AmpWavehhToSvReSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,             & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,             & 
& cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,     & 
& cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,               & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexhhToSvReSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,             & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,             & 
& cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,     & 
& cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,               & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRdrhhToSvReSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& ZcplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,          & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvReVPVZ1,       & 
& cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,              & 
& cplSvReSvReVZpVZp1,AmpVertexIRoshhToSvReSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,ZcplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,           & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,             & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,             & 
& cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,     & 
& cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,               & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRoshhToSvReSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,     & 
& cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,& 
& cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,          & 
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,          & 
& cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,             & 
& AmpVertexIRoshhToSvReSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,            & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplAhAhSvReSvRe1,             & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,             & 
& cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,     & 
& cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,               & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRoshhToSvReSvRe)

 End if 
 End if 
AmpVertexhhToSvReSvRe = AmpVertexhhToSvReSvRe -  AmpVertexIRdrhhToSvReSvRe! +  AmpVertexIRoshhToSvReSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToSvReSvRe(gt2,:,:) = AmpWaveZhhToSvReSvRe(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvReSvRe(gt1,:,:) 
AmpVertexZhhToSvReSvRe(gt2,:,:)= AmpVertexZhhToSvReSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvReSvRe(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
! Final State 1 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvReSvRe(:,gt2,:) = AmpWaveZhhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvRe(:,gt1,:) 
AmpVertexZhhToSvReSvRe(:,gt2,:)= AmpVertexZhhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvRe(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
! Final State 2 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToSvReSvRe(:,:,gt2) = AmpWaveZhhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvRe(:,:,gt1) 
AmpVertexZhhToSvReSvRe(:,:,gt2)= AmpVertexZhhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvRe(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvReSvRe = AmpVertexhhToSvReSvRe  +  AmpVertexIRoshhToSvReSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvRe SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe 
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe  
Else 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe + AmpWavehhToSvReSvRe + AmpVertexhhToSvReSvRe
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + AmpWavehhToSvReSvRe + AmpVertexhhToSvReSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MSvReOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MSvRe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = 2._dp*AmpWavehhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = 2._dp*AmpVertexhhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvRe = + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreehhToSvReSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvRe = + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreehhToSvReSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToSvReSvRe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),helfactor*AmpSqhhToSvReSvRe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),helfactor*AmpSqhhToSvReSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvReSvRe(gt1, gt2, gt3) + MRGhhToSvReSvRe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvReSvRe(gt1, gt2, gt3) + MRGhhToSvReSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
! Conjg(VWm) VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhTocVWmVWm(cplhhcVWmVWm,Mhh,MVWm,Mhh2,MVWm2,               & 
& AmpTreehhTocVWmVWm)

  Else 
Call Amplitude_Tree_BLSSM_hhTocVWmVWm(ZcplhhcVWmVWm,Mhh,MVWm,Mhh2,MVWm2,              & 
& AmpTreehhTocVWmVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,MhhOS,MVWmOS,            & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,MhhOS,MVWmOS,           & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,Mhh,MVWm,MRPhhTocVWmVWm, & 
& MRGhhTocVWmVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,Mhh,MVWm,               & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhTocVWmVWm(cplhhcVWmVWm,ctcplhhcVWmVWm,Mhh,Mhh2,           & 
& MVWm,MVWm2,Zfhh,ZfVWm,AmpWavehhTocVWmVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,    & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,           & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,               & 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexhhTocVWmVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,    & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,           & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,               & 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRdrhhTocVWmVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,GosZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,      & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,GosZcplhhcHpmVWm,ZcplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,            & 
& GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,  & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,              & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,      & 
& cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,GZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,        & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,GZcplhhcHpmVWm,ZcplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,              & 
& GZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,    & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,              & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,      & 
& cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,GcplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,   & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,           & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,               & 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,               & 
& cplcgZpgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,             & 
& cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,    & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,           & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,               & 
& cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,             & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 End if 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm -  AmpVertexIRdrhhTocVWmVWm! +  AmpVertexIRoshhTocVWmVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocVWmVWm=0._dp 
AmpVertexZhhTocVWmVWm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhTocVWmVWm(:,gt2) = AmpWaveZhhTocVWmVWm(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTocVWmVWm(:,gt1) 
AmpVertexZhhTocVWmVWm(:,gt2)= AmpVertexZhhTocVWmVWm(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhTocVWmVWm(:,gt1) 
 End Do 
End Do 
AmpWavehhTocVWmVWm=AmpWaveZhhTocVWmVWm 
AmpVertexhhTocVWmVWm= AmpVertexZhhTocVWmVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm  +  AmpVertexIRoshhTocVWmVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWm] VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm 
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm  
Else 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm 
End if 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVWmOS)+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVWm)+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpWavehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWmVWm(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
Else  
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
End if  
Else  
  AmpSqhhTocVWmVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWmVWm(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqhhTocVWmVWm(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVWm,MVWm,helfactor*AmpSqhhTocVWmVWm(gt1))
End if 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_BLSSM_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,MVZOS,MRPhhToVZVZ,       & 
& MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,MVZOS,MRPhhToVZVZ,      & 
& MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,           & 
& MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,          & 
& MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVZVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVPVZ,ZfVZ,ZfVZpVZ,ZfVZVP,ZfVZVZp,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,        & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,        & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,              & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,ZcplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,        & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,       & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,ZcplhhVZVZ,               & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,        & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,       & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,              & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,        & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,  & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,        & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZVZ=0._dp 
AmpVertexZhhToVZVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToVZVZ(:,gt2) = AmpWaveZhhToVZVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZVZ(:,gt1) 
AmpVertexZhhToVZVZ(:,gt2)= AmpVertexZhhToVZVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZVZ=AmpWaveZhhToVZVZ 
AmpVertexhhToVZVZ= AmpVertexZhhToVZVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZ)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
End if  
Else  
  AmpSqhhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZ,MVZ,helfactor*AmpSqhhToVZVZ(gt1))
End if 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToVZpVZ(cplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,MVZp2,          & 
& AmpTreehhToVZpVZ)

  Else 
Call Amplitude_Tree_BLSSM_hhToVZpVZ(ZcplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,               & 
& MVZp2,AmpTreehhToVZpVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,MhhOS,MVZOS,MVZpOS,          & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,MhhOS,MVZOS,MVZpOS,         & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,Mhh,MVZ,MVZp,MRPhhToVZpVZ,   & 
& MRGhhToVZpVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,Mhh,MVZ,MVZp,               & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVZpVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZ,ZfVZ,ZfVZp,ZfVZpVP,ZfVZpVZ,          & 
& AmpWavehhToVZpVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexhhToVZpVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexIRdrhhToVZpVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,              & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,ZcplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,ZcplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,              & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvImSvReVZ,cplSvImSvReVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,      & 
& cplSvImSvImVZVZp1,cplSvReSvReVZVZp1,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,               & 
& cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 End if 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ -  AmpVertexIRdrhhToVZpVZ! +  AmpVertexIRoshhToVZpVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZ=0._dp 
AmpVertexZhhToVZpVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToVZpVZ(:,gt2) = AmpWaveZhhToVZpVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZpVZ(:,gt1) 
AmpVertexZhhToVZpVZ(:,gt2)= AmpVertexZhhToVZpVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZpVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZ=AmpWaveZhhToVZpVZ 
AmpVertexhhToVZpVZ= AmpVertexZhhToVZpVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ  +  AmpVertexIRoshhToVZpVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ 
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ  
Else 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ 
End if 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpWavehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
Else  
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
End if  
Else  
  AmpSqhhToVZpVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZOS,helfactor*AmpSqhhToVZpVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVZp,MVZ,helfactor*AmpSqhhToVZpVZ(gt1))
End if 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_hhToVZpVZp(cplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,AmpTreehhToVZpVZp)

  Else 
Call Amplitude_Tree_BLSSM_hhToVZpVZp(ZcplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,AmpTreehhToVZpVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,MhhOS,MVZpOS,              & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,MhhOS,MVZpOS,             & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,Mhh,MVZp,MRPhhToVZpVZp,    & 
& MRGhhToVZpVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,Mhh,MVZp,MRPhhToVZpVZp,   & 
& MRGhhToVZpVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVZpVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZp,ZfVZp,ZfVZpVP,ZfVZpVZ,              & 
& ZfVZVZp,AmpWavehhToVZpVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexhhToVZpVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRdrhhToVZpVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,             & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,ZcplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,ZcplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,           & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,          & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,             & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,          & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,            & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,  & 
& cplSvImSvImVZpVZp1,cplSvReSvReVZpVZp1,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,           & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

 End if 
 End if 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp -  AmpVertexIRdrhhToVZpVZp! +  AmpVertexIRoshhToVZpVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZp=0._dp 
AmpVertexZhhToVZpVZp=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZhhToVZpVZp(:,gt2) = AmpWaveZhhToVZpVZp(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZpVZp(:,gt1) 
AmpVertexZhhToVZpVZp(:,gt2)= AmpVertexZhhToVZpVZp(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZpVZp(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZp=AmpWaveZhhToVZpVZp 
AmpVertexhhToVZpVZp= AmpVertexZhhToVZpVZp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp  +  AmpVertexIRoshhToVZpVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp 
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp  
Else 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp 
End if 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpWavehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
Else  
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
End if  
Else  
  AmpSqhhToVZpVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZpOS,helfactor*AmpSqhhToVZpVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZp,MVZp,helfactor*AmpSqhhToVZpVZp(gt1))
End if 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End If 
!---------------- 
! Ah hh
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhToAhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
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
& cplhhhhSvReSvRe1,AmpVertexhhToAhhh)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToAhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
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
& cplhhhhSvReSvRe1,AmpVertexhhToAhhh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToAhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
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
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexhhToAhhh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah hh -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhhh = 0._dp 
 AmpSum2hhToAhhh = 0._dp  
Else 
 AmpSumhhToAhhh = AmpVertexhhToAhhh + AmpWavehhToAhhh
 AmpSum2hhToAhhh = AmpVertexhhToAhhh + AmpWavehhToAhhh 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(Mhh(gt3)))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MhhOS(gt3),AmpSumhhToAhhh(gt1, gt2, gt3),AmpSum2hhToAhhh(gt1, gt2, gt3),AmpSqhhToAhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),Mhh(gt3),AmpSumhhToAhhh(gt1, gt2, gt3),AmpSum2hhToAhhh(gt1, gt2, gt3),AmpSqhhToAhhh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqhhToAhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhToAhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),Mhh(gt3),helfactor*AmpSqhhToAhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToAhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_hhToAhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,ZfAh,Zfhh,ZfVP,            & 
& ZfVZpVP,ZfVZVP,AmpWavehhToAhVP)

 Else 
Call Amplitude_WAVE_BLSSM_hhToAhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,ZfAh,Zfhh,ZfVP,            & 
& ZfVZpVP,ZfVZVP,AmpWavehhToAhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhToAhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
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
& AmpVertexhhToAhVP)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToAhVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
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
& AmpVertexhhToAhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToAhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ctcplAhhhVP,        & 
& ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,ZfAh,Zfhh,ZfVP,ZfVZpVP,            & 
& ZfVZVP,AmpWavehhToAhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToAhVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
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
& cplhhhhVPVZp1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVP = 0._dp 
 AmpSum2hhToAhVP = 0._dp  
Else 
 AmpSumhhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP
 AmpSum2hhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=3,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),0._dp,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVP,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVP(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqhhToAhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVP,helfactor*AmpSqhhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
Call Amplitude_VERTEX_BLSSM_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,MSuOS,          & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,AmpVertexhhToGluGlu)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,MSuOS,          & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,AmpVertexhhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToGluGlu(MFd,MFu,MGlu,Mhh,MSd,MSu,MFd2,MFu2,            & 
& MGlu2,Mhh2,MSd2,MSu2,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,           & 
& cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,AmpVertexhhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToGluGlu = 0._dp 
 AmpSum2hhToGluGlu = 0._dp  
Else 
 AmpSumhhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu
 AmpSum2hhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MGluOS)+Abs(MGluOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MGlu)+Abs(MGlu))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MGluOS,MGluOS,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MGlu,MGlu,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
End if  
Else  
  AmpSqhhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhToGluGlu(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(MhhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqhhToGluGlu(gt1))
Else 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(Mhh(gt1),MGlu,MGlu,helfactor*AmpSqhhToGluGlu(gt1))
End if 
If ((Abs(MRPhhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhTohhVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,           & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MCha2OS,MChi2OS,             & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,         & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,       & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,         & 
& cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_BLSSM_hhTohhVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,           & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MCha2OS,MChi2OS,             & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,         & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,       & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,         & 
& cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTohhVP(MCha,MChi,MFd,MFe,MFu,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,     & 
& cplcChaChaVPR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,       & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,              & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),0._dp,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVP,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqhhTohhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVP,helfactor*AmpSqhhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhTohhVZ(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,           & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhHpmcHpm,       & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,         & 
& cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_hhTohhVZ(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,           & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhHpmcHpm,       & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,         & 
& cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTohhVZ(MCha,MChi,MFd,MFe,MFu,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,     & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZOS,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZ,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqhhTohhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqhhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! hh VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhTohhVZp(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MCha2OS,MChi2OS,          & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZp,cplHpmcVWmVZp,     & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexhhTohhVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_hhTohhVZp(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZpOS,MCha2OS,MChi2OS,          & 
& MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,              & 
& MSvRe2OS,MVWm2OS,MVZp2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZp,cplHpmcVWmVZp,     & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,        & 
& cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexhhTohhVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhTohhVZp(MCha,MChi,MFd,MFe,MFu,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZp,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZp2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZp,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,            & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVZp,     & 
& cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,        & 
& cplcVWmVWmVZp,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,AmpVertexhhTohhVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZp = 0._dp 
 AmpSum2hhTohhVZp = 0._dp  
Else 
 AmpSumhhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp
 AmpSum2hhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZp,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZp(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZpOS,helfactor*AmpSqhhTohhVZp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZp,helfactor*AmpSqhhTohhVZp(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
Call Amplitude_VERTEX_BLSSM_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,MVG,               & 
& MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,MVG,               & 
& MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVGVG(MFd,MFu,Mhh,MSd,MSu,MVG,MFd2,MFu2,               & 
& Mhh2,MSd2,MSu2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,cplSdcSdVG,cplSucSuVG,       & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVG)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVG,MVG,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
End if  
Else  
  AmpSqhhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVGVG(gt1))
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh(gt1),MVG,MVG,helfactor*AmpSqhhToVGVG(gt1))
End if 
If ((Abs(MRPhhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,            & 
& AmpWavehhToVPVP)

 Else 
Call Amplitude_WAVE_BLSSM_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,            & 
& AmpWavehhToVPVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhToVPVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,  & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplAhAhVPVP1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,        & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,          & 
& cplSucSuVPVPaa,cplSvImSvImVPVP1,cplSvReSvReVPVP1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,    & 
& cplcVWmVPVPVWm2Q,AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToVPVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,      & 
& cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,  & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplAhAhVPVP1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,        & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,          & 
& cplSucSuVPVPaa,cplSvImSvImVPVP1,cplSvReSvReVPVP1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,    & 
& cplcVWmVPVPVWm2Q,AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,AmpWavehhToVPVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVPVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,  & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplAhAhVPVP1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,        & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,          & 
& cplSucSuVPVPaa,cplSvImSvImVPVP1,cplSvReSvReVPVP1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,    & 
& cplcVWmVPVPVWm2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVP,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
End if  
Else  
  AmpSqhhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVPVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVP,MVP,helfactor*AmpSqhhToVPVP(gt1))
End if 
If ((Abs(MRPhhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,              & 
& AmpWavehhToVPVZ)

 Else 
Call Amplitude_WAVE_BLSSM_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,              & 
& AmpWavehhToVPVZ)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhToVPVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,       & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,       & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVZ,cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVWmVZ,cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,        & 
& cplhhhhVZVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,         & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplSvImSvImVPVZ1,          & 
& cplSvReSvReVPVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToVPVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,       & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,       & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVZ,cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVWmVZ,cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,        & 
& cplhhhhVZVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,         & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplSvImSvImVPVZ1,          & 
& cplSvReSvReVPVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,AmpWavehhToVPVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVPVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,      & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,            & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,           & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVZ,cplSvImSvReVP,cplSvImSvReVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVWmVZ,cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,        & 
& cplhhhhVZVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,         & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplSvImSvImVPVZ1,          & 
& cplSvReSvReVPVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZOS,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZ,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
End if  
Else  
  AmpSqhhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZOS,helfactor*AmpSqhhToVPVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZ,helfactor*AmpSqhhToVPVZ(gt1))
End if 
If ((Abs(MRPhhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
!---------------- 
! VP VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,            & 
& ZfVZp,ZfVZVZp,AmpWavehhToVPVZp)

 Else 
Call Amplitude_WAVE_BLSSM_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,            & 
& ZfVZp,ZfVZVZp,AmpWavehhToVPVZp)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_hhToVPVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVP,     & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,             & 
& cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,cplcHpmVPVWm,cplcVWmVPVWm,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,               & 
& cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_hhToVPVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,          & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,       & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVP,     & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,              & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,             & 
& cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,cplcHpmVPVWm,cplcVWmVPVWm,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,               & 
& cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZp,ZfVZVZp,          & 
& AmpWavehhToVPVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_hhToVPVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,               & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,    & 
& cplChiChiVPR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpChh,        & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVP,cplHpmcVWmVP,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,             & 
& cplSucSuVP,cplSucSuVZp,cplSvImSvReVP,cplSvImSvReVZp,cplcHpmVPVWm,cplcVWmVPVWm,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,     & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,         & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& cplSvImSvImVPVZp1,cplSvReSvReVPVZp1,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,               & 
& cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZp = 0._dp 
 AmpSum2hhToVPVZp = 0._dp  
Else 
 AmpSumhhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp
 AmpSum2hhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZpOS,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZp,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
End if  
Else  
  AmpSqhhToVPVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZpOS,helfactor*AmpSqhhToVPVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZp,helfactor*AmpSqhhToVPVZp(gt1))
End if 
If ((Abs(MRPhhToVPVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_BLSSM
