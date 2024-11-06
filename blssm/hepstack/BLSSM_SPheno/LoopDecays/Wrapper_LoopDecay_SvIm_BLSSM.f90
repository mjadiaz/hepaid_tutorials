! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:13 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_SvIm_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_SvIm_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_SvIm(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,          & 
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

Complex(dp),Intent(in) :: cplAhAhhh(4,4,4),cplAhAhSvImSvIm1(4,4,6,6),cplAhAhSvImSvRe1(4,4,6,6),cplAhAhSvReSvRe1(4,4,6,6),& 
& cplAhcHpmVWm(4,2),cplAhhhSvImSvIm1(4,4,6,6),cplAhhhSvImSvRe1(4,4,6,6),cplAhhhSvReSvRe1(4,4,6,6),& 
& cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),   & 
& cplAhHpmSvImcSe1(4,2,6,6),cplAhHpmSvRecSe1(4,2,6,6),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),& 
& cplAhSeSvImcHpm1(4,6,6,2),cplAhSeSvRecHpm1(4,6,6,2),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),& 
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
& cplhhcVWmVWm(4),cplhhhhhh(4,4,4),cplhhhhSvImSvIm1(4,4,6,6),cplhhhhSvImSvRe1(4,4,6,6),  & 
& cplhhhhSvReSvRe1(4,4,6,6),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhHpmSvImcSe1(4,2,6,6),& 
& cplhhHpmSvRecSe1(4,2,6,6),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSeSvImcHpm1(4,6,6,2),& 
& cplhhSeSvRecHpm1(4,6,6,2),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6), & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),           & 
& cplhhVZVZp(4),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),  & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucSd(2,6,6),         & 
& cplHpmSvImcSe(2,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),        & 
& cplHpmSvRecSe(2,6,6),cplSdSvImcSecSuaa(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),           & 
& cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSeSvImcHpm(6,6,2),& 
& cplSeSvImcVWm(6,6),cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6),cplSeSvImcVWmVZp1(6,6), & 
& cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),cplSeSvRecHpm(6,6,2)

Complex(dp),Intent(in) :: cplSeSvRecVWm(6,6),cplSeSvRecVWmVP1(6,6),cplSeSvRecVWmVZ1(6,6),cplSeSvRecVWmVZp1(6,6), & 
& cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSvImcSeVPVWm1(6,6),         & 
& cplSvImcSeVWm(6,6),cplSvImcSeVWmVZ1(6,6),cplSvImcSeVWmVZp1(6,6),cplSvImSvImcVWmVWm1(6,6),& 
& cplSvImSvImSvImSvIm1(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvImVPVP1(6,6),cplSvImSvImVPVZ1(6,6),cplSvImSvImVPVZp1(6,6),cplSvImSvImVZpVZp1(6,6),& 
& cplSvImSvImVZVZ1(6,6),cplSvImSvImVZVZp1(6,6),cplSvImSvReSvReSvRe1(6,6,6,6),            & 
& cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),cplSvRecSeVPVWm1(6,6),       & 
& cplSvRecSeVWm(6,6),cplSvRecSeVWmVZ1(6,6),cplSvRecSeVWmVZp1(6,6),cplSvReSvReVPVP1(6,6), & 
& cplSvReSvReVPVZ1(6,6),cplSvReSvReVPVZp1(6,6),cplSvReSvReVZpVZp1(6,6),cplSvReSvReVZVZ1(6,6),& 
& cplSvReSvReVZVZp1(6,6),ctcplAhSvImSvIm(4,6,6),ctcplAhSvImSvRe(4,6,6),ctcplcFeChaSvImL(3,2,6),& 
& ctcplcFeChaSvImR(3,2,6),ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6),ctcplhhSvImSvIm(4,6,6),& 
& ctcplhhSvImSvRe(4,6,6),ctcplHpmSvImcSe(2,6,6),ctcplSeSvImcVWm(6,6),ctcplSvImSvReVP(6,6),& 
& ctcplSvImSvReVZ(6,6),ctcplSvImSvReVZp(6,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),          & 
& GcplSeSvImcHpm(6,6,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplSeSvImcHpm(6,6,2),& 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplSeSvImcHpm(6,6,2),ZcplAhSvImSvIm(4,6,6),      & 
& ZcplAhSvImSvRe(4,6,6),ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),ZcplChiFvSvImL(7,6,6),& 
& ZcplChiFvSvImR(7,6,6),ZcplhhSvImSvIm(4,6,6),ZcplhhSvImSvRe(4,6,6),ZcplHpmSvImcSe(2,6,6),& 
& ZcplSeSvImcVWm(6,6),ZcplSvImSvReVZ(6,6),ZcplSvImSvReVZp(6,6)

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
Real(dp), Intent(out) :: gP1LSvIm(6,168) 
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
Real(dp) :: MRPSvImToSvImAh(6,6,4),MRGSvImToSvImAh(6,6,4), MRPZSvImToSvImAh(6,6,4),MRGZSvImToSvImAh(6,6,4) 
Real(dp) :: MVPSvImToSvImAh(6,6,4) 
Real(dp) :: RMsqTreeSvImToSvImAh(6,6,4),RMsqWaveSvImToSvImAh(6,6,4),RMsqVertexSvImToSvImAh(6,6,4) 
Complex(dp) :: AmpTreeSvImToSvImAh(6,6,4),AmpWaveSvImToSvImAh(6,6,4)=(0._dp,0._dp),AmpVertexSvImToSvImAh(6,6,4)& 
 & ,AmpVertexIRosSvImToSvImAh(6,6,4),AmpVertexIRdrSvImToSvImAh(6,6,4), AmpSumSvImToSvImAh(6,6,4), AmpSum2SvImToSvImAh(6,6,4) 
Complex(dp) :: AmpTreeZSvImToSvImAh(6,6,4),AmpWaveZSvImToSvImAh(6,6,4),AmpVertexZSvImToSvImAh(6,6,4) 
Real(dp) :: AmpSqSvImToSvImAh(6,6,4),  AmpSqTreeSvImToSvImAh(6,6,4) 
Real(dp) :: MRPSvImToSvReAh(6,6,4),MRGSvImToSvReAh(6,6,4), MRPZSvImToSvReAh(6,6,4),MRGZSvImToSvReAh(6,6,4) 
Real(dp) :: MVPSvImToSvReAh(6,6,4) 
Real(dp) :: RMsqTreeSvImToSvReAh(6,6,4),RMsqWaveSvImToSvReAh(6,6,4),RMsqVertexSvImToSvReAh(6,6,4) 
Complex(dp) :: AmpTreeSvImToSvReAh(6,6,4),AmpWaveSvImToSvReAh(6,6,4)=(0._dp,0._dp),AmpVertexSvImToSvReAh(6,6,4)& 
 & ,AmpVertexIRosSvImToSvReAh(6,6,4),AmpVertexIRdrSvImToSvReAh(6,6,4), AmpSumSvImToSvReAh(6,6,4), AmpSum2SvImToSvReAh(6,6,4) 
Complex(dp) :: AmpTreeZSvImToSvReAh(6,6,4),AmpWaveZSvImToSvReAh(6,6,4),AmpVertexZSvImToSvReAh(6,6,4) 
Real(dp) :: AmpSqSvImToSvReAh(6,6,4),  AmpSqTreeSvImToSvReAh(6,6,4) 
Real(dp) :: MRPSvImTocFeCha(6,3,2),MRGSvImTocFeCha(6,3,2), MRPZSvImTocFeCha(6,3,2),MRGZSvImTocFeCha(6,3,2) 
Real(dp) :: MVPSvImTocFeCha(6,3,2) 
Real(dp) :: RMsqTreeSvImTocFeCha(6,3,2),RMsqWaveSvImTocFeCha(6,3,2),RMsqVertexSvImTocFeCha(6,3,2) 
Complex(dp) :: AmpTreeSvImTocFeCha(2,6,3,2),AmpWaveSvImTocFeCha(2,6,3,2)=(0._dp,0._dp),AmpVertexSvImTocFeCha(2,6,3,2)& 
 & ,AmpVertexIRosSvImTocFeCha(2,6,3,2),AmpVertexIRdrSvImTocFeCha(2,6,3,2), AmpSumSvImTocFeCha(2,6,3,2), AmpSum2SvImTocFeCha(2,6,3,2) 
