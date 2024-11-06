! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:13 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Se_BLSSM
Use Model_Data_BLSSM 
Use Kinematics 
Use OneLoopDecay_Se_BLSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Se(MSdOS,MSd2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MSvImOS,            & 
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

Complex(dp),Intent(in) :: cplAhAhhh(4,4,4),cplAhAhSecSe1(4,4,6,6),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),             & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhHpmSvImcSe1(4,2,6,6),& 
& cplAhHpmSvRecSe1(4,2,6,6),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSeSvImcHpm1(4,6,6,2),& 
& cplAhSeSvRecHpm1(4,6,6,2),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6), & 
& cplAhSvReSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),   & 
& cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),         & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,7,2),      & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFeSvImL(2,3,6),   & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFeFeAhL(3,3,4),      & 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVPL(3,3),             & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),   & 
& cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),       & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),          & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,            & 
& cplcVWmVWmVZp,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),             & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplhhcHpmVWm(4,2),   & 
& cplhhcVWmVWm(4),cplhhhhhh(4,4,4),cplhhhhSecSe1(4,4,6,6),cplhhHpmcHpm(4,2,2),           & 
& cplhhHpmcVWm(4,2),cplhhHpmSvImcSe1(4,2,6,6),cplhhHpmSvRecSe1(4,2,6,6),cplhhSdcSd(4,6,6),& 
& cplhhSecSe(4,6,6),cplhhSeSvImcHpm1(4,6,6,2),cplhhSeSvRecHpm1(4,6,6,2),cplhhSucSu(4,6,6),& 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),           & 
& cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVP(2,2),             & 
& cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2), & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),& 
& cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvRecSe(2,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),        & 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSvImcSecSuaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),        & 
& cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),           & 
& cplSecSeVPVZp1(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZpVZp1(6,6),             & 
& cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),& 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6)

Complex(dp),Intent(in) :: cplSeSvImcVWmVZp1(6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),          & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSeSvRecVWmVP1(6,6),cplSeSvRecVWmVZ1(6,6),   & 
& cplSeSvRecVWmVZp1(6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSvImcSeVPVWm1(6,6),               & 
& cplSvImcSeVWm(6,6),cplSvImcSeVWmVZ1(6,6),cplSvImcSeVWmVZp1(6,6),cplSvImSvImcVWmVWm1(6,6),& 
& cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),cplSvRecSeVPVWm1(6,6),       & 
& cplSvRecSeVWm(6,6),cplSvRecSeVWmVZ1(6,6),cplSvRecSeVWmVZp1(6,6),cplSvReSvRecVWmVWm1(6,6),& 
& ctcplAhSecSe(4,6,6),ctcplChiFecSeL(7,3,6),ctcplChiFecSeR(7,3,6),ctcplFvChacSeL(6,2,6), & 
& ctcplFvChacSeR(6,2,6),ctcplhhSecSe(4,6,6),ctcplHpmSvImcSe(2,6,6),ctcplHpmSvRecSe(2,6,6),& 
& ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6),ctcplSvImcSeVWm(6,6),           & 
& ctcplSvRecSeVWm(6,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GcplHpmSvImcSe(2,6,6),          & 
& GcplHpmSvRecSe(2,6,6),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplHpmSvImcSe(2,6,6),& 
& GosZcplHpmSvRecSe(2,6,6),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplHpmSvImcSe(2,6,6),   & 
& GZcplHpmSvRecSe(2,6,6),ZcplAhSecSe(4,6,6),ZcplChiFecSeL(7,3,6),ZcplChiFecSeR(7,3,6),   & 
& ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),ZcplhhSecSe(4,6,6),ZcplHpmSvImcSe(2,6,6),    & 
& ZcplHpmSvRecSe(2,6,6),ZcplSecSeVZ(6,6),ZcplSecSeVZp(6,6),ZcplSvImcSeVWm(6,6),          & 
& ZcplSvRecSeVWm(6,6)

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
Real(dp), Intent(out) :: gP1LSe(6,111) 
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
Real(dp) :: MRPSeToSeAh(6,6,4),MRGSeToSeAh(6,6,4), MRPZSeToSeAh(6,6,4),MRGZSeToSeAh(6,6,4) 
Real(dp) :: MVPSeToSeAh(6,6,4) 
Real(dp) :: RMsqTreeSeToSeAh(6,6,4),RMsqWaveSeToSeAh(6,6,4),RMsqVertexSeToSeAh(6,6,4) 
Complex(dp) :: AmpTreeSeToSeAh(6,6,4),AmpWaveSeToSeAh(6,6,4)=(0._dp,0._dp),AmpVertexSeToSeAh(6,6,4)& 
 & ,AmpVertexIRosSeToSeAh(6,6,4),AmpVertexIRdrSeToSeAh(6,6,4), AmpSumSeToSeAh(6,6,4), AmpSum2SeToSeAh(6,6,4) 
Complex(dp) :: AmpTreeZSeToSeAh(6,6,4),AmpWaveZSeToSeAh(6,6,4),AmpVertexZSeToSeAh(6,6,4) 
Real(dp) :: AmpSqSeToSeAh(6,6,4),  AmpSqTreeSeToSeAh(6,6,4) 
Real(dp) :: MRPSeToFvCha(6,6,2),MRGSeToFvCha(6,6,2), MRPZSeToFvCha(6,6,2),MRGZSeToFvCha(6,6,2) 
Real(dp) :: MVPSeToFvCha(6,6,2) 
Real(dp) :: RMsqTreeSeToFvCha(6,6,2),RMsqWaveSeToFvCha(6,6,2),RMsqVertexSeToFvCha(6,6,2) 
Complex(dp) :: AmpTreeSeToFvCha(2,6,6,2),AmpWaveSeToFvCha(2,6,6,2)=(0._dp,0._dp),AmpVertexSeToFvCha(2,6,6,2)& 
 & ,AmpVertexIRosSeToFvCha(2,6,6,2),AmpVertexIRdrSeToFvCha(2,6,6,2), AmpSumSeToFvCha(2,6,6,2), AmpSum2SeToFvCha(2,6,6,2) 
