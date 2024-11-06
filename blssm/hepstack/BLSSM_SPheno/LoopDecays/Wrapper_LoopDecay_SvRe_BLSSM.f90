! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:13 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_SvRe_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_SvRe_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_SvRe(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,          & 
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
& cplHpmSvImcSe(2,6,6),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvRecSe(2,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),& 
& cplSdSvRecSecSuaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),cplSecSecVWmVWm1(6,6),          & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),& 
& cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6),cplSeSvImcVWmVZp1(6,6),cplSeSvImSvRecSe1(6,6,6,6),& 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSeSvRecVWmVP1(6,6),cplSeSvRecVWmVZ1(6,6)

Complex(dp),Intent(in) :: cplSeSvRecVWmVZp1(6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),         & 
& cplSuSvReSvRecSuaa(6,6,6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWm(6,6),cplSvImcSeVWmVZ1(6,6),& 
& cplSvImcSeVWmVZp1(6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),    & 
& cplSvImSvImVPVP1(6,6),cplSvImSvImVPVZ1(6,6),cplSvImSvImVPVZp1(6,6),cplSvImSvImVZpVZp1(6,6),& 
& cplSvImSvImVZVZ1(6,6),cplSvImSvImVZVZp1(6,6),cplSvImSvReSvReSvRe1(6,6,6,6),            & 
& cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),cplSvRecSeVPVWm1(6,6),       & 
& cplSvRecSeVWm(6,6),cplSvRecSeVWmVZ1(6,6),cplSvRecSeVWmVZp1(6,6),cplSvReSvRecVWmVWm1(6,6),& 
& cplSvReSvReSvReSvRe1(6,6,6,6),cplSvReSvReVPVP1(6,6),cplSvReSvReVPVZ1(6,6),             & 
& cplSvReSvReVPVZp1(6,6),cplSvReSvReVZpVZp1(6,6),cplSvReSvReVZVZ1(6,6),cplSvReSvReVZVZp1(6,6),& 
& ctcplAhSvImSvRe(4,6,6),ctcplAhSvReSvRe(4,6,6),ctcplcFeChaSvReL(3,2,6),ctcplcFeChaSvReR(3,2,6),& 
& ctcplChiFvSvReL(7,6,6),ctcplChiFvSvReR(7,6,6),ctcplhhSvImSvRe(4,6,6),ctcplhhSvReSvRe(4,6,6),& 
& ctcplHpmSvRecSe(2,6,6),ctcplSeSvRecVWm(6,6),ctcplSvImSvReVP(6,6),ctcplSvImSvReVZ(6,6), & 
& ctcplSvImSvReVZp(6,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GcplSeSvRecHpm(6,6,2),         & 
& GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplSeSvRecHpm(6,6,2),GZcplcHpmVPVWm(2),    & 
& GZcplHpmcVWmVP(2),GZcplSeSvRecHpm(6,6,2),ZcplAhSvImSvRe(4,6,6),ZcplAhSvReSvRe(4,6,6),  & 
& ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),ZcplChiFvSvReL(7,6,6),ZcplChiFvSvReR(7,6,6),& 
& ZcplhhSvImSvRe(4,6,6),ZcplhhSvReSvRe(4,6,6),ZcplHpmSvRecSe(2,6,6),ZcplSeSvRecVWm(6,6), & 
& ZcplSvImSvReVZ(6,6),ZcplSvImSvReVZp(6,6)

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
Real(dp), Intent(out) :: gP1LSvRe(6,168) 
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
Real(dp) :: MRPSvReToSvImAh(6,6,4),MRGSvReToSvImAh(6,6,4), MRPZSvReToSvImAh(6,6,4),MRGZSvReToSvImAh(6,6,4) 
Real(dp) :: MVPSvReToSvImAh(6,6,4) 
Real(dp) :: RMsqTreeSvReToSvImAh(6,6,4),RMsqWaveSvReToSvImAh(6,6,4),RMsqVertexSvReToSvImAh(6,6,4) 
Complex(dp) :: AmpTreeSvReToSvImAh(6,6,4),AmpWaveSvReToSvImAh(6,6,4)=(0._dp,0._dp),AmpVertexSvReToSvImAh(6,6,4)& 
 & ,AmpVertexIRosSvReToSvImAh(6,6,4),AmpVertexIRdrSvReToSvImAh(6,6,4), AmpSumSvReToSvImAh(6,6,4), AmpSum2SvReToSvImAh(6,6,4) 
Complex(dp) :: AmpTreeZSvReToSvImAh(6,6,4),AmpWaveZSvReToSvImAh(6,6,4),AmpVertexZSvReToSvImAh(6,6,4) 
Real(dp) :: AmpSqSvReToSvImAh(6,6,4),  AmpSqTreeSvReToSvImAh(6,6,4) 
Real(dp) :: MRPSvReToSvReAh(6,6,4),MRGSvReToSvReAh(6,6,4), MRPZSvReToSvReAh(6,6,4),MRGZSvReToSvReAh(6,6,4) 
Real(dp) :: MVPSvReToSvReAh(6,6,4) 
Real(dp) :: RMsqTreeSvReToSvReAh(6,6,4),RMsqWaveSvReToSvReAh(6,6,4),RMsqVertexSvReToSvReAh(6,6,4) 
Complex(dp) :: AmpTreeSvReToSvReAh(6,6,4),AmpWaveSvReToSvReAh(6,6,4)=(0._dp,0._dp),AmpVertexSvReToSvReAh(6,6,4)& 
 & ,AmpVertexIRosSvReToSvReAh(6,6,4),AmpVertexIRdrSvReToSvReAh(6,6,4), AmpSumSvReToSvReAh(6,6,4), AmpSum2SvReToSvReAh(6,6,4) 
Complex(dp) :: AmpTreeZSvReToSvReAh(6,6,4),AmpWaveZSvReToSvReAh(6,6,4),AmpVertexZSvReToSvReAh(6,6,4) 
Real(dp) :: AmpSqSvReToSvReAh(6,6,4),  AmpSqTreeSvReToSvReAh(6,6,4) 
Real(dp) :: MRPSvReTocFeCha(6,3,2),MRGSvReTocFeCha(6,3,2), MRPZSvReTocFeCha(6,3,2),MRGZSvReTocFeCha(6,3,2) 
Real(dp) :: MVPSvReTocFeCha(6,3,2) 
Real(dp) :: RMsqTreeSvReTocFeCha(6,3,2),RMsqWaveSvReTocFeCha(6,3,2),RMsqVertexSvReTocFeCha(6,3,2) 
Complex(dp) :: AmpTreeSvReTocFeCha(2,6,3,2),AmpWaveSvReTocFeCha(2,6,3,2)=(0._dp,0._dp),AmpVertexSvReTocFeCha(2,6,3,2)& 
 & ,AmpVertexIRosSvReTocFeCha(2,6,3,2),AmpVertexIRdrSvReTocFeCha(2,6,3,2), AmpSumSvReTocFeCha(2,6,3,2), AmpSum2SvReTocFeCha(2,6,3,2) 
Complex(dp) :: AmpTreeZSvReTocFeCha(2,6,3,2),AmpWaveZSvReTocFeCha(2,6,3,2),AmpVertexZSvReTocFeCha(2,6,3,2) 
Real(dp) :: AmpSqSvReTocFeCha(6,3,2),  AmpSqTreeSvReTocFeCha(6,3,2) 
Real(dp) :: MRPSvReToFvChi(6,6,7),MRGSvReToFvChi(6,6,7), MRPZSvReToFvChi(6,6,7),MRGZSvReToFvChi(6,6,7) 
Real(dp) :: MVPSvReToFvChi(6,6,7) 
Real(dp) :: RMsqTreeSvReToFvChi(6,6,7),RMsqWaveSvReToFvChi(6,6,7),RMsqVertexSvReToFvChi(6,6,7) 
Complex(dp) :: AmpTreeSvReToFvChi(2,6,6,7),AmpWaveSvReToFvChi(2,6,6,7)=(0._dp,0._dp),AmpVertexSvReToFvChi(2,6,6,7)& 
 & ,AmpVertexIRosSvReToFvChi(2,6,6,7),AmpVertexIRdrSvReToFvChi(2,6,6,7), AmpSumSvReToFvChi(2,6,6,7), AmpSum2SvReToFvChi(2,6,6,7) 
Complex(dp) :: AmpTreeZSvReToFvChi(2,6,6,7),AmpWaveZSvReToFvChi(2,6,6,7),AmpVertexZSvReToFvChi(2,6,6,7) 
Real(dp) :: AmpSqSvReToFvChi(6,6,7),  AmpSqTreeSvReToFvChi(6,6,7) 
Real(dp) :: MRPSvReToSvImhh(6,6,4),MRGSvReToSvImhh(6,6,4), MRPZSvReToSvImhh(6,6,4),MRGZSvReToSvImhh(6,6,4) 
Real(dp) :: MVPSvReToSvImhh(6,6,4) 
Real(dp) :: RMsqTreeSvReToSvImhh(6,6,4),RMsqWaveSvReToSvImhh(6,6,4),RMsqVertexSvReToSvImhh(6,6,4) 
Complex(dp) :: AmpTreeSvReToSvImhh(6,6,4),AmpWaveSvReToSvImhh(6,6,4)=(0._dp,0._dp),AmpVertexSvReToSvImhh(6,6,4)& 
 & ,AmpVertexIRosSvReToSvImhh(6,6,4),AmpVertexIRdrSvReToSvImhh(6,6,4), AmpSumSvReToSvImhh(6,6,4), AmpSum2SvReToSvImhh(6,6,4) 
Complex(dp) :: AmpTreeZSvReToSvImhh(6,6,4),AmpWaveZSvReToSvImhh(6,6,4),AmpVertexZSvReToSvImhh(6,6,4) 
Real(dp) :: AmpSqSvReToSvImhh(6,6,4),  AmpSqTreeSvReToSvImhh(6,6,4) 
Real(dp) :: MRPSvReToSvRehh(6,6,4),MRGSvReToSvRehh(6,6,4), MRPZSvReToSvRehh(6,6,4),MRGZSvReToSvRehh(6,6,4) 
Real(dp) :: MVPSvReToSvRehh(6,6,4) 
Real(dp) :: RMsqTreeSvReToSvRehh(6,6,4),RMsqWaveSvReToSvRehh(6,6,4),RMsqVertexSvReToSvRehh(6,6,4) 
Complex(dp) :: AmpTreeSvReToSvRehh(6,6,4),AmpWaveSvReToSvRehh(6,6,4)=(0._dp,0._dp),AmpVertexSvReToSvRehh(6,6,4)& 
 & ,AmpVertexIRosSvReToSvRehh(6,6,4),AmpVertexIRdrSvReToSvRehh(6,6,4), AmpSumSvReToSvRehh(6,6,4), AmpSum2SvReToSvRehh(6,6,4) 