Complex(dp) :: AmpTreeZSvImTocFeCha(2,6,3,2),AmpWaveZSvImTocFeCha(2,6,3,2),AmpVertexZSvImTocFeCha(2,6,3,2) 
Real(dp) :: AmpSqSvImTocFeCha(6,3,2),  AmpSqTreeSvImTocFeCha(6,3,2) 
Real(dp) :: MRPSvImToFvChi(6,6,7),MRGSvImToFvChi(6,6,7), MRPZSvImToFvChi(6,6,7),MRGZSvImToFvChi(6,6,7) 
Real(dp) :: MVPSvImToFvChi(6,6,7) 
Real(dp) :: RMsqTreeSvImToFvChi(6,6,7),RMsqWaveSvImToFvChi(6,6,7),RMsqVertexSvImToFvChi(6,6,7) 
Complex(dp) :: AmpTreeSvImToFvChi(2,6,6,7),AmpWaveSvImToFvChi(2,6,6,7)=(0._dp,0._dp),AmpVertexSvImToFvChi(2,6,6,7)& 
 & ,AmpVertexIRosSvImToFvChi(2,6,6,7),AmpVertexIRdrSvImToFvChi(2,6,6,7), AmpSumSvImToFvChi(2,6,6,7), AmpSum2SvImToFvChi(2,6,6,7) 
Complex(dp) :: AmpTreeZSvImToFvChi(2,6,6,7),AmpWaveZSvImToFvChi(2,6,6,7),AmpVertexZSvImToFvChi(2,6,6,7) 
Real(dp) :: AmpSqSvImToFvChi(6,6,7),  AmpSqTreeSvImToFvChi(6,6,7) 
Real(dp) :: MRPSvImToSvImhh(6,6,4),MRGSvImToSvImhh(6,6,4), MRPZSvImToSvImhh(6,6,4),MRGZSvImToSvImhh(6,6,4) 
Real(dp) :: MVPSvImToSvImhh(6,6,4) 
Real(dp) :: RMsqTreeSvImToSvImhh(6,6,4),RMsqWaveSvImToSvImhh(6,6,4),RMsqVertexSvImToSvImhh(6,6,4) 
Complex(dp) :: AmpTreeSvImToSvImhh(6,6,4),AmpWaveSvImToSvImhh(6,6,4)=(0._dp,0._dp),AmpVertexSvImToSvImhh(6,6,4)& 
 & ,AmpVertexIRosSvImToSvImhh(6,6,4),AmpVertexIRdrSvImToSvImhh(6,6,4), AmpSumSvImToSvImhh(6,6,4), AmpSum2SvImToSvImhh(6,6,4) 
Complex(dp) :: AmpTreeZSvImToSvImhh(6,6,4),AmpWaveZSvImToSvImhh(6,6,4),AmpVertexZSvImToSvImhh(6,6,4) 
Real(dp) :: AmpSqSvImToSvImhh(6,6,4),  AmpSqTreeSvImToSvImhh(6,6,4) 
Real(dp) :: MRPSvImToSvRehh(6,6,4),MRGSvImToSvRehh(6,6,4), MRPZSvImToSvRehh(6,6,4),MRGZSvImToSvRehh(6,6,4) 
Real(dp) :: MVPSvImToSvRehh(6,6,4) 
Real(dp) :: RMsqTreeSvImToSvRehh(6,6,4),RMsqWaveSvImToSvRehh(6,6,4),RMsqVertexSvImToSvRehh(6,6,4) 
Complex(dp) :: AmpTreeSvImToSvRehh(6,6,4),AmpWaveSvImToSvRehh(6,6,4)=(0._dp,0._dp),AmpVertexSvImToSvRehh(6,6,4)& 
 & ,AmpVertexIRosSvImToSvRehh(6,6,4),AmpVertexIRdrSvImToSvRehh(6,6,4), AmpSumSvImToSvRehh(6,6,4), AmpSum2SvImToSvRehh(6,6,4) 
Complex(dp) :: AmpTreeZSvImToSvRehh(6,6,4),AmpWaveZSvImToSvRehh(6,6,4),AmpVertexZSvImToSvRehh(6,6,4) 
Real(dp) :: AmpSqSvImToSvRehh(6,6,4),  AmpSqTreeSvImToSvRehh(6,6,4) 
Real(dp) :: MRPSvImTocSeHpm(6,6,2),MRGSvImTocSeHpm(6,6,2), MRPZSvImTocSeHpm(6,6,2),MRGZSvImTocSeHpm(6,6,2) 
Real(dp) :: MVPSvImTocSeHpm(6,6,2) 
Real(dp) :: RMsqTreeSvImTocSeHpm(6,6,2),RMsqWaveSvImTocSeHpm(6,6,2),RMsqVertexSvImTocSeHpm(6,6,2) 
Complex(dp) :: AmpTreeSvImTocSeHpm(6,6,2),AmpWaveSvImTocSeHpm(6,6,2)=(0._dp,0._dp),AmpVertexSvImTocSeHpm(6,6,2)& 
 & ,AmpVertexIRosSvImTocSeHpm(6,6,2),AmpVertexIRdrSvImTocSeHpm(6,6,2), AmpSumSvImTocSeHpm(6,6,2), AmpSum2SvImTocSeHpm(6,6,2) 