Complex(dp) :: AmpTreeZSeToFvCha(2,6,6,2),AmpWaveZSeToFvCha(2,6,6,2),AmpVertexZSeToFvCha(2,6,6,2) 
Real(dp) :: AmpSqSeToFvCha(6,6,2),  AmpSqTreeSeToFvCha(6,6,2) 
Real(dp) :: MRPSeToFeChi(6,3,7),MRGSeToFeChi(6,3,7), MRPZSeToFeChi(6,3,7),MRGZSeToFeChi(6,3,7) 
Real(dp) :: MVPSeToFeChi(6,3,7) 
Real(dp) :: RMsqTreeSeToFeChi(6,3,7),RMsqWaveSeToFeChi(6,3,7),RMsqVertexSeToFeChi(6,3,7) 
Complex(dp) :: AmpTreeSeToFeChi(2,6,3,7),AmpWaveSeToFeChi(2,6,3,7)=(0._dp,0._dp),AmpVertexSeToFeChi(2,6,3,7)& 
 & ,AmpVertexIRosSeToFeChi(2,6,3,7),AmpVertexIRdrSeToFeChi(2,6,3,7), AmpSumSeToFeChi(2,6,3,7), AmpSum2SeToFeChi(2,6,3,7) 
Complex(dp) :: AmpTreeZSeToFeChi(2,6,3,7),AmpWaveZSeToFeChi(2,6,3,7),AmpVertexZSeToFeChi(2,6,3,7) 
Real(dp) :: AmpSqSeToFeChi(6,3,7),  AmpSqTreeSeToFeChi(6,3,7) 
Real(dp) :: MRPSeToSehh(6,6,4),MRGSeToSehh(6,6,4), MRPZSeToSehh(6,6,4),MRGZSeToSehh(6,6,4) 
Real(dp) :: MVPSeToSehh(6,6,4) 
Real(dp) :: RMsqTreeSeToSehh(6,6,4),RMsqWaveSeToSehh(6,6,4),RMsqVertexSeToSehh(6,6,4) 
Complex(dp) :: AmpTreeSeToSehh(6,6,4),AmpWaveSeToSehh(6,6,4)=(0._dp,0._dp),AmpVertexSeToSehh(6,6,4)& 
 & ,AmpVertexIRosSeToSehh(6,6,4),AmpVertexIRdrSeToSehh(6,6,4), AmpSumSeToSehh(6,6,4), AmpSum2SeToSehh(6,6,4) 
Complex(dp) :: AmpTreeZSeToSehh(6,6,4),AmpWaveZSeToSehh(6,6,4),AmpVertexZSeToSehh(6,6,4) 
Real(dp) :: AmpSqSeToSehh(6,6,4),  AmpSqTreeSeToSehh(6,6,4) 
Real(dp) :: MRPSeToSvImHpm(6,6,2),MRGSeToSvImHpm(6,6,2), MRPZSeToSvImHpm(6,6,2),MRGZSeToSvImHpm(6,6,2) 
Real(dp) :: MVPSeToSvImHpm(6,6,2) 
Real(dp) :: RMsqTreeSeToSvImHpm(6,6,2),RMsqWaveSeToSvImHpm(6,6,2),RMsqVertexSeToSvImHpm(6,6,2) 
Complex(dp) :: AmpTreeSeToSvImHpm(6,6,2),AmpWaveSeToSvImHpm(6,6,2)=(0._dp,0._dp),AmpVertexSeToSvImHpm(6,6,2)& 
 & ,AmpVertexIRosSeToSvImHpm(6,6,2),AmpVertexIRdrSeToSvImHpm(6,6,2), AmpSumSeToSvImHpm(6,6,2), AmpSum2SeToSvImHpm(6,6,2) 
Complex(dp) :: AmpTreeZSeToSvImHpm(6,6,2),AmpWaveZSeToSvImHpm(6,6,2),AmpVertexZSeToSvImHpm(6,6,2) 
Real(dp) :: AmpSqSeToSvImHpm(6,6,2),  AmpSqTreeSeToSvImHpm(6,6,2) 
Real(dp) :: MRPSeToSvReHpm(6,6,2),MRGSeToSvReHpm(6,6,2), MRPZSeToSvReHpm(6,6,2),MRGZSeToSvReHpm(6,6,2) 
Real(dp) :: MVPSeToSvReHpm(6,6,2) 
Real(dp) :: RMsqTreeSeToSvReHpm(6,6,2),RMsqWaveSeToSvReHpm(6,6,2),RMsqVertexSeToSvReHpm(6,6,2) 
Complex(dp) :: AmpTreeSeToSvReHpm(6,6,2),AmpWaveSeToSvReHpm(6,6,2)=(0._dp,0._dp),AmpVertexSeToSvReHpm(6,6,2)& 
 & ,AmpVertexIRosSeToSvReHpm(6,6,2),AmpVertexIRdrSeToSvReHpm(6,6,2), AmpSumSeToSvReHpm(6,6,2), AmpSum2SeToSvReHpm(6,6,2) 