Complex(dp) :: AmpTreeZSvReToSvRehh(6,6,4),AmpWaveZSvReToSvRehh(6,6,4),AmpVertexZSvReToSvRehh(6,6,4) 
Real(dp) :: AmpSqSvReToSvRehh(6,6,4),  AmpSqTreeSvReToSvRehh(6,6,4) 
Real(dp) :: MRPSvReTocSeHpm(6,6,2),MRGSvReTocSeHpm(6,6,2), MRPZSvReTocSeHpm(6,6,2),MRGZSvReTocSeHpm(6,6,2) 
Real(dp) :: MVPSvReTocSeHpm(6,6,2) 
Real(dp) :: RMsqTreeSvReTocSeHpm(6,6,2),RMsqWaveSvReTocSeHpm(6,6,2),RMsqVertexSvReTocSeHpm(6,6,2) 
Complex(dp) :: AmpTreeSvReTocSeHpm(6,6,2),AmpWaveSvReTocSeHpm(6,6,2)=(0._dp,0._dp),AmpVertexSvReTocSeHpm(6,6,2)& 
 & ,AmpVertexIRosSvReTocSeHpm(6,6,2),AmpVertexIRdrSvReTocSeHpm(6,6,2), AmpSumSvReTocSeHpm(6,6,2), AmpSum2SvReTocSeHpm(6,6,2) 