Complex(dp) :: AmpTreeZSvImTocSeHpm(6,6,2),AmpWaveZSvImTocSeHpm(6,6,2),AmpVertexZSvImTocSeHpm(6,6,2) 
Real(dp) :: AmpSqSvImTocSeHpm(6,6,2),  AmpSqTreeSvImTocSeHpm(6,6,2) 
Real(dp) :: MRPSvImToSecVWm(6,6),MRGSvImToSecVWm(6,6), MRPZSvImToSecVWm(6,6),MRGZSvImToSecVWm(6,6) 
Real(dp) :: MVPSvImToSecVWm(6,6) 
Real(dp) :: RMsqTreeSvImToSecVWm(6,6),RMsqWaveSvImToSecVWm(6,6),RMsqVertexSvImToSecVWm(6,6) 
Complex(dp) :: AmpTreeSvImToSecVWm(2,6,6),AmpWaveSvImToSecVWm(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSecVWm(2,6,6)& 
 & ,AmpVertexIRosSvImToSecVWm(2,6,6),AmpVertexIRdrSvImToSecVWm(2,6,6), AmpSumSvImToSecVWm(2,6,6), AmpSum2SvImToSecVWm(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSecVWm(2,6,6),AmpWaveZSvImToSecVWm(2,6,6),AmpVertexZSvImToSecVWm(2,6,6) 
Real(dp) :: AmpSqSvImToSecVWm(6,6),  AmpSqTreeSvImToSecVWm(6,6) 
Real(dp) :: MRPSvImToSvReVZ(6,6),MRGSvImToSvReVZ(6,6), MRPZSvImToSvReVZ(6,6),MRGZSvImToSvReVZ(6,6) 
Real(dp) :: MVPSvImToSvReVZ(6,6) 
Real(dp) :: RMsqTreeSvImToSvReVZ(6,6),RMsqWaveSvImToSvReVZ(6,6),RMsqVertexSvImToSvReVZ(6,6) 
Complex(dp) :: AmpTreeSvImToSvReVZ(2,6,6),AmpWaveSvImToSvReVZ(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvReVZ(2,6,6)& 
 & ,AmpVertexIRosSvImToSvReVZ(2,6,6),AmpVertexIRdrSvImToSvReVZ(2,6,6), AmpSumSvImToSvReVZ(2,6,6), AmpSum2SvImToSvReVZ(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvReVZ(2,6,6),AmpWaveZSvImToSvReVZ(2,6,6),AmpVertexZSvImToSvReVZ(2,6,6) 
Real(dp) :: AmpSqSvImToSvReVZ(6,6),  AmpSqTreeSvImToSvReVZ(6,6) 
Real(dp) :: MRPSvImToSvReVZp(6,6),MRGSvImToSvReVZp(6,6), MRPZSvImToSvReVZp(6,6),MRGZSvImToSvReVZp(6,6) 
Real(dp) :: MVPSvImToSvReVZp(6,6) 
Real(dp) :: RMsqTreeSvImToSvReVZp(6,6),RMsqWaveSvImToSvReVZp(6,6),RMsqVertexSvImToSvReVZp(6,6) 
Complex(dp) :: AmpTreeSvImToSvReVZp(2,6,6),AmpWaveSvImToSvReVZp(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvReVZp(2,6,6)& 
 & ,AmpVertexIRosSvImToSvReVZp(2,6,6),AmpVertexIRdrSvImToSvReVZp(2,6,6), AmpSumSvImToSvReVZp(2,6,6), AmpSum2SvImToSvReVZp(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvReVZp(2,6,6),AmpWaveZSvImToSvReVZp(2,6,6),AmpVertexZSvImToSvReVZp(2,6,6) 
Real(dp) :: AmpSqSvImToSvReVZp(6,6),  AmpSqTreeSvImToSvReVZp(6,6) 
Real(dp) :: MRPSvImToSvImVP(6,6),MRGSvImToSvImVP(6,6), MRPZSvImToSvImVP(6,6),MRGZSvImToSvImVP(6,6) 
Real(dp) :: MVPSvImToSvImVP(6,6) 
Real(dp) :: RMsqTreeSvImToSvImVP(6,6),RMsqWaveSvImToSvImVP(6,6),RMsqVertexSvImToSvImVP(6,6) 
Complex(dp) :: AmpTreeSvImToSvImVP(2,6,6),AmpWaveSvImToSvImVP(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvImVP(2,6,6)& 
 & ,AmpVertexIRosSvImToSvImVP(2,6,6),AmpVertexIRdrSvImToSvImVP(2,6,6), AmpSumSvImToSvImVP(2,6,6), AmpSum2SvImToSvImVP(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvImVP(2,6,6),AmpWaveZSvImToSvImVP(2,6,6),AmpVertexZSvImToSvImVP(2,6,6) 
Real(dp) :: AmpSqSvImToSvImVP(6,6),  AmpSqTreeSvImToSvImVP(6,6) 
Real(dp) :: MRPSvImToSvImVZ(6,6),MRGSvImToSvImVZ(6,6), MRPZSvImToSvImVZ(6,6),MRGZSvImToSvImVZ(6,6) 
Real(dp) :: MVPSvImToSvImVZ(6,6) 
Real(dp) :: RMsqTreeSvImToSvImVZ(6,6),RMsqWaveSvImToSvImVZ(6,6),RMsqVertexSvImToSvImVZ(6,6) 
Complex(dp) :: AmpTreeSvImToSvImVZ(2,6,6),AmpWaveSvImToSvImVZ(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvImVZ(2,6,6)& 
 & ,AmpVertexIRosSvImToSvImVZ(2,6,6),AmpVertexIRdrSvImToSvImVZ(2,6,6), AmpSumSvImToSvImVZ(2,6,6), AmpSum2SvImToSvImVZ(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvImVZ(2,6,6),AmpWaveZSvImToSvImVZ(2,6,6),AmpVertexZSvImToSvImVZ(2,6,6) 
Real(dp) :: AmpSqSvImToSvImVZ(6,6),  AmpSqTreeSvImToSvImVZ(6,6) 
Real(dp) :: MRPSvImToSvImVZp(6,6),MRGSvImToSvImVZp(6,6), MRPZSvImToSvImVZp(6,6),MRGZSvImToSvImVZp(6,6) 
Real(dp) :: MVPSvImToSvImVZp(6,6) 
Real(dp) :: RMsqTreeSvImToSvImVZp(6,6),RMsqWaveSvImToSvImVZp(6,6),RMsqVertexSvImToSvImVZp(6,6) 
Complex(dp) :: AmpTreeSvImToSvImVZp(2,6,6),AmpWaveSvImToSvImVZp(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvImVZp(2,6,6)& 
 & ,AmpVertexIRosSvImToSvImVZp(2,6,6),AmpVertexIRdrSvImToSvImVZp(2,6,6), AmpSumSvImToSvImVZp(2,6,6), AmpSum2SvImToSvImVZp(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvImVZp(2,6,6),AmpWaveZSvImToSvImVZp(2,6,6),AmpVertexZSvImToSvImVZp(2,6,6) 
Real(dp) :: AmpSqSvImToSvImVZp(6,6),  AmpSqTreeSvImToSvImVZp(6,6) 
Real(dp) :: MRPSvImToSvReVP(6,6),MRGSvImToSvReVP(6,6), MRPZSvImToSvReVP(6,6),MRGZSvImToSvReVP(6,6) 
Real(dp) :: MVPSvImToSvReVP(6,6) 
Real(dp) :: RMsqTreeSvImToSvReVP(6,6),RMsqWaveSvImToSvReVP(6,6),RMsqVertexSvImToSvReVP(6,6) 
Complex(dp) :: AmpTreeSvImToSvReVP(2,6,6),AmpWaveSvImToSvReVP(2,6,6)=(0._dp,0._dp),AmpVertexSvImToSvReVP(2,6,6)& 
 & ,AmpVertexIRosSvImToSvReVP(2,6,6),AmpVertexIRdrSvImToSvReVP(2,6,6), AmpSumSvImToSvReVP(2,6,6), AmpSum2SvImToSvReVP(2,6,6) 
Complex(dp) :: AmpTreeZSvImToSvReVP(2,6,6),AmpWaveZSvImToSvReVP(2,6,6),AmpVertexZSvImToSvReVP(2,6,6) 
Real(dp) :: AmpSqSvImToSvReVP(6,6),  AmpSqTreeSvImToSvReVP(6,6) 
Write(*,*) "Calculating one-loop decays of SvIm " 
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
! SvIm Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvImAh(cplAhSvImSvIm,MAh,MSvIm,MAh2,MSvIm2,           & 
& AmpTreeSvImToSvImAh)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvImAh(ZcplAhSvImSvIm,MAh,MSvIm,MAh2,MSvIm2,          & 
& AmpTreeSvImToSvImAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImAh(MLambda,em,gs,cplAhSvImSvIm,MAhOS,MSvImOS,         & 
& MRPSvImToSvImAh,MRGSvImToSvImAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImAh(MLambda,em,gs,ZcplAhSvImSvIm,MAhOS,MSvImOS,        & 
& MRPSvImToSvImAh,MRGSvImToSvImAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvImAh(MLambda,em,gs,cplAhSvImSvIm,MAh,MSvIm,             & 
& MRPSvImToSvImAh,MRGSvImToSvImAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImAh(MLambda,em,gs,ZcplAhSvImSvIm,MAh,MSvIm,            & 
& MRPSvImToSvImAh,MRGSvImToSvImAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvImAh(cplAhSvImSvIm,ctcplAhSvImSvIm,MAh,             & 
& MAh2,MSvIm,MSvIm2,ZfAh,ZfSvIm,AmpWaveSvImToSvImAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexSvImToSvImAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRdrSvImToSvImAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

 End if 
 End if 
AmpVertexSvImToSvImAh = AmpVertexSvImToSvImAh -  AmpVertexIRdrSvImToSvImAh! +  AmpVertexIRosSvImToSvImAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvImAh(gt2,:,:) = AmpWaveZSvImToSvImAh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImAh(gt1,:,:) 
AmpVertexZSvImToSvImAh(gt2,:,:)= AmpVertexZSvImToSvImAh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
! Final State 1 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvImAh(:,gt2,:) = AmpWaveZSvImToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImAh(:,gt1,:) 
AmpVertexZSvImToSvImAh(:,gt2,:)= AmpVertexZSvImToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
! Final State 2 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvImToSvImAh(:,:,gt2) = AmpWaveZSvImToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvImToSvImAh(:,:,gt1) 
AmpVertexZSvImToSvImAh(:,:,gt2)= AmpVertexZSvImToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvImToSvImAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvImAh = AmpVertexSvImToSvImAh  +  AmpVertexIRosSvImToSvImAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh 
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh  
Else 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh + AmpWaveSvImToSvImAh + AmpVertexSvImToSvImAh
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + AmpWaveSvImToSvImAh + AmpVertexSvImToSvImAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = 2._dp*AmpWaveSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = 2._dp*AmpVertexSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImAh = + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImAh = + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),helfactor*AmpSqSvImToSvImAh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),helfactor*AmpSqSvImToSvImAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImAh(gt1, gt2, gt3) + MRGSvImToSvImAh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImAh(gt1, gt2, gt3) + MRGSvImToSvImAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! SvRe Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvReAh(cplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,            & 
& MSvIm2,MSvRe2,AmpTreeSvImToSvReAh)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvReAh(ZcplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,           & 
& MSvIm2,MSvRe2,AmpTreeSvImToSvReAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReAh(MLambda,em,gs,cplAhSvImSvRe,MAhOS,MSvImOS,         & 
& MSvReOS,MRPSvImToSvReAh,MRGSvImToSvReAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReAh(MLambda,em,gs,ZcplAhSvImSvRe,MAhOS,MSvImOS,        & 
& MSvReOS,MRPSvImToSvReAh,MRGSvImToSvReAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvReAh(MLambda,em,gs,cplAhSvImSvRe,MAh,MSvIm,             & 
& MSvRe,MRPSvImToSvReAh,MRGSvImToSvReAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReAh(MLambda,em,gs,ZcplAhSvImSvRe,MAh,MSvIm,            & 
& MSvRe,MRPSvImToSvReAh,MRGSvImToSvReAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvReAh(cplAhSvImSvRe,ctcplAhSvImSvRe,MAh,             & 
& MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,AmpWaveSvImToSvReAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& AmpVertexSvImToSvReAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRdrSvImToSvReAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvImToSvReAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRosSvImToSvReAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvReAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRosSvImToSvReAh)

 End if 
 End if 
AmpVertexSvImToSvReAh = AmpVertexSvImToSvReAh -  AmpVertexIRdrSvImToSvReAh! +  AmpVertexIRosSvImToSvReAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReAh(gt2,:,:) = AmpWaveZSvImToSvReAh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvReAh(gt1,:,:) 
AmpVertexZSvImToSvReAh(gt2,:,:)= AmpVertexZSvImToSvReAh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvReAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
! Final State 1 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReAh(:,gt2,:) = AmpWaveZSvImToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvReAh(:,gt1,:) 
AmpVertexZSvImToSvReAh(:,gt2,:)= AmpVertexZSvImToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvReAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
! Final State 2 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvImToSvReAh(:,:,gt2) = AmpWaveZSvImToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvImToSvReAh(:,:,gt1) 
AmpVertexZSvImToSvReAh(:,:,gt2)= AmpVertexZSvImToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvImToSvReAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvReAh = AmpVertexSvImToSvReAh  +  AmpVertexIRosSvImToSvReAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh 
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh  
Else 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh + AmpWaveSvImToSvReAh + AmpVertexSvImToSvReAh
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + AmpWaveSvImToSvReAh + AmpVertexSvImToSvReAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = 2._dp*AmpWaveSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = 2._dp*AmpVertexSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvReAh = + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvReAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvReAh = + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvReAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),helfactor*AmpSqSvImToSvReAh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),helfactor*AmpSqSvImToSvReAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvReAh(gt1, gt2, gt3) + MRGSvImToSvReAh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvReAh(gt1, gt2, gt3) + MRGSvImToSvReAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! bar(Fe) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,MCha,            & 
& MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeSvImTocFeCha)

  Else 
Call Amplitude_Tree_BLSSM_SvImTocFeCha(ZcplcFeChaSvImL,ZcplcFeChaSvImR,               & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeSvImTocFeCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImTocFeCha(MLambda,em,gs,cplcFeChaSvImL,cplcFeChaSvImR,       & 
& MChaOS,MFeOS,MSvImOS,MRPSvImTocFeCha,MRGSvImTocFeCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImTocFeCha(MLambda,em,gs,ZcplcFeChaSvImL,ZcplcFeChaSvImR,     & 
& MChaOS,MFeOS,MSvImOS,MRPSvImTocFeCha,MRGSvImTocFeCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImTocFeCha(MLambda,em,gs,cplcFeChaSvImL,cplcFeChaSvImR,       & 
& MCha,MFe,MSvIm,MRPSvImTocFeCha,MRGSvImTocFeCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImTocFeCha(MLambda,em,gs,ZcplcFeChaSvImL,ZcplcFeChaSvImR,     & 
& MCha,MFe,MSvIm,MRPSvImTocFeCha,MRGSvImTocFeCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,ctcplcFeChaSvImL,& 
& ctcplcFeChaSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,ZfFER,ZfLm,ZfLp,               & 
& ZfSvIm,AmpWaveSvImTocFeCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,        & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexSvImTocFeCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,        & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRdrSvImTocFeCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,ZcplcFeChaSvImL,ZcplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,cplChiFvSvImR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,ZcplcFeChaSvImL,  & 
& ZcplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,        & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,      & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,cplChiFvSvImR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,        & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

 End if 
 End if 
AmpVertexSvImTocFeCha = AmpVertexSvImTocFeCha -  AmpVertexIRdrSvImTocFeCha! +  AmpVertexIRosSvImTocFeCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImTocFeCha(:,gt2,:,:) = AmpWaveZSvImTocFeCha(:,gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImTocFeCha(:,gt1,:,:) 
AmpVertexZSvImTocFeCha(:,gt2,:,:)= AmpVertexZSvImTocFeCha(:,gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImTocFeCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
! Final State 1 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImTocFeCha(1,:,gt2,:) = AmpWaveZSvImTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWaveSvImTocFeCha(1,:,gt1,:) 
AmpVertexZSvImTocFeCha(1,:,gt2,:)= AmpVertexZSvImTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexSvImTocFeCha(1,:,gt1,:) 
AmpWaveZSvImTocFeCha(2,:,gt2,:) = AmpWaveZSvImTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWaveSvImTocFeCha(2,:,gt1,:) 
AmpVertexZSvImTocFeCha(2,:,gt2,:)= AmpVertexZSvImTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexSvImTocFeCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
! Final State 2 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvImTocFeCha(1,:,:,gt2) = AmpWaveZSvImTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSvImTocFeCha(1,:,:,gt1) 
AmpVertexZSvImTocFeCha(1,:,:,gt2)= AmpVertexZSvImTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSvImTocFeCha(1,:,:,gt1) 
AmpWaveZSvImTocFeCha(2,:,:,gt2) = AmpWaveZSvImTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSvImTocFeCha(2,:,:,gt1) 
AmpVertexZSvImTocFeCha(2,:,:,gt2)= AmpVertexZSvImTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSvImTocFeCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
End if
If (ShiftIRdiv) Then 
AmpVertexSvImTocFeCha = AmpVertexSvImTocFeCha  +  AmpVertexIRosSvImTocFeCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->bar[Fe] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha 
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha  
Else 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha + AmpWaveSvImTocFeCha + AmpVertexSvImTocFeCha
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + AmpWaveSvImTocFeCha + AmpVertexSvImTocFeCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MFe(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = 2._dp*AmpWaveSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = 2._dp*AmpVertexSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvImTocFeCha = + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvImTocFeCha(gt1, gt2, gt3)  
Else  
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvImTocFeCha = + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvImTocFeCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvImTocFeCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),helfactor*AmpSqSvImTocFeCha(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MFe(gt2),MCha(gt3),helfactor*AmpSqSvImTocFeCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImTocFeCha(gt1, gt2, gt3) + MRGSvImTocFeCha(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImTocFeCha(gt1, gt2, gt3) + MRGSvImTocFeCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! Fv Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,MChi,               & 
& MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeSvImToFvChi)

  Else 
Call Amplitude_Tree_BLSSM_SvImToFvChi(ZcplChiFvSvImL,ZcplChiFvSvImR,MChi,             & 
& MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeSvImToFvChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToFvChi(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,          & 
& MChiOS,MFvOS,MSvImOS,MRPSvImToFvChi,MRGSvImToFvChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToFvChi(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,        & 
& MChiOS,MFvOS,MSvImOS,MRPSvImToFvChi,MRGSvImToFvChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToFvChi(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,          & 
& MChi,MFv,MSvIm,MRPSvImToFvChi,MRGSvImToFvChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToFvChi(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,        & 
& MChi,MFv,MSvIm,MRPSvImToFvChi,MRGSvImToFvChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,ctcplChiFvSvImL,    & 
& ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFvm,ZfL0,ZfSvIm,AmpWaveSvImToFvChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexSvImToFvChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRdrSvImToFvChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

 End if 
 End if 
AmpVertexSvImToFvChi = AmpVertexSvImToFvChi -  AmpVertexIRdrSvImToFvChi! +  AmpVertexIRosSvImToFvChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToFvChi(:,gt2,:,:) = AmpWaveZSvImToFvChi(:,gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToFvChi(:,gt1,:,:) 
AmpVertexZSvImToFvChi(:,gt2,:,:)= AmpVertexZSvImToFvChi(:,gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToFvChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
! Final State 1 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToFvChi(1,:,gt2,:) = AmpWaveZSvImToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveSvImToFvChi(1,:,gt1,:) 
AmpVertexZSvImToFvChi(1,:,gt2,:)= AmpVertexZSvImToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexSvImToFvChi(1,:,gt1,:) 
AmpWaveZSvImToFvChi(2,:,gt2,:) = AmpWaveZSvImToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveSvImToFvChi(2,:,gt1,:) 
AmpVertexZSvImToFvChi(2,:,gt2,:)= AmpVertexZSvImToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexSvImToFvChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
! Final State 2 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZSvImToFvChi(1,:,:,gt2) = AmpWaveZSvImToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvImToFvChi(1,:,:,gt1) 
AmpVertexZSvImToFvChi(1,:,:,gt2)= AmpVertexZSvImToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvImToFvChi(1,:,:,gt1) 
AmpWaveZSvImToFvChi(2,:,:,gt2) = AmpWaveZSvImToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvImToFvChi(2,:,:,gt1) 
AmpVertexZSvImToFvChi(2,:,:,gt2)= AmpVertexZSvImToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvImToFvChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToFvChi = AmpVertexSvImToFvChi  +  AmpVertexIRosSvImToFvChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->Fv Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi 
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi  
Else 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi + AmpWaveSvImToFvChi + AmpVertexSvImToFvChi
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + AmpWaveSvImToFvChi + AmpVertexSvImToFvChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,7
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MFv(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = 2._dp*AmpWaveSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = 2._dp*AmpVertexSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3)  
  AmpSum2SvImToFvChi = + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3) + AmpSqTreeSvImToFvChi(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3)  
  AmpSum2SvImToFvChi = + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3) + AmpSqTreeSvImToFvChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToFvChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvImToFvChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),helfactor*AmpSqSvImToFvChi(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MFv(gt2),MChi(gt3),helfactor*AmpSqSvImToFvChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToFvChi(gt1, gt2, gt3) + MRGSvImToFvChi(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToFvChi(gt1, gt2, gt3) + MRGSvImToFvChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! SvIm hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvImhh(cplhhSvImSvIm,Mhh,MSvIm,Mhh2,MSvIm2,           & 
& AmpTreeSvImToSvImhh)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvImhh(ZcplhhSvImSvIm,Mhh,MSvIm,Mhh2,MSvIm2,          & 
& AmpTreeSvImToSvImhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImhh(MLambda,em,gs,cplhhSvImSvIm,MhhOS,MSvImOS,         & 
& MRPSvImToSvImhh,MRGSvImToSvImhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImhh(MLambda,em,gs,ZcplhhSvImSvIm,MhhOS,MSvImOS,        & 
& MRPSvImToSvImhh,MRGSvImToSvImhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvImhh(MLambda,em,gs,cplhhSvImSvIm,Mhh,MSvIm,             & 
& MRPSvImToSvImhh,MRGSvImToSvImhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvImhh(MLambda,em,gs,ZcplhhSvImSvIm,Mhh,MSvIm,            & 
& MRPSvImToSvImhh,MRGSvImToSvImhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvImhh(cplhhSvImSvIm,ctcplhhSvImSvIm,Mhh,             & 
& Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,AmpWaveSvImToSvImhh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexSvImToSvImhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRdrSvImToSvImhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvImToSvImhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRosSvImToSvImhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvImToSvImhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,AmpVertexIRosSvImToSvImhh)

 End if 
 End if 
AmpVertexSvImToSvImhh = AmpVertexSvImToSvImhh -  AmpVertexIRdrSvImToSvImhh! +  AmpVertexIRosSvImToSvImhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvImhh(gt2,:,:) = AmpWaveZSvImToSvImhh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImhh(gt1,:,:) 
AmpVertexZSvImToSvImhh(gt2,:,:)= AmpVertexZSvImToSvImhh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
! Final State 1 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvImhh(:,gt2,:) = AmpWaveZSvImToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImhh(:,gt1,:) 
AmpVertexZSvImToSvImhh(:,gt2,:)= AmpVertexZSvImToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
! Final State 2 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvImToSvImhh(:,:,gt2) = AmpWaveZSvImToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvImToSvImhh(:,:,gt1) 
AmpVertexZSvImToSvImhh(:,:,gt2)= AmpVertexZSvImToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvImToSvImhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvImhh = AmpVertexSvImToSvImhh  +  AmpVertexIRosSvImToSvImhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh 
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh  
Else 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh + AmpWaveSvImToSvImhh + AmpVertexSvImToSvImhh
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + AmpWaveSvImToSvImhh + AmpVertexSvImToSvImhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvIm(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = 2._dp*AmpWaveSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = 2._dp*AmpVertexSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImhh = + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImhh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImhh = + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),helfactor*AmpSqSvImToSvImhh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),helfactor*AmpSqSvImToSvImhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImhh(gt1, gt2, gt3) + MRGSvImToSvImhh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImhh(gt1, gt2, gt3) + MRGSvImToSvImhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! SvRe hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvRehh(cplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,            & 
& MSvIm2,MSvRe2,AmpTreeSvImToSvRehh)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvRehh(ZcplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,           & 
& MSvIm2,MSvRe2,AmpTreeSvImToSvRehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvRehh(MLambda,em,gs,cplhhSvImSvRe,MhhOS,MSvImOS,         & 
& MSvReOS,MRPSvImToSvRehh,MRGSvImToSvRehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvRehh(MLambda,em,gs,ZcplhhSvImSvRe,MhhOS,MSvImOS,        & 
& MSvReOS,MRPSvImToSvRehh,MRGSvImToSvRehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvRehh(MLambda,em,gs,cplhhSvImSvRe,Mhh,MSvIm,             & 
& MSvRe,MRPSvImToSvRehh,MRGSvImToSvRehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvRehh(MLambda,em,gs,ZcplhhSvImSvRe,Mhh,MSvIm,            & 
& MSvRe,MRPSvImToSvRehh,MRGSvImToSvRehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvRehh(cplhhSvImSvRe,ctcplhhSvImSvRe,Mhh,             & 
& Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,AmpWaveSvImToSvRehh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexSvImToSvRehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrSvImToSvRehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvImToSvRehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvImToSvRehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

 End if 
 End if 
AmpVertexSvImToSvRehh = AmpVertexSvImToSvRehh -  AmpVertexIRdrSvImToSvRehh! +  AmpVertexIRosSvImToSvRehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvRehh(gt2,:,:) = AmpWaveZSvImToSvRehh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvRehh(gt1,:,:) 
AmpVertexZSvImToSvRehh(gt2,:,:)= AmpVertexZSvImToSvRehh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvRehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
! Final State 1 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvRehh(:,gt2,:) = AmpWaveZSvImToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvRehh(:,gt1,:) 
AmpVertexZSvImToSvRehh(:,gt2,:)= AmpVertexZSvImToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvRehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
! Final State 2 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvImToSvRehh(:,:,gt2) = AmpWaveZSvImToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvImToSvRehh(:,:,gt1) 
AmpVertexZSvImToSvRehh(:,:,gt2)= AmpVertexZSvImToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvImToSvRehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvRehh = AmpVertexSvImToSvRehh  +  AmpVertexIRosSvImToSvRehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh 
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh  
Else 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh + AmpWaveSvImToSvRehh + AmpVertexSvImToSvRehh
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + AmpWaveSvImToSvRehh + AmpVertexSvImToSvRehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvRe(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = 2._dp*AmpWaveSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = 2._dp*AmpVertexSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvImToSvRehh = + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvImToSvRehh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvImToSvRehh = + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvImToSvRehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvRehh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),helfactor*AmpSqSvImToSvRehh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),helfactor*AmpSqSvImToSvRehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvRehh(gt1, gt2, gt3) + MRGSvImToSvRehh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvRehh(gt1, gt2, gt3) + MRGSvImToSvRehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! Conjg(Se) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImTocSeHpm(cplHpmSvImcSe,MHpm,MSe,MSvIm,MHpm2,            & 
& MSe2,MSvIm2,AmpTreeSvImTocSeHpm)

  Else 
Call Amplitude_Tree_BLSSM_SvImTocSeHpm(ZcplHpmSvImcSe,MHpm,MSe,MSvIm,MHpm2,           & 
& MSe2,MSvIm2,AmpTreeSvImTocSeHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImTocSeHpm(MLambda,em,gs,cplHpmSvImcSe,MHpmOS,MSeOS,          & 
& MSvImOS,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImTocSeHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpmOS,               & 
& MSeOS,MSvImOS,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImTocSeHpm(MLambda,em,gs,cplHpmSvImcSe,MHpm,MSe,              & 
& MSvIm,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImTocSeHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpm,MSe,             & 
& MSvIm,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImTocSeHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,MHpm,            & 
& MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,AmpWaveSvImTocSeHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexSvImTocSeHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRdrSvImTocSeHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,             & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,ZcplHpmSvImcSe,cplHpmSvRecSe,       & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,           & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,             & 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSvImTocSeHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,ZcplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSvImTocSeHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,             & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,           & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,             & 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSvImTocSeHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,             & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSvImTocSeHpm)

 End if 
 End if 
AmpVertexSvImTocSeHpm = AmpVertexSvImTocSeHpm -  AmpVertexIRdrSvImTocSeHpm! +  AmpVertexIRosSvImTocSeHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImTocSeHpm(gt2,:,:) = AmpWaveZSvImTocSeHpm(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImTocSeHpm(gt1,:,:) 
AmpVertexZSvImTocSeHpm(gt2,:,:)= AmpVertexZSvImTocSeHpm(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImTocSeHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
! Final State 1 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImTocSeHpm(:,gt2,:) = AmpWaveZSvImTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSvImTocSeHpm(:,gt1,:) 
AmpVertexZSvImTocSeHpm(:,gt2,:)= AmpVertexZSvImTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexSvImTocSeHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
! Final State 2 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvImTocSeHpm(:,:,gt2) = AmpWaveZSvImTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSvImTocSeHpm(:,:,gt1) 
AmpVertexZSvImTocSeHpm(:,:,gt2)= AmpVertexZSvImTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSvImTocSeHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSvImTocSeHpm = AmpVertexSvImTocSeHpm  +  AmpVertexIRosSvImTocSeHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->conj[Se] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm 
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm  
Else 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm + AmpWaveSvImTocSeHpm + AmpVertexSvImTocSeHpm
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + AmpWaveSvImTocSeHpm + AmpVertexSvImTocSeHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSe(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = 2._dp*AmpWaveSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = 2._dp*AmpVertexSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvImTocSeHpm = + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvImTocSeHpm = + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImTocSeHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),helfactor*AmpSqSvImTocSeHpm(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MSe(gt2),MHpm(gt3),helfactor*AmpSqSvImTocSeHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImTocSeHpm(gt1, gt2, gt3) + MRGSvImTocSeHpm(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImTocSeHpm(gt1, gt2, gt3) + MRGSvImTocSeHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! Se Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSecVWm(cplSeSvImcVWm,MSe,MSvIm,MVWm,MSe2,             & 
& MSvIm2,MVWm2,AmpTreeSvImToSecVWm)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSecVWm(ZcplSeSvImcVWm,MSe,MSvIm,MVWm,MSe2,            & 
& MSvIm2,MVWm2,AmpTreeSvImToSecVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSecVWm(MLambda,em,gs,cplSeSvImcVWm,MSeOS,MSvImOS,         & 
& MVWmOS,MRPSvImToSecVWm,MRGSvImToSecVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSecVWm(MLambda,em,gs,ZcplSeSvImcVWm,MSeOS,MSvImOS,        & 
& MVWmOS,MRPSvImToSecVWm,MRGSvImToSecVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSecVWm(MLambda,em,gs,cplSeSvImcVWm,MSe,MSvIm,             & 
& MVWm,MRPSvImToSecVWm,MRGSvImToSecVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSecVWm(MLambda,em,gs,ZcplSeSvImcVWm,MSe,MSvIm,            & 
& MVWm,MRPSvImToSecVWm,MRGSvImToSecVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSecVWm(cplSeSvImcVWm,ctcplSeSvImcVWm,MSe,             & 
& MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,AmpWaveSvImToSecVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvImSvImcVWmVWm1,AmpVertexSvImToSecVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvImSvImcVWmVWm1,AmpVertexIRdrSvImToSecVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,GosZcplSeSvImcHpm,& 
& ZcplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,          & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,    & 
& cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,    & 
& cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,               & 
& AmpVertexIRosSvImToSecVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,GZcplHpmcVWmVP,cplHpmcVWmVZ,    & 
& cplHpmcVWmVZp,GZcplSeSvImcHpm,ZcplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,GcplSeSvImcHpm,    & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,    & 
& cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,    & 
& cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,               & 
& AmpVertexIRosSvImToSecVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

 End if 
 End if 
AmpVertexSvImToSecVWm = AmpVertexSvImToSecVWm -  AmpVertexIRdrSvImToSecVWm! +  AmpVertexIRosSvImToSecVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSecVWm=0._dp 
AmpVertexZSvImToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSecVWm(:,gt2,:) = AmpWaveZSvImToSecVWm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSecVWm(:,gt1,:) 
AmpVertexZSvImToSecVWm(:,gt2,:)= AmpVertexZSvImToSecVWm(:,gt2,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSecVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSecVWm=AmpWaveZSvImToSecVWm 
AmpVertexSvImToSecVWm= AmpVertexZSvImToSecVWm
! Final State 1 
AmpWaveZSvImToSecVWm=0._dp 
AmpVertexZSvImToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSecVWm(:,:,gt2) = AmpWaveZSvImToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSvImToSecVWm(:,:,gt1) 
AmpVertexZSvImToSecVWm(:,:,gt2)= AmpVertexZSvImToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSvImToSecVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSecVWm=AmpWaveZSvImToSecVWm 
AmpVertexSvImToSecVWm= AmpVertexZSvImToSecVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSecVWm = AmpVertexSvImToSecVWm  +  AmpVertexIRosSvImToSecVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->Se conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm 
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm  
Else 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm + AmpWaveSvImToSecVWm + AmpVertexSvImToSecVWm
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + AmpWaveSvImToSecVWm + AmpVertexSvImToSecVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSe(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = 2._dp*AmpWaveSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = 2._dp*AmpVertexSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSecVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqTreeSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2)  
  AmpSum2SvImToSecVWm = + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2) + AmpSqTreeSvImToSecVWm(gt1, gt2)  
Else  
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqTreeSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2)  
  AmpSum2SvImToSecVWm = + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2) + AmpSqTreeSvImToSecVWm(gt1, gt2)  
End if  
Else  
  AmpSqSvImToSecVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSecVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MSeOS(gt2),MVWmOS,helfactor*AmpSqSvImToSecVWm(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MSe(gt2),MVWm,helfactor*AmpSqSvImToSecVWm(gt1, gt2))
End if 
If ((Abs(MRPSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPSvImToSecVWm(gt1, gt2) + MRGSvImToSecVWm(gt1, gt2)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPSvImToSecVWm(gt1, gt2) + MRGSvImToSecVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! SvRe VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvReVZ(cplSvImSvReVZ,MSvIm,MSvRe,MVZ,MSvIm2,          & 
& MSvRe2,MVZ2,AmpTreeSvImToSvReVZ)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvReVZ(ZcplSvImSvReVZ,MSvIm,MSvRe,MVZ,MSvIm2,         & 
& MSvRe2,MVZ2,AmpTreeSvImToSvReVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZ(MLambda,em,gs,cplSvImSvReVZ,MSvImOS,               & 
& MSvReOS,MVZOS,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvImOS,              & 
& MSvReOS,MVZOS,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvReVZ(MLambda,em,gs,cplSvImSvReVZ,MSvIm,MSvRe,           & 
& MVZ,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvIm,MSvRe,          & 
& MVZ,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvReVZ(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveSvImToSvReVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,     & 
& cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,             & 
& cplSvImSvImVPVZ1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexSvImToSvReVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,     & 
& cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,             & 
& cplSvImSvImVPVZ1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRdrSvImToSvReVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,               & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,       & 
& cplSvImSvReVP,ZcplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSvImSvImVPVZ1,          & 
& cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1,cplSvReSvReVZVZ1, & 
& cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,ZcplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,    & 
& cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,             & 
& cplSvImSvImVPVZ1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,               & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,       & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,   & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSvImSvImVPVZ1,cplSvImSvImVZVZ1,      & 
& cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1,cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,& 
& cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,     & 
& cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,             & 
& cplSvImSvImVPVZ1,cplSvImSvImVZVZ1,cplSvImSvImVZVZp1,cplSvImcSeVWmVZ1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

 End if 
 End if 
AmpVertexSvImToSvReVZ = AmpVertexSvImToSvReVZ -  AmpVertexIRdrSvImToSvReVZ! +  AmpVertexIRosSvImToSvReVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvReVZ=0._dp 
AmpVertexZSvImToSvReVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReVZ(:,gt2,:) = AmpWaveZSvImToSvReVZ(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvReVZ(:,gt1,:) 
AmpVertexZSvImToSvReVZ(:,gt2,:)= AmpVertexZSvImToSvReVZ(:,gt2,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvReVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvReVZ=AmpWaveZSvImToSvReVZ 
AmpVertexSvImToSvReVZ= AmpVertexZSvImToSvReVZ
! Final State 1 
AmpWaveZSvImToSvReVZ=0._dp 
AmpVertexZSvImToSvReVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReVZ(:,:,gt2) = AmpWaveZSvImToSvReVZ(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvReVZ(:,:,gt1) 
AmpVertexZSvImToSvReVZ(:,:,gt2)= AmpVertexZSvImToSvReVZ(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvReVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvReVZ=AmpWaveZSvImToSvReVZ 
AmpVertexSvImToSvReVZ= AmpVertexZSvImToSvReVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvReVZ = AmpVertexSvImToSvReVZ  +  AmpVertexIRosSvImToSvReVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ 
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ  
Else 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ + AmpWaveSvImToSvReVZ + AmpVertexSvImToSvReVZ
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + AmpWaveSvImToSvReVZ + AmpVertexSvImToSvReVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = 2._dp*AmpWaveSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = 2._dp*AmpVertexSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvReVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2)  
  AmpSum2SvImToSvReVZ = + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2) + AmpSqTreeSvImToSvReVZ(gt1, gt2)  
Else  
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2)  
  AmpSum2SvImToSvReVZ = + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2) + AmpSqTreeSvImToSvReVZ(gt1, gt2)  
End if  
Else  
  AmpSqSvImToSvReVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MVZOS,helfactor*AmpSqSvImToSvReVZ(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MVZ,helfactor*AmpSqSvImToSvReVZ(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZ(gt1, gt2) + MRGSvImToSvReVZ(gt1, gt2)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZ(gt1, gt2) + MRGSvImToSvReVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
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
! SvRe VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvImToSvReVZp(cplSvImSvReVZp,MSvIm,MSvRe,MVZp,              & 
& MSvIm2,MSvRe2,MVZp2,AmpTreeSvImToSvReVZp)

  Else 
Call Amplitude_Tree_BLSSM_SvImToSvReVZp(ZcplSvImSvReVZp,MSvIm,MSvRe,MVZp,             & 
& MSvIm2,MSvRe2,MVZp2,AmpTreeSvImToSvReVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZp(MLambda,em,gs,cplSvImSvReVZp,MSvImOS,             & 
& MSvReOS,MVZpOS,MRPSvImToSvReVZp,MRGSvImToSvReVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZp(MLambda,em,gs,ZcplSvImSvReVZp,MSvImOS,            & 
& MSvReOS,MVZpOS,MRPSvImToSvReVZp,MRGSvImToSvReVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvImToSvReVZp(MLambda,em,gs,cplSvImSvReVZp,MSvIm,               & 
& MSvRe,MVZp,MRPSvImToSvReVZp,MRGSvImToSvReVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvImToSvReVZp(MLambda,em,gs,ZcplSvImSvReVZp,MSvIm,              & 
& MSvRe,MVZp,MRPSvImToSvReVZp,MRGSvImToSvReVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvReVZp(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,   & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,MVZp,MVZp2,ZfSvIm,ZfSvRe,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveSvImToSvReVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvReVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,               & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,              & 
& cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,              & 
& cplSvRecSeVWmVZp1,AmpVertexSvImToSvReVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,               & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,              & 
& cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,              & 
& cplSvRecSeVWmVZp1,AmpVertexIRdrSvImToSvReVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,            & 
& MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,           & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,  & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,           & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,ZcplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,     & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,              & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,cplSvRecSeVWmVZp1,AmpVertexIRosSvImToSvReVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,               & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,ZcplSvImSvReVZp,   & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,              & 
& cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,              & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSvImToSvReVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,               & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,            & 
& MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,           & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,  & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmSvRecSe,           & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,    & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,     & 
& cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,              & 
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,cplSvRecSeVWmVZp1,AmpVertexIRosSvImToSvReVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvImToSvReVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,               & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSvImSvImVPVZp1,cplSvImSvImVZVZp1,cplSvImSvImVZpVZp1,              & 
& cplSvImcSeVWmVZp1,cplSvReSvReVPVZp1,cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,              & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSvImToSvReVZp)

 End if 
 End if 
AmpVertexSvImToSvReVZp = AmpVertexSvImToSvReVZp -  AmpVertexIRdrSvImToSvReVZp! +  AmpVertexIRosSvImToSvReVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvReVZp=0._dp 
AmpVertexZSvImToSvReVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReVZp(:,gt2,:) = AmpWaveZSvImToSvReVZp(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvReVZp(:,gt1,:) 
AmpVertexZSvImToSvReVZp(:,gt2,:)= AmpVertexZSvImToSvReVZp(:,gt2,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvReVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvReVZp=AmpWaveZSvImToSvReVZp 
AmpVertexSvImToSvReVZp= AmpVertexZSvImToSvReVZp
! Final State 1 
AmpWaveZSvImToSvReVZp=0._dp 
AmpVertexZSvImToSvReVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSvReVZp(:,:,gt2) = AmpWaveZSvImToSvReVZp(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvReVZp(:,:,gt1) 
AmpVertexZSvImToSvReVZp(:,:,gt2)= AmpVertexZSvImToSvReVZp(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvReVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvReVZp=AmpWaveZSvImToSvReVZp 
AmpVertexSvImToSvReVZp= AmpVertexZSvImToSvReVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvReVZp = AmpVertexSvImToSvReVZp  +  AmpVertexIRosSvImToSvReVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvReVZp = AmpTreeSvImToSvReVZp 
 AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp + 2._dp*AmpWaveSvImToSvReVZp + 2._dp*AmpVertexSvImToSvReVZp  
Else 
 AmpSumSvImToSvReVZp = AmpTreeSvImToSvReVZp + AmpWaveSvImToSvReVZp + AmpVertexSvImToSvReVZp
 AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp + AmpWaveSvImToSvReVZp + AmpVertexSvImToSvReVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReVZp = AmpTreeSvImToSvReVZp
 AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvReVZp(gt1, gt2) 
  AmpSum2SvImToSvReVZp = 2._dp*AmpWaveSvImToSvReVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvReVZp(gt1, gt2) 
  AmpSum2SvImToSvReVZp = 2._dp*AmpVertexSvImToSvReVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvReVZp(gt1, gt2) 
  AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp + 2._dp*AmpWaveSvImToSvReVZp + 2._dp*AmpVertexSvImToSvReVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvReVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZp(gt1, gt2) = AmpSqSvImToSvReVZp(gt1, gt2)  
  AmpSum2SvImToSvReVZp = + 2._dp*AmpWaveSvImToSvReVZp + 2._dp*AmpVertexSvImToSvReVZp
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
  AmpSqSvImToSvReVZp(gt1, gt2) = AmpSqSvImToSvReVZp(gt1, gt2) + AmpSqTreeSvImToSvReVZp(gt1, gt2)  
Else  
  AmpSum2SvImToSvReVZp = AmpTreeSvImToSvReVZp
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZp(gt1, gt2) = AmpSqSvImToSvReVZp(gt1, gt2)  
  AmpSum2SvImToSvReVZp = + 2._dp*AmpWaveSvImToSvReVZp + 2._dp*AmpVertexSvImToSvReVZp
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZp,AmpSumSvImToSvReVZp(:,gt1, gt2),AmpSum2SvImToSvReVZp(:,gt1, gt2),AmpSqSvImToSvReVZp(gt1, gt2)) 
  AmpSqSvImToSvReVZp(gt1, gt2) = AmpSqSvImToSvReVZp(gt1, gt2) + AmpSqTreeSvImToSvReVZp(gt1, gt2)  
End if  
Else  
  AmpSqSvImToSvReVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MVZpOS,helfactor*AmpSqSvImToSvReVZp(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MVZp,helfactor*AmpSqSvImToSvReVZp(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvReVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvReVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZp(gt1, gt2) + MRGSvImToSvReVZp(gt1, gt2)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZp(gt1, gt2) + MRGSvImToSvReVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! SvIm VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,    & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSvImSvReVP,cplSvImSvReVZ,       & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,               & 
& cplSvImcSeVPVWm1,AmpVertexSvImToSvImVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,    & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSvImSvReVP,cplSvImSvReVZ,       & 
& cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,               & 
& cplSvImcSeVPVWm1,AmpVertexSvImToSvImVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplFvFvVPL,cplFvFvVPR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,  & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1, & 
& cplSvImcSeVPVWm1,AmpVertexSvImToSvImVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImVP = 0._dp 
 AmpSum2SvImToSvImVP = 0._dp  
Else 
 AmpSumSvImToSvImVP = AmpVertexSvImToSvImVP + AmpWaveSvImToSvImVP
 AmpSum2SvImToSvImVP = AmpVertexSvImToSvImVP + AmpWaveSvImToSvImVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvImOS(gt2),0._dp,AmpSumSvImToSvImVP(:,gt1, gt2),AmpSum2SvImToSvImVP(:,gt1, gt2),AmpSqSvImToSvImVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvIm(gt2),MVP,AmpSumSvImToSvImVP(:,gt1, gt2),AmpSum2SvImToSvImVP(:,gt1, gt2),AmpSqSvImToSvImVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvImVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImVP(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),0._dp,helfactor*AmpSqSvImToSvImVP(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MVP,helfactor*AmpSqSvImToSvImVP(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvImVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! SvIm VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1, & 
& cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1, & 
& cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmSvImcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,        & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,    & 
& cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImVZ = 0._dp 
 AmpSum2SvImToSvImVZ = 0._dp  
Else 
 AmpSumSvImToSvImVZ = AmpVertexSvImToSvImVZ + AmpWaveSvImToSvImVZ
 AmpSum2SvImToSvImVZ = AmpVertexSvImToSvImVZ + AmpWaveSvImToSvImVZ 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvImToSvImVZ(:,gt1, gt2),AmpSum2SvImToSvImVZ(:,gt1, gt2),AmpSqSvImToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvIm(gt2),MVZ,AmpSumSvImToSvImVZ(:,gt1, gt2),AmpSum2SvImToSvImVZ(:,gt1, gt2),AmpSqSvImToSvImVZ(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvImVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MVZOS,helfactor*AmpSqSvImToSvImVZ(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MVZ,helfactor*AmpSqSvImToSvImVZ(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvImVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! SvIm VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,             & 
& cplHpmSvImcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZp,     & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,  & 
& cplSeSvImcVWmVZp1,cplSvImcSeVWmVZp1,AmpVertexSvImToSvImVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvImL,               & 
& cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,             & 
& cplHpmSvImcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZp,     & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,  & 
& cplSeSvImcVWmVZp1,cplSvImcSeVWmVZp1,AmpVertexSvImToSvImVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvImVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,             & 
& cplChiChiVZpR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,           & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvImcSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSvImcSeVWmVZp1,         & 
& AmpVertexSvImToSvImVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImVZp = 0._dp 
 AmpSum2SvImToSvImVZp = 0._dp  
Else 
 AmpSumSvImToSvImVZp = AmpVertexSvImToSvImVZp + AmpWaveSvImToSvImVZp
 AmpSum2SvImToSvImVZp = AmpVertexSvImToSvImVZp + AmpWaveSvImToSvImVZp 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvImToSvImVZp(:,gt1, gt2),AmpSum2SvImToSvImVZp(:,gt1, gt2),AmpSqSvImToSvImVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvIm(gt2),MVZp,AmpSumSvImToSvImVZp(:,gt1, gt2),AmpSum2SvImToSvImVZp(:,gt1, gt2),AmpSqSvImToSvImVZp(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvImVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MVZpOS,helfactor*AmpSqSvImToSvImVZp(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MVZp,helfactor*AmpSqSvImToSvImVZp(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvImVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! SvRe VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_SvImToSvReVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvImOS,MSvIm2OS,MSvReOS,             & 
& MSvRe2OS,MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvImToSvReVP)

 Else 
Call Amplitude_WAVE_BLSSM_SvImToSvReVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvImOS,MSvIm2OS,MSvReOS,             & 
& MSvRe2OS,MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvImToSvReVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvImToSvReVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,           & 
& cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,            & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImSvReVP,      & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImSvImVPVP1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1, & 
& cplSvImcSeVPVWm1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvRecSeVPVWm1, & 
& AmpVertexSvImToSvReVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SvImToSvReVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,           & 
& cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,            & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImSvReVP,      & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImSvImVPVP1,cplSvImSvImVPVZ1,cplSvImSvImVPVZp1, & 
& cplSvImcSeVPVWm1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1,cplSvReSvReVPVZp1,cplSvRecSeVPVWm1, & 
& AmpVertexSvImToSvReVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvImToSvReVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvImToSvReVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvImToSvReVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmSvRecSe,          & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,     & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImSvImVPVP1,          & 
& cplSvImSvImVPVZ1,cplSvImSvImVPVZp1,cplSvImcSeVPVWm1,cplSvReSvReVPVP1,cplSvReSvReVPVZ1, & 
& cplSvReSvReVPVZp1,cplSvRecSeVPVWm1,AmpVertexSvImToSvReVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReVP = 0._dp 
 AmpSum2SvImToSvReVP = 0._dp  
Else 
 AmpSumSvImToSvReVP = AmpVertexSvImToSvReVP + AmpWaveSvImToSvReVP
 AmpSum2SvImToSvReVP = AmpVertexSvImToSvReVP + AmpWaveSvImToSvReVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvImOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSvIm(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),0._dp,AmpSumSvImToSvReVP(:,gt1, gt2),AmpSum2SvImToSvReVP(:,gt1, gt2),AmpSqSvImToSvReVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVP,AmpSumSvImToSvReVP(:,gt1, gt2),AmpSum2SvImToSvReVP(:,gt1, gt2),AmpSqSvImToSvReVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvReVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReVP(gt1, gt2).eq.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),0._dp,helfactor*AmpSqSvImToSvReVP(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MVP,helfactor*AmpSqSvImToSvReVP(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvReVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_SvIm

End Module Wrapper_OneLoopDecay_SvIm_BLSSM