Complex(dp) :: AmpTreeZSeToSvReHpm(6,6,2),AmpWaveZSeToSvReHpm(6,6,2),AmpVertexZSeToSvReHpm(6,6,2) 
Real(dp) :: AmpSqSeToSvReHpm(6,6,2),  AmpSqTreeSeToSvReHpm(6,6,2) 
Real(dp) :: MRPSeToSeVZ(6,6),MRGSeToSeVZ(6,6), MRPZSeToSeVZ(6,6),MRGZSeToSeVZ(6,6) 
Real(dp) :: MVPSeToSeVZ(6,6) 
Real(dp) :: RMsqTreeSeToSeVZ(6,6),RMsqWaveSeToSeVZ(6,6),RMsqVertexSeToSeVZ(6,6) 
Complex(dp) :: AmpTreeSeToSeVZ(2,6,6),AmpWaveSeToSeVZ(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVZ(2,6,6)& 
 & ,AmpVertexIRosSeToSeVZ(2,6,6),AmpVertexIRdrSeToSeVZ(2,6,6), AmpSumSeToSeVZ(2,6,6), AmpSum2SeToSeVZ(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVZ(2,6,6),AmpWaveZSeToSeVZ(2,6,6),AmpVertexZSeToSeVZ(2,6,6) 
Real(dp) :: AmpSqSeToSeVZ(6,6),  AmpSqTreeSeToSeVZ(6,6) 
Real(dp) :: MRPSeToSeVZp(6,6),MRGSeToSeVZp(6,6), MRPZSeToSeVZp(6,6),MRGZSeToSeVZp(6,6) 
Real(dp) :: MVPSeToSeVZp(6,6) 
Real(dp) :: RMsqTreeSeToSeVZp(6,6),RMsqWaveSeToSeVZp(6,6),RMsqVertexSeToSeVZp(6,6) 
Complex(dp) :: AmpTreeSeToSeVZp(2,6,6),AmpWaveSeToSeVZp(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVZp(2,6,6)& 
 & ,AmpVertexIRosSeToSeVZp(2,6,6),AmpVertexIRdrSeToSeVZp(2,6,6), AmpSumSeToSeVZp(2,6,6), AmpSum2SeToSeVZp(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVZp(2,6,6),AmpWaveZSeToSeVZp(2,6,6),AmpVertexZSeToSeVZp(2,6,6) 
Real(dp) :: AmpSqSeToSeVZp(6,6),  AmpSqTreeSeToSeVZp(6,6) 
Real(dp) :: MRPSeToSvImVWm(6,6),MRGSeToSvImVWm(6,6), MRPZSeToSvImVWm(6,6),MRGZSeToSvImVWm(6,6) 
Real(dp) :: MVPSeToSvImVWm(6,6) 
Real(dp) :: RMsqTreeSeToSvImVWm(6,6),RMsqWaveSeToSvImVWm(6,6),RMsqVertexSeToSvImVWm(6,6) 
Complex(dp) :: AmpTreeSeToSvImVWm(2,6,6),AmpWaveSeToSvImVWm(2,6,6)=(0._dp,0._dp),AmpVertexSeToSvImVWm(2,6,6)& 
 & ,AmpVertexIRosSeToSvImVWm(2,6,6),AmpVertexIRdrSeToSvImVWm(2,6,6), AmpSumSeToSvImVWm(2,6,6), AmpSum2SeToSvImVWm(2,6,6) 
Complex(dp) :: AmpTreeZSeToSvImVWm(2,6,6),AmpWaveZSeToSvImVWm(2,6,6),AmpVertexZSeToSvImVWm(2,6,6) 
Real(dp) :: AmpSqSeToSvImVWm(6,6),  AmpSqTreeSeToSvImVWm(6,6) 
Real(dp) :: MRPSeToSvReVWm(6,6),MRGSeToSvReVWm(6,6), MRPZSeToSvReVWm(6,6),MRGZSeToSvReVWm(6,6) 
Real(dp) :: MVPSeToSvReVWm(6,6) 
Real(dp) :: RMsqTreeSeToSvReVWm(6,6),RMsqWaveSeToSvReVWm(6,6),RMsqVertexSeToSvReVWm(6,6) 
Complex(dp) :: AmpTreeSeToSvReVWm(2,6,6),AmpWaveSeToSvReVWm(2,6,6)=(0._dp,0._dp),AmpVertexSeToSvReVWm(2,6,6)& 
 & ,AmpVertexIRosSeToSvReVWm(2,6,6),AmpVertexIRdrSeToSvReVWm(2,6,6), AmpSumSeToSvReVWm(2,6,6), AmpSum2SeToSvReVWm(2,6,6) 
Complex(dp) :: AmpTreeZSeToSvReVWm(2,6,6),AmpWaveZSeToSvReVWm(2,6,6),AmpVertexZSeToSvReVWm(2,6,6) 
Real(dp) :: AmpSqSeToSvReVWm(6,6),  AmpSqTreeSeToSvReVWm(6,6) 
Real(dp) :: MRPSeToSeVP(6,6),MRGSeToSeVP(6,6), MRPZSeToSeVP(6,6),MRGZSeToSeVP(6,6) 
Real(dp) :: MVPSeToSeVP(6,6) 
Real(dp) :: RMsqTreeSeToSeVP(6,6),RMsqWaveSeToSeVP(6,6),RMsqVertexSeToSeVP(6,6) 
Complex(dp) :: AmpTreeSeToSeVP(2,6,6),AmpWaveSeToSeVP(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVP(2,6,6)& 
 & ,AmpVertexIRosSeToSeVP(2,6,6),AmpVertexIRdrSeToSeVP(2,6,6), AmpSumSeToSeVP(2,6,6), AmpSum2SeToSeVP(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVP(2,6,6),AmpWaveZSeToSeVP(2,6,6),AmpVertexZSeToSeVP(2,6,6) 
Real(dp) :: AmpSqSeToSeVP(6,6),  AmpSqTreeSeToSeVP(6,6) 
Write(*,*) "Calculating one-loop decays of Se " 
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
! Se Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSeAh(cplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  Else 
Call Amplitude_Tree_BLSSM_SeToSeAh(ZcplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAhOS,MSeOS,MRPSeToSeAh,      & 
& MRGSeToSeAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAhOS,MSeOS,MRPSeToSeAh,     & 
& MRGSeToSeAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAh,MSe,MRPSeToSeAh,          & 
& MRGSeToSeAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAh,MSe,MRPSeToSeAh,         & 
& MRGSeToSeAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSeAh(cplAhSecSe,ctcplAhSecSe,MAh,MAh2,MSe,              & 
& MSe2,ZfAh,ZfSe,AmpWaveSeToSeAh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSd,              & 
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
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexSeToSeAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRdrSeToSeAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

 End if 
 End if 
AmpVertexSeToSeAh = AmpVertexSeToSeAh -  AmpVertexIRdrSeToSeAh! +  AmpVertexIRosSeToSeAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(gt2,:,:) = AmpWaveZSeToSeAh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeAh(gt1,:,:) 
AmpVertexZSeToSeAh(gt2,:,:)= AmpVertexZSeToSeAh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 1 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(:,gt2,:) = AmpWaveZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSeAh(:,gt1,:) 
AmpVertexZSeToSeAh(:,gt2,:)= AmpVertexZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSeAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 2 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSeToSeAh(:,:,gt2) = AmpWaveZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSeToSeAh(:,:,gt1) 
AmpVertexZSeToSeAh(:,:,gt2)= AmpVertexZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSeToSeAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeAh = AmpVertexSeToSeAh  +  AmpVertexIRosSeToSeAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh 
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh  
Else 
 AmpSumSeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,4
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpWaveSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSeAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MAh(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Fv Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToFvCha(cplFvChacSeL,cplFvChacSeR,MCha,MFv,               & 
& MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  Else 
Call Amplitude_Tree_BLSSM_SeToFvCha(ZcplFvChacSeL,ZcplFvChacSeR,MCha,MFv,             & 
& MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToFvCha(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,              & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToFvCha(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,            & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToFvCha(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,              & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToFvCha(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,            & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToFvCha(cplFvChacSeL,cplFvChacSeR,ctcplFvChacSeL,         & 
& ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFvm,ZfLm,ZfLp,ZfSe,AmpWaveSeToFvCha)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
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
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexSeToFvCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrSeToFvCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
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
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
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
& cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 End if 
AmpVertexSeToFvCha = AmpVertexSeToFvCha -  AmpVertexIRdrSeToFvCha! +  AmpVertexIRosSeToFvCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFvCha(:,gt2,:,:) = AmpWaveZSeToFvCha(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFvCha(:,gt1,:,:) 
AmpVertexZSeToFvCha(:,gt2,:,:)= AmpVertexZSeToFvCha(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFvCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 1 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFvCha(1,:,gt2,:) = AmpWaveZSeToFvCha(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveSeToFvCha(1,:,gt1,:) 
AmpVertexZSeToFvCha(1,:,gt2,:)= AmpVertexZSeToFvCha(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexSeToFvCha(1,:,gt1,:) 
AmpWaveZSeToFvCha(2,:,gt2,:) = AmpWaveZSeToFvCha(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveSeToFvCha(2,:,gt1,:) 
AmpVertexZSeToFvCha(2,:,gt2,:)= AmpVertexZSeToFvCha(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexSeToFvCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 2 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToFvCha(1,:,:,gt2) = AmpWaveZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSeToFvCha(1,:,:,gt1) 
AmpVertexZSeToFvCha(1,:,:,gt2)= AmpVertexZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSeToFvCha(1,:,:,gt1) 
AmpWaveZSeToFvCha(2,:,:,gt2) = AmpWaveZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSeToFvCha(2,:,:,gt1) 
AmpVertexZSeToFvCha(2,:,:,gt2)= AmpVertexZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSeToFvCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFvCha = AmpVertexSeToFvCha  +  AmpVertexIRosSeToFvCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fv Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha 
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha  
Else 
 AmpSumSeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MFv(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpWaveSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFvCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFvCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFvCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFv(gt2),MCha(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Fe Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,MChi,MFe,               & 
& MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  Else 
Call Amplitude_Tree_BLSSM_SeToFeChi(ZcplChiFecSeL,ZcplChiFecSeR,MChi,MFe,             & 
& MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,              & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,            & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,              & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,            & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,         & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveSeToFeChi)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexSeToFeChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrSeToFeChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,              & 
& cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,              & 
& cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 End if 
AmpVertexSeToFeChi = AmpVertexSeToFeChi -  AmpVertexIRdrSeToFeChi! +  AmpVertexIRosSeToFeChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFeChi(:,gt2,:,:) = AmpWaveZSeToFeChi(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFeChi(:,gt1,:,:) 
AmpVertexZSeToFeChi(:,gt2,:,:)= AmpVertexZSeToFeChi(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFeChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 1 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToFeChi(1,:,gt2,:) = AmpWaveZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveSeToFeChi(1,:,gt1,:) 
AmpVertexZSeToFeChi(1,:,gt2,:)= AmpVertexZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexSeToFeChi(1,:,gt1,:) 
AmpWaveZSeToFeChi(2,:,gt2,:) = AmpWaveZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveSeToFeChi(2,:,gt1,:) 
AmpVertexZSeToFeChi(2,:,gt2,:)= AmpVertexZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexSeToFeChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 2 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZSeToFeChi(1,:,:,gt2) = AmpWaveZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(1,:,:,gt1) 
AmpVertexZSeToFeChi(1,:,:,gt2)= AmpVertexZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(1,:,:,gt1) 
AmpWaveZSeToFeChi(2,:,:,gt2) = AmpWaveZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(2,:,:,gt1) 
AmpVertexZSeToFeChi(2,:,:,gt2)= AmpVertexZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFeChi = AmpVertexSeToFeChi  +  AmpVertexIRosSeToFeChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fe Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi 
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi  
Else 
 AmpSumSeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,7
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MFe(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpWaveSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFeChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFeChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFeChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFe(gt2),MChi(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSehh(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  Else 
Call Amplitude_Tree_BLSSM_SeToSehh(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSehh(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,MRPSeToSehh,      & 
& MRGSeToSehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSehh(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,MRPSeToSehh,     & 
& MRGSeToSehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSehh(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPSeToSehh,          & 
& MRGSeToSehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSehh(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,MRPSeToSehh,         & 
& MRGSeToSehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSehh(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,MSe,              & 
& MSe2,Zfhh,ZfSe,AmpWaveSeToSehh)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSd,              & 
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
& cplSecSeVZpVZp1,AmpVertexSeToSehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSecSeVZpVZp1,AmpVertexIRdrSeToSehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

 End if 
 End if 
AmpVertexSeToSehh = AmpVertexSeToSehh -  AmpVertexIRdrSeToSehh! +  AmpVertexIRosSeToSehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(gt2,:,:) = AmpWaveZSeToSehh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSehh(gt1,:,:) 
AmpVertexZSeToSehh(gt2,:,:)= AmpVertexZSeToSehh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 1 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(:,gt2,:) = AmpWaveZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSehh(:,gt1,:) 
AmpVertexZSeToSehh(:,gt2,:)= AmpVertexZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 2 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZSeToSehh(:,:,gt2) = AmpWaveZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSeToSehh(:,:,gt1) 
AmpVertexZSeToSehh(:,:,gt2)= AmpVertexZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSeToSehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSehh = AmpVertexSeToSehh  +  AmpVertexIRosSeToSehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh 
 AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh  
Else 
 AmpSumSeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,4
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSehh = AmpTreeSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpWaveSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSehh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),Mhh(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! SvIm Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSvImHpm(cplHpmSvImcSe,MHpm,MSe,MSvIm,MHpm2,             & 
& MSe2,MSvIm2,AmpTreeSeToSvImHpm)

  Else 
Call Amplitude_Tree_BLSSM_SeToSvImHpm(ZcplHpmSvImcSe,MHpm,MSe,MSvIm,MHpm2,            & 
& MSe2,MSvIm2,AmpTreeSeToSvImHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSvImHpm(MLambda,em,gs,cplHpmSvImcSe,MHpmOS,MSeOS,           & 
& MSvImOS,MRPSeToSvImHpm,MRGSeToSvImHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSvImHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpmOS,MSeOS,          & 
& MSvImOS,MRPSeToSvImHpm,MRGSeToSvImHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSvImHpm(MLambda,em,gs,cplHpmSvImcSe,MHpm,MSe,               & 
& MSvIm,MRPSeToSvImHpm,MRGSeToSvImHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSvImHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpm,MSe,              & 
& MSvIm,MRPSeToSvImHpm,MRGSeToSvImHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSvImHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,MHpm,             & 
& MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,AmpWaveSeToSvImHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexSeToSvImHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRdrSeToSvImHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSeToSvImHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSeToSvImHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSeToSvImHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,AmpVertexIRosSeToSvImHpm)

 End if 
 End if 
AmpVertexSeToSvImHpm = AmpVertexSeToSvImHpm -  AmpVertexIRdrSeToSvImHpm! +  AmpVertexIRosSeToSvImHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImHpm(gt2,:,:) = AmpWaveZSeToSvImHpm(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvImHpm(gt1,:,:) 
AmpVertexZSeToSvImHpm(gt2,:,:)= AmpVertexZSeToSvImHpm(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvImHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
! Final State 1 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImHpm(:,gt2,:) = AmpWaveZSeToSvImHpm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSeToSvImHpm(:,gt1,:) 
AmpVertexZSeToSvImHpm(:,gt2,:)= AmpVertexZSeToSvImHpm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSeToSvImHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
! Final State 2 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToSvImHpm(:,:,gt2) = AmpWaveZSeToSvImHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSeToSvImHpm(:,:,gt1) 
AmpVertexZSeToSvImHpm(:,:,gt2)= AmpVertexZSeToSvImHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSeToSvImHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvImHpm = AmpVertexSeToSvImHpm  +  AmpVertexIRosSeToSvImHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvIm Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm 
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm  
Else 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm + AmpWaveSeToSvImHpm + AmpVertexSeToSvImHpm
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + AmpWaveSeToSvImHpm + AmpVertexSeToSvImHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = 2._dp*AmpWaveSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = 2._dp*AmpVertexSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvImHpm = + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvImHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvImHpm = + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvImHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvImHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),helfactor*AmpSqSeToSvImHpm(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvIm(gt2),MHpm(gt3),helfactor*AmpSqSeToSvImHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSvImHpm(gt1, gt2, gt3) + MRGSeToSvImHpm(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSvImHpm(gt1, gt2, gt3) + MRGSeToSvImHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! SvRe Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSvReHpm(cplHpmSvRecSe,MHpm,MSe,MSvRe,MHpm2,             & 
& MSe2,MSvRe2,AmpTreeSeToSvReHpm)

  Else 
Call Amplitude_Tree_BLSSM_SeToSvReHpm(ZcplHpmSvRecSe,MHpm,MSe,MSvRe,MHpm2,            & 
& MSe2,MSvRe2,AmpTreeSeToSvReHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSvReHpm(MLambda,em,gs,cplHpmSvRecSe,MHpmOS,MSeOS,           & 
& MSvReOS,MRPSeToSvReHpm,MRGSeToSvReHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSvReHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpmOS,MSeOS,          & 
& MSvReOS,MRPSeToSvReHpm,MRGSeToSvReHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSvReHpm(MLambda,em,gs,cplHpmSvRecSe,MHpm,MSe,               & 
& MSvRe,MRPSeToSvReHpm,MRGSeToSvReHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSvReHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpm,MSe,              & 
& MSvRe,MRPSeToSvReHpm,MRGSeToSvReHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSvReHpm(cplHpmSvRecSe,ctcplHpmSvRecSe,MHpm,             & 
& MHpm2,MSe,MSe2,MSvRe,MSvRe2,ZfHpm,ZfSe,ZfSvRe,AmpWaveSeToSvReHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexSeToSvReHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRdrSeToSvReHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReHpm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
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
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReHpm)

 End if 
 End if 
AmpVertexSeToSvReHpm = AmpVertexSeToSvReHpm -  AmpVertexIRdrSeToSvReHpm! +  AmpVertexIRosSeToSvReHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReHpm(gt2,:,:) = AmpWaveZSeToSvReHpm(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvReHpm(gt1,:,:) 
AmpVertexZSeToSvReHpm(gt2,:,:)= AmpVertexZSeToSvReHpm(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvReHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
! Final State 1 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReHpm(:,gt2,:) = AmpWaveZSeToSvReHpm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSeToSvReHpm(:,gt1,:) 
AmpVertexZSeToSvReHpm(:,gt2,:)= AmpVertexZSeToSvReHpm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSeToSvReHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
! Final State 2 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToSvReHpm(:,:,gt2) = AmpWaveZSeToSvReHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSeToSvReHpm(:,:,gt1) 
AmpVertexZSeToSvReHpm(:,:,gt2)= AmpVertexZSeToSvReHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSeToSvReHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvReHpm = AmpVertexSeToSvReHpm  +  AmpVertexIRosSeToSvReHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvRe Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm 
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm  
Else 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm + AmpWaveSeToSvReHpm + AmpVertexSeToSvReHpm
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + AmpWaveSeToSvReHpm + AmpVertexSeToSvReHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = 2._dp*AmpWaveSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = 2._dp*AmpVertexSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvReHpm = + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvReHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvReHpm = + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvReHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvReHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),helfactor*AmpSqSeToSvReHpm(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvRe(gt2),MHpm(gt3),helfactor*AmpSqSeToSvReHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSvReHpm(gt1, gt2, gt3) + MRGSeToSvReHpm(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSvReHpm(gt1, gt2, gt3) + MRGSeToSvReHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSeVZ(cplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  Else 
Call Amplitude_Tree_BLSSM_SeToSeVZ(ZcplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSeOS,MVZOS,MRPSeToSeVZ,      & 
& MRGSeToSeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSeOS,MVZOS,MRPSeToSeVZ,     & 
& MRGSeToSeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,          & 
& MRGSeToSeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,         & 
& MRGSeToSeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSeVZ(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ctcplSecSeVP,    & 
& ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZ,MVZ2,ZfSe,ZfVPVZ,ZfVZ,ZfVZpVZ,        & 
& AmpWaveSeToSeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,     & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,cplSvImcSeVWm,           & 
& cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,             & 
& cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,          & 
& AmpVertexSeToSeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,        & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,          & 
& AmpVertexIRdrSeToSeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,cplHpmSvRecSe,    & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,ZcplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,          & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,             & 
& cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,        & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,ZcplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,          & 
& AmpVertexIRosSeToSeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,              & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSvImcSe,cplHpmSvRecSe,    & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,             & 
& cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,        & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZ,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,          & 
& AmpVertexIRosSeToSeVZ)

 End if 
 End if 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ -  AmpVertexIRdrSeToSeVZ! +  AmpVertexIRosSeToSeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,gt2,:) = AmpWaveZSeToSeVZ(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeVZ(:,gt1,:) 
AmpVertexZSeToSeVZ(:,gt2,:)= AmpVertexZSeToSeVZ(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
! Final State 1 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,:,gt2) = AmpWaveZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSeToSeVZ(:,:,gt1) 
AmpVertexZSeToSeVZ(:,:,gt2)= AmpVertexZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSeToSeVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ  +  AmpVertexIRosSeToSeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ 
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ  
Else 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpWaveSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
Else  
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
End if  
Else  
  AmpSqSeToSeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MVZOS,helfactor*AmpSqSeToSeVZ(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVZ,helfactor*AmpSqSeToSeVZ(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSeVZp(cplSecSeVZp,MSe,MVZp,MSe2,MVZp2,AmpTreeSeToSeVZp)

  Else 
Call Amplitude_Tree_BLSSM_SeToSeVZp(ZcplSecSeVZp,MSe,MVZp,MSe2,MVZp2,AmpTreeSeToSeVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZp(MLambda,em,gs,cplSecSeVZp,MSeOS,MVZpOS,               & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZp(MLambda,em,gs,ZcplSecSeVZp,MSeOS,MVZpOS,              & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSeVZp(MLambda,em,gs,cplSecSeVZp,MSe,MVZp,MRPSeToSeVZp,      & 
& MRGSeToSeVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSeVZp(MLambda,em,gs,ZcplSecSeVZp,MSe,MVZp,MRPSeToSeVZp,     & 
& MRGSeToSeVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSeVZp(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ctcplSecSeVP,   & 
& ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZp,MVZp2,ZfSe,ZfVPVZp,ZfVZp,            & 
& ZfVZVZp,AmpWaveSeToSeVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,  & 
& cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZp,cplSvImcSeVWm,          & 
& cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSeSvRecVWmVZp1,         & 
& cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,cplSvRecSeVWmVZp1,     & 
& AmpVertexSeToSeVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,           & 
& cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,    & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,     & 
& cplSvRecSeVWmVZp1,AmpVertexIRdrSeToSeVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,               & 
& cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,ZcplSecSeVZp,cplSvImSvReVZp,cplSvImcSeVWm,         & 
& cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSeSvRecVWmVZp1,         & 
& cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,cplSvRecSeVWmVZp1,     & 
& AmpVertexIRosSeToSeVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,           & 
& cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,    & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,ZcplSecSeVZp,cplSvImSvReVZp,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,     & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSeToSeVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZp(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSvImcSe,               & 
& cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZp,cplSvImcSeVWm,          & 
& cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,cplSeSvRecVWmVZp1,         & 
& cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,cplSvRecSeVWmVZp1,     & 
& AmpVertexIRosSeToSeVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplFvChacSeL,           & 
& cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,   & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,    & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSeSvImcVWmVZp1,             & 
& cplSeSvRecVWmVZp1,cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSvImcSeVWmVZp1,     & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSeToSeVZp)

 End if 
 End if 
AmpVertexSeToSeVZp = AmpVertexSeToSeVZp -  AmpVertexIRdrSeToSeVZp! +  AmpVertexIRosSeToSeVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeVZp=0._dp 
AmpVertexZSeToSeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZp(:,gt2,:) = AmpWaveZSeToSeVZp(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeVZp(:,gt1,:) 
AmpVertexZSeToSeVZp(:,gt2,:)= AmpVertexZSeToSeVZp(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeVZp=AmpWaveZSeToSeVZp 
AmpVertexSeToSeVZp= AmpVertexZSeToSeVZp
! Final State 1 
AmpWaveZSeToSeVZp=0._dp 
AmpVertexZSeToSeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZp(:,:,gt2) = AmpWaveZSeToSeVZp(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSeToSeVZp(:,:,gt1) 
AmpVertexZSeToSeVZp(:,:,gt2)= AmpVertexZSeToSeVZp(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSeToSeVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeVZp=AmpWaveZSeToSeVZp 
AmpVertexSeToSeVZp= AmpVertexZSeToSeVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeVZp = AmpVertexSeToSeVZp  +  AmpVertexIRosSeToSeVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp 
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp  
Else 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp + AmpWaveSeToSeVZp + AmpVertexSeToSeVZp
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + AmpWaveSeToSeVZp + AmpVertexSeToSeVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = 2._dp*AmpWaveSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = 2._dp*AmpVertexSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqTreeSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2)  
  AmpSum2SeToSeVZp = + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2) + AmpSqTreeSeToSeVZp(gt1, gt2)  
Else  
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqTreeSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2)  
  AmpSum2SeToSeVZp = + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2) + AmpSqTreeSeToSeVZp(gt1, gt2)  
End if  
Else  
  AmpSqSeToSeVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MVZpOS,helfactor*AmpSqSeToSeVZp(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVZp,helfactor*AmpSqSeToSeVZp(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSeVZp(gt1, gt2) + MRGSeToSeVZp(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSeVZp(gt1, gt2) + MRGSeToSeVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! SvIm VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSvImVWm(cplSvImcSeVWm,MSe,MSvIm,MVWm,MSe2,              & 
& MSvIm2,MVWm2,AmpTreeSeToSvImVWm)

  Else 
Call Amplitude_Tree_BLSSM_SeToSvImVWm(ZcplSvImcSeVWm,MSe,MSvIm,MVWm,MSe2,             & 
& MSvIm2,MVWm2,AmpTreeSeToSvImVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSvImVWm(MLambda,em,gs,cplSvImcSeVWm,MSeOS,MSvImOS,          & 
& MVWmOS,MRPSeToSvImVWm,MRGSeToSvImVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSvImVWm(MLambda,em,gs,ZcplSvImcSeVWm,MSeOS,MSvImOS,         & 
& MVWmOS,MRPSeToSvImVWm,MRGSeToSvImVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSvImVWm(MLambda,em,gs,cplSvImcSeVWm,MSe,MSvIm,              & 
& MVWm,MRPSeToSvImVWm,MRGSeToSvImVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSvImVWm(MLambda,em,gs,ZcplSvImcSeVWm,MSe,MSvIm,             & 
& MVWm,MRPSeToSvImVWm,MRGSeToSvImVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSvImVWm(cplSvImcSeVWm,ctcplSvImcSeVWm,MSe,              & 
& MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,AmpWaveSeToSvImVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,     & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,& 
& AmpVertexSeToSvImVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,     & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,& 
& AmpVertexIRdrSeToSvImVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplFvChacSeL,       & 
& cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,GosZcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& ZcplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,         & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1, & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvImVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,GZcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& ZcplSvImcSeVWm,cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,    & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,     & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,& 
& AmpVertexIRosSeToSvImVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplFvChacSeL,       & 
& cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,GcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,      & 
& cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,  & 
& cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvImVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,     & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,& 
& AmpVertexIRosSeToSvImVWm)

 End if 
 End if 
AmpVertexSeToSvImVWm = AmpVertexSeToSvImVWm -  AmpVertexIRdrSeToSvImVWm! +  AmpVertexIRosSeToSvImVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvImVWm=0._dp 
AmpVertexZSeToSvImVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImVWm(:,gt2,:) = AmpWaveZSeToSvImVWm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvImVWm(:,gt1,:) 
AmpVertexZSeToSvImVWm(:,gt2,:)= AmpVertexZSeToSvImVWm(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvImVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvImVWm=AmpWaveZSeToSvImVWm 
AmpVertexSeToSvImVWm= AmpVertexZSeToSvImVWm
! Final State 1 
AmpWaveZSeToSvImVWm=0._dp 
AmpVertexZSeToSvImVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImVWm(:,:,gt2) = AmpWaveZSeToSvImVWm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveSeToSvImVWm(:,:,gt1) 
AmpVertexZSeToSvImVWm(:,:,gt2)= AmpVertexZSeToSvImVWm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexSeToSvImVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvImVWm=AmpWaveZSeToSvImVWm 
AmpVertexSeToSvImVWm= AmpVertexZSeToSvImVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvImVWm = AmpVertexSeToSvImVWm  +  AmpVertexIRosSeToSvImVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvIm VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm 
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm  
Else 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm + AmpWaveSeToSvImVWm + AmpVertexSeToSvImVWm
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + AmpWaveSeToSvImVWm + AmpVertexSeToSvImVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvImOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSvIm(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = 2._dp*AmpWaveSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = 2._dp*AmpVertexSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvImVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqTreeSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2)  
  AmpSum2SeToSvImVWm = + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2) + AmpSqTreeSeToSvImVWm(gt1, gt2)  
Else  
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqTreeSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2)  
  AmpSum2SeToSvImVWm = + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2) + AmpSqTreeSeToSvImVWm(gt1, gt2)  
End if  
Else  
  AmpSqSeToSvImVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvImVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvImOS(gt2),MVWmOS,helfactor*AmpSqSeToSvImVWm(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvIm(gt2),MVWm,helfactor*AmpSqSeToSvImVWm(gt1, gt2))
End if 
If ((Abs(MRPSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSvImVWm(gt1, gt2) + MRGSeToSvImVWm(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSvImVWm(gt1, gt2) + MRGSeToSvImVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! SvRe VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_BLSSM_SeToSvReVWm(cplSvRecSeVWm,MSe,MSvRe,MVWm,MSe2,              & 
& MSvRe2,MVWm2,AmpTreeSeToSvReVWm)

  Else 
Call Amplitude_Tree_BLSSM_SeToSvReVWm(ZcplSvRecSeVWm,MSe,MSvRe,MVWm,MSe2,             & 
& MSvRe2,MVWm2,AmpTreeSeToSvReVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_BLSSM_SeToSvReVWm(MLambda,em,gs,cplSvRecSeVWm,MSeOS,MSvReOS,          & 
& MVWmOS,MRPSeToSvReVWm,MRGSeToSvReVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_BLSSM_SeToSvReVWm(MLambda,em,gs,ZcplSvRecSeVWm,MSeOS,MSvReOS,         & 
& MVWmOS,MRPSeToSvReVWm,MRGSeToSvReVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_BLSSM_SeToSvReVWm(MLambda,em,gs,cplSvRecSeVWm,MSe,MSvRe,              & 
& MVWm,MRPSeToSvReVWm,MRGSeToSvReVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_BLSSM_SeToSvReVWm(MLambda,em,gs,ZcplSvRecSeVWm,MSe,MSvRe,             & 
& MVWm,MRPSeToSvReVWm,MRGSeToSvReVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSvReVWm(cplSvRecSeVWm,ctcplSvRecSeVWm,MSe,              & 
& MSe2,MSvRe,MSvRe2,MVWm,MVWm2,ZfSe,ZfSvRe,ZfVWm,AmpWaveSeToSvReVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,               & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,        & 
& cplSvImcSeVWmVZp1,cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,               & 
& cplSvRecSeVWmVZp1,AmpVertexSeToSvReVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,        & 
& cplSvImcSeVWmVZp1,cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,               & 
& cplSvRecSeVWmVZp1,AmpVertexIRdrSeToSvReVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,       & 
& cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GosZcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,ZcplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,            & 
& cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,               & 
& cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,GZcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,ZcplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,    & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,        & 
& cplSvImcSeVWmVZp1,cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,               & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReVWm(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,           & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,MVZp2OS,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,       & 
& cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,      & 
& cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvImcSeVWmVZp1,    & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplSvRecSeVWmVZp1,               & 
& AmpVertexIRosSeToSvReVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_BLSSM_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,        & 
& cplSvImcSeVWmVZp1,cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,               & 
& cplSvRecSeVWmVZp1,AmpVertexIRosSeToSvReVWm)

 End if 
 End if 
AmpVertexSeToSvReVWm = AmpVertexSeToSvReVWm -  AmpVertexIRdrSeToSvReVWm! +  AmpVertexIRosSeToSvReVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvReVWm=0._dp 
AmpVertexZSeToSvReVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReVWm(:,gt2,:) = AmpWaveZSeToSvReVWm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvReVWm(:,gt1,:) 
AmpVertexZSeToSvReVWm(:,gt2,:)= AmpVertexZSeToSvReVWm(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvReVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvReVWm=AmpWaveZSeToSvReVWm 
AmpVertexSeToSvReVWm= AmpVertexZSeToSvReVWm
! Final State 1 
AmpWaveZSeToSvReVWm=0._dp 
AmpVertexZSeToSvReVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReVWm(:,:,gt2) = AmpWaveZSeToSvReVWm(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveSeToSvReVWm(:,:,gt1) 
AmpVertexZSeToSvReVWm(:,:,gt2)= AmpVertexZSeToSvReVWm(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexSeToSvReVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvReVWm=AmpWaveZSeToSvReVWm 
AmpVertexSeToSvReVWm= AmpVertexZSeToSvReVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvReVWm = AmpVertexSeToSvReVWm  +  AmpVertexIRosSeToSvReVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvRe VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm 
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm  
Else 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm + AmpWaveSeToSvReVWm + AmpVertexSeToSvReVWm
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + AmpWaveSeToSvReVWm + AmpVertexSeToSvReVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvReOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSvRe(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = 2._dp*AmpWaveSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = 2._dp*AmpVertexSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvReVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqTreeSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2)  
  AmpSum2SeToSvReVWm = + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2) + AmpSqTreeSeToSvReVWm(gt1, gt2)  
Else  
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqTreeSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2)  
  AmpSum2SeToSvReVWm = + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2) + AmpSqTreeSeToSvReVWm(gt1, gt2)  
End if  
Else  
  AmpSqSeToSvReVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvReVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvReOS(gt2),MVWmOS,helfactor*AmpSqSeToSvReVWm(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvRe(gt2),MVWm,helfactor*AmpSqSeToSvReVWm(gt1, gt2))
End if 
If ((Abs(MRPSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSvReVWm(gt1, gt2) + MRGSeToSvReVWm(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSvReVWm(gt1, gt2) + MRGSeToSvReVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Se VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_BLSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ctcplSecSeVP,    & 
& ctcplSecSeVZ,ctcplSecSeVZp,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSeToSeVP)

 Else 
Call Amplitude_WAVE_BLSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ctcplSecSeVP,    & 
& ctcplSecSeVZ,ctcplSecSeVZp,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSeToSeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_BLSSM_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,MhhOS,           & 
& MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& MVZp2OS,cplAhhhVP,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChiVPL,cplChiChiVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhSecSe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,              & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,         & 
& cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSecSeVPVZp1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSeToSeVP)

 Else 
Call Amplitude_VERTEX_BLSSM_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,MhhOS,           & 
& MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& MVZp2OS,cplAhhhVP,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChiVPL,cplChiChiVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhSecSe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,              & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,         & 
& cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSecSeVPVZp1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSeToSeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_BLSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ctcplSecSeVP,    & 
& ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,ZfSe,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSeToSeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_BLSSM_SeToSeVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,              & 
& MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,    & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVPVZ,cplhhVPVZp,cplHpmSvImcSe,               & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvImSvReVP,cplSvImcSeVWm,           & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,             & 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,          & 
& AmpVertexSeToSeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVP = 0._dp 
 AmpSum2SeToSeVP = 0._dp  
Else 
 AmpSumSeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP
 AmpSum2SeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),0._dp,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVP,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
End if  
Else  
  AmpSqSeToSeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVP(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),0._dp,helfactor*AmpSqSeToSeVP(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVP,helfactor*AmpSqSeToSeVP(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Se

End Module Wrapper_OneLoopDecay_Se_BLSSM