Complex(dp) :: AmpTreeZSvReTocSeHpm(6,6,2),AmpWaveZSvReTocSeHpm(6,6,2),AmpVertexZSvReTocSeHpm(6,6,2) 
Real(dp) :: AmpSqSvReTocSeHpm(6,6,2),  AmpSqTreeSvReTocSeHpm(6,6,2) 
Real(dp) :: MRPSvReToSecVWm(6,6),MRGSvReToSecVWm(6,6), MRPZSvReToSecVWm(6,6),MRGZSvReToSecVWm(6,6) 
Real(dp) :: MVPSvReToSecVWm(6,6) 
Real(dp) :: RMsqTreeSvReToSecVWm(6,6),RMsqWaveSvReToSecVWm(6,6),RMsqVertexSvReToSecVWm(6,6) 
Complex(dp) :: AmpTreeSvReToSecVWm(2,6,6),AmpWaveSvReToSecVWm(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSecVWm(2,6,6)& 
 & ,AmpVertexIRosSvReToSecVWm(2,6,6),AmpVertexIRdrSvReToSecVWm(2,6,6), AmpSumSvReToSecVWm(2,6,6), AmpSum2SvReToSecVWm(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSecVWm(2,6,6),AmpWaveZSvReToSecVWm(2,6,6),AmpVertexZSvReToSecVWm(2,6,6) 
Real(dp) :: AmpSqSvReToSecVWm(6,6),  AmpSqTreeSvReToSecVWm(6,6) 
Real(dp) :: MRPSvReToSvImVZ(6,6),MRGSvReToSvImVZ(6,6), MRPZSvReToSvImVZ(6,6),MRGZSvReToSvImVZ(6,6) 
Real(dp) :: MVPSvReToSvImVZ(6,6) 
Real(dp) :: RMsqTreeSvReToSvImVZ(6,6),RMsqWaveSvReToSvImVZ(6,6),RMsqVertexSvReToSvImVZ(6,6) 
Complex(dp) :: AmpTreeSvReToSvImVZ(2,6,6),AmpWaveSvReToSvImVZ(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvImVZ(2,6,6)& 
 & ,AmpVertexIRosSvReToSvImVZ(2,6,6),AmpVertexIRdrSvReToSvImVZ(2,6,6), AmpSumSvReToSvImVZ(2,6,6), AmpSum2SvReToSvImVZ(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvImVZ(2,6,6),AmpWaveZSvReToSvImVZ(2,6,6),AmpVertexZSvReToSvImVZ(2,6,6) 
Real(dp) :: AmpSqSvReToSvImVZ(6,6),  AmpSqTreeSvReToSvImVZ(6,6) 
Real(dp) :: MRPSvReToSvImVZp(6,6),MRGSvReToSvImVZp(6,6), MRPZSvReToSvImVZp(6,6),MRGZSvReToSvImVZp(6,6) 
Real(dp) :: MVPSvReToSvImVZp(6,6) 
Real(dp) :: RMsqTreeSvReToSvImVZp(6,6),RMsqWaveSvReToSvImVZp(6,6),RMsqVertexSvReToSvImVZp(6,6) 
Complex(dp) :: AmpTreeSvReToSvImVZp(2,6,6),AmpWaveSvReToSvImVZp(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvImVZp(2,6,6)& 
 & ,AmpVertexIRosSvReToSvImVZp(2,6,6),AmpVertexIRdrSvReToSvImVZp(2,6,6), AmpSumSvReToSvImVZp(2,6,6), AmpSum2SvReToSvImVZp(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvImVZp(2,6,6),AmpWaveZSvReToSvImVZp(2,6,6),AmpVertexZSvReToSvImVZp(2,6,6) 
Real(dp) :: AmpSqSvReToSvImVZp(6,6),  AmpSqTreeSvReToSvImVZp(6,6) 
Real(dp) :: MRPSvReToSvImVP(6,6),MRGSvReToSvImVP(6,6), MRPZSvReToSvImVP(6,6),MRGZSvReToSvImVP(6,6) 
Real(dp) :: MVPSvReToSvImVP(6,6) 
Real(dp) :: RMsqTreeSvReToSvImVP(6,6),RMsqWaveSvReToSvImVP(6,6),RMsqVertexSvReToSvImVP(6,6) 
Complex(dp) :: AmpTreeSvReToSvImVP(2,6,6),AmpWaveSvReToSvImVP(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvImVP(2,6,6)& 
 & ,AmpVertexIRosSvReToSvImVP(2,6,6),AmpVertexIRdrSvReToSvImVP(2,6,6), AmpSumSvReToSvImVP(2,6,6), AmpSum2SvReToSvImVP(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvImVP(2,6,6),AmpWaveZSvReToSvImVP(2,6,6),AmpVertexZSvReToSvImVP(2,6,6) 
Real(dp) :: AmpSqSvReToSvImVP(6,6),  AmpSqTreeSvReToSvImVP(6,6) 
Real(dp) :: MRPSvReToSvReVP(6,6),MRGSvReToSvReVP(6,6), MRPZSvReToSvReVP(6,6),MRGZSvReToSvReVP(6,6) 
Real(dp) :: MVPSvReToSvReVP(6,6) 
Real(dp) :: RMsqTreeSvReToSvReVP(6,6),RMsqWaveSvReToSvReVP(6,6),RMsqVertexSvReToSvReVP(6,6) 
Complex(dp) :: AmpTreeSvReToSvReVP(2,6,6),AmpWaveSvReToSvReVP(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvReVP(2,6,6)& 
 & ,AmpVertexIRosSvReToSvReVP(2,6,6),AmpVertexIRdrSvReToSvReVP(2,6,6), AmpSumSvReToSvReVP(2,6,6), AmpSum2SvReToSvReVP(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvReVP(2,6,6),AmpWaveZSvReToSvReVP(2,6,6),AmpVertexZSvReToSvReVP(2,6,6) 
Real(dp) :: AmpSqSvReToSvReVP(6,6),  AmpSqTreeSvReToSvReVP(6,6) 
Real(dp) :: MRPSvReToSvReVZ(6,6),MRGSvReToSvReVZ(6,6), MRPZSvReToSvReVZ(6,6),MRGZSvReToSvReVZ(6,6) 
Real(dp) :: MVPSvReToSvReVZ(6,6) 
Real(dp) :: RMsqTreeSvReToSvReVZ(6,6),RMsqWaveSvReToSvReVZ(6,6),RMsqVertexSvReToSvReVZ(6,6) 
Complex(dp) :: AmpTreeSvReToSvReVZ(2,6,6),AmpWaveSvReToSvReVZ(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvReVZ(2,6,6)& 
 & ,AmpVertexIRosSvReToSvReVZ(2,6,6),AmpVertexIRdrSvReToSvReVZ(2,6,6), AmpSumSvReToSvReVZ(2,6,6), AmpSum2SvReToSvReVZ(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvReVZ(2,6,6),AmpWaveZSvReToSvReVZ(2,6,6),AmpVertexZSvReToSvReVZ(2,6,6) 
Real(dp) :: AmpSqSvReToSvReVZ(6,6),  AmpSqTreeSvReToSvReVZ(6,6) 
Real(dp) :: MRPSvReToSvReVZp(6,6),MRGSvReToSvReVZp(6,6), MRPZSvReToSvReVZp(6,6),MRGZSvReToSvReVZp(6,6) 
Real(dp) :: MVPSvReToSvReVZp(6,6) 
Real(dp) :: RMsqTreeSvReToSvReVZp(6,6),RMsqWaveSvReToSvReVZp(6,6),RMsqVertexSvReToSvReVZp(6,6) 
Complex(dp) :: AmpTreeSvReToSvReVZp(2,6,6),AmpWaveSvReToSvReVZp(2,6,6)=(0._dp,0._dp),AmpVertexSvReToSvReVZp(2,6,6)& 
 & ,AmpVertexIRosSvReToSvReVZp(2,6,6),AmpVertexIRdrSvReToSvReVZp(2,6,6), AmpSumSvReToSvReVZp(2,6,6), AmpSum2SvReToSvReVZp(2,6,6) 
Complex(dp) :: AmpTreeZSvReToSvReVZp(2,6,6),AmpWaveZSvReToSvReVZp(2,6,6),AmpVertexZSvReToSvReVZp(2,6,6) 
Real(dp) :: AmpSqSvReToSvReVZp(6,6),  AmpSqTreeSvReToSvReVZp(6,6) 
Write(*,*) "Calculating one-loop decays of SvRe " 
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
Call Amplitude_Tree_BLSSM_SvReToSvImAh(cplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,            & 
& MSvIm2,MSvRe2,AmpTreeSvReToSvImAh)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvImAh(ZcplAhSvImSvRe,MAh,MSvIm,MSvRe,MAh2,           & 
& MSvIm2,MSvRe2,AmpTreeSvReToSvImAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImAh(MLambda,em,gs,cplAhSvImSvRe,MAhOS,MSvImOS,         & 
& MSvReOS,MRPSvReToSvImAh,MRGSvReToSvImAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImAh(MLambda,em,gs,ZcplAhSvImSvRe,MAhOS,MSvImOS,        & 
& MSvReOS,MRPSvReToSvImAh,MRGSvReToSvImAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvImAh(MLambda,em,gs,cplAhSvImSvRe,MAh,MSvIm,             & 
& MSvRe,MRPSvReToSvImAh,MRGSvReToSvImAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImAh(MLambda,em,gs,ZcplAhSvImSvRe,MAh,MSvIm,            & 
& MSvRe,MRPSvReToSvImAh,MRGSvReToSvImAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvImAh(cplAhSvImSvRe,ctcplAhSvImSvRe,MAh,             & 
& MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,AmpWaveSvReToSvImAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& AmpVertexSvReToSvImAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRdrSvReToSvImAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvReToSvImAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRosSvReToSvImAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvReToSvImAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& AmpVertexIRosSvReToSvImAh)

 End if 
 End if 
AmpVertexSvReToSvImAh = AmpVertexSvReToSvImAh -  AmpVertexIRdrSvReToSvImAh! +  AmpVertexIRosSvReToSvImAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvImAh=0._dp 
AmpVertexZSvReToSvImAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImAh(gt2,:,:) = AmpWaveZSvReToSvImAh(gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvImAh(gt1,:,:) 
AmpVertexZSvReToSvImAh(gt2,:,:)= AmpVertexZSvReToSvImAh(gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvImAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReToSvImAh=AmpWaveZSvReToSvImAh 
AmpVertexSvReToSvImAh= AmpVertexZSvReToSvImAh
! Final State 1 
AmpWaveZSvReToSvImAh=0._dp 
AmpVertexZSvReToSvImAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImAh(:,gt2,:) = AmpWaveZSvReToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvReToSvImAh(:,gt1,:) 
AmpVertexZSvReToSvImAh(:,gt2,:)= AmpVertexZSvReToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvReToSvImAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvImAh=AmpWaveZSvReToSvImAh 
AmpVertexSvReToSvImAh= AmpVertexZSvReToSvImAh
! Final State 2 
AmpWaveZSvReToSvImAh=0._dp 
AmpVertexZSvReToSvImAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvReToSvImAh(:,:,gt2) = AmpWaveZSvReToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvReToSvImAh(:,:,gt1) 
AmpVertexZSvReToSvImAh(:,:,gt2)= AmpVertexZSvReToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvReToSvImAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvImAh=AmpWaveZSvReToSvImAh 
AmpVertexSvReToSvImAh= AmpVertexZSvReToSvImAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvImAh = AmpVertexSvReToSvImAh  +  AmpVertexIRosSvReToSvImAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvIm Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvImAh = AmpTreeSvReToSvImAh 
 AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh + 2._dp*AmpWaveSvReToSvImAh + 2._dp*AmpVertexSvReToSvImAh  
Else 
 AmpSumSvReToSvImAh = AmpTreeSvReToSvImAh + AmpWaveSvReToSvImAh + AmpVertexSvReToSvImAh
 AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh + AmpWaveSvReToSvImAh + AmpVertexSvReToSvImAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvImAh = AmpTreeSvReToSvImAh
 AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImAh = 2._dp*AmpWaveSvReToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImAh = 2._dp*AmpVertexSvReToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh + 2._dp*AmpWaveSvReToSvImAh + 2._dp*AmpVertexSvReToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvImAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvImAh(gt1, gt2, gt3) = AmpSqSvReToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvReToSvImAh = + 2._dp*AmpWaveSvReToSvImAh + 2._dp*AmpVertexSvReToSvImAh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvReToSvImAh(gt1, gt2, gt3) = AmpSqSvReToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvReToSvImAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvReToSvImAh = AmpTreeSvReToSvImAh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvImAh(gt1, gt2, gt3) = AmpSqSvReToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvReToSvImAh = + 2._dp*AmpWaveSvReToSvImAh + 2._dp*AmpVertexSvReToSvImAh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvReToSvImAh(gt1, gt2, gt3),AmpSum2SvReToSvImAh(gt1, gt2, gt3),AmpSqSvReToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvReToSvImAh(gt1, gt2, gt3) = AmpSqSvReToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvReToSvImAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReToSvImAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvImAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvImOS(gt2),MAhOS(gt3),helfactor*AmpSqSvReToSvImAh(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvIm(gt2),MAh(gt3),helfactor*AmpSqSvReToSvImAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvImAh(gt1, gt2, gt3) + MRGSvReToSvImAh(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvImAh(gt1, gt2, gt3) + MRGSvReToSvImAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReToSvReAh(cplAhSvReSvRe,MAh,MSvRe,MAh2,MSvRe2,           & 
& AmpTreeSvReToSvReAh)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvReAh(ZcplAhSvReSvRe,MAh,MSvRe,MAh2,MSvRe2,          & 
& AmpTreeSvReToSvReAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvReAh(MLambda,em,gs,cplAhSvReSvRe,MAhOS,MSvReOS,         & 
& MRPSvReToSvReAh,MRGSvReToSvReAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvReAh(MLambda,em,gs,ZcplAhSvReSvRe,MAhOS,MSvReOS,        & 
& MRPSvReToSvReAh,MRGSvReToSvReAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvReAh(MLambda,em,gs,cplAhSvReSvRe,MAh,MSvRe,             & 
& MRPSvReToSvReAh,MRGSvReToSvReAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvReAh(MLambda,em,gs,ZcplAhSvReSvRe,MAh,MSvRe,            & 
& MRPSvReToSvReAh,MRGSvReToSvReAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvReAh(cplAhSvReSvRe,ctcplAhSvReSvRe,MAh,             & 
& MAh2,MSvRe,MSvRe2,ZfAh,ZfSvRe,AmpWaveSvReToSvReAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexSvReToSvReAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRdrSvReToSvReAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosSvReToSvReAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosSvReToSvReAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosSvReToSvReAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,AmpVertexIRosSvReToSvReAh)

 End if 
 End if 
AmpVertexSvReToSvReAh = AmpVertexSvReToSvReAh -  AmpVertexIRdrSvReToSvReAh! +  AmpVertexIRosSvReToSvReAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvReAh=0._dp 
AmpVertexZSvReToSvReAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvReAh(gt2,:,:) = AmpWaveZSvReToSvReAh(gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvReAh(gt1,:,:) 
AmpVertexZSvReToSvReAh(gt2,:,:)= AmpVertexZSvReToSvReAh(gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvReAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReToSvReAh=AmpWaveZSvReToSvReAh 
AmpVertexSvReToSvReAh= AmpVertexZSvReToSvReAh
! Final State 1 
AmpWaveZSvReToSvReAh=0._dp 
AmpVertexZSvReToSvReAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvReAh(:,gt2,:) = AmpWaveZSvReToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvReAh(:,gt1,:) 
AmpVertexZSvReToSvReAh(:,gt2,:)= AmpVertexZSvReToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvReToSvReAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvReAh=AmpWaveZSvReToSvReAh 
AmpVertexSvReToSvReAh= AmpVertexZSvReToSvReAh
! Final State 2 
AmpWaveZSvReToSvReAh=0._dp 
AmpVertexZSvReToSvReAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvReToSvReAh(:,:,gt2) = AmpWaveZSvReToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvReToSvReAh(:,:,gt1) 
AmpVertexZSvReToSvReAh(:,:,gt2)= AmpVertexZSvReToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvReToSvReAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvReAh=AmpWaveZSvReToSvReAh 
AmpVertexSvReToSvReAh= AmpVertexZSvReToSvReAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvReAh = AmpVertexSvReToSvReAh  +  AmpVertexIRosSvReToSvReAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvRe Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvReAh = AmpTreeSvReToSvReAh 
 AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh + 2._dp*AmpWaveSvReToSvReAh + 2._dp*AmpVertexSvReToSvReAh  
Else 
 AmpSumSvReToSvReAh = AmpTreeSvReToSvReAh + AmpWaveSvReToSvReAh + AmpVertexSvReToSvReAh
 AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh + AmpWaveSvReToSvReAh + AmpVertexSvReToSvReAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvReAh = AmpTreeSvReToSvReAh
 AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvReAh = 2._dp*AmpWaveSvReToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvReAh = 2._dp*AmpVertexSvReToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh + 2._dp*AmpWaveSvReToSvReAh + 2._dp*AmpVertexSvReToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvReAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvReAh(gt1, gt2, gt3) = AmpSqSvReToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvReToSvReAh = + 2._dp*AmpWaveSvReToSvReAh + 2._dp*AmpVertexSvReToSvReAh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvReToSvReAh(gt1, gt2, gt3) = AmpSqSvReToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvReToSvReAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvReToSvReAh = AmpTreeSvReToSvReAh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvReAh(gt1, gt2, gt3) = AmpSqSvReToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvReToSvReAh = + 2._dp*AmpWaveSvReToSvReAh + 2._dp*AmpVertexSvReToSvReAh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvReToSvReAh(gt1, gt2, gt3),AmpSum2SvReToSvReAh(gt1, gt2, gt3),AmpSqSvReToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvReToSvReAh(gt1, gt2, gt3) = AmpSqSvReToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvReToSvReAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReToSvReAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvReAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvReOS(gt2),MAhOS(gt3),helfactor*AmpSqSvReToSvReAh(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvRe(gt2),MAh(gt3),helfactor*AmpSqSvReToSvReAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvReAh(gt1, gt2, gt3) + MRGSvReToSvReAh(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvReAh(gt1, gt2, gt3) + MRGSvReToSvReAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReTocFeCha(cplcFeChaSvReL,cplcFeChaSvReR,MCha,            & 
& MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeSvReTocFeCha)

  Else 
Call Amplitude_Tree_BLSSM_SvReTocFeCha(ZcplcFeChaSvReL,ZcplcFeChaSvReR,               & 
& MCha,MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeSvReTocFeCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReTocFeCha(MLambda,em,gs,cplcFeChaSvReL,cplcFeChaSvReR,       & 
& MChaOS,MFeOS,MSvReOS,MRPSvReTocFeCha,MRGSvReTocFeCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReTocFeCha(MLambda,em,gs,ZcplcFeChaSvReL,ZcplcFeChaSvReR,     & 
& MChaOS,MFeOS,MSvReOS,MRPSvReTocFeCha,MRGSvReTocFeCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReTocFeCha(MLambda,em,gs,cplcFeChaSvReL,cplcFeChaSvReR,       & 
& MCha,MFe,MSvRe,MRPSvReTocFeCha,MRGSvReTocFeCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReTocFeCha(MLambda,em,gs,ZcplcFeChaSvReL,ZcplcFeChaSvReR,     & 
& MCha,MFe,MSvRe,MRPSvReTocFeCha,MRGSvReTocFeCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReTocFeCha(cplcFeChaSvReL,cplcFeChaSvReR,ctcplcFeChaSvReL,& 
& ctcplcFeChaSvReR,MCha,MCha2,MFe,MFe2,MSvRe,MSvRe2,ZfFEL,ZfFER,ZfLm,ZfLp,               & 
& ZfSvRe,AmpWaveSvReTocFeCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,        & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,        & 
& cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexSvReTocFeCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,        & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,        & 
& cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRdrSvReTocFeCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,      & 
& cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& ZcplcFeChaSvReL,ZcplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,cplChiFvSvReR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvRecSeVWm,AmpVertexIRosSvReTocFeCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,            & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,        & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,        & 
& cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReTocFeCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,      & 
& cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,cplChiFvSvReR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvRecSeVWm,AmpVertexIRosSvReTocFeCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,        & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,        & 
& cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,   & 
& cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReTocFeCha)

 End if 
 End if 
AmpVertexSvReTocFeCha = AmpVertexSvReTocFeCha -  AmpVertexIRdrSvReTocFeCha! +  AmpVertexIRosSvReTocFeCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReTocFeCha=0._dp 
AmpVertexZSvReTocFeCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReTocFeCha(:,gt2,:,:) = AmpWaveZSvReTocFeCha(:,gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReTocFeCha(:,gt1,:,:) 
AmpVertexZSvReTocFeCha(:,gt2,:,:)= AmpVertexZSvReTocFeCha(:,gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReTocFeCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReTocFeCha=AmpWaveZSvReTocFeCha 
AmpVertexSvReTocFeCha= AmpVertexZSvReTocFeCha
! Final State 1 
AmpWaveZSvReTocFeCha=0._dp 
AmpVertexZSvReTocFeCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvReTocFeCha(1,:,gt2,:) = AmpWaveZSvReTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWaveSvReTocFeCha(1,:,gt1,:) 
AmpVertexZSvReTocFeCha(1,:,gt2,:)= AmpVertexZSvReTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexSvReTocFeCha(1,:,gt1,:) 
AmpWaveZSvReTocFeCha(2,:,gt2,:) = AmpWaveZSvReTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWaveSvReTocFeCha(2,:,gt1,:) 
AmpVertexZSvReTocFeCha(2,:,gt2,:)= AmpVertexZSvReTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexSvReTocFeCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReTocFeCha=AmpWaveZSvReTocFeCha 
AmpVertexSvReTocFeCha= AmpVertexZSvReTocFeCha
! Final State 2 
AmpWaveZSvReTocFeCha=0._dp 
AmpVertexZSvReTocFeCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvReTocFeCha(1,:,:,gt2) = AmpWaveZSvReTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSvReTocFeCha(1,:,:,gt1) 
AmpVertexZSvReTocFeCha(1,:,:,gt2)= AmpVertexZSvReTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSvReTocFeCha(1,:,:,gt1) 
AmpWaveZSvReTocFeCha(2,:,:,gt2) = AmpWaveZSvReTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSvReTocFeCha(2,:,:,gt1) 
AmpVertexZSvReTocFeCha(2,:,:,gt2)= AmpVertexZSvReTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSvReTocFeCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReTocFeCha=AmpWaveZSvReTocFeCha 
AmpVertexSvReTocFeCha= AmpVertexZSvReTocFeCha
End if
If (ShiftIRdiv) Then 
AmpVertexSvReTocFeCha = AmpVertexSvReTocFeCha  +  AmpVertexIRosSvReTocFeCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->bar[Fe] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReTocFeCha = AmpTreeSvReTocFeCha 
 AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha + 2._dp*AmpWaveSvReTocFeCha + 2._dp*AmpVertexSvReTocFeCha  
Else 
 AmpSumSvReTocFeCha = AmpTreeSvReTocFeCha + AmpWaveSvReTocFeCha + AmpVertexSvReTocFeCha
 AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha + AmpWaveSvReTocFeCha + AmpVertexSvReTocFeCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReTocFeCha = AmpTreeSvReTocFeCha
 AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MFe(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvReTocFeCha = 2._dp*AmpWaveSvReTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvReTocFeCha = 2._dp*AmpVertexSvReTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha + 2._dp*AmpWaveSvReTocFeCha + 2._dp*AmpVertexSvReTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReTocFeCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvReTocFeCha(gt1, gt2, gt3) = AmpSqSvReTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvReTocFeCha = + 2._dp*AmpWaveSvReTocFeCha + 2._dp*AmpVertexSvReTocFeCha
  Call SquareAmp_StoFF(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvReTocFeCha(gt1, gt2, gt3) = AmpSqSvReTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvReTocFeCha(gt1, gt2, gt3)  
Else  
  AmpSum2SvReTocFeCha = AmpTreeSvReTocFeCha
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvReTocFeCha(gt1, gt2, gt3) = AmpSqSvReTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvReTocFeCha = + 2._dp*AmpWaveSvReTocFeCha + 2._dp*AmpVertexSvReTocFeCha
  Call SquareAmp_StoFF(MSvRe(gt1),MFe(gt2),MCha(gt3),AmpSumSvReTocFeCha(:,gt1, gt2, gt3),AmpSum2SvReTocFeCha(:,gt1, gt2, gt3),AmpSqSvReTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvReTocFeCha(gt1, gt2, gt3) = AmpSqSvReTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvReTocFeCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReTocFeCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvReTocFeCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvReOS(gt1),MFeOS(gt2),MChaOS(gt3),helfactor*AmpSqSvReTocFeCha(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvRe(gt1),MFe(gt2),MCha(gt3),helfactor*AmpSqSvReTocFeCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvReTocFeCha(gt1, gt2, gt3) + MRGSvReTocFeCha(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvReTocFeCha(gt1, gt2, gt3) + MRGSvReTocFeCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReToFvChi(cplChiFvSvReL,cplChiFvSvReR,MChi,               & 
& MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeSvReToFvChi)

  Else 
Call Amplitude_Tree_BLSSM_SvReToFvChi(ZcplChiFvSvReL,ZcplChiFvSvReR,MChi,             & 
& MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeSvReToFvChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToFvChi(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,          & 
& MChiOS,MFvOS,MSvReOS,MRPSvReToFvChi,MRGSvReToFvChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToFvChi(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR,        & 
& MChiOS,MFvOS,MSvReOS,MRPSvReToFvChi,MRGSvReToFvChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToFvChi(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,          & 
& MChi,MFv,MSvRe,MRPSvReToFvChi,MRGSvReToFvChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToFvChi(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR,        & 
& MChi,MFv,MSvRe,MRPSvReToFvChi,MRGSvReToFvChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToFvChi(cplChiFvSvReL,cplChiFvSvReR,ctcplChiFvSvReL,    & 
& ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFvm,ZfL0,ZfSvRe,AmpWaveSvReToFvChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexSvReToFvChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRdrSvReToFvChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReToFvChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReToFvChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReToFvChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,AmpVertexIRosSvReToFvChi)

 End if 
 End if 
AmpVertexSvReToFvChi = AmpVertexSvReToFvChi -  AmpVertexIRdrSvReToFvChi! +  AmpVertexIRosSvReToFvChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToFvChi=0._dp 
AmpVertexZSvReToFvChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToFvChi(:,gt2,:,:) = AmpWaveZSvReToFvChi(:,gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToFvChi(:,gt1,:,:) 
AmpVertexZSvReToFvChi(:,gt2,:,:)= AmpVertexZSvReToFvChi(:,gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToFvChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReToFvChi=AmpWaveZSvReToFvChi 
AmpVertexSvReToFvChi= AmpVertexZSvReToFvChi
! Final State 1 
AmpWaveZSvReToFvChi=0._dp 
AmpVertexZSvReToFvChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToFvChi(1,:,gt2,:) = AmpWaveZSvReToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveSvReToFvChi(1,:,gt1,:) 
AmpVertexZSvReToFvChi(1,:,gt2,:)= AmpVertexZSvReToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexSvReToFvChi(1,:,gt1,:) 
AmpWaveZSvReToFvChi(2,:,gt2,:) = AmpWaveZSvReToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveSvReToFvChi(2,:,gt1,:) 
AmpVertexZSvReToFvChi(2,:,gt2,:)= AmpVertexZSvReToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexSvReToFvChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToFvChi=AmpWaveZSvReToFvChi 
AmpVertexSvReToFvChi= AmpVertexZSvReToFvChi
! Final State 2 
AmpWaveZSvReToFvChi=0._dp 
AmpVertexZSvReToFvChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZSvReToFvChi(1,:,:,gt2) = AmpWaveZSvReToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvReToFvChi(1,:,:,gt1) 
AmpVertexZSvReToFvChi(1,:,:,gt2)= AmpVertexZSvReToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvReToFvChi(1,:,:,gt1) 
AmpWaveZSvReToFvChi(2,:,:,gt2) = AmpWaveZSvReToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvReToFvChi(2,:,:,gt1) 
AmpVertexZSvReToFvChi(2,:,:,gt2)= AmpVertexZSvReToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvReToFvChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToFvChi=AmpWaveZSvReToFvChi 
AmpVertexSvReToFvChi= AmpVertexZSvReToFvChi
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToFvChi = AmpVertexSvReToFvChi  +  AmpVertexIRosSvReToFvChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->Fv Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToFvChi = AmpTreeSvReToFvChi 
 AmpSum2SvReToFvChi = AmpTreeSvReToFvChi + 2._dp*AmpWaveSvReToFvChi + 2._dp*AmpVertexSvReToFvChi  
Else 
 AmpSumSvReToFvChi = AmpTreeSvReToFvChi + AmpWaveSvReToFvChi + AmpVertexSvReToFvChi
 AmpSum2SvReToFvChi = AmpTreeSvReToFvChi + AmpWaveSvReToFvChi + AmpVertexSvReToFvChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToFvChi = AmpTreeSvReToFvChi
 AmpSum2SvReToFvChi = AmpTreeSvReToFvChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,7
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MFv(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReToFvChi = AmpTreeSvReToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToFvChi(gt1, gt2, gt3) 
  AmpSum2SvReToFvChi = 2._dp*AmpWaveSvReToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToFvChi(gt1, gt2, gt3) 
  AmpSum2SvReToFvChi = 2._dp*AmpVertexSvReToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToFvChi(gt1, gt2, gt3) 
  AmpSum2SvReToFvChi = AmpTreeSvReToFvChi + 2._dp*AmpWaveSvReToFvChi + 2._dp*AmpVertexSvReToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToFvChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToFvChi = AmpTreeSvReToFvChi
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvReToFvChi(gt1, gt2, gt3) = AmpSqSvReToFvChi(gt1, gt2, gt3)  
  AmpSum2SvReToFvChi = + 2._dp*AmpWaveSvReToFvChi + 2._dp*AmpVertexSvReToFvChi
  Call SquareAmp_StoFF(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
  AmpSqSvReToFvChi(gt1, gt2, gt3) = AmpSqSvReToFvChi(gt1, gt2, gt3) + AmpSqTreeSvReToFvChi(gt1, gt2, gt3)  
Else  
  AmpSum2SvReToFvChi = AmpTreeSvReToFvChi
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvReToFvChi(gt1, gt2, gt3) = AmpSqSvReToFvChi(gt1, gt2, gt3)  
  AmpSum2SvReToFvChi = + 2._dp*AmpWaveSvReToFvChi + 2._dp*AmpVertexSvReToFvChi
  Call SquareAmp_StoFF(MSvRe(gt1),MFv(gt2),MChi(gt3),AmpSumSvReToFvChi(:,gt1, gt2, gt3),AmpSum2SvReToFvChi(:,gt1, gt2, gt3),AmpSqSvReToFvChi(gt1, gt2, gt3)) 
  AmpSqSvReToFvChi(gt1, gt2, gt3) = AmpSqSvReToFvChi(gt1, gt2, gt3) + AmpSqTreeSvReToFvChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReToFvChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvReToFvChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MFvOS(gt2),MChiOS(gt3),helfactor*AmpSqSvReToFvChi(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MFv(gt2),MChi(gt3),helfactor*AmpSqSvReToFvChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvReToFvChi(gt1, gt2, gt3) + MRGSvReToFvChi(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvReToFvChi(gt1, gt2, gt3) + MRGSvReToFvChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReToSvImhh(cplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,            & 
& MSvIm2,MSvRe2,AmpTreeSvReToSvImhh)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvImhh(ZcplhhSvImSvRe,Mhh,MSvIm,MSvRe,Mhh2,           & 
& MSvIm2,MSvRe2,AmpTreeSvReToSvImhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImhh(MLambda,em,gs,cplhhSvImSvRe,MhhOS,MSvImOS,         & 
& MSvReOS,MRPSvReToSvImhh,MRGSvReToSvImhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImhh(MLambda,em,gs,ZcplhhSvImSvRe,MhhOS,MSvImOS,        & 
& MSvReOS,MRPSvReToSvImhh,MRGSvReToSvImhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvImhh(MLambda,em,gs,cplhhSvImSvRe,Mhh,MSvIm,             & 
& MSvRe,MRPSvReToSvImhh,MRGSvReToSvImhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImhh(MLambda,em,gs,ZcplhhSvImSvRe,Mhh,MSvIm,            & 
& MSvRe,MRPSvReToSvImhh,MRGSvReToSvImhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvImhh(cplhhSvImSvRe,ctcplhhSvImSvRe,Mhh,             & 
& Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,AmpWaveSvReToSvImhh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexSvReToSvImhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrSvReToSvImhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvReToSvImhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvReToSvImhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvReToSvImhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvReToSvImhh)

 End if 
 End if 
AmpVertexSvReToSvImhh = AmpVertexSvReToSvImhh -  AmpVertexIRdrSvReToSvImhh! +  AmpVertexIRosSvReToSvImhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvImhh=0._dp 
AmpVertexZSvReToSvImhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImhh(gt2,:,:) = AmpWaveZSvReToSvImhh(gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvImhh(gt1,:,:) 
AmpVertexZSvReToSvImhh(gt2,:,:)= AmpVertexZSvReToSvImhh(gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvImhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReToSvImhh=AmpWaveZSvReToSvImhh 
AmpVertexSvReToSvImhh= AmpVertexZSvReToSvImhh
! Final State 1 
AmpWaveZSvReToSvImhh=0._dp 
AmpVertexZSvReToSvImhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImhh(:,gt2,:) = AmpWaveZSvReToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvReToSvImhh(:,gt1,:) 
AmpVertexZSvReToSvImhh(:,gt2,:)= AmpVertexZSvReToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvReToSvImhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvImhh=AmpWaveZSvReToSvImhh 
AmpVertexSvReToSvImhh= AmpVertexZSvReToSvImhh
! Final State 2 
AmpWaveZSvReToSvImhh=0._dp 
AmpVertexZSvReToSvImhh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvReToSvImhh(:,:,gt2) = AmpWaveZSvReToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvReToSvImhh(:,:,gt1) 
AmpVertexZSvReToSvImhh(:,:,gt2)= AmpVertexZSvReToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvReToSvImhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvImhh=AmpWaveZSvReToSvImhh 
AmpVertexSvReToSvImhh= AmpVertexZSvReToSvImhh
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvImhh = AmpVertexSvReToSvImhh  +  AmpVertexIRosSvReToSvImhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvIm hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvImhh = AmpTreeSvReToSvImhh 
 AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh + 2._dp*AmpWaveSvReToSvImhh + 2._dp*AmpVertexSvReToSvImhh  
Else 
 AmpSumSvReToSvImhh = AmpTreeSvReToSvImhh + AmpWaveSvReToSvImhh + AmpVertexSvReToSvImhh
 AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh + AmpWaveSvReToSvImhh + AmpVertexSvReToSvImhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvImhh = AmpTreeSvReToSvImhh
 AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImhh = 2._dp*AmpWaveSvReToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImhh = 2._dp*AmpVertexSvReToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh + 2._dp*AmpWaveSvReToSvImhh + 2._dp*AmpVertexSvReToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvImhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvImhh(gt1, gt2, gt3) = AmpSqSvReToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvReToSvImhh = + 2._dp*AmpWaveSvReToSvImhh + 2._dp*AmpVertexSvReToSvImhh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvReToSvImhh(gt1, gt2, gt3) = AmpSqSvReToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvReToSvImhh(gt1, gt2, gt3)  
Else  
  AmpSum2SvReToSvImhh = AmpTreeSvReToSvImhh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvImhh(gt1, gt2, gt3) = AmpSqSvReToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvReToSvImhh = + 2._dp*AmpWaveSvReToSvImhh + 2._dp*AmpVertexSvReToSvImhh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvReToSvImhh(gt1, gt2, gt3),AmpSum2SvReToSvImhh(gt1, gt2, gt3),AmpSqSvReToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvReToSvImhh(gt1, gt2, gt3) = AmpSqSvReToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvReToSvImhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReToSvImhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvImhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvImOS(gt2),MhhOS(gt3),helfactor*AmpSqSvReToSvImhh(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvIm(gt2),Mhh(gt3),helfactor*AmpSqSvReToSvImhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvImhh(gt1, gt2, gt3) + MRGSvReToSvImhh(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvImhh(gt1, gt2, gt3) + MRGSvReToSvImhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReToSvRehh(cplhhSvReSvRe,Mhh,MSvRe,Mhh2,MSvRe2,           & 
& AmpTreeSvReToSvRehh)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvRehh(ZcplhhSvReSvRe,Mhh,MSvRe,Mhh2,MSvRe2,          & 
& AmpTreeSvReToSvRehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvRehh(MLambda,em,gs,cplhhSvReSvRe,MhhOS,MSvReOS,         & 
& MRPSvReToSvRehh,MRGSvReToSvRehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvRehh(MLambda,em,gs,ZcplhhSvReSvRe,MhhOS,MSvReOS,        & 
& MRPSvReToSvRehh,MRGSvReToSvRehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvRehh(MLambda,em,gs,cplhhSvReSvRe,Mhh,MSvRe,             & 
& MRPSvReToSvRehh,MRGSvReToSvRehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvRehh(MLambda,em,gs,ZcplhhSvReSvRe,Mhh,MSvRe,            & 
& MRPSvReToSvRehh,MRGSvReToSvRehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvRehh(cplhhSvReSvRe,ctcplhhSvReSvRe,Mhh,             & 
& Mhh2,MSvRe,MSvRe2,Zfhh,ZfSvRe,AmpWaveSvReToSvRehh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexSvReToSvRehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRdrSvReToSvRehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvReSvReVZpVZp1,AmpVertexIRosSvReToSvRehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRosSvReToSvRehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& AmpVertexIRosSvReToSvRehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,AmpVertexIRosSvReToSvRehh)

 End if 
 End if 
AmpVertexSvReToSvRehh = AmpVertexSvReToSvRehh -  AmpVertexIRdrSvReToSvRehh! +  AmpVertexIRosSvReToSvRehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvRehh=0._dp 
AmpVertexZSvReToSvRehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvRehh(gt2,:,:) = AmpWaveZSvReToSvRehh(gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvRehh(gt1,:,:) 
AmpVertexZSvReToSvRehh(gt2,:,:)= AmpVertexZSvReToSvRehh(gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvRehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReToSvRehh=AmpWaveZSvReToSvRehh 
AmpVertexSvReToSvRehh= AmpVertexZSvReToSvRehh
! Final State 1 
AmpWaveZSvReToSvRehh=0._dp 
AmpVertexZSvReToSvRehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvRehh(:,gt2,:) = AmpWaveZSvReToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvRehh(:,gt1,:) 
AmpVertexZSvReToSvRehh(:,gt2,:)= AmpVertexZSvReToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvReToSvRehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvRehh=AmpWaveZSvReToSvRehh 
AmpVertexSvReToSvRehh= AmpVertexZSvReToSvRehh
! Final State 2 
AmpWaveZSvReToSvRehh=0._dp 
AmpVertexZSvReToSvRehh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSvReToSvRehh(:,:,gt2) = AmpWaveZSvReToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvReToSvRehh(:,:,gt1) 
AmpVertexZSvReToSvRehh(:,:,gt2)= AmpVertexZSvReToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvReToSvRehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvRehh=AmpWaveZSvReToSvRehh 
AmpVertexSvReToSvRehh= AmpVertexZSvReToSvRehh
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvRehh = AmpVertexSvReToSvRehh  +  AmpVertexIRosSvReToSvRehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvRe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvRehh = AmpTreeSvReToSvRehh 
 AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh + 2._dp*AmpWaveSvReToSvRehh + 2._dp*AmpVertexSvReToSvRehh  
Else 
 AmpSumSvReToSvRehh = AmpTreeSvReToSvRehh + AmpWaveSvReToSvRehh + AmpVertexSvReToSvRehh
 AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh + AmpWaveSvReToSvRehh + AmpVertexSvReToSvRehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvRehh = AmpTreeSvReToSvRehh
 AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvReToSvRehh = 2._dp*AmpWaveSvReToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvReToSvRehh = 2._dp*AmpVertexSvReToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh + 2._dp*AmpWaveSvReToSvRehh + 2._dp*AmpVertexSvReToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvRehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvRehh(gt1, gt2, gt3) = AmpSqSvReToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvReToSvRehh = + 2._dp*AmpWaveSvReToSvRehh + 2._dp*AmpVertexSvReToSvRehh
  Call SquareAmp_StoSS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvReToSvRehh(gt1, gt2, gt3) = AmpSqSvReToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvReToSvRehh(gt1, gt2, gt3)  
Else  
  AmpSum2SvReToSvRehh = AmpTreeSvReToSvRehh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvReToSvRehh(gt1, gt2, gt3) = AmpSqSvReToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvReToSvRehh = + 2._dp*AmpWaveSvReToSvRehh + 2._dp*AmpVertexSvReToSvRehh
  Call SquareAmp_StoSS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvReToSvRehh(gt1, gt2, gt3),AmpSum2SvReToSvRehh(gt1, gt2, gt3),AmpSqSvReToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvReToSvRehh(gt1, gt2, gt3) = AmpSqSvReToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvReToSvRehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReToSvRehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvRehh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvReOS(gt2),MhhOS(gt3),helfactor*AmpSqSvReToSvRehh(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvRe(gt2),Mhh(gt3),helfactor*AmpSqSvReToSvRehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvRehh(gt1, gt2, gt3) + MRGSvReToSvRehh(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvReToSvRehh(gt1, gt2, gt3) + MRGSvReToSvRehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReTocSeHpm(cplHpmSvRecSe,MHpm,MSe,MSvRe,MHpm2,            & 
& MSe2,MSvRe2,AmpTreeSvReTocSeHpm)

  Else 
Call Amplitude_Tree_BLSSM_SvReTocSeHpm(ZcplHpmSvRecSe,MHpm,MSe,MSvRe,MHpm2,           & 
& MSe2,MSvRe2,AmpTreeSvReTocSeHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReTocSeHpm(MLambda,em,gs,cplHpmSvRecSe,MHpmOS,MSeOS,          & 
& MSvReOS,MRPSvReTocSeHpm,MRGSvReTocSeHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReTocSeHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpmOS,               & 
& MSeOS,MSvReOS,MRPSvReTocSeHpm,MRGSvReTocSeHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReTocSeHpm(MLambda,em,gs,cplHpmSvRecSe,MHpm,MSe,              & 
& MSvRe,MRPSvReTocSeHpm,MRGSvReTocSeHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReTocSeHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpm,MSe,             & 
& MSvRe,MRPSvReTocSeHpm,MRGSvReTocSeHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReTocSeHpm(cplHpmSvRecSe,ctcplHpmSvRecSe,MHpm,            & 
& MHpm2,MSe,MSe2,MSvRe,MSvRe2,ZfHpm,ZfSe,ZfSvRe,AmpWaveSvReTocSeHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexSvReTocSeHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRdrSvReTocSeHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,             & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,ZcplHpmSvRecSe,       & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,           & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,             & 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReTocSeHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& ZcplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,      & 
& cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReTocSeHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,         & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,             & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,           & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,             & 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReTocSeHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,    & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,           & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,             & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReTocSeHpm)

 End if 
 End if 
AmpVertexSvReTocSeHpm = AmpVertexSvReTocSeHpm -  AmpVertexIRdrSvReTocSeHpm! +  AmpVertexIRosSvReTocSeHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReTocSeHpm=0._dp 
AmpVertexZSvReTocSeHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReTocSeHpm(gt2,:,:) = AmpWaveZSvReTocSeHpm(gt2,:,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReTocSeHpm(gt1,:,:) 
AmpVertexZSvReTocSeHpm(gt2,:,:)= AmpVertexZSvReTocSeHpm(gt2,:,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReTocSeHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvReTocSeHpm=AmpWaveZSvReTocSeHpm 
AmpVertexSvReTocSeHpm= AmpVertexZSvReTocSeHpm
! Final State 1 
AmpWaveZSvReTocSeHpm=0._dp 
AmpVertexZSvReTocSeHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReTocSeHpm(:,gt2,:) = AmpWaveZSvReTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSvReTocSeHpm(:,gt1,:) 
AmpVertexZSvReTocSeHpm(:,gt2,:)= AmpVertexZSvReTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexSvReTocSeHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReTocSeHpm=AmpWaveZSvReTocSeHpm 
AmpVertexSvReTocSeHpm= AmpVertexZSvReTocSeHpm
! Final State 2 
AmpWaveZSvReTocSeHpm=0._dp 
AmpVertexZSvReTocSeHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvReTocSeHpm(:,:,gt2) = AmpWaveZSvReTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSvReTocSeHpm(:,:,gt1) 
AmpVertexZSvReTocSeHpm(:,:,gt2)= AmpVertexZSvReTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSvReTocSeHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReTocSeHpm=AmpWaveZSvReTocSeHpm 
AmpVertexSvReTocSeHpm= AmpVertexZSvReTocSeHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSvReTocSeHpm = AmpVertexSvReTocSeHpm  +  AmpVertexIRosSvReTocSeHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->conj[Se] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReTocSeHpm = AmpTreeSvReTocSeHpm 
 AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm + 2._dp*AmpWaveSvReTocSeHpm + 2._dp*AmpVertexSvReTocSeHpm  
Else 
 AmpSumSvReTocSeHpm = AmpTreeSvReTocSeHpm + AmpWaveSvReTocSeHpm + AmpVertexSvReTocSeHpm
 AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm + AmpWaveSvReTocSeHpm + AmpVertexSvReTocSeHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReTocSeHpm = AmpTreeSvReTocSeHpm
 AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSe(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvReTocSeHpm = 2._dp*AmpWaveSvReTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvReTocSeHpm = 2._dp*AmpVertexSvReTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm + 2._dp*AmpWaveSvReTocSeHpm + 2._dp*AmpVertexSvReTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReTocSeHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvReTocSeHpm(gt1, gt2, gt3) = AmpSqSvReTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvReTocSeHpm = + 2._dp*AmpWaveSvReTocSeHpm + 2._dp*AmpVertexSvReTocSeHpm
  Call SquareAmp_StoSS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvReTocSeHpm(gt1, gt2, gt3) = AmpSqSvReTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvReTocSeHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SvReTocSeHpm = AmpTreeSvReTocSeHpm
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvReTocSeHpm(gt1, gt2, gt3) = AmpSqSvReTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvReTocSeHpm = + 2._dp*AmpWaveSvReTocSeHpm + 2._dp*AmpVertexSvReTocSeHpm
  Call SquareAmp_StoSS(MSvRe(gt1),MSe(gt2),MHpm(gt3),AmpSumSvReTocSeHpm(gt1, gt2, gt3),AmpSum2SvReTocSeHpm(gt1, gt2, gt3),AmpSqSvReTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvReTocSeHpm(gt1, gt2, gt3) = AmpSqSvReTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvReTocSeHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvReTocSeHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReTocSeHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvReOS(gt1),MSeOS(gt2),MHpmOS(gt3),helfactor*AmpSqSvReTocSeHpm(gt1, gt2, gt3))
Else 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvRe(gt1),MSe(gt2),MHpm(gt3),helfactor*AmpSqSvReTocSeHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvReTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvReTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvReTocSeHpm(gt1, gt2, gt3) + MRGSvReTocSeHpm(gt1, gt2, gt3)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvReTocSeHpm(gt1, gt2, gt3) + MRGSvReTocSeHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
Call Amplitude_Tree_BLSSM_SvReToSecVWm(cplSeSvRecVWm,MSe,MSvRe,MVWm,MSe2,             & 
& MSvRe2,MVWm2,AmpTreeSvReToSecVWm)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSecVWm(ZcplSeSvRecVWm,MSe,MSvRe,MVWm,MSe2,            & 
& MSvRe2,MVWm2,AmpTreeSvReToSecVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSecVWm(MLambda,em,gs,cplSeSvRecVWm,MSeOS,MSvReOS,         & 
& MVWmOS,MRPSvReToSecVWm,MRGSvReToSecVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSecVWm(MLambda,em,gs,ZcplSeSvRecVWm,MSeOS,MSvReOS,        & 
& MVWmOS,MRPSvReToSecVWm,MRGSvReToSecVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSecVWm(MLambda,em,gs,cplSeSvRecVWm,MSe,MSvRe,             & 
& MVWm,MRPSvReToSecVWm,MRGSvReToSecVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSecVWm(MLambda,em,gs,ZcplSeSvRecVWm,MSe,MSvRe,            & 
& MVWm,MRPSvReToSecVWm,MRGSvReToSecVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSecVWm(cplSeSvRecVWm,ctcplSeSvRecVWm,MSe,             & 
& MSe2,MSvRe,MSvRe2,MVWm,MVWm2,ZfSe,ZfSvRe,ZfVWm,AmpWaveSvReToSecVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplHpmSvRecSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvReSvRecVWmVWm1,AmpVertexSvReToSecVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplHpmSvRecSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvReSvRecVWmVWm1,AmpVertexIRdrSvReToSecVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplhhcVWmVWm,cplHpmSvRecSe,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcHpm,  & 
& cplSeSvImcVWm,GosZcplSeSvRecHpm,ZcplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,      & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,    & 
& cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,    & 
& cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,cplSvReSvRecVWmVWm1,               & 
& AmpVertexIRosSvReToSecVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplHpmSvRecSe,GZcplHpmcVWmVP,cplHpmcVWmVZ,    & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,GZcplSeSvRecHpm,ZcplSeSvRecVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvRecSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvReSvRecVWmVWm1,AmpVertexIRosSvReToSecVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplhhcVWmVWm,cplHpmSvRecSe,GcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,GcplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,          & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,    & 
& cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,    & 
& cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,cplSvReSvRecVWmVWm1,               & 
& AmpVertexIRosSvReToSecVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,        & 
& cplAhSvReSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplHpmSvRecSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvImcVWmVZp1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvRecVWmVZp1,cplSecSecVWmVWm1,& 
& cplSvReSvRecVWmVWm1,AmpVertexIRosSvReToSecVWm)

 End if 
 End if 
AmpVertexSvReToSecVWm = AmpVertexSvReToSecVWm -  AmpVertexIRdrSvReToSecVWm! +  AmpVertexIRosSvReToSecVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSecVWm=0._dp 
AmpVertexZSvReToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSecVWm(:,gt2,:) = AmpWaveZSvReToSecVWm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSecVWm(:,gt1,:) 
AmpVertexZSvReToSecVWm(:,gt2,:)= AmpVertexZSvReToSecVWm(:,gt2,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSecVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSecVWm=AmpWaveZSvReToSecVWm 
AmpVertexSvReToSecVWm= AmpVertexZSvReToSecVWm
! Final State 1 
AmpWaveZSvReToSecVWm=0._dp 
AmpVertexZSvReToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSecVWm(:,:,gt2) = AmpWaveZSvReToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSvReToSecVWm(:,:,gt1) 
AmpVertexZSvReToSecVWm(:,:,gt2)= AmpVertexZSvReToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSvReToSecVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSecVWm=AmpWaveZSvReToSecVWm 
AmpVertexSvReToSecVWm= AmpVertexZSvReToSecVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSecVWm = AmpVertexSvReToSecVWm  +  AmpVertexIRosSvReToSecVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->Se conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSecVWm = AmpTreeSvReToSecVWm 
 AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm + 2._dp*AmpWaveSvReToSecVWm + 2._dp*AmpVertexSvReToSecVWm  
Else 
 AmpSumSvReToSecVWm = AmpTreeSvReToSecVWm + AmpWaveSvReToSecVWm + AmpVertexSvReToSecVWm
 AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm + AmpWaveSvReToSecVWm + AmpVertexSvReToSecVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSecVWm = AmpTreeSvReToSecVWm
 AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSecVWm(gt1, gt2) 
  AmpSum2SvReToSecVWm = 2._dp*AmpWaveSvReToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSecVWm(gt1, gt2) 
  AmpSum2SvReToSecVWm = 2._dp*AmpVertexSvReToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSecVWm(gt1, gt2) 
  AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm + 2._dp*AmpWaveSvReToSecVWm + 2._dp*AmpVertexSvReToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSecVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
  AmpSqTreeSvReToSecVWm(gt1, gt2) = AmpSqSvReToSecVWm(gt1, gt2)  
  AmpSum2SvReToSecVWm = + 2._dp*AmpWaveSvReToSecVWm + 2._dp*AmpVertexSvReToSecVWm
  Call SquareAmp_StoSV(MSvReOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
  AmpSqSvReToSecVWm(gt1, gt2) = AmpSqSvReToSecVWm(gt1, gt2) + AmpSqTreeSvReToSecVWm(gt1, gt2)  
Else  
  AmpSum2SvReToSecVWm = AmpTreeSvReToSecVWm
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
  AmpSqTreeSvReToSecVWm(gt1, gt2) = AmpSqSvReToSecVWm(gt1, gt2)  
  AmpSum2SvReToSecVWm = + 2._dp*AmpWaveSvReToSecVWm + 2._dp*AmpVertexSvReToSecVWm
  Call SquareAmp_StoSV(MSvRe(gt1),MSe(gt2),MVWm,AmpSumSvReToSecVWm(:,gt1, gt2),AmpSum2SvReToSecVWm(:,gt1, gt2),AmpSqSvReToSecVWm(gt1, gt2)) 
  AmpSqSvReToSecVWm(gt1, gt2) = AmpSqSvReToSecVWm(gt1, gt2) + AmpSqTreeSvReToSecVWm(gt1, gt2)  
End if  
Else  
  AmpSqSvReToSecVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSecVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvReOS(gt1),MSeOS(gt2),MVWmOS,helfactor*AmpSqSvReToSecVWm(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 2._dp*GammaTPS(MSvRe(gt1),MSe(gt2),MVWm,helfactor*AmpSqSvReToSecVWm(gt1, gt2))
End if 
If ((Abs(MRPSvReToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPSvReToSecVWm(gt1, gt2) + MRGSvReToSecVWm(gt1, gt2)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPSvReToSecVWm(gt1, gt2) + MRGSvReToSecVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
! SvIm VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvReToSvImVZ(cplSvImSvReVZ,MSvIm,MSvRe,MVZ,MSvIm2,          & 
& MSvRe2,MVZ2,AmpTreeSvReToSvImVZ)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvImVZ(ZcplSvImSvReVZ,MSvIm,MSvRe,MVZ,MSvIm2,         & 
& MSvRe2,MVZ2,AmpTreeSvReToSvImVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZ(MLambda,em,gs,cplSvImSvReVZ,MSvImOS,               & 
& MSvReOS,MVZOS,MRPSvReToSvImVZ,MRGSvReToSvImVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvImOS,              & 
& MSvReOS,MVZOS,MRPSvReToSvImVZ,MRGSvReToSvImVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvImVZ(MLambda,em,gs,cplSvImSvReVZ,MSvIm,MSvRe,           & 
& MVZ,MRPSvReToSvImVZ,MRGSvReToSvImVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvIm,MSvRe,          & 
& MVZ,MRPSvReToSvImVZ,MRGSvReToSvImVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvImVZ(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveSvReToSvImVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexSvReToSvImVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRdrSvReToSvImVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvReToSvImVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvReToSvImVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
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
& cplSvRecSeVWmVZ1,AmpVertexIRosSvReToSvImVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvReSvReVZVZ1,cplSvReSvReVZVZp1,cplSvRecSeVWmVZ1,AmpVertexIRosSvReToSvImVZ)

 End if 
 End if 
AmpVertexSvReToSvImVZ = AmpVertexSvReToSvImVZ -  AmpVertexIRdrSvReToSvImVZ! +  AmpVertexIRosSvReToSvImVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvImVZ=0._dp 
AmpVertexZSvReToSvImVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImVZ(:,gt2,:) = AmpWaveZSvReToSvImVZ(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvImVZ(:,gt1,:) 
AmpVertexZSvReToSvImVZ(:,gt2,:)= AmpVertexZSvReToSvImVZ(:,gt2,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvImVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvImVZ=AmpWaveZSvReToSvImVZ 
AmpVertexSvReToSvImVZ= AmpVertexZSvReToSvImVZ
! Final State 1 
AmpWaveZSvReToSvImVZ=0._dp 
AmpVertexZSvReToSvImVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImVZ(:,:,gt2) = AmpWaveZSvReToSvImVZ(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveSvReToSvImVZ(:,:,gt1) 
AmpVertexZSvReToSvImVZ(:,:,gt2)= AmpVertexZSvReToSvImVZ(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexSvReToSvImVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvImVZ=AmpWaveZSvReToSvImVZ 
AmpVertexSvReToSvImVZ= AmpVertexZSvReToSvImVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvImVZ = AmpVertexSvReToSvImVZ  +  AmpVertexIRosSvReToSvImVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvIm VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvImVZ = AmpTreeSvReToSvImVZ 
 AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ + 2._dp*AmpWaveSvReToSvImVZ + 2._dp*AmpVertexSvReToSvImVZ  
Else 
 AmpSumSvReToSvImVZ = AmpTreeSvReToSvImVZ + AmpWaveSvReToSvImVZ + AmpVertexSvReToSvImVZ
 AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ + AmpWaveSvReToSvImVZ + AmpVertexSvReToSvImVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvImVZ = AmpTreeSvReToSvImVZ
 AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvImVZ(gt1, gt2) 
  AmpSum2SvReToSvImVZ = 2._dp*AmpWaveSvReToSvImVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvImVZ(gt1, gt2) 
  AmpSum2SvReToSvImVZ = 2._dp*AmpVertexSvReToSvImVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvImVZ(gt1, gt2) 
  AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ + 2._dp*AmpWaveSvReToSvImVZ + 2._dp*AmpVertexSvReToSvImVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvImVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
  AmpSqTreeSvReToSvImVZ(gt1, gt2) = AmpSqSvReToSvImVZ(gt1, gt2)  
  AmpSum2SvReToSvImVZ = + 2._dp*AmpWaveSvReToSvImVZ + 2._dp*AmpVertexSvReToSvImVZ
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
  AmpSqSvReToSvImVZ(gt1, gt2) = AmpSqSvReToSvImVZ(gt1, gt2) + AmpSqTreeSvReToSvImVZ(gt1, gt2)  
Else  
  AmpSum2SvReToSvImVZ = AmpTreeSvReToSvImVZ
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
  AmpSqTreeSvReToSvImVZ(gt1, gt2) = AmpSqSvReToSvImVZ(gt1, gt2)  
  AmpSum2SvReToSvImVZ = + 2._dp*AmpWaveSvReToSvImVZ + 2._dp*AmpVertexSvReToSvImVZ
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZ,AmpSumSvReToSvImVZ(:,gt1, gt2),AmpSum2SvReToSvImVZ(:,gt1, gt2),AmpSqSvReToSvImVZ(gt1, gt2)) 
  AmpSqSvReToSvImVZ(gt1, gt2) = AmpSqSvReToSvImVZ(gt1, gt2) + AmpSqTreeSvReToSvImVZ(gt1, gt2)  
End if  
Else  
  AmpSqSvReToSvImVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvImVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvImOS(gt2),MVZOS,helfactor*AmpSqSvReToSvImVZ(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvIm(gt2),MVZ,helfactor*AmpSqSvReToSvImVZ(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvImVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvImVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvReToSvImVZ(gt1, gt2) + MRGSvReToSvImVZ(gt1, gt2)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvReToSvImVZ(gt1, gt2) + MRGSvReToSvImVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
! SvIm VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SvReToSvImVZp(cplSvImSvReVZp,MSvIm,MSvRe,MVZp,              & 
& MSvIm2,MSvRe2,MVZp2,AmpTreeSvReToSvImVZp)

  Else 
Call Amplitude_Tree_BLSSM_SvReToSvImVZp(ZcplSvImSvReVZp,MSvIm,MSvRe,MVZp,             & 
& MSvIm2,MSvRe2,MVZp2,AmpTreeSvReToSvImVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZp(MLambda,em,gs,cplSvImSvReVZp,MSvImOS,             & 
& MSvReOS,MVZpOS,MRPSvReToSvImVZp,MRGSvReToSvImVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZp(MLambda,em,gs,ZcplSvImSvReVZp,MSvImOS,            & 
& MSvReOS,MVZpOS,MRPSvReToSvImVZp,MRGSvReToSvImVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SvReToSvImVZp(MLambda,em,gs,cplSvImSvReVZp,MSvIm,               & 
& MSvRe,MVZp,MRPSvReToSvImVZp,MRGSvReToSvImVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SvReToSvImVZp(MLambda,em,gs,ZcplSvImSvReVZp,MSvIm,              & 
& MSvRe,MVZp,MRPSvReToSvImVZp,MRGSvReToSvImVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvImVZp(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,   & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,MVZp,MVZp2,ZfSvIm,ZfSvRe,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveSvReToSvImVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvImVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
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
& cplSvRecSeVWmVZp1,AmpVertexSvReToSvImVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSvRecSeVWmVZp1,AmpVertexIRdrSvReToSvImVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReToSvImVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSvRecSeVWmVZp1,AmpVertexIRosSvReToSvImVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
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
& cplSvReSvReVZVZp1,cplSvReSvReVZpVZp1,cplSvRecSeVWmVZp1,AmpVertexIRosSvReToSvImVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SvReToSvImVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSvRecSeVWmVZp1,AmpVertexIRosSvReToSvImVZp)

 End if 
 End if 
AmpVertexSvReToSvImVZp = AmpVertexSvReToSvImVZp -  AmpVertexIRdrSvReToSvImVZp! +  AmpVertexIRosSvReToSvImVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvReToSvImVZp=0._dp 
AmpVertexZSvReToSvImVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImVZp(:,gt2,:) = AmpWaveZSvReToSvImVZp(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvReToSvImVZp(:,gt1,:) 
AmpVertexZSvReToSvImVZp(:,gt2,:)= AmpVertexZSvReToSvImVZp(:,gt2,:) + ZRUZVR(gt2,gt1)*AmpVertexSvReToSvImVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvReToSvImVZp=AmpWaveZSvReToSvImVZp 
AmpVertexSvReToSvImVZp= AmpVertexZSvReToSvImVZp
! Final State 1 
AmpWaveZSvReToSvImVZp=0._dp 
AmpVertexZSvReToSvImVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvReToSvImVZp(:,:,gt2) = AmpWaveZSvReToSvImVZp(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveSvReToSvImVZp(:,:,gt1) 
AmpVertexZSvReToSvImVZp(:,:,gt2)= AmpVertexZSvReToSvImVZp(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexSvReToSvImVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvReToSvImVZp=AmpWaveZSvReToSvImVZp 
AmpVertexSvReToSvImVZp= AmpVertexZSvReToSvImVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSvReToSvImVZp = AmpVertexSvReToSvImVZp  +  AmpVertexIRosSvReToSvImVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvIm VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvReToSvImVZp = AmpTreeSvReToSvImVZp 
 AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp + 2._dp*AmpWaveSvReToSvImVZp + 2._dp*AmpVertexSvReToSvImVZp  
Else 
 AmpSumSvReToSvImVZp = AmpTreeSvReToSvImVZp + AmpWaveSvReToSvImVZp + AmpVertexSvReToSvImVZp
 AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp + AmpWaveSvReToSvImVZp + AmpVertexSvReToSvImVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvImVZp = AmpTreeSvReToSvImVZp
 AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvReToSvImVZp(gt1, gt2) 
  AmpSum2SvReToSvImVZp = 2._dp*AmpWaveSvReToSvImVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvReToSvImVZp(gt1, gt2) 
  AmpSum2SvReToSvImVZp = 2._dp*AmpVertexSvReToSvImVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvReToSvImVZp(gt1, gt2) 
  AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp + 2._dp*AmpWaveSvReToSvImVZp + 2._dp*AmpVertexSvReToSvImVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvReToSvImVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
  AmpSqTreeSvReToSvImVZp(gt1, gt2) = AmpSqSvReToSvImVZp(gt1, gt2)  
  AmpSum2SvReToSvImVZp = + 2._dp*AmpWaveSvReToSvImVZp + 2._dp*AmpVertexSvReToSvImVZp
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
  AmpSqSvReToSvImVZp(gt1, gt2) = AmpSqSvReToSvImVZp(gt1, gt2) + AmpSqTreeSvReToSvImVZp(gt1, gt2)  
Else  
  AmpSum2SvReToSvImVZp = AmpTreeSvReToSvImVZp
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
  AmpSqTreeSvReToSvImVZp(gt1, gt2) = AmpSqSvReToSvImVZp(gt1, gt2)  
  AmpSum2SvReToSvImVZp = + 2._dp*AmpWaveSvReToSvImVZp + 2._dp*AmpVertexSvReToSvImVZp
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVZp,AmpSumSvReToSvImVZp(:,gt1, gt2),AmpSum2SvReToSvImVZp(:,gt1, gt2),AmpSqSvReToSvImVZp(gt1, gt2)) 
  AmpSqSvReToSvImVZp(gt1, gt2) = AmpSqSvReToSvImVZp(gt1, gt2) + AmpSqTreeSvReToSvImVZp(gt1, gt2)  
End if  
Else  
  AmpSqSvReToSvImVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvImVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvImOS(gt2),MVZpOS,helfactor*AmpSqSvReToSvImVZp(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvIm(gt2),MVZp,helfactor*AmpSqSvReToSvImVZp(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvImVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvReToSvImVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvReToSvImVZp(gt1, gt2) + MRGSvReToSvImVZp(gt1, gt2)) 
  gP1LSvRe(gt1,i4) = gP1LSvRe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvReToSvImVZp(gt1, gt2) + MRGSvReToSvImVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvRe(gt1,i4) 
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
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_SvReToSvImVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvImOS,MSvIm2OS,MSvReOS,             & 
& MSvRe2OS,MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvReToSvImVP)

 Else 
Call Amplitude_WAVE_BLSSM_SvReToSvImVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvImOS,MSvIm2OS,MSvReOS,             & 
& MSvRe2OS,MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvReToSvImVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvReToSvImVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
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
& AmpVertexSvReToSvImVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SvReToSvImVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
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
& AmpVertexSvReToSvImVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SvReToSvImVP(cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& ctcplSvImSvReVP,ctcplSvImSvReVZ,ctcplSvImSvReVZp,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& MVP,MVP2,ZfSvIm,ZfSvRe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvReToSvImVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvImVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvReSvReVPVZp1,cplSvRecSeVPVWm1,AmpVertexSvReToSvImVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvIm VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvImVP = 0._dp 
 AmpSum2SvReToSvImVP = 0._dp  
Else 
 AmpSumSvReToSvImVP = AmpVertexSvReToSvImVP + AmpWaveSvReToSvImVP
 AmpSum2SvReToSvImVP = AmpVertexSvReToSvImVP + AmpWaveSvReToSvImVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvImOS(gt2),0._dp,AmpSumSvReToSvImVP(:,gt1, gt2),AmpSum2SvReToSvImVP(:,gt1, gt2),AmpSqSvReToSvImVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvIm(gt2),MVP,AmpSumSvReToSvImVP(:,gt1, gt2),AmpSum2SvReToSvImVP(:,gt1, gt2),AmpSqSvReToSvImVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvReToSvImVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvImVP(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvImOS(gt2),0._dp,helfactor*AmpSqSvReToSvImVP(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvIm(gt2),MVP,helfactor*AmpSqSvReToSvImVP(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvImVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvImVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
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


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,    & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,           & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvRecSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImSvReVP,cplSvImSvReVZ,       & 
& cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvRecVWmVP1,               & 
& cplSvRecSeVPVWm1,AmpVertexSvReToSvReVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVP,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,    & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,           & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvRecSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImSvReVP,cplSvImSvReVZ,       & 
& cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvRecVWmVP1,               & 
& cplSvRecSeVPVWm1,AmpVertexSvReToSvReVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplFvFvVPL,cplFvFvVPR,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplHpmSvRecSe,  & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvRecVWmVP1, & 
& cplSvRecSeVPVWm1,AmpVertexSvReToSvReVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvRe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvReVP = 0._dp 
 AmpSum2SvReToSvReVP = 0._dp  
Else 
 AmpSumSvReToSvReVP = AmpVertexSvReToSvReVP + AmpWaveSvReToSvReVP
 AmpSum2SvReToSvReVP = AmpVertexSvReToSvReVP + AmpWaveSvReToSvReVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvReOS(gt2),0._dp,AmpSumSvReToSvReVP(:,gt1, gt2),AmpSum2SvReToSvReVP(:,gt1, gt2),AmpSqSvReToSvReVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvRe(gt2),MVP,AmpSumSvReToSvReVP(:,gt1, gt2),AmpSum2SvReToSvReVP(:,gt1, gt2),AmpSqSvReToSvReVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvReToSvReVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvReVP(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvReOS(gt2),0._dp,helfactor*AmpSqSvReToSvReVP(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvRe(gt2),MVP,helfactor*AmpSqSvReToSvReVP(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvReVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvReVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! SvRe VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvRecSe,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvRecVWmVZ1, & 
& cplSvRecSeVWmVZ1,AmpVertexSvReToSvReVZ)

 Else 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvRecSe,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVP,        & 
& cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvRecVWmVZ1, & 
& cplSvRecSeVWmVZ1,AmpVertexSvReToSvReVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,        & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,    & 
& cplSeSvRecVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexSvReToSvReVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvRe VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvReVZ = 0._dp 
 AmpSum2SvReToSvReVZ = 0._dp  
Else 
 AmpSumSvReToSvReVZ = AmpVertexSvReToSvReVZ + AmpWaveSvReToSvReVZ
 AmpSum2SvReToSvReVZ = AmpVertexSvReToSvReVZ + AmpWaveSvReToSvReVZ 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvReToSvReVZ(:,gt1, gt2),AmpSum2SvReToSvReVZ(:,gt1, gt2),AmpSqSvReToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvRe(gt2),MVZ,AmpSumSvReToSvReVZ(:,gt1, gt2),AmpSum2SvReToSvReVZ(:,gt1, gt2),AmpSqSvReToSvReVZ(gt1, gt2)) 
End if  
Else  
  AmpSqSvReToSvReVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvReVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvReOS(gt2),MVZOS,helfactor*AmpSqSvReToSvReVZ(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvRe(gt2),MVZ,helfactor*AmpSqSvReToSvReVZ(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvReVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvReVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! SvRe VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,             & 
& cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,     & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,  & 
& cplSeSvRecVWmVZp1,cplSvRecSeVWmVZp1,AmpVertexSvReToSvReVZp)

 Else 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,             & 
& cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,     & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,  & 
& cplSeSvRecVWmVZp1,cplSvRecSeVWmVZp1,AmpVertexSvReToSvReVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SvReToSvReVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,             & 
& cplChiChiVZpR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,           & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvRecVWmVZp1,cplSvRecSeVWmVZp1,         & 
& AmpVertexSvReToSvReVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvRe->SvRe VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvReToSvReVZp = 0._dp 
 AmpSum2SvReToSvReVZp = 0._dp  
Else 
 AmpSumSvReToSvReVZp = AmpVertexSvReToSvReVZp + AmpWaveSvReToSvReVZp
 AmpSum2SvReToSvReVZp = AmpVertexSvReToSvReVZp + AmpWaveSvReToSvReVZp 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvReOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSvRe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvReOS(gt1),MSvReOS(gt2),MVZpOS,AmpSumSvReToSvReVZp(:,gt1, gt2),AmpSum2SvReToSvReVZp(:,gt1, gt2),AmpSqSvReToSvReVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvRe(gt1),MSvRe(gt2),MVZp,AmpSumSvReToSvReVZp(:,gt1, gt2),AmpSum2SvReToSvReVZp(:,gt1, gt2),AmpSqSvReToSvReVZp(gt1, gt2)) 
End if  
Else  
  AmpSqSvReToSvReVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvReToSvReVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSvRe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvReOS(gt1),MSvReOS(gt2),MVZpOS,helfactor*AmpSqSvReToSvReVZp(gt1, gt2))
Else 
  gP1LSvRe(gt1,i4) = 1._dp*GammaTPS(MSvRe(gt1),MSvRe(gt2),MVZp,helfactor*AmpSqSvReToSvReVZp(gt1, gt2))
End if 
If ((Abs(MRPSvReToSvReVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvReToSvReVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvRe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_SvRe

End Module Wrapper_OneLoopDecay_SvRe_BLSSM
