! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:50 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_BLSSM 
 
Use Control 
Use Settings 
Use Couplings_BLSSM 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_BLSSM 
Use StandardModel 
Use Tadpoles_BLSSM 
 Use EffectivePotential_BLSSM 
 Use Pole2L_BLSSM 
 Use TreeLevelMasses_BLSSM 
 
Real(dp), Private :: MSd_1L(6), MSd2_1L(6)  
Complex(dp), Private :: ZD_1L(6,6)  
Real(dp), Private :: MSu_1L(6), MSu2_1L(6)  
Complex(dp), Private :: ZU_1L(6,6)  
Real(dp), Private :: MSe_1L(6), MSe2_1L(6)  
Complex(dp), Private :: ZE_1L(6,6)  
Real(dp), Private :: MSvIm_1L(6), MSvIm2_1L(6)  
Complex(dp), Private :: ZVI_1L(6,6)  
Real(dp), Private :: MSvRe_1L(6), MSvRe2_1L(6)  
Complex(dp), Private :: ZVR_1L(6,6)  
Real(dp), Private :: Mhh_1L(4), Mhh2_1L(4)  
Complex(dp), Private :: ZH_1L(4,4)  
Real(dp), Private :: MAh_1L(4), MAh2_1L(4)  
Complex(dp), Private :: ZA_1L(4,4)  
Real(dp), Private :: MHpm_1L(2), MHpm2_1L(2)  
Complex(dp), Private :: ZP_1L(2,2)  
Real(dp), Private :: MChi_1L(7), MChi2_1L(7)  
Complex(dp), Private :: ZN_1L(7,7)  
Real(dp), Private :: MCha_1L(2), MCha2_1L(2)  
Complex(dp), Private :: UM_1L(2,2),UP_1L(2,2)
Real(dp), Private :: MFv_1L(6), MFv2_1L(6)  
Complex(dp), Private :: UV_1L(6,6)  
Real(dp), Private :: MFe_1L(3), MFe2_1L(3)  
Complex(dp), Private :: ZEL_1L(3,3),ZER_1L(3,3)
Real(dp), Private :: MFd_1L(3), MFd2_1L(3)  
Complex(dp), Private :: ZDL_1L(3,3),ZDR_1L(3,3)
Real(dp), Private :: MFu_1L(3), MFu2_1L(3)  
Complex(dp), Private :: ZUL_1L(3,3),ZUR_1L(3,3)
Real(dp), Private :: MGlu_1L, MGlu2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZp_1L, MVZp2_1L  
Real(dp), Private :: MVWm_1L, MVWm2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(4)  
Real(dp) :: pi_ep2L(4,4)
Real(dp) :: Pi2S_EffPot(4,4)
Real(dp) :: PiP2S_EffPot(4,4)
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,x1,x2

Complex(dp) :: cplAhAhcVWmVWm(4,4),cplAhAhUhh(4,4,4),cplAhAhUhhUhh(4,4,4,4),cplAhAhUHpmcUHpm(4,4,2,2),& 
& cplAhAhUSdcUSd(4,4,6,6),cplAhAhUSecUSe(4,4,6,6),cplAhAhUSucUSu(4,4,6,6),               & 
& cplAhAhUSvImUSvIm(4,4,6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplAhAhVPVP(4,4),cplAhAhVPVZ(4,4),& 
& cplAhAhVPVZp(4,4),cplAhAhVZpVZp(4,4),cplAhAhVZVZ(4,4),cplAhAhVZVZp(4,4),               & 
& cplAhcUHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcUHpm(4,2,2), & 
& cplAhHpmcVWm(4,2),cplAhSdcUSd(4,6,6),cplAhSecUSe(4,6,6),cplAhSucUSu(4,6,6),            & 
& cplAhSvImUSvRe(4,6,6),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZp(4,4),cplAhUSvImSvIm(4,6,6),& 
& cplAhUSvImSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcChaChaUAhL(2,2,4),cplcChaChaUAhR(2,2,4),& 
& cplcChaChaUhhL(2,2,4),cplcChaChaUhhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6),cplcChaFdcUSuL(2,3,6),cplcChaFdcUSuR(2,3,6),& 
& cplcChaUChiHpmL(2,7,2),cplcChaUChiHpmR(2,7,2),cplcChaUChiVWmL(2,7),cplcChaUChiVWmR(2,7),& 
& cplcChaUFvSeL(2,6,6),cplcChaUFvSeR(2,6,6),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),     & 
& cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),& 
& cplcFdFdVZR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFdUChiSdL(3,7,6),             & 
& cplcFdUChiSdR(3,7,6),cplcFeChaUSvImL(3,2,6),cplcFeChaUSvImR(3,2,6),cplcFeChaUSvReL(3,2,6),& 
& cplcFeChaUSvReR(3,2,6),cplcFeFeUAhL(3,3,4),cplcFeFeUAhR(3,3,4),cplcFeFeUhhL(3,3,4),    & 
& cplcFeFeUhhR(3,3,4),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),& 
& cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeUChiSeL(3,7,6),cplcFeUChiSeR(3,7,6),          & 
& cplcFeUFvHpmL(3,6,2),cplcFeUFvHpmR(3,6,2),cplcFeUFvVWmL(3,6),cplcFeUFvVWmR(3,6),       & 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),     & 
& cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),       & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcFuUChiSuL(3,7,6),cplcFuUChiSuR(3,7,6),cplcgAgWmcVWm,cplcgGgGVG,cplcgWmgWmUAh(4),   & 
& cplcgWmgWmUhh(4),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWmgZpUHpm(2),            & 
& cplcgWmgZUHpm(2),cplcgWpCgAcVWm,cplcgWpCgWpCUAh(4),cplcgWpCgWpCUhh(4),cplcgWpCgWpCVP,  & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcUHpm(2),cplcgWpCgZcVWm,cplcgWpCgZpcUHpm(2),  & 
& cplcgWpCgZpcVWm,cplcgZgWmcUHpm(2),cplcgZgWmcVWm,cplcgZgWpCUHpm(2),cplcgZgZpUhh(4),     & 
& cplcgZgZUhh(4),cplcgZpgWmcUHpm(2),cplcgZpgWmcVWm,cplcgZpgWpCUHpm(2),cplcgZpgZpUhh(4),  & 
& cplcgZpgZUhh(4),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiChacUHpmL(7,2,2),      & 
& cplChiChacUHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChiChiUAhL(7,7,4),   & 
& cplChiChiUAhR(7,7,4),cplChiChiUhhL(7,7,4),cplChiChiUhhR(7,7,4),cplChiChiVPL(7,7),      & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiChiVZR(7,7),cplChiFdcUSdL(7,3,6),cplChiFdcUSdR(7,3,6),cplChiFecUSeL(7,3,6),      & 
& cplChiFecUSeR(7,3,6),cplChiFucUSuL(7,3,6),cplChiFucUSuR(7,3,6),cplChiFvUSvImL(7,6,6)

Complex(dp) :: cplChiFvUSvImR(7,6,6),cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplChiUFvSvImL(7,6,6),& 
& cplChiUFvSvImR(7,6,6),cplChiUFvSvReL(7,6,6),cplChiUFvSvReR(7,6,6),cplcHpmVPVWm(2),     & 
& cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6),          & 
& cplcUChaChaAhL(2,2,4),cplcUChaChaAhR(2,2,4),cplcUChaChahhL(2,2,4),cplcUChaChahhR(2,2,4),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZpL(2,2),      & 
& cplcUChaChaVZpR(2,2),cplcUChaChaVZR(2,2),cplcUChaChiHpmL(2,7,2),cplcUChaChiHpmR(2,7,2),& 
& cplcUChaChiVWmL(2,7),cplcUChaChiVWmR(2,7),cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6), & 
& cplcUChaFeSvImL(2,3,6),cplcUChaFeSvImR(2,3,6),cplcUChaFeSvReL(2,3,6),cplcUChaFeSvReR(2,3,6),& 
& cplcUChaFvSeL(2,6,6),cplcUChaFvSeR(2,6,6),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),   & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),     & 
& cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZpL(3,3),              & 
& cplcUFdFdVZpR(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),        & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),           & 
& cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),& 
& cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),     & 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFeVZR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6),       & 
& cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2), & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),       & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZpL(3,3),              & 
& cplcUFuFuVZpR(3,3),cplcUFuFuVZR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),            & 
& cplcUHpmVPVWm(2),cplcUHpmVWmVZ(2),cplcUHpmVWmVZp(2),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,& 
& cplcVWmcVWmVWmVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWm,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,       & 
& cplcVWmVWmVZpVZp3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,    & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvChacUSeL(6,2,6),cplFvChacUSeR(6,2,6),           & 
& cplFvFecUHpmL(6,3,2),cplFvFecUHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),         & 
& cplFvFvUAhL(6,6,4),cplFvFvUAhR(6,6,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),           & 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),     & 
& cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),             & 
& cplGluGluVGL,cplGluGluVGR,cplhhcUHpmVWm(4,2),cplhhcVWmVWm(4),cplhhhhcVWmVWm(4,4),      & 
& cplhhhhUHpmcUHpm(4,4,2,2),cplhhhhUSdcUSd(4,4,6,6),cplhhhhUSecUSe(4,4,6,6)

Complex(dp) :: cplhhhhUSucUSu(4,4,6,6),cplhhhhUSvImUSvIm(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),         & 
& cplhhhhVPVP(4,4),cplhhhhVPVZ(4,4),cplhhhhVPVZp(4,4),cplhhhhVZpVZp(4,4),cplhhhhVZVZ(4,4),& 
& cplhhhhVZVZp(4,4),cplhhHpmcUHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcUSd(4,6,6),           & 
& cplhhSecUSe(4,6,6),cplhhSucUSu(4,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvImSvIm(4,6,6),     & 
& cplhhUSvImSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4), & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVPVP(2,2),& 
& cplHpmcHpmVPVZ(2,2),cplHpmcHpmVPVZp(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),         & 
& cplHpmcHpmVZpVZp(2,2),cplHpmcHpmVZVZ(2,2),cplHpmcHpmVZVZp(2,2),cplHpmcUHpmVP(2,2),     & 
& cplHpmcUHpmVZ(2,2),cplHpmcUHpmVZp(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),& 
& cplHpmSucUSd(2,6,6),cplHpmSvImcUSe(2,6,6),cplHpmSvRecUSe(2,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),& 
& cplHpmUSecHpmcUSe(2,6,2,6),cplHpmUSucHpmcUSu(2,6,2,6),cplHpmUSvImcSe(2,6,6),           & 
& cplHpmUSvImUSvImcHpm(2,6,6,2),cplHpmUSvRecSe(2,6,6),cplHpmUSvReUSvRecHpm(2,6,6,2),     & 
& cplSdcHpmcUSu(6,2,6),cplSdcSdcVWmVWm(6,6),cplSdcSdVG(6,6),cplSdcSdVGVG(6,6),           & 
& cplSdcSdVP(6,6),cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSdVPVZp(6,6),cplSdcSdVZ(6,6),& 
& cplSdcSdVZp(6,6),cplSdcSdVZpVZp(6,6),cplSdcSdVZVZ(6,6),cplSdcSdVZVZp(6,6),             & 
& cplSdcSucVWm(6,6),cplSdcUHpmcSu(6,2,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),              & 
& cplSdcUSdVZ(6,6),cplSdcUSdVZp(6,6),cplSdcUSucVWm(6,6),cplSdUSecSdcUSe(6,6,6,6),        & 
& cplSdUSucSdcUSu(6,6,6,6),cplSdUSvImUSvImcSd(6,6,6,6),cplSdUSvReUSvRecSd(6,6,6,6),      & 
& cplSecSecVWmVWm(6,6),cplSecSeVP(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),              & 
& cplSecSeVPVZp(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZpVZp(6,6),               & 
& cplSecSeVZVZ(6,6),cplSecSeVZVZp(6,6),cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSecUSeVZp(6,6),& 
& cplSeSvImcUHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecUHpm(6,6,2),cplSeSvRecVWm(6,6),     & 
& cplSeUSucSecUSu(6,6,6,6),cplSeUSvImcVWm(6,6),cplSeUSvImUSvImcSe(6,6,6,6),              & 
& cplSeUSvRecVWm(6,6),cplSeUSvReUSvRecSe(6,6,6,6),cplSucSucVWmVWm(6,6),cplSucSuVG(6,6),  & 
& cplSucSuVGVG(6,6),cplSucSuVP(6,6),cplSucSuVPVP(6,6),cplSucSuVPVZ(6,6),cplSucSuVPVZp(6,6),& 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplSucSuVZpVZp(6,6),cplSucSuVZVZ(6,6),cplSucSuVZVZp(6,6),& 
& cplSucUSdVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),cplSucUSuVZ(6,6),cplSucUSuVZp(6,6),& 
& cplSuUSvImUSvImcSu(6,6,6,6),cplSuUSvReUSvRecSu(6,6,6,6),cplSvImcUSeVWm(6,6),           & 
& cplSvImSvImcVWmVWm(6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplSvImSvImVPVP(6,6),           & 
& cplSvImSvImVPVZ(6,6),cplSvImSvImVPVZp(6,6),cplSvImSvImVZpVZp(6,6),cplSvImSvImVZVZ(6,6),& 
& cplSvImSvImVZVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),       & 
& cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),cplSvImUSvReVZp(6,6),cplSvRecUSeVWm(6,6),      & 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVPVP(6,6),cplSvReSvReVPVZ(6,6),cplSvReSvReVPVZp(6,6),& 
& cplSvReSvReVZpVZp(6,6),cplSvReSvReVZVZ(6,6),cplSvReSvReVZVZp(6,6),cplUAhAhhh(4,4,4),   & 
& cplUAhhhVP(4,4),cplUAhhhVZ(4,4),cplUAhhhVZp(4,4),cplUAhHpmcHpm(4,2,2),cplUAhHpmcVWm(4,2),& 
& cplUAhSdcSd(4,6,6),cplUAhSecSe(4,6,6),cplUAhSucSu(4,6,6),cplUAhSvImSvIm(4,6,6),        & 
& cplUAhSvImSvRe(4,6,6),cplUAhSvReSvRe(4,6,6),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhcVWmVWm(4,4)

Complex(dp) :: cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,2,2),cplUAhUAhSdcSd(4,4,6,6),              & 
& cplUAhUAhSecSe(4,4,6,6),cplUAhUAhSucSu(4,4,6,6),cplUAhUAhSvImSvIm(4,4,6,6),            & 
& cplUAhUAhSvReSvRe(4,4,6,6),cplUAhUAhVPVP(4,4),cplUAhUAhVZpVZp(4,4),cplUAhUAhVZVZ(4,4), & 
& cplUChiChacHpmL(7,2,2),cplUChiChacHpmR(7,2,2),cplUChiChacVWmL(7,2),cplUChiChacVWmR(7,2),& 
& cplUChiChiAhL(7,7,4),cplUChiChiAhR(7,7,4),cplUChiChihhL(7,7,4),cplUChiChihhR(7,7,4),   & 
& cplUChiChiVPL(7,7),cplUChiChiVPR(7,7),cplUChiChiVZL(7,7),cplUChiChiVZpL(7,7),          & 
& cplUChiChiVZpR(7,7),cplUChiChiVZR(7,7),cplUChiFdcSdL(7,3,6),cplUChiFdcSdR(7,3,6),      & 
& cplUChiFecSeL(7,3,6),cplUChiFecSeR(7,3,6),cplUChiFucSuL(7,3,6),cplUChiFucSuR(7,3,6),   & 
& cplUChiFvSvImL(7,6,6),cplUChiFvSvImR(7,6,6),cplUChiFvSvReL(7,6,6),cplUChiFvSvReR(7,6,6),& 
& cplUFvChacSeL(6,2,6),cplUFvChacSeR(6,2,6),cplUFvFecHpmL(6,3,2),cplUFvFecHpmR(6,3,2),   & 
& cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),           & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZpL(6,6),cplUFvFvVZpR(6,6),cplUFvFvVZR(6,6),cplUhhcVWmVWm(4),& 
& cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),          & 
& cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),     & 
& cplUhhSvReSvRe(4,6,6),cplUhhUhhcVWmVWm(4,4),cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,2,2),& 
& cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),cplUhhUhhSucSu(4,4,6,6),               & 
& cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),cplUhhUhhVPVP(4,4),              & 
& cplUhhUhhVZpVZp(4,4),cplUhhUhhVZVZ(4,4),cplUhhVPVZ(4),cplUhhVPVZp(4),cplUhhVZpVZp(4),  & 
& cplUhhVZVZ(4),cplUhhVZVZp(4),cplUHpmcUHpmcVWmVWm(2,2),cplUHpmcUHpmVPVP(2,2),           & 
& cplUHpmcUHpmVZpVZp(2,2),cplUHpmcUHpmVZVZ(2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),            & 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvImSvImcUHpm(2,6,6,2),cplUHpmSvReSvRecUHpm(2,6,6,2),cplUSdcUSdcVWmVWm(6,6),    & 
& cplUSdcUSdVGVG(6,6),cplUSdcUSdVPVP(6,6),cplUSdcUSdVZpVZp(6,6),cplUSdcUSdVZVZ(6,6),     & 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,6,6,6),cplUSdSvReSvRecUSd(6,6,6,6),cplUSecUSecVWmVWm(6,6),        & 
& cplUSecUSeVPVP(6,6),cplUSecUSeVZpVZp(6,6),cplUSecUSeVZVZ(6,6),cplUSeSecUSecSe(6,6,6,6),& 
& cplUSeSucUSecSu(6,6,6,6),cplUSeSvImSvImcUSe(6,6,6,6),cplUSeSvReSvRecUSe(6,6,6,6),      & 
& cplUSucUSucVWmVWm(6,6),cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),cplUSucUSuVZpVZp(6,6),  & 
& cplUSucUSuVZVZ(6,6),cplUSuSucUSucSu(6,6,6,6),cplUSuSvImSvImcUSu(6,6,6,6),              & 
& cplUSuSvReSvRecUSu(6,6,6,6),cplUSvImSvReVP(6,6),cplUSvImSvReVZ(6,6),cplUSvImSvReVZp(6,6),& 
& cplUSvImUSvImcVWmVWm(6,6),cplUSvImUSvImSvImSvIm(6,6,6,6),cplUSvImUSvImSvReSvRe(6,6,6,6),& 
& cplUSvImUSvImVPVP(6,6),cplUSvImUSvImVZpVZp(6,6),cplUSvImUSvImVZVZ(6,6),cplUSvReUSvRecVWmVWm(6,6),& 
& cplUSvReUSvReSvReSvRe(6,6,6,6),cplUSvReUSvReVPVP(6,6),cplUSvReUSvReVZpVZp(6,6),        & 
& cplUSvReUSvReVZVZ(6,6),cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(4,4), diff(4,4)
Complex(dp) :: Tad1Loop(10), dmz2  
Real(dp) :: comp(6), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWm = RXi 
RXiZ = RXi 
RXiZp = RXi 

 ! Running angles 
TanBetaQ = vu/vd

 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

mC12Tree  = mC12
mC22Tree  = mC22
mHd2Tree  = mHd2
mHu2Tree  = mHu2
MuPTree  = MuP
MuTree  = Mu
BMuPTree  = BMuP
BmuTree  = Bmu

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
vd=vSM/Sqrt(1 + TanBetaQ**2) 
vu=TanBetaQ*vd 
Else 
Call CouplingsForVectorBosons(g1,g2,gBY,ZH,ZA,TW,UM,UP,ZN,UV,gBL,gYB,vd,              & 
& vu,x1,x2,TWp,ZP,ZD,ZE,ZU,ZVI,ZVR,ZDL,ZUL,ZEL,cplAhhhVP,cplcChaChaVPL,cplcChaChaVPR,    & 
& cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,             & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm1,             & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,   & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,       & 
& cplcVWmVWmVZpVZp3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,            & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,& 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm, & 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcHpmVWmVZ,cplcHpmVPVWm,    & 
& cplAhAhVPVZ,cplhhhhVPVZ,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,         & 
& cplSvImSvImVPVZ,cplSvReSvReVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcHpmVWmVZp,cplAhAhVPVZp,cplhhhhVPVZp,cplHpmcHpmVPVZp,cplSdcSdVPVZp,cplSecSeVPVZp,   & 
& cplSucSuVPVZp,cplSvImSvImVPVZp,cplSvReSvReVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvReSvReVZVZp,cplcVWmVWmVZVZp1,        & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
vSM=sqrt(vev2) 
vd=vSM/Sqrt(1 + TanBetaQ**2) 
vu=TanBetaQ*vd 
End if 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

Call CouplingsForLoopMasses(Mu,Yd,Td,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,gBL,gYB,            & 
& gBY,ZN,ZDL,ZDR,g3,pG,vd,vu,x1,x2,ZH,Tu,ZU,ZP,TW,TWp,Ye,ZE,ZVI,ZVR,Yv,Te,               & 
& UV,ZEL,ZER,Yx,Tv,MuP,Tx,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,         & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,       & 
& cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,  & 
& cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,     & 
& cplUSdcUSdVZpVZp,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,               & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,cplhhhhUSucUSu,        & 
& cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,  & 
& cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,     & 
& cplUSucUSuVZpVZp,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,  & 
& cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSecUSeVZp,        & 
& cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,         & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe, & 
& cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,cplAhUSvImSvIm,       & 
& cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,cplChiFvUSvImL,cplChiFvUSvImR,          & 
& cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,cplSeUSvImcVWm,cplUSvImSvReVP,            & 
& cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,        & 
& cplUSvImUSvImVZpVZp,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,     & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,        & 
& cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,          & 
& cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,      & 
& cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,cplAhAhUhh,cplAhUhhVP,      & 
& cplAhUhhVZ,cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,      & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,        & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,         & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,       & 
& cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,           & 
& cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,      & 
& cplUhhUhhVZpVZp,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,  & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,           & 
& cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,           & 
& cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,cplUAhUAhhhhh,              & 
& cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvImSvIm,       & 
& cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,cplUAhUAhVZpVZp,        & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,               & 
& cplcgZpgWmcUHpm,cplcgWmgZpUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,        & 
& cplcgZpgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,               & 
& cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm,cplcUHpmVPVWm,              & 
& cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,    & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,            & 
& cplUHpmcUHpmVZpVZp,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,        & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVPL,             & 
& cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,cplUChiChiVZpR,               & 
& cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,   & 
& cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,           & 
& cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,               & 
& cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,cplcUChaChaAhL,            & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,         & 
& cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,         & 
& cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,         & 
& cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,     & 
& cplUFvChacSeR,cplChiUFvSvImL,cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,             & 
& cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,       & 
& cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,             & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,             & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,     & 
& cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,        & 
& cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,   & 
& cplcUFdGluSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcFdFdVGL,cplcFdFdVGR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,       & 
& cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplAhhhVP,cplcChaChaVPL,           & 
& cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,           & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP, & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm1,             & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,   & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,  & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVZpVZp,cplHpmcHpmVZp,       & 
& cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,        & 
& cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,            & 
& cplSucSuVZpVZp,cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,& 
& cplcVWmVWmVZpVZp3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,            & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,& 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm, & 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcHpmVWmVZ,cplcHpmVPVWm,    & 
& cplAhAhVPVZ,cplhhhhVPVZ,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,         & 
& cplSvImSvImVPVZ,cplSvReSvReVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcHpmVWmVZp,cplAhAhVPVZp,cplhhhhVPVZp,cplHpmcHpmVPVZp,cplSdcSdVPVZp,cplSecSeVPVZp,   & 
& cplSucSuVPVZp,cplSvImSvImVPVZp,cplSvReSvReVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,     & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvReSvReVZVZp,cplcVWmVWmVZVZp1,        & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3)

Call OneLoopTadpoleshh(vd,vu,x1,x2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,        & 
& cplUhhVZpVZp,Tad1Loop(1:4))

mC12Tree  = mC12
mC22Tree  = mC22
mHd2Tree  = mHd2
mHu2Tree  = mHu2
MuPTree  = MuP
MuTree  = Mu
BMuPTree  = BMuP
BmuTree  = Bmu
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  vdFix = 0._dp 
  vuFix = 0._dp 
  x1Fix = 0._dp 
  x2Fix = 0._dp 
   g1_saveEP =g1
   g1 = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
   gBL_saveEP =gBL
   gBL = 0._dp 
   gYB_saveEP =gYB
   gYB = 0._dp 
   gBY_saveEP =gBY
   gBY = 0._dp 
     Else 
  vdFix = vd 
  vuFix = vu 
  x1Fix = x1 
  x2Fix = x2 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 
  ! Make sure that there are no exactly degenerated masses! 
   Yd_saveEP =Yd
   where (aint(Abs(Yd)).eq.Yd) Yd=Yd*(1 + 1*1.0E-12_dp)
   Ye_saveEP =Ye
   where (aint(Abs(Ye)).eq.Ye) Ye=Ye*(1 + 2*1.0E-12_dp)
   Yu_saveEP =Yu
   where (aint(Abs(Yu)).eq.Yu) Yu=Yu*(1 + 3*1.0E-12_dp)
   Yx_saveEP =Yx
   where (aint(Abs(Yx)).eq.Yx) Yx=Yx*(1 + 4*1.0E-12_dp)
   Yv_saveEP =Yv
   where (aint(Abs(Yv)).eq.Yv) Yv=Yv*(1 + 5*1.0E-12_dp)
   Td_saveEP =Td
   where (aint(Abs(Td)).eq.Td) Td=Td*(1 + 6*1.0E-12_dp)
   Te_saveEP =Te
   where (aint(Abs(Te)).eq.Te) Te=Te*(1 + 7*1.0E-12_dp)
   Tu_saveEP =Tu
   where (aint(Abs(Tu)).eq.Tu) Tu=Tu*(1 + 8*1.0E-12_dp)
   Tx_saveEP =Tx
   where (aint(Abs(Tx)).eq.Tx) Tx=Tx*(1 + 9*1.0E-12_dp)
   Tv_saveEP =Tv
   where (aint(Abs(Tv)).eq.Tv) Tv=Tv*(1 + 10*1.0E-12_dp)
   mq2_saveEP =mq2
   where (aint(Abs(mq2)).eq.mq2) mq2=mq2*(1 + 11*1.0E-12_dp)
   ml2_saveEP =ml2
   where (aint(Abs(ml2)).eq.ml2) ml2=ml2*(1 + 12*1.0E-12_dp)
   md2_saveEP =md2
   where (aint(Abs(md2)).eq.md2) md2=md2*(1 + 13*1.0E-12_dp)
   mu2_saveEP =mu2
   where (aint(Abs(mu2)).eq.mu2) mu2=mu2*(1 + 14*1.0E-12_dp)
   me2_saveEP =me2
   where (aint(Abs(me2)).eq.me2) me2=me2*(1 + 15*1.0E-12_dp)
   mv2_saveEP =mv2
   where (aint(Abs(mv2)).eq.mv2) mv2=mv2*(1 + 16*1.0E-12_dp)

If (TwoLoopSafeMode) Then 
  iFin = 12 
  Convergence2L = .false. 
  hstep_pn = 2.0_dp 
  hstep_sa = 2.0_dp 
Else 
  iFin = 1 
  Convergence2L = .true. 
End if 

Pi2S_EffPot_save = 0._dp 
Pi2S_EffPot = 0._dp 

Do i2L = 1, iFin 
Call CalculateCorrectionsEffPot(ti_ep2L,pi_ep2L,vd,vu,x1,x2,g1,g2,g3,gBL,             & 
& gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,               & 
& md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

Pi2S_EffPot(1,1) = pi_ep2L(1,1)!-ti_ep2L(1)/vd
Pi2S_EffPot(1,2) = pi_ep2L(1,2)
Pi2S_EffPot(1,3) = pi_ep2L(1,3)
Pi2S_EffPot(1,4) = pi_ep2L(1,4)
Pi2S_EffPot(2,1) = pi_ep2L(2,1)
Pi2S_EffPot(2,2) = pi_ep2L(2,2)!-ti_ep2L(2)/vu
Pi2S_EffPot(2,3) = pi_ep2L(2,3)
Pi2S_EffPot(2,4) = pi_ep2L(2,4)
Pi2S_EffPot(3,1) = pi_ep2L(3,1)
Pi2S_EffPot(3,2) = pi_ep2L(3,2)
Pi2S_EffPot(3,3) = pi_ep2L(3,3)!-ti_ep2L(3)/x1
Pi2S_EffPot(3,4) = pi_ep2L(3,4)
Pi2S_EffPot(4,1) = pi_ep2L(4,1)
Pi2S_EffPot(4,2) = pi_ep2L(4,2)
Pi2S_EffPot(4,3) = pi_ep2L(4,3)
Pi2S_EffPot(4,4) = pi_ep2L(4,4)!-ti_ep2L(4)/x2
 diff=(Pi2S_EffPot-Pi2S_EffPot_save)/MaxVal(Abs(Pi2S_EffPot)) 
  If (MaxVal(Abs(diff)).lt.1.0E-4_dp) Then 
    Convergence2L = .True. 
    Exit 
  Else 
    Pi2S_EffPot_save = Pi2S_EffPot 
  hstep_pn = hstep_pn/2._dp 
  hstep_sa = hstep_sa/2._dp 
  End If 
End do 
If (.not.Convergence2L) Then 
 Write(*,*) "WARNING: Two-Loop corrections are numerically unstable! "  
 Call TerminateProgram 
End If  
 Pi2A0 = 0._dp 
   Yd =Yd_saveEP 
   Ye =Ye_saveEP 
   Yu =Yu_saveEP 
   Yx =Yx_saveEP 
   Yv =Yv_saveEP 
   Td =Td_saveEP 
   Te =Te_saveEP 
   Tu =Tu_saveEP 
   Tx =Tx_saveEP 
   Tv =Tv_saveEP 
   mq2 =mq2_saveEP 
   ml2 =ml2_saveEP 
   md2 =md2_saveEP 
   mu2 =mu2_saveEP 
   me2 =me2_saveEP 
   mv2 =mv2_saveEP 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   Yd_saveEP =Yd
   where (aint(Abs(Yd)).eq.Yd) Yd=Yd*(1 + 1*1.0E-12_dp)
   Ye_saveEP =Ye
   where (aint(Abs(Ye)).eq.Ye) Ye=Ye*(1 + 2*1.0E-12_dp)
   Yu_saveEP =Yu
   where (aint(Abs(Yu)).eq.Yu) Yu=Yu*(1 + 3*1.0E-12_dp)
   Yx_saveEP =Yx
   where (aint(Abs(Yx)).eq.Yx) Yx=Yx*(1 + 4*1.0E-12_dp)
   Yv_saveEP =Yv
   where (aint(Abs(Yv)).eq.Yv) Yv=Yv*(1 + 5*1.0E-12_dp)
   Td_saveEP =Td
   where (aint(Abs(Td)).eq.Td) Td=Td*(1 + 6*1.0E-12_dp)
   Te_saveEP =Te
   where (aint(Abs(Te)).eq.Te) Te=Te*(1 + 7*1.0E-12_dp)
   Tu_saveEP =Tu
   where (aint(Abs(Tu)).eq.Tu) Tu=Tu*(1 + 8*1.0E-12_dp)
   Tx_saveEP =Tx
   where (aint(Abs(Tx)).eq.Tx) Tx=Tx*(1 + 9*1.0E-12_dp)
   Tv_saveEP =Tv
   where (aint(Abs(Tv)).eq.Tv) Tv=Tv*(1 + 10*1.0E-12_dp)
   mq2_saveEP =mq2
   where (aint(Abs(mq2)).eq.mq2) mq2=mq2*(1 + 11*1.0E-12_dp)
   ml2_saveEP =ml2
   where (aint(Abs(ml2)).eq.ml2) ml2=ml2*(1 + 12*1.0E-12_dp)
   md2_saveEP =md2
   where (aint(Abs(md2)).eq.md2) md2=md2*(1 + 13*1.0E-12_dp)
   mu2_saveEP =mu2
   where (aint(Abs(mu2)).eq.mu2) mu2=mu2*(1 + 14*1.0E-12_dp)
   me2_saveEP =me2
   where (aint(Abs(me2)).eq.me2) me2=me2*(1 + 15*1.0E-12_dp)
   mv2_saveEP =mv2
   where (aint(Abs(mv2)).eq.mv2) mv2=mv2*(1 + 16*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,              & 
& Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,           & 
& mC22,MBBp,M1,M2,M3,MBp,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,             & 
& MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,            & 
& MBBp,M1,M2,M3,MBp,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

End if 
   Yd =Yd_saveEP 
   Ye =Ye_saveEP 
   Yu =Yu_saveEP 
   Yx =Yx_saveEP 
   Yv =Yv_saveEP 
   Td =Td_saveEP 
   Te =Te_saveEP 
   Tu =Tu_saveEP 
   Tx =Tx_saveEP 
   Tv =Tv_saveEP 
   mq2 =mq2_saveEP 
   ml2 =ml2_saveEP 
   md2 =md2_saveEP 
   mu2 =mu2_saveEP 
   me2 =me2_saveEP 
   mv2 =mv2_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   g1 =g1_saveEP 
   g2 =g2_saveEP 
   gBL =gBL_saveEP 
   gYB =gYB_saveEP 
   gBY =gBY_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,Tad1Loop)

MuP1L = MuP
Mu1L = Mu
BMuP1L = BMuP
Bmu1L = Bmu
mC121L = mC12
mC221L = mC22
mHd21L = mHd2
mHu21L = mHu2
Tad1Loop(1:4) = Tad1Loop(1:4) - ti_ep2L 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,Tad1Loop)

MuP2L = MuP
Mu2L = Mu
BMuP2L = BMuP
Bmu2L = Bmu
mC122L = mC12
mC222L = mC22
mHd22L = mHd2
mHu22L = mHu2
Call OneLoopSd(g1,g2,gBL,gYB,gBY,Mu1L,Yd,Td,mq2,md2,vd,vu,x1,x2,MSd,MSd2,             & 
& MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,              & 
& MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,            & 
& MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,            & 
& cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,          & 
& cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd, & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplUSdcUSdVZpVZp,       & 
& 0.1_dp*delta_mass,MSd_1L,MSd2_1L,ZD_1L,kont)

Call OneLoopSu(g1,g2,gBL,gYB,gBY,Mu1L,Yu,Tu,mq2,mu2,vd,vu,x1,x2,MSu,MSu2,             & 
& MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,             & 
& MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,          & 
& cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,       & 
& cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,  & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplUSucUSuVZpVZp,       & 
& 0.1_dp*delta_mass,MSu_1L,MSu2_1L,ZU_1L,kont)

Call OneLoopSe(g1,g2,gBL,gYB,gBY,Mu1L,Ye,Te,ml2,me2,vd,vu,x1,x2,MSe,MSe2,             & 
& MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,           & 
& MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecUSe,       & 
& cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,    & 
& cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,     & 
& cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,       & 
& cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,& 
& cplUSecUSeVZVZ,cplUSecUSeVZpVZp,0.1_dp*delta_mass,MSe_1L,MSe2_1L,ZE_1L,kont)

Call OneLoopSvIm(g1,g2,gBL,gYB,gBY,MuP1L,Mu1L,Yx,Tx,Yv,Tv,ml2,mv2,vd,vu,              & 
& x1,x2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,MChi,            & 
& MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,            & 
& MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,cplChiFvUSvImL, & 
& cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,cplSeUSvImcVWm,            & 
& cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,     & 
& cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,         & 
& cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,cplUSvImUSvImcVWmVWm,    & 
& cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,0.1_dp*delta_mass,MSvIm_1L,MSvIm2_1L,            & 
& ZVI_1L,kont)

Call OneLoopSvRe(g1,g2,gBL,gYB,gBY,MuP1L,Mu1L,Yx,Tx,Yv,Tv,ml2,mv2,vd,vu,              & 
& x1,x2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,MChi,            & 
& MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,            & 
& MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,cplChiFvUSvReL, & 
& cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,cplSeUSvRecVWm,            & 
& cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,     & 
& cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,         & 
& cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,cplUSvReUSvRecVWmVWm,    & 
& cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,0.1_dp*delta_mass,MSvRe_1L,MSvRe2_1L,            & 
& ZVR_1L,kont)

Call OneLoophh(g1,g2,gBL,gYB,gBY,MuP2L,BMuP2L,Mu2L,Bmu2L,mHd22L,mHu22L,               & 
& mC122L,mC222L,vd,vu,x1,x2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,          & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,          & 
& cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,    & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,       & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,       & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,         & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,        & 
& 0.1_dp*delta_mass,Mhh_1L,Mhh2_1L,ZH_1L,kont)

If (TwoLoopMethod.gt.2) Then 
Call OneLoopAh(g1,g2,gBL,gYB,gBY,MuP2L,BMuP2L,Mu2L,Bmu2L,mHd22L,mHu22L,               & 
& mC122L,mC222L,vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,               & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,  & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,         & 
& cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,      & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,            & 
& cplUAhUAhSucSu,cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,     & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,0.1_dp*delta_mass,MAh_1L,MAh2_1L,ZA_1L,kont)

Else 
Call OneLoopAh(g1,g2,gBL,gYB,gBY,MuP1L,BMuP1L,Mu1L,Bmu1L,mHd21L,mHu21L,               & 
& mC121L,mC221L,vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,               & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,  & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,         & 
& cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,      & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,            & 
& cplUAhUAhSucSu,cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,     & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,0.1_dp*delta_mass,MAh_1L,MAh2_1L,ZA_1L,kont)

End if 
Call OneLoopHpm(g1,g2,gBL,gYB,gBY,Mu1L,Bmu1L,mHd21L,mHu21L,vd,vu,x1,x2,               & 
& MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,MFd2,MFv,            & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,             & 
& MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,     & 
& cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,              & 
& cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,           & 
& cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,            & 
& cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm,              & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,          & 
& cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,             & 
& cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,        & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,0.1_dp*delta_mass,MHpm_1L,MHpm2_1L,ZP_1L,kont)

Call OneLoopChi(g1,g2,gBL,gYB,gBY,MuP1L,Mu1L,M1,M2,MBp,MBBp,vd,vu,x1,x2,              & 
& MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,           & 
& MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,MSvIm,MSvIm2,              & 
& MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,     & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVPL,             & 
& cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,cplUChiChiVZpR,               & 
& cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,   & 
& cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,           & 
& cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,               & 
& cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,0.1_dp*delta_mass,         & 
& MChi_1L,MChi2_1L,ZN_1L,kont)

Call OneLoopCha(g2,Mu1L,M2,vd,vu,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MVZp,MVZp2,MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,            & 
& MFe,MFe2,MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,              & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,         & 
& cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,         & 
& cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,         & 
& cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,0.1_dp*delta_mass,MCha_1L,MCha2_1L,        & 
& UM_1L,UP_1L,kont)

Call OneLoopFv(Yx,Yv,vu,x1,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,               & 
& MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,    & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,0.1_dp*delta_mass,             & 
& MFv_1L,MFv2_1L,UV_1L,kont)

Call OneLoopFe(Ye,vd,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,             & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,0.1_dp*delta_mass,MFe_1L,MFe2_1L,            & 
& ZEL_1L,ZER_1L,kont)

Call OneLoopFd(Yd,vd,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,0.1_dp*delta_mass,             & 
& MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,kont)

Call OneLoopFu(Yu,vu,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,           & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,0.1_dp*delta_mass,           & 
& MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,kont)

Call OneLoopGlu(M3,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,       & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,0.1_dp*delta_mass,MGlu_1L,MGlu2_1L,kont)

Call OneLoopVZp(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,MAh2,               & 
& MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,               & 
& MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,             & 
& MSvIm2,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,           & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpmcHpmVZpVZp,             & 
& cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,      & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,0.1_dp*delta_mass,               & 
& MVZp_1L,MVZp2_1L,kont)

MSd = MSd_1L 
MSd2 = MSd2_1L 
ZD = ZD_1L 
MSu = MSu_1L 
MSu2 = MSu2_1L 
ZU = ZU_1L 
MSe = MSe_1L 
MSe2 = MSe2_1L 
ZE = ZE_1L 
MSvIm = MSvIm_1L 
MSvIm2 = MSvIm2_1L 
ZVI = ZVI_1L 
MSvRe = MSvRe_1L 
MSvRe2 = MSvRe2_1L 
ZVR = ZVR_1L 
Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
ZA = ZA_1L 
MHpm = MHpm_1L 
MHpm2 = MHpm2_1L 
ZP = ZP_1L 
MChi = MChi_1L 
MChi2 = MChi2_1L 
ZN = ZN_1L 
MCha = MCha_1L 
MCha2 = MCha2_1L 
UM = UM_1L 
UP = UP_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MGlu = MGlu_1L 
MGlu2 = MGlu2_1L 
MVZp = MVZp_1L 
MVZp2 = MVZp2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,kont)

! Set pole masses 
MVWm = mW 
MVWm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWm = 1._dp 
RXiZ = 1._dp 
RXiZp = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
mC12  = mC12Tree 
mC22  = mC22Tree 
mHd2  = mHd2Tree 
mHu2  = mHu2Tree 
MuP  = MuPTree 
Mu  = MuTree 
BMuP  = BMuPTree 
Bmu  = BmuTree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(vd,vu,x1,x2,MAh,MAh2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,             & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,          & 
& cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,   & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,      & 
& cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvReSvRe,cplUhhcVWmVWm,       & 
& cplUhhVZVZ,cplUhhVZpVZp,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplcChaChaUhhL(2,2,4),cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),   & 
& cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),      & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),        & 
& cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZpUhh(4),& 
& cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),cplUhhSdcSd(4,6,6),cplUhhSecSe(4,6,6),          & 
& cplUhhSucSu(4,6,6),cplUhhSvImSvIm(4,6,6),cplUhhSvReSvRe(4,6,6),cplUhhcVWmVWm(4),       & 
& cplUhhVZVZ(4),cplUhhVZpVZp(4)

Real(dp), Intent(in) :: vd,vu,x1,x2

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(4)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(MAh2(i1)) 
  Do gO1 = 1, 4
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Cha] 
!------------------------ 
Do i1 = 1, 2
 A0m = 2._dp*MCha(i1)*SA_A0(MCha2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcChaChaUhhL(i1,i1,gO1)
   coupR = cplcChaChaUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! Chi 
!------------------------ 
Do i1 = 1, 7
 A0m = 2._dp*MChi(i1)*SA_A0(MChi2(i1)) 
  Do gO1 = 1, 4
   coupL = cplChiChiUhhL(i1,i1,gO1)
   coupR = cplChiChiUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 6
 A0m = 2._dp*MFv(i1)*SA_A0(MFv2(i1)) 
  Do gO1 = 1, 4
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWmgWmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWpCgWpCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZp] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZp2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
Do i1 = 1, 2
 A0m = SA_A0(MHpm2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhHpmcHpm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSd2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhSdcSd(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSe2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhSecSe(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSu2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhSucSu(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! SvIm 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSvIm2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhSvImSvIm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! SvRe 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSvRe2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhSvReSvRe(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWm2)+RXi*SA_A0(MVWm2*RXi) - 2._dp*MVWm2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhcVWmVWm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! VZp 
!------------------------ 
A0m = 3._dp*SA_A0(MVZp2)+RXi*SA_A0(MVZp2*RXi) - 2._dp*MVZp2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZpVZp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoopSd(g1,g2,gBL,gYB,gBY,Mu,Yd,Td,mq2,md2,vd,vu,x1,x2,MSd,              & 
& MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,             & 
& MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,MSe2,MSvIm,MSvIm2,              & 
& MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,      & 
& cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,          & 
& cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd, & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplUSdcUSdVZpVZp,       & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(7),MChi2(7),MGlu,MGlu2,Mhh(4),Mhh2(4),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),mq2(3,3),md2(3,3)

Complex(dp), Intent(in) :: cplAhSdcUSd(4,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(7,3,6),    & 
& cplChiFdcUSdR(7,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(4,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSdcUSdVZp(6,6),& 
& cplSucUSdVWm(6,6),cplAhAhUSdcUSd(4,4,6,6),cplhhhhUSdcUSd(4,4,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),& 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,6,6,6),cplUSdSvReSvRecUSd(6,6,6,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6),cplUSdcUSdVZpVZp(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSd'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(g1**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(gBL**2*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(gBY**2*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gBL**2*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+mq2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+mq2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+mq2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-((vu*Mu*Conjg(Yd(1,1)))/sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-((vu*Mu*Conjg(Yd(2,1)))/sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-((vu*Mu*Conjg(Yd(3,1)))/sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(gBL**2*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(gBY**2*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gBL**2*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gBY**2*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+mq2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+mq2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-((vu*Mu*Conjg(Yd(1,2)))/sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-((vu*Mu*Conjg(Yd(2,2)))/sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-((vu*Mu*Conjg(Yd(3,2)))/sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(g1**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(gYB**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g1**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(gYB**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+mq2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-((vu*Mu*Conjg(Yd(1,3)))/sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-((vu*Mu*Conjg(Yd(2,3)))/sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-((vu*Mu*Conjg(Yd(3,3)))/sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(g1**2*vd**2)/12._dp
mat2a(4,4) = mat2a(4,4)-(gYB**2*vd**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vd**2)/24._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vd**2)/24._dp
mat2a(4,4) = mat2a(4,4)+(g1**2*vu**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(gYB**2*vu**2)/12._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vu**2)/24._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vu**2)/24._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*x1**2)/6._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x1**2)/12._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*x1**2)/6._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x1**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*x2**2)/6._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x2**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*x2**2)/6._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x2**2)/12._dp
mat2a(4,4) = mat2a(4,4)+md2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+md2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+md2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(g1**2*vd**2)/12._dp
mat2a(5,5) = mat2a(5,5)-(gYB**2*vd**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*vd**2)/24._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*vd**2)/24._dp
mat2a(5,5) = mat2a(5,5)+(g1**2*vu**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(gYB**2*vu**2)/12._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*vu**2)/24._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*vu**2)/24._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*x1**2)/6._dp
mat2a(5,5) = mat2a(5,5)+(gBL**2*x1**2)/12._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*x1**2)/6._dp
mat2a(5,5) = mat2a(5,5)+(gBY**2*x1**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*x2**2)/6._dp
mat2a(5,5) = mat2a(5,5)-(gBL**2*x2**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*x2**2)/6._dp
mat2a(5,5) = mat2a(5,5)-(gBY**2*x2**2)/12._dp
mat2a(5,5) = mat2a(5,5)+md2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+md2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(g1**2*vd**2)/12._dp
mat2a(6,6) = mat2a(6,6)-(gYB**2*vd**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*vd**2)/24._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*vd**2)/24._dp
mat2a(6,6) = mat2a(6,6)+(g1**2*vu**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(gYB**2*vu**2)/12._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*vu**2)/24._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*vu**2)/24._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*x1**2)/6._dp
mat2a(6,6) = mat2a(6,6)+(gBL**2*x1**2)/12._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*x1**2)/6._dp
mat2a(6,6) = mat2a(6,6)+(gBY**2*x1**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*x2**2)/6._dp
mat2a(6,6) = mat2a(6,6)-(gBL**2*x2**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*x2**2)/6._dp
mat2a(6,6) = mat2a(6,6)-(gBY**2*x2**2)/12._dp
mat2a(6,6) = mat2a(6,6)+md2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,  & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,       & 
& cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,  & 
& cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,     & 
& cplUSdcUSdVZpVZp,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZDOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSd2(i1)
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,  & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,       & 
& cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,  & 
& cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,     & 
& cplUSdcUSdVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,  & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,       & 
& cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,  & 
& cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,     & 
& cplUSdcUSdVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZDOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSd
 
 
Subroutine Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,               & 
& MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,           & 
& MVWm2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,      & 
& cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,      & 
& cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,          & 
& cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,      & 
& cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm, & 
& cplUSdcUSdVZVZ,cplUSdcUSdVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(7),MChi2(7),MGlu,MGlu2,Mhh(4),Mhh2(4),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSdcUSd(4,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(7,3,6),    & 
& cplChiFdcUSdR(7,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(4,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSdcUSdVZp(6,6),& 
& cplSucUSdVWm(6,6),cplAhAhUSdcUSd(4,4,6,6),cplhhhhUSdcUSd(4,4,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),& 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,6,6,6),cplUSdSvReSvRecUSd(6,6,6,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6),cplUSdcUSdVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Sd, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSd2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplAhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MCha(i2)*Real(SA_B0(p2,MFu2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChaFucUSdL(i2,i1,gO1)
coupR1 = cplChaFucUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChaFucUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChaFucUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fd, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MChi(i2)*Real(SA_B0(p2,MFd2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFdcUSdL(i2,i1,gO1)
coupR1 = cplChiFdcUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFdcUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFdcUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MGlu2,MFd2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFd(i2)*Real(SA_B0(p2,MGlu2,MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFdcUSdL(i2,gO1)
coupR1 = cplGluFdcUSdR(i2,gO1)
coupL2 =  Conjg(cplGluFdcUSdL(i2,gO2))
coupR2 =  Conjg(cplGluFdcUSdR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Sd, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSd2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplhhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Su, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSu2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSucUSd(i2,i1,gO1)
coup2 = Conjg(cplHpmSucUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVG(i2,gO1)
coup2 =  Conjg(cplSdcUSdVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVP(i2,gO1)
coup2 =  Conjg(cplSdcUSdVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZ(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZp(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSdVWm(i2,gO1)
coup2 =  Conjg(cplSucUSdVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSdcHpmcUSd(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSdcUSdcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSecUSdcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSucUSdcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvImSvImcUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvReSvRecUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSd 
 
Subroutine DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,            & 
& MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVZp,MVZp2,MVWm,           & 
& MVWm2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,      & 
& cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,      & 
& cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSdcUSdVZp,cplSucUSdVWm,cplAhAhUSdcUSd,          & 
& cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,      & 
& cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm, & 
& cplUSdcUSdVZVZ,cplUSdcUSdVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(7),MChi2(7),MGlu,MGlu2,Mhh(4),Mhh2(4),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSdcUSd(4,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(7,3,6),    & 
& cplChiFdcUSdR(7,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(4,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSdcUSdVZp(6,6),& 
& cplSucUSdVWm(6,6),cplAhAhUSdcUSd(4,4,6,6),cplhhhhUSdcUSd(4,4,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),& 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,6,6,6),cplUSdSvReSvRecUSd(6,6,6,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6),cplUSdcUSdVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Sd, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplAhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MCha(i2)*Real(SA_DerB0(p2,MFu2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChaFucUSdL(i2,i1,gO1)
coupR1 = cplChaFucUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChaFucUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChaFucUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fd, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MChi(i2)*Real(SA_DerB0(p2,MFd2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFdcUSdL(i2,i1,gO1)
coupR1 = cplChiFdcUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFdcUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFdcUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MGlu2,MFd2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFd(i2)*Real(SA_DerB0(p2,MGlu2,MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFdcUSdL(i2,gO1)
coupR1 = cplGluFdcUSdR(i2,gO1)
coupL2 =  Conjg(cplGluFdcUSdL(i2,gO2))
coupR2 =  Conjg(cplGluFdcUSdR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Sd, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplhhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Su, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSucUSd(i2,i1,gO1)
coup2 = Conjg(cplHpmSucUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVG2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVG(i2,gO1)
coup2 =  Conjg(cplSdcUSdVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVP(i2,gO1)
coup2 =  Conjg(cplSdcUSdVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZ(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZp(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSdVWm(i2,gO1)
coup2 =  Conjg(cplSucUSdVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSdcHpmcUSd(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSdcUSdcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSecUSdcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSucUSdcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvImSvImcUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvReSvRecUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVG2) + 0.25_dp*RXi*SA_DerA0(MVG2*RXi) - 0.5_dp*MVG2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVGVG(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSd 
 
Subroutine OneLoopSu(g1,g2,gBL,gYB,gBY,Mu,Yu,Tu,mq2,mu2,vd,vu,x1,x2,MSu,              & 
& MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,             & 
& MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSe,MSe2,MSvIm,MSvIm2,              & 
& MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,    & 
& cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,       & 
& cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,  & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplUSucUSuVZpVZp,       & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MChi(7),MChi2(7),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: Mu,Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Complex(dp), Intent(in) :: cplAhSucUSu(4,6,6),cplChiFucUSuL(7,3,6),cplChiFucUSuR(7,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(4,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplSucUSuVZp(6,6),cplAhAhUSucUSu(4,4,6,6),cplhhhhUSucUSu(4,4,6,6),    & 
& cplHpmUSucHpmcUSu(2,6,2,6),cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),          & 
& cplUSuSucUSucSu(6,6,6,6),cplUSuSvImSvImcUSu(6,6,6,6),cplUSuSvReSvRecUSu(6,6,6,6),      & 
& cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6),    & 
& cplUSucUSuVZpVZp(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSu'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(g1**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(gBL**2*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)-(gBY**2*x1**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gBL**2*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*x2**2)/12._dp
mat2a(1,1) = mat2a(1,1)+mq2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+mq2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+mq2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-((vd*Mu*Conjg(Yu(1,1)))/sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-((vd*Mu*Conjg(Yu(2,1)))/sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-((vd*Mu*Conjg(Yu(3,1)))/sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(gBL**2*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)-(gBY**2*x1**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gBL**2*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+(gBY**2*x2**2)/12._dp
mat2a(2,2) = mat2a(2,2)+mq2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+mq2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-((vd*Mu*Conjg(Yu(1,2)))/sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-((vd*Mu*Conjg(Yu(2,2)))/sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-((vd*Mu*Conjg(Yu(3,2)))/sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(g1**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(gYB**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g1**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(gYB**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x1**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x2**2)/12._dp
mat2a(3,3) = mat2a(3,3)+mq2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-((vd*Mu*Conjg(Yu(1,3)))/sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-((vd*Mu*Conjg(Yu(2,3)))/sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-((vd*Mu*Conjg(Yu(3,3)))/sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+(g1**2*vd**2)/6._dp
mat2a(4,4) = mat2a(4,4)+(gYB**2*vd**2)/6._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vd**2)/24._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vd**2)/24._dp
mat2a(4,4) = mat2a(4,4)-(g1**2*vu**2)/6._dp
mat2a(4,4) = mat2a(4,4)-(gYB**2*vu**2)/6._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vu**2)/24._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vu**2)/24._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*x1**2)/3._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x1**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*x1**2)/3._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x1**2)/12._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*x2**2)/3._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x2**2)/12._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*x2**2)/3._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x2**2)/12._dp
mat2a(4,4) = mat2a(4,4)+mu2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+mu2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+mu2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)+(g1**2*vd**2)/6._dp
mat2a(5,5) = mat2a(5,5)+(gYB**2*vd**2)/6._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*vd**2)/24._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*vd**2)/24._dp
mat2a(5,5) = mat2a(5,5)-(g1**2*vu**2)/6._dp
mat2a(5,5) = mat2a(5,5)-(gYB**2*vu**2)/6._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*vu**2)/24._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*vu**2)/24._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*x1**2)/3._dp
mat2a(5,5) = mat2a(5,5)+(gBL**2*x1**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*x1**2)/3._dp
mat2a(5,5) = mat2a(5,5)+(gBY**2*x1**2)/12._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*x2**2)/3._dp
mat2a(5,5) = mat2a(5,5)-(gBL**2*x2**2)/12._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*x2**2)/3._dp
mat2a(5,5) = mat2a(5,5)-(gBY**2*x2**2)/12._dp
mat2a(5,5) = mat2a(5,5)+mu2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+mu2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)+(g1**2*vd**2)/6._dp
mat2a(6,6) = mat2a(6,6)+(gYB**2*vd**2)/6._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*vd**2)/24._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*vd**2)/24._dp
mat2a(6,6) = mat2a(6,6)-(g1**2*vu**2)/6._dp
mat2a(6,6) = mat2a(6,6)-(gYB**2*vu**2)/6._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*vu**2)/24._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*vu**2)/24._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*x1**2)/3._dp
mat2a(6,6) = mat2a(6,6)+(gBL**2*x1**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*x1**2)/3._dp
mat2a(6,6) = mat2a(6,6)+(gBY**2*x1**2)/12._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*x2**2)/3._dp
mat2a(6,6) = mat2a(6,6)-(gBL**2*x2**2)/12._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*x2**2)/3._dp
mat2a(6,6) = mat2a(6,6)-(gBY**2*x2**2)/12._dp
mat2a(6,6) = mat2a(6,6)+mu2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,            & 
& cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,   & 
& cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,         & 
& cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,      & 
& cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm, & 
& cplUSucUSuVZVZ,cplUSucUSuVZpVZp,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZUOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSu2(i1)
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,            & 
& cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,   & 
& cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,         & 
& cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,      & 
& cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm, & 
& cplUSucUSuVZVZ,cplUSucUSuVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,            & 
& cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,   & 
& cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,         & 
& cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,      & 
& cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm, & 
& cplUSucUSuVZVZ,cplUSucUSuVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZUOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSu
 
 
Subroutine Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,             & 
& MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,      & 
& cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,   & 
& cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,         & 
& cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,      & 
& cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm, & 
& cplUSucUSuVZVZ,cplUSucUSuVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MChi(7),MChi2(7),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSucUSu(4,6,6),cplChiFucUSuL(7,3,6),cplChiFucUSuR(7,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(4,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplSucUSuVZp(6,6),cplAhAhUSucUSu(4,4,6,6),cplhhhhUSucUSu(4,4,6,6),    & 
& cplHpmUSucHpmcUSu(2,6,2,6),cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),          & 
& cplUSuSucUSucSu(6,6,6,6),cplUSuSvImSvImcUSu(6,6,6,6),cplUSuSvReSvRecUSu(6,6,6,6),      & 
& cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6),    & 
& cplUSucUSuVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Su, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSu2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplAhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MChi(i2)*Real(SA_B0(p2,MFu2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFucUSuL(i2,i1,gO1)
coupR1 = cplChiFucUSuR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFucUSuL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFucUSuR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MFd(i2)*Real(SA_B0(p2,MCha2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcChaFdcUSuL(i1,i2,gO1)
coupR1 = cplcChaFdcUSuR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaFdcUSuL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaFdcUSuR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fu 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MGlu2,MFu2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFu(i2)*Real(SA_B0(p2,MGlu2,MFu2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFucUSuL(i2,gO1)
coupR1 = cplGluFucUSuR(i2,gO1)
coupL2 =  Conjg(cplGluFucUSuL(i2,gO2))
coupR2 =  Conjg(cplGluFucUSuR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Su, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSu2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplhhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcHpmcUSu(i2,i1,gO1)
coup2 = Conjg(cplSdcHpmcUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSucVWm(i2,gO1)
coup2 =  Conjg(cplSdcUSucVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VG, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVG(i2,gO1)
coup2 =  Conjg(cplSucUSuVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVP(i2,gO1)
coup2 =  Conjg(cplSucUSuVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZ(i2,gO1)
coup2 =  Conjg(cplSucUSuVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZp(i2,gO1)
coup2 =  Conjg(cplSucUSuVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSucHpmcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSucSdcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSucSecUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSucUSucSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvImSvImcUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvReSvRecUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSucVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSu 
 
Subroutine DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,          & 
& MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,      & 
& cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,   & 
& cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplSucUSuVZp,cplAhAhUSucUSu,         & 
& cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,      & 
& cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm, & 
& cplUSucUSuVZVZ,cplUSucUSuVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(4),MAh2(4),MFu(3),MFu2(3),MChi(7),MChi2(7),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSucUSu(4,6,6),cplChiFucUSuL(7,3,6),cplChiFucUSuR(7,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(4,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplSucUSuVZp(6,6),cplAhAhUSucUSu(4,4,6,6),cplhhhhUSucUSu(4,4,6,6),    & 
& cplHpmUSucHpmcUSu(2,6,2,6),cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),          & 
& cplUSuSucUSucSu(6,6,6,6),cplUSuSvImSvImcUSu(6,6,6,6),cplUSuSvReSvRecUSu(6,6,6,6),      & 
& cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6),    & 
& cplUSucUSuVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Su, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplAhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MChi(i2)*Real(SA_DerB0(p2,MFu2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFucUSuL(i2,i1,gO1)
coupR1 = cplChiFucUSuR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFucUSuL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFucUSuR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MFd(i2)*Real(SA_DerB0(p2,MCha2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcChaFdcUSuL(i1,i2,gO1)
coupR1 = cplcChaFdcUSuR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaFdcUSuL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaFdcUSuR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fu 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MGlu2,MFu2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFu(i2)*Real(SA_DerB0(p2,MGlu2,MFu2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFucUSuL(i2,gO1)
coupR1 = cplGluFucUSuR(i2,gO1)
coupL2 =  Conjg(cplGluFucUSuL(i2,gO2))
coupR2 =  Conjg(cplGluFucUSuR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Su, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplhhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcHpmcUSu(i2,i1,gO1)
coup2 = Conjg(cplSdcHpmcUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSucVWm(i2,gO1)
coup2 =  Conjg(cplSdcUSucVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VG, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVG2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVG(i2,gO1)
coup2 =  Conjg(cplSucUSuVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVP(i2,gO1)
coup2 =  Conjg(cplSucUSuVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZ(i2,gO1)
coup2 =  Conjg(cplSucUSuVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZp(i2,gO1)
coup2 =  Conjg(cplSucUSuVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSucHpmcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSucSdcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSucSecUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSucUSucSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvImSvImcUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvReSvRecUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVG2) + 0.25_dp*RXi*SA_DerA0(MVG2*RXi) - 0.5_dp*MVG2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVGVG(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSucVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSu 
 
Subroutine OneLoopSe(g1,g2,gBL,gYB,gBY,Mu,Ye,Te,ml2,me2,vd,vu,x1,x2,MSe,              & 
& MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,           & 
& MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSd,MSd2,MSu,MSu2,              & 
& cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,       & 
& cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSecUSeVZp,cplSvImcUSeVWm,     & 
& cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,        & 
& cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe,cplUSecUSeVPVP,  & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(4),MAh2(4),MFv(6),MFv2(6),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSvIm(6),MSvIm2(6),MHpm(2),MHpm2(2),MSvRe(6),          & 
& MSvRe2(6),MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),ml2(3,3),me2(3,3)

Complex(dp), Intent(in) :: cplAhSecUSe(4,6,6),cplFvChacUSeL(6,2,6),cplFvChacUSeR(6,2,6),cplChiFecUSeL(7,3,6),    & 
& cplChiFecUSeR(7,3,6),cplhhSecUSe(4,6,6),cplHpmSvImcUSe(2,6,6),cplHpmSvRecUSe(2,6,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSecUSeVZp(6,6),cplSvImcUSeVWm(6,6),               & 
& cplSvRecUSeVWm(6,6),cplAhAhUSecUSe(4,4,6,6),cplhhhhUSecUSe(4,4,6,6),cplHpmUSecHpmcUSe(2,6,2,6),& 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,6,6,6),cplUSeSvReSvRecUSe(6,6,6,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6),cplUSecUSeVZpVZp(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSe'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBL**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBL**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBY**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-((vu*Mu*Conjg(Ye(1,1)))/sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-((vu*Mu*Conjg(Ye(2,1)))/sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-((vu*Mu*Conjg(Ye(3,1)))/sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBL**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBY**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBL**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBY**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-((vu*Mu*Conjg(Ye(1,2)))/sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-((vu*Mu*Conjg(Ye(2,2)))/sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-((vu*Mu*Conjg(Ye(3,2)))/sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-((vu*Mu*Conjg(Ye(1,3)))/sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-((vu*Mu*Conjg(Ye(2,3)))/sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-((vu*Mu*Conjg(Ye(3,3)))/sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(g1**2*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gYB**2*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(g1**2*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gYB**2*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)+me2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+me2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+me2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(g1**2*vd**2)/4._dp
mat2a(5,5) = mat2a(5,5)-(gYB**2*vd**2)/4._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(g1**2*vu**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gYB**2*vu**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*x1**2)/2._dp
mat2a(5,5) = mat2a(5,5)-(gBL**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*x1**2)/2._dp
mat2a(5,5) = mat2a(5,5)-(gBY**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*x2**2)/2._dp
mat2a(5,5) = mat2a(5,5)+(gBL**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*x2**2)/2._dp
mat2a(5,5) = mat2a(5,5)+(gBY**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)+me2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+me2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(g1**2*vd**2)/4._dp
mat2a(6,6) = mat2a(6,6)-(gYB**2*vd**2)/4._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(g1**2*vu**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gYB**2*vu**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*x1**2)/2._dp
mat2a(6,6) = mat2a(6,6)-(gBL**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*x1**2)/2._dp
mat2a(6,6) = mat2a(6,6)-(gBY**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*x2**2)/2._dp
mat2a(6,6) = mat2a(6,6)+(gBL**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*x2**2)/2._dp
mat2a(6,6) = mat2a(6,6)+(gBY**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)+me2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,               & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,              & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,   & 
& kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZEOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSe2(i1)
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,               & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,              & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,   & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,               & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,              & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,   & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZEOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSe
 
 
Subroutine Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,               & 
& MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,          & 
& MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,    & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,              & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(4),MAh2(4),MFv(6),MFv2(6),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSvIm(6),MSvIm2(6),MHpm(2),MHpm2(2),MSvRe(6),          & 
& MSvRe2(6),MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSecUSe(4,6,6),cplFvChacUSeL(6,2,6),cplFvChacUSeR(6,2,6),cplChiFecUSeL(7,3,6),    & 
& cplChiFecUSeR(7,3,6),cplhhSecUSe(4,6,6),cplHpmSvImcUSe(2,6,6),cplHpmSvRecUSe(2,6,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSecUSeVZp(6,6),cplSvImcUSeVWm(6,6),               & 
& cplSvRecUSeVWm(6,6),cplAhAhUSecUSe(4,4,6,6),cplhhhhUSecUSe(4,4,6,6),cplHpmUSecHpmcUSe(2,6,2,6),& 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,6,6,6),cplUSeSvReSvRecUSe(6,6,6,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6),cplUSecUSeVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Se, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplAhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MCha(i2)*Real(SA_B0(p2,MFv2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplFvChacUSeL(i1,i2,gO1)
coupR1 = cplFvChacUSeR(i1,i2,gO1)
coupL2 =  Conjg(cplFvChacUSeL(i1,i2,gO2))
coupR2 =  Conjg(cplFvChacUSeR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*Real(SA_B0(p2,MFe2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFecUSeL(i2,i1,gO1)
coupR1 = cplChiFecUSeR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFecUSeL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFecUSeR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Se, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplhhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvImcUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvImcUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvRecUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvRecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVP(i2,gO1)
coup2 =  Conjg(cplSecUSeVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZ(i2,gO1)
coup2 =  Conjg(cplSecUSeVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZp(i2,gO1)
coup2 =  Conjg(cplSecUSeVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvIm2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImcUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvImcUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvRe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvRecUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvRecUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSecHpmcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSecSdcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSecUSecSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSucUSecSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvImSvImcUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvReSvRecUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSecVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSe 
 
Subroutine DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,            & 
& MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVZp,MVZp2,          & 
& MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,    & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSecUSeVZp,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,              & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplUSecUSeVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(4),MAh2(4),MFv(6),MFv2(6),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSvIm(6),MSvIm2(6),MHpm(2),MHpm2(2),MSvRe(6),          & 
& MSvRe2(6),MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSecUSe(4,6,6),cplFvChacUSeL(6,2,6),cplFvChacUSeR(6,2,6),cplChiFecUSeL(7,3,6),    & 
& cplChiFecUSeR(7,3,6),cplhhSecUSe(4,6,6),cplHpmSvImcUSe(2,6,6),cplHpmSvRecUSe(2,6,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSecUSeVZp(6,6),cplSvImcUSeVWm(6,6),               & 
& cplSvRecUSeVWm(6,6),cplAhAhUSecUSe(4,4,6,6),cplhhhhUSecUSe(4,4,6,6),cplHpmUSecHpmcUSe(2,6,2,6),& 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,6,6,6),cplUSeSvReSvRecUSe(6,6,6,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6),cplUSecUSeVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Se, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplAhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MCha(i2)*Real(SA_DerB0(p2,MFv2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplFvChacUSeL(i1,i2,gO1)
coupR1 = cplFvChacUSeR(i1,i2,gO1)
coupL2 =  Conjg(cplFvChacUSeL(i1,i2,gO2))
coupR2 =  Conjg(cplFvChacUSeR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*Real(SA_DerB0(p2,MFe2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFecUSeL(i2,i1,gO1)
coupR1 = cplChiFecUSeR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFecUSeL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFecUSeR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Se, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplhhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvImcUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvImcUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvRecUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvRecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVP(i2,gO1)
coup2 =  Conjg(cplSecUSeVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZ(i2,gO1)
coup2 =  Conjg(cplSecUSeVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZp(i2,gO1)
coup2 =  Conjg(cplSecUSeVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImcUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvImcUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvRecUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvRecUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSecHpmcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSecSdcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSecUSecSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSucUSecSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvImSvImcUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvReSvRecUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSecVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSe 
 
Subroutine OneLoopSvIm(g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,Tx,Yv,Tv,ml2,mv2,vd,               & 
& vu,x1,x2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,              & 
& MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd,            & 
& MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,           & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,        & 
& cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,          & 
& cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,      & 
& cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ml2(3,3),mv2(3,3)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(4,6,6),cplAhUSvImSvRe(4,6,6),cplcFeChaUSvImL(3,2,6),cplcFeChaUSvImR(3,2,6),& 
& cplChiFvUSvImL(7,6,6),cplChiFvUSvImR(7,6,6),cplhhUSvImSvIm(4,6,6),cplhhUSvImSvRe(4,6,6),& 
& cplHpmUSvImcSe(2,6,6),cplSeUSvImcVWm(6,6),cplUSvImSvReVP(6,6),cplUSvImSvReVZ(6,6),     & 
& cplUSvImSvReVZp(6,6),cplAhAhUSvImUSvIm(4,4,6,6),cplhhhhUSvImUSvIm(4,4,6,6),            & 
& cplHpmUSvImUSvImcHpm(2,6,6,2),cplSdUSvImUSvImcSd(6,6,6,6),cplSeUSvImUSvImcSe(6,6,6,6), & 
& cplSuUSvImUSvImcSu(6,6,6,6),cplUSvImUSvImSvImSvIm(6,6,6,6),cplUSvImUSvImSvReSvRe(6,6,6,6),& 
& cplUSvImUSvImVPVP(6,6),cplUSvImUSvImcVWmVWm(6,6),cplUSvImUSvImVZVZ(6,6),               & 
& cplUSvImUSvImVZpVZp(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSvIm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBL**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBL**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBY**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)/2._dp
mat2a(1,2) = mat2a(1,2)+ml2(2,1)/2._dp
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)/2._dp
mat2a(1,3) = mat2a(1,3)+ml2(3,1)/2._dp
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vd*Mu*Conjg(Yv(1,1)))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tv(1,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)-(vu*x1*Conjg(Yv(j1,1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)-(vu*x1*Conjg(Yv(j1,1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)-(vu*x1*Conjg(Yx(1,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)-(vu*x1*Conjg(Yx(j1,1))*Yv(j1,1))/4._dp
End Do 
mat2a(1,4) = mat2a(1,4)-(vd*Conjg(Mu)*Yv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vu*Tv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vd*Mu*Conjg(Yv(2,1)))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tv(2,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)-(vu*x1*Conjg(Yv(j1,1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)-(vu*x1*Conjg(Yv(j1,1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)-(vu*x1*Conjg(Yx(2,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)-(vu*x1*Conjg(Yx(j1,2))*Yv(j1,1))/4._dp
End Do 
mat2a(1,5) = mat2a(1,5)-(vd*Conjg(Mu)*Yv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vu*Tv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vd*Mu*Conjg(Yv(3,1)))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tv(3,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)-(vu*x1*Conjg(Yv(j1,1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)-(vu*x1*Conjg(Yv(j1,1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)-(vu*x1*Conjg(Yx(3,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)-(vu*x1*Conjg(Yx(j1,3))*Yv(j1,1))/4._dp
End Do 
mat2a(1,6) = mat2a(1,6)-(vd*Conjg(Mu)*Yv(3,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vu*Tv(3,1))/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBL**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBY**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBL**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBY**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)/2._dp
mat2a(2,3) = mat2a(2,3)+ml2(3,2)/2._dp
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vd*Mu*Conjg(Yv(1,2)))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tv(1,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)-(vu*x1*Conjg(Yv(j1,2))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)-(vu*x1*Conjg(Yv(j1,2))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)-(vu*x1*Conjg(Yx(1,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)-(vu*x1*Conjg(Yx(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(2,4) = mat2a(2,4)-(vd*Conjg(Mu)*Yv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vu*Tv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vd*Mu*Conjg(Yv(2,2)))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tv(2,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)-(vu*x1*Conjg(Yv(j1,2))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)-(vu*x1*Conjg(Yv(j1,2))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)-(vu*x1*Conjg(Yx(2,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)-(vu*x1*Conjg(Yx(j1,2))*Yv(j1,2))/4._dp
End Do 
mat2a(2,5) = mat2a(2,5)-(vd*Conjg(Mu)*Yv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vu*Tv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vd*Mu*Conjg(Yv(3,2)))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tv(3,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)-(vu*x1*Conjg(Yv(j1,2))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)-(vu*x1*Conjg(Yv(j1,2))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)-(vu*x1*Conjg(Yx(3,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)-(vu*x1*Conjg(Yx(j1,3))*Yv(j1,2))/4._dp
End Do 
mat2a(2,6) = mat2a(2,6)-(vd*Conjg(Mu)*Yv(3,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vu*Tv(3,2))/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vd*Mu*Conjg(Yv(1,3)))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tv(1,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)-(vu*x1*Conjg(Yv(j1,3))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)-(vu*x1*Conjg(Yv(j1,3))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)-(vu*x1*Conjg(Yx(1,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)-(vu*x1*Conjg(Yx(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(3,4) = mat2a(3,4)-(vd*Conjg(Mu)*Yv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vu*Tv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vd*Mu*Conjg(Yv(2,3)))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tv(2,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)-(vu*x1*Conjg(Yv(j1,3))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)-(vu*x1*Conjg(Yv(j1,3))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)-(vu*x1*Conjg(Yx(2,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)-(vu*x1*Conjg(Yx(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(3,5) = mat2a(3,5)-(vd*Conjg(Mu)*Yv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vu*Tv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vd*Mu*Conjg(Yv(3,3)))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tv(3,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)-(vu*x1*Conjg(Yv(j1,3))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)-(vu*x1*Conjg(Yv(j1,3))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)-(vu*x1*Conjg(Yx(3,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)-(vu*x1*Conjg(Yx(j1,3))*Yv(j1,3))/4._dp
End Do 
mat2a(3,6) = mat2a(3,6)-(vd*Conjg(Mu)*Yv(3,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vu*Tv(3,3))/(2._dp*sqrt(2._dp))
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(MuP*x2*Conjg(Yx(1,1)))/sqrt(2._dp)
mat2a(4,4) = mat2a(4,4)-((x1*Conjg(Tx(1,1)))/sqrt(2._dp))
mat2a(4,4) = mat2a(4,4)+mv2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(1,j1))*Yx(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(j1,1))*Yx(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
mat2a(4,4) = mat2a(4,4)+(x2*Conjg(MuP)*Yx(1,1))/sqrt(2._dp)
mat2a(4,4) = mat2a(4,4)-((x1*Tx(1,1))/sqrt(2._dp))
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+(MuP*x2*Conjg(Yx(1,2)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(MuP*x2*Conjg(Yx(2,1)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(x1*Conjg(Tx(1,2)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(x1*Conjg(Tx(2,1)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+mv2(1,2)/2._dp
mat2a(4,5) = mat2a(4,5)+mv2(2,1)/2._dp
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(2,j1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,2))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(1,j1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(2,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/4._dp
End Do 
mat2a(4,5) = mat2a(4,5)+(x2*Conjg(MuP)*Yx(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(x2*Conjg(MuP)*Yx(2,1))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(x1*Tx(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(x1*Tx(2,1))/(2._dp*sqrt(2._dp))
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+(MuP*x2*Conjg(Yx(1,3)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(MuP*x2*Conjg(Yx(3,1)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(x1*Conjg(Tx(1,3)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(x1*Conjg(Tx(3,1)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+mv2(1,3)/2._dp
mat2a(4,6) = mat2a(4,6)+mv2(3,1)/2._dp
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(3,j1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,3))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(1,j1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(3,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/4._dp
End Do 
mat2a(4,6) = mat2a(4,6)+(x2*Conjg(MuP)*Yx(1,3))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(x2*Conjg(MuP)*Yx(3,1))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(x1*Tx(1,3))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(x1*Tx(3,1))/(2._dp*sqrt(2._dp))
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(gBL**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)-(gBY**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gBL**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gBY**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(MuP*x2*Conjg(Yx(2,2)))/sqrt(2._dp)
mat2a(5,5) = mat2a(5,5)-((x1*Conjg(Tx(2,2)))/sqrt(2._dp))
mat2a(5,5) = mat2a(5,5)+mv2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(2,j1))*Yx(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(j1,2))*Yx(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,2))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,2))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
mat2a(5,5) = mat2a(5,5)+(x2*Conjg(MuP)*Yx(2,2))/sqrt(2._dp)
mat2a(5,5) = mat2a(5,5)-((x1*Tx(2,2))/sqrt(2._dp))
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+(MuP*x2*Conjg(Yx(2,3)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(MuP*x2*Conjg(Yx(3,2)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(x1*Conjg(Tx(2,3)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(x1*Conjg(Tx(3,2)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+mv2(2,3)/2._dp
mat2a(5,6) = mat2a(5,6)+mv2(3,2)/2._dp
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(3,j1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,3))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(2,j1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,2))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(3,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/4._dp
End Do 
mat2a(5,6) = mat2a(5,6)+(x2*Conjg(MuP)*Yx(2,3))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(x2*Conjg(MuP)*Yx(3,2))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(x1*Tx(2,3))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(x1*Tx(3,2))/(2._dp*sqrt(2._dp))
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(gBL**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)-(gBY**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gBL**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gBY**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(MuP*x2*Conjg(Yx(3,3)))/sqrt(2._dp)
mat2a(6,6) = mat2a(6,6)-((x1*Conjg(Tx(3,3)))/sqrt(2._dp))
mat2a(6,6) = mat2a(6,6)+mv2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(3,j1))*Yx(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(j1,3))*Yx(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,3))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,3))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
mat2a(6,6) = mat2a(6,6)+(x2*Conjg(MuP)*Yx(3,3))/sqrt(2._dp)
mat2a(6,6) = mat2a(6,6)-((x1*Tx(3,3))/sqrt(2._dp))

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR, & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,        & 
& cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,          & 
& cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,      & 
& cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVIOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSvIm2(i1)
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR, & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,        & 
& cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,          & 
& cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,      & 
& cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR, & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,cplAhAhUSvImUSvIm,        & 
& cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,          & 
& cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,cplUSvImUSvImVPVP,      & 
& cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVIOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSvIm
 
 
Subroutine Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,           & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,            & 
& cplcFeChaUSvImR,cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,           & 
& cplHpmUSvImcSe,cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,           & 
& cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,           & 
& cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,     & 
& cplUSvImUSvImVPVP,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(4,6,6),cplAhUSvImSvRe(4,6,6),cplcFeChaUSvImL(3,2,6),cplcFeChaUSvImR(3,2,6),& 
& cplChiFvUSvImL(7,6,6),cplChiFvUSvImR(7,6,6),cplhhUSvImSvIm(4,6,6),cplhhUSvImSvRe(4,6,6),& 
& cplHpmUSvImcSe(2,6,6),cplSeUSvImcVWm(6,6),cplUSvImSvReVP(6,6),cplUSvImSvReVZ(6,6),     & 
& cplUSvImSvReVZp(6,6),cplAhAhUSvImUSvIm(4,4,6,6),cplhhhhUSvImUSvIm(4,4,6,6),            & 
& cplHpmUSvImUSvImcHpm(2,6,6,2),cplSdUSvImUSvImcSd(6,6,6,6),cplSeUSvImUSvImcSe(6,6,6,6), & 
& cplSuUSvImUSvImcSu(6,6,6,6),cplUSvImUSvImSvImSvIm(6,6,6,6),cplUSvImUSvImSvReSvRe(6,6,6,6),& 
& cplUSvImUSvImVPVP(6,6),cplUSvImUSvImcVWmVWm(6,6),cplUSvImUSvImVZVZ(6,6),               & 
& cplUSvImUSvImVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_B0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcFeChaUSvImL(i1,i2,gO1)
coupR1 = cplcFeChaUSvImR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvImL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvImR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_B0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFvUSvImL(i2,i1,gO1)
coupR1 = cplChiFvUSvImR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvImL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvImR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvImcSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvImcSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvImcVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvImcVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VP, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvRe2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVP(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvRe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVZ(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvRe2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVZp(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvImUSvImcHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSvImUSvImcSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvImUSvImcSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSuUSvImUSvImcSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSvIm 
 
Subroutine DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,             & 
& MCha,MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,            & 
& MVZ2,MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,       & 
& cplcFeChaUSvImR,cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,           & 
& cplHpmUSvImcSe,cplSeUSvImcVWm,cplUSvImSvReVP,cplUSvImSvReVZ,cplUSvImSvReVZp,           & 
& cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,           & 
& cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,     & 
& cplUSvImUSvImVPVP,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplUSvImUSvImVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(4,6,6),cplAhUSvImSvRe(4,6,6),cplcFeChaUSvImL(3,2,6),cplcFeChaUSvImR(3,2,6),& 
& cplChiFvUSvImL(7,6,6),cplChiFvUSvImR(7,6,6),cplhhUSvImSvIm(4,6,6),cplhhUSvImSvRe(4,6,6),& 
& cplHpmUSvImcSe(2,6,6),cplSeUSvImcVWm(6,6),cplUSvImSvReVP(6,6),cplUSvImSvReVZ(6,6),     & 
& cplUSvImSvReVZp(6,6),cplAhAhUSvImUSvIm(4,4,6,6),cplhhhhUSvImUSvIm(4,4,6,6),            & 
& cplHpmUSvImUSvImcHpm(2,6,6,2),cplSdUSvImUSvImcSd(6,6,6,6),cplSeUSvImUSvImcSe(6,6,6,6), & 
& cplSuUSvImUSvImcSu(6,6,6,6),cplUSvImUSvImSvImSvIm(6,6,6,6),cplUSvImUSvImSvReSvRe(6,6,6,6),& 
& cplUSvImUSvImVPVP(6,6),cplUSvImUSvImcVWmVWm(6,6),cplUSvImUSvImVZVZ(6,6),               & 
& cplUSvImUSvImVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_DerB0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcFeChaUSvImL(i1,i2,gO1)
coupR1 = cplcFeChaUSvImR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvImL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvImR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_DerB0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFvUSvImL(i2,i1,gO1)
coupR1 = cplChiFvUSvImR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvImL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvImR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvImcSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvImcSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvImcVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvImcVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VP, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVP(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVZ(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImSvReVZp(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvImUSvImcHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSvImUSvImcSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvImUSvImcSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSuUSvImUSvImcSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvImUSvImVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSvIm 
 
Subroutine OneLoopSvRe(g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,Tx,Yv,Tv,ml2,mv2,vd,               & 
& vu,x1,x2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,              & 
& MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd,            & 
& MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,           & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,        & 
& cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,          & 
& cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,      & 
& cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ml2(3,3),mv2(3,3)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSvRe'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBL**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBL**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBY**2*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)/2._dp
mat2a(1,2) = mat2a(1,2)+ml2(2,1)/2._dp
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)/2._dp
mat2a(1,3) = mat2a(1,3)+ml2(3,1)/2._dp
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vd*Mu*Conjg(Yv(1,1)))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tv(1,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)+(vu*x1*Conjg(Yv(j1,1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)+(vu*x1*Conjg(Yv(j1,1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)+(vu*x1*Conjg(Yx(1,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,4) = mat2a(1,4)+(vu*x1*Conjg(Yx(j1,1))*Yv(j1,1))/4._dp
End Do 
mat2a(1,4) = mat2a(1,4)-(vd*Conjg(Mu)*Yv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)+(vu*Tv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vd*Mu*Conjg(Yv(2,1)))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tv(2,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)+(vu*x1*Conjg(Yv(j1,1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)+(vu*x1*Conjg(Yv(j1,1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)+(vu*x1*Conjg(Yx(2,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,5) = mat2a(1,5)+(vu*x1*Conjg(Yx(j1,2))*Yv(j1,1))/4._dp
End Do 
mat2a(1,5) = mat2a(1,5)-(vd*Conjg(Mu)*Yv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)+(vu*Tv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vd*Mu*Conjg(Yv(3,1)))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tv(3,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)+(vu*x1*Conjg(Yv(j1,1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)+(vu*x1*Conjg(Yv(j1,1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)+(vu*x1*Conjg(Yx(3,j1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,6) = mat2a(1,6)+(vu*x1*Conjg(Yx(j1,3))*Yv(j1,1))/4._dp
End Do 
mat2a(1,6) = mat2a(1,6)-(vd*Conjg(Mu)*Yv(3,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)+(vu*Tv(3,1))/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBL**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gBY**2*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBL**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gBY**2*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)/2._dp
mat2a(2,3) = mat2a(2,3)+ml2(3,2)/2._dp
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vd*Mu*Conjg(Yv(1,2)))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tv(1,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)+(vu*x1*Conjg(Yv(j1,2))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)+(vu*x1*Conjg(Yv(j1,2))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)+(vu*x1*Conjg(Yx(1,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,4) = mat2a(2,4)+(vu*x1*Conjg(Yx(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(2,4) = mat2a(2,4)-(vd*Conjg(Mu)*Yv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)+(vu*Tv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vd*Mu*Conjg(Yv(2,2)))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tv(2,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)+(vu*x1*Conjg(Yv(j1,2))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)+(vu*x1*Conjg(Yv(j1,2))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)+(vu*x1*Conjg(Yx(2,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,5) = mat2a(2,5)+(vu*x1*Conjg(Yx(j1,2))*Yv(j1,2))/4._dp
End Do 
mat2a(2,5) = mat2a(2,5)-(vd*Conjg(Mu)*Yv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)+(vu*Tv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vd*Mu*Conjg(Yv(3,2)))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tv(3,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)+(vu*x1*Conjg(Yv(j1,2))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)+(vu*x1*Conjg(Yv(j1,2))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)+(vu*x1*Conjg(Yx(3,j1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,6) = mat2a(2,6)+(vu*x1*Conjg(Yx(j1,3))*Yv(j1,2))/4._dp
End Do 
mat2a(2,6) = mat2a(2,6)-(vd*Conjg(Mu)*Yv(3,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)+(vu*Tv(3,2))/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x1**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x2**2)/4._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vd*Mu*Conjg(Yv(1,3)))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tv(1,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)+(vu*x1*Conjg(Yv(j1,3))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)+(vu*x1*Conjg(Yv(j1,3))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)+(vu*x1*Conjg(Yx(1,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,4) = mat2a(3,4)+(vu*x1*Conjg(Yx(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(3,4) = mat2a(3,4)-(vd*Conjg(Mu)*Yv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)+(vu*Tv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vd*Mu*Conjg(Yv(2,3)))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tv(2,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)+(vu*x1*Conjg(Yv(j1,3))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)+(vu*x1*Conjg(Yv(j1,3))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)+(vu*x1*Conjg(Yx(2,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,5) = mat2a(3,5)+(vu*x1*Conjg(Yx(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(3,5) = mat2a(3,5)-(vd*Conjg(Mu)*Yv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)+(vu*Tv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vd*Mu*Conjg(Yv(3,3)))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tv(3,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)+(vu*x1*Conjg(Yv(j1,3))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)+(vu*x1*Conjg(Yv(j1,3))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)+(vu*x1*Conjg(Yx(3,j1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,6) = mat2a(3,6)+(vu*x1*Conjg(Yx(j1,3))*Yv(j1,3))/4._dp
End Do 
mat2a(3,6) = mat2a(3,6)-(vd*Conjg(Mu)*Yv(3,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)+(vu*Tv(3,3))/(2._dp*sqrt(2._dp))
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vd**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vu**2)/8._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x1**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x2**2)/4._dp
mat2a(4,4) = mat2a(4,4)-((MuP*x2*Conjg(Yx(1,1)))/sqrt(2._dp))
mat2a(4,4) = mat2a(4,4)+(x1*Conjg(Tx(1,1)))/sqrt(2._dp)
mat2a(4,4) = mat2a(4,4)+mv2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(1,j1))*Yx(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(j1,1))*Yx(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
mat2a(4,4) = mat2a(4,4)-((x2*Conjg(MuP)*Yx(1,1))/sqrt(2._dp))
mat2a(4,4) = mat2a(4,4)+(x1*Tx(1,1))/sqrt(2._dp)
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)-(MuP*x2*Conjg(Yx(1,2)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(MuP*x2*Conjg(Yx(2,1)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(x1*Conjg(Tx(1,2)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(x1*Conjg(Tx(2,1)))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+mv2(1,2)/2._dp
mat2a(4,5) = mat2a(4,5)+mv2(2,1)/2._dp
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(2,j1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,2))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(1,j1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(2,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/4._dp
End Do 
mat2a(4,5) = mat2a(4,5)-(x2*Conjg(MuP)*Yx(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)-(x2*Conjg(MuP)*Yx(2,1))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(x1*Tx(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,5) = mat2a(4,5)+(x1*Tx(2,1))/(2._dp*sqrt(2._dp))
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)-(MuP*x2*Conjg(Yx(1,3)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(MuP*x2*Conjg(Yx(3,1)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(x1*Conjg(Tx(1,3)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(x1*Conjg(Tx(3,1)))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+mv2(1,3)/2._dp
mat2a(4,6) = mat2a(4,6)+mv2(3,1)/2._dp
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(3,j1))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,3))*Yx(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(1,j1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(1,j1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(x1**2*Conjg(Yx(j1,1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(3,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/4._dp
End Do 
mat2a(4,6) = mat2a(4,6)-(x2*Conjg(MuP)*Yx(1,3))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)-(x2*Conjg(MuP)*Yx(3,1))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(x1*Tx(1,3))/(2._dp*sqrt(2._dp))
mat2a(4,6) = mat2a(4,6)+(x1*Tx(3,1))/(2._dp*sqrt(2._dp))
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(gYB*gBL*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(g1*gBY*vd**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(gYB*gBL*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)+(g1*gBY*vu**2)/8._dp
mat2a(5,5) = mat2a(5,5)-(gBL**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)-(gBY**2*x1**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gBL**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(gBY**2*x2**2)/4._dp
mat2a(5,5) = mat2a(5,5)-((MuP*x2*Conjg(Yx(2,2)))/sqrt(2._dp))
mat2a(5,5) = mat2a(5,5)+(x1*Conjg(Tx(2,2)))/sqrt(2._dp)
mat2a(5,5) = mat2a(5,5)+mv2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(2,j1))*Yx(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(j1,2))*Yx(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,2))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,2))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
mat2a(5,5) = mat2a(5,5)-((x2*Conjg(MuP)*Yx(2,2))/sqrt(2._dp))
mat2a(5,5) = mat2a(5,5)+(x1*Tx(2,2))/sqrt(2._dp)
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)-(MuP*x2*Conjg(Yx(2,3)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(MuP*x2*Conjg(Yx(3,2)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(x1*Conjg(Tx(2,3)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(x1*Conjg(Tx(3,2)))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+mv2(2,3)/2._dp
mat2a(5,6) = mat2a(5,6)+mv2(3,2)/2._dp
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(3,j1))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,3))*Yx(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(2,j1))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,2))*Yx(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(2,j1))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(x1**2*Conjg(Yx(j1,2))*Yx(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(3,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/4._dp
End Do 
mat2a(5,6) = mat2a(5,6)-(x2*Conjg(MuP)*Yx(2,3))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)-(x2*Conjg(MuP)*Yx(3,2))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(x1*Tx(2,3))/(2._dp*sqrt(2._dp))
mat2a(5,6) = mat2a(5,6)+(x1*Tx(3,2))/(2._dp*sqrt(2._dp))
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(gYB*gBL*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(g1*gBY*vd**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(gYB*gBL*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)+(g1*gBY*vu**2)/8._dp
mat2a(6,6) = mat2a(6,6)-(gBL**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)-(gBY**2*x1**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gBL**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(gBY**2*x2**2)/4._dp
mat2a(6,6) = mat2a(6,6)-((MuP*x2*Conjg(Yx(3,3)))/sqrt(2._dp))
mat2a(6,6) = mat2a(6,6)+(x1*Conjg(Tx(3,3)))/sqrt(2._dp)
mat2a(6,6) = mat2a(6,6)+mv2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(3,j1))*Yx(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(j1,3))*Yx(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(3,j1))*Yx(j1,3))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(x1**2*Conjg(Yx(j1,3))*Yx(j1,3))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
mat2a(6,6) = mat2a(6,6)-((x2*Conjg(MuP)*Yx(3,3))/sqrt(2._dp))
mat2a(6,6) = mat2a(6,6)+(x1*Tx(3,3))/sqrt(2._dp)

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR, & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,        & 
& cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,          & 
& cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,      & 
& cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVROS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSvRe2(i1)
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR, & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,        & 
& cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,          & 
& cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,      & 
& cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,             & 
& MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR, & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,cplAhAhUSvReUSvRe,        & 
& cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,          & 
& cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvReVPVP,      & 
& cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVROS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSvRe
 
 
Subroutine Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,           & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,            & 
& cplcFeChaUSvReR,cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,           & 
& cplHpmUSvRecSe,cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,           & 
& cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,           & 
& cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,     & 
& cplUSvReUSvReVPVP,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplAhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_B0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcFeChaUSvReL(i1,i2,gO1)
coupR1 = cplcFeChaUSvReR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvReL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvReR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_B0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFvUSvReL(i2,i1,gO1)
coupR1 = cplChiFvUSvReR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvReL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvReR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplhhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvRecSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvRecSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvRecVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvRecVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VP, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvIm2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVP(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvIm2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVZ(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSvIm2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVZp(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvReUSvRecHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSvReUSvRecSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvReUSvRecSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSuUSvReUSvRecSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImSvImUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvRecVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSvRe 
 
Subroutine DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,             & 
& MCha,MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,            & 
& MVZ2,MVZp,MVZp2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,       & 
& cplcFeChaUSvReR,cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,           & 
& cplHpmUSvRecSe,cplSeUSvRecVWm,cplSvImUSvReVP,cplSvImUSvReVZ,cplSvImUSvReVZp,           & 
& cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,           & 
& cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,     & 
& cplUSvReUSvReVPVP,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,cplUSvReUSvReVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(6),MSvIm2(6),MAh(4),MAh2(4),MSvRe(6),MSvRe2(6),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(6),MFv2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplAhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_DerB0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcFeChaUSvReL(i1,i2,gO1)
coupR1 = cplcFeChaUSvReR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvReL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvReR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_DerB0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFvUSvReL(i2,i1,gO1)
coupR1 = cplChiFvUSvReR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvReL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvReR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplhhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvRecSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvRecSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvRecVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvRecVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VP, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVP(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVZ(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVZp2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImUSvReVZp(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSvReUSvRecHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSvReUSvRecSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSvReUSvRecSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSuUSvReUSvRecSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImSvImUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvRecVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSvReUSvReVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSvRe 
 
Subroutine OneLoophh(g1,g2,gBL,gYB,gBY,MuP,BMuP,Mu,Bmu,mHd2,mHu2,mC12,mC22,           & 
& vd,vu,x1,x2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,       & 
& cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,   & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,     & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,            & 
& cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,     & 
& cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,      & 
& cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,      & 
& cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,delta,mass,               & 
& mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MVZ,MVZ2,MVZp,MVZp2,MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),           & 
& MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),             & 
& MSvIm2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp), Intent(in) :: MuP,BMuP,Mu,Bmu

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),& 
& cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),   & 
& cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),       & 
& cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),            & 
& cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),    & 
& cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),          & 
& cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),     & 
& cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),     & 
& cplUhhVZVZp(4),cplUhhVZpVZp(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),          & 
& cplUhhUhhHpmcHpm(4,4,2,2),cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),             & 
& cplUhhUhhSucSu(4,4,6,6),cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),         & 
& cplUhhUhhVPVP(4,4),cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(3*g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(3*gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(3*g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+Mu*Conjg(Mu)
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-(g1**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)-(gYB**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)-Bmu/2._dp
mat2a(1,2) = mat2a(1,2)-Conjg(Bmu)/2._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(gYB*gBL*vd*x1)/2._dp
mat2a(1,3) = mat2a(1,3)+(g1*gBY*vd*x1)/2._dp
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(gYB*gBL*vd*x2)/2._dp
mat2a(1,4) = mat2a(1,4)-(g1*gBY*vd*x2)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(3*g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(3*gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(3*g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+Mu*Conjg(Mu)
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(gYB*gBL*vu*x1)/2._dp
mat2a(2,3) = mat2a(2,3)-(g1*gBY*vu*x1)/2._dp
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)+(gYB*gBL*vu*x2)/2._dp
mat2a(2,4) = mat2a(2,4)+(g1*gBY*vu*x2)/2._dp
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+mC12
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vd**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vd**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vu**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vu**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(3*gBL**2*x1**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(3*gBY**2*x1**2)/2._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x2**2)/2._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x2**2)/2._dp
mat2a(3,3) = mat2a(3,3)+MuP*Conjg(MuP)
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(gBL**2*x1*x2)
mat2a(3,4) = mat2a(3,4)-(gBY**2*x1*x2)
mat2a(3,4) = mat2a(3,4)-BMuP/2._dp
mat2a(3,4) = mat2a(3,4)-Conjg(BMuP)/2._dp
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+mC22
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(3*gBL**2*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(3*gBY**2*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+MuP*Conjg(MuP)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,          & 
& cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,    & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,       & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,       & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,         & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,        & 
& kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,          & 
& cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,    & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,       & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,       & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,         & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,        & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,          & 
& cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,    & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,       & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,       & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,         & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,        & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,MChi2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,          & 
& cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,    & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,       & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,cplUhhVPVZp,       & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,         & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MVZ,MVZ2,MVZp,MVZp2,MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),           & 
& MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),             & 
& MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),& 
& cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),   & 
& cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),       & 
& cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),            & 
& cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),    & 
& cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),          & 
& cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),     & 
& cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),     & 
& cplUhhVZVZp(4),cplUhhVZpVZp(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),          & 
& cplUhhUhhHpmcHpm(4,4,2,2),cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),             & 
& cplUhhUhhSucSu(4,4,6,6),cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),         & 
& cplUhhUhhVPVP(4,4),cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZp2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZp(i2,gO1)
coup2 =  Conjg(cplAhUhhVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcChaChaUhhL(i1,i2,gO1)
coupR1 = cplcChaChaUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplChiChiUhhL(i1,i2,gO1)
coupR1 = cplChiChiUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWmgWmUhh(gO1)
coup2 =  cplcgWmgWmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWpCgWpCUhh(gO1)
coup2 =  cplcgWpCgWpCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZp], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZp2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUhhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUhhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUhhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUhhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUhhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUhhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZp(gO1)
coup2 =  Conjg(cplUhhVPVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWm2,MVWm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWmVWm(gO1)
coup2 =  Conjg(cplUhhcVWmVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZp(gO1)
coup2 =  Conjg(cplUhhVZVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZp2,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZpVZp(gO1)
coup2 =  Conjg(cplUhhVZpVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MCha,MCha2,MChi,              & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhVP,            & 
& cplAhUhhVZ,cplAhUhhVZp,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,      & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,        & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,         & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhVPVZ,       & 
& cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,           & 
& cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,      & 
& cplUhhUhhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MVZ,MVZ2,MVZp,MVZp2,MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),           & 
& MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),             & 
& MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),& 
& cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),   & 
& cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),       & 
& cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),            & 
& cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),    & 
& cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),          & 
& cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),     & 
& cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),     & 
& cplUhhVZVZp(4),cplUhhVZpVZp(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),          & 
& cplUhhUhhHpmcHpm(4,4,2,2),cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),             & 
& cplUhhUhhSucSu(4,4,6,6),cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),         & 
& cplUhhUhhVPVP(4,4),cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVP2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVZp2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZp(i2,gO1)
coup2 =  Conjg(cplAhUhhVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcChaChaUhhL(i1,i2,gO1)
coupR1 = cplcChaChaUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplChiChiUhhL(i1,i2,gO1)
coupR1 = cplChiChiUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWmgWmUhh(gO1)
coup2 =  cplcgWmgWmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWpCgWpCUhh(gO1)
coup2 =  cplcgWpCgWpCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZp], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZp2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUhhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUhhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUhhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUhhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUhhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUhhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVP2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVP2,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZp(gO1)
coup2 =  Conjg(cplUhhVPVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWm2,MVWm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWmVWm(gO1)
coup2 =  Conjg(cplUhhcVWmVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZp(gO1)
coup2 =  Conjg(cplUhhVZVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZp2,MVZp2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZpVZp(gO1)
coup2 =  Conjg(cplUhhVZpVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1Loophh 
 
Subroutine OneLoopAh(g1,g2,gBL,gYB,gBY,MuP,BMuP,Mu,Bmu,mHd2,mHu2,mC12,mC22,           & 
& vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,  & 
& cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,       & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,             & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,      & 
& cplUAhUAhVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2,TW,TWp

Complex(dp), Intent(in) :: MuP,BMuP,Mu,Bmu

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplcChaChaUAhL(2,2,4),cplcChaChaUAhR(2,2,4),cplChiChiUAhL(7,7,4),   & 
& cplChiChiUAhR(7,7,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),cplcFeFeUAhL(3,3,4),      & 
& cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplFvFvUAhL(6,6,4),        & 
& cplFvFvUAhR(6,6,4),cplcgWmgWmUAh(4),cplcgWpCgWpCUAh(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),& 
& cplUAhhhVZp(4,4),cplUAhHpmcHpm(4,2,2),cplUAhHpmcVWm(4,2),cplUAhSdcSd(4,6,6),           & 
& cplUAhSecSe(4,6,6),cplUAhSucSu(4,6,6),cplUAhSvImSvIm(4,6,6),cplUAhSvImSvRe(4,6,6),     & 
& cplUAhSvReSvRe(4,6,6),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,2,2),& 
& cplUAhUAhSdcSd(4,4,6,6),cplUAhUAhSecSe(4,4,6,6),cplUAhUAhSucSu(4,4,6,6),               & 
& cplUAhUAhSvImSvIm(4,4,6,6),cplUAhUAhSvReSvRe(4,4,6,6),cplUAhUAhVPVP(4,4),              & 
& cplUAhUAhcVWmVWm(4,4),cplUAhUAhVZVZ(4,4),cplUAhUAhVZpVZp(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+Mu*Conjg(Mu)
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2*Cos(TWp)**2*RXiZp)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*vd**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*g2*vd**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(gYB*g2*vd**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)-(g1*gYB*vd**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1*gYB*vd**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2*RXiZ*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*vd**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+Bmu/2._dp
mat2a(1,2) = mat2a(1,2)+Conjg(Bmu)/2._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat2a(1,2) = mat2a(1,2)-(gYB**2*vd*vu*Cos(TWp)**2*RXiZp)/4._dp
mat2a(1,2) = mat2a(1,2)-(g1*g2*vd*vu*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,2) = mat2a(1,2)-(g1**2*vd*vu*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,2) = mat2a(1,2)+(gYB*g2*vd*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)-(gYB*g2*vd*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)+(g1*gYB*vd*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)-(g1*gYB*vd*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)-(gYB**2*vd*vu*RXiZ*Sin(TWp)**2)/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat2a(1,2) = mat2a(1,2)-(g1*g2*vd*vu*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,2) = mat2a(1,2)-(g1**2*vd*vu*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(gYB*gBL*vd*x1*Cos(TWp)**2*RXiZp)/2._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBY*vd*x1*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,3) = mat2a(1,3)+(g1*gBY*vd*x1*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat2a(1,3) = mat2a(1,3)-(g2*gBL*vd*x1*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vd*x1*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)-(g1*gBL*vd*x1*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)-(gYB*gBY*vd*x1*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)+(g1*gBL*vd*x1*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)+(gYB*gBY*vd*x1*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,3) = mat2a(1,3)+(gYB*gBL*vd*x1*RXiZ*Sin(TWp)**2)/2._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBY*vd*x1*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,3) = mat2a(1,3)+(g1*gBY*vd*x1*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(gYB*gBL*vd*x2*Cos(TWp)**2*RXiZp)/2._dp
mat2a(1,4) = mat2a(1,4)-(g2*gBY*vd*x2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,4) = mat2a(1,4)-(g1*gBY*vd*x2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat2a(1,4) = mat2a(1,4)+(g2*gBL*vd*x2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)-(g2*gBL*vd*x2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)+(g1*gBL*vd*x2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)+(gYB*gBY*vd*x2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)-(g1*gBL*vd*x2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)-(gYB*gBY*vd*x2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,4) = mat2a(1,4)-(gYB*gBL*vd*x2*RXiZ*Sin(TWp)**2)/2._dp
mat2a(1,4) = mat2a(1,4)-(g2*gBY*vd*x2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,4) = mat2a(1,4)-(g1*gBY*vd*x2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+Mu*Conjg(Mu)
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2*Cos(TWp)**2*RXiZp)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*g2*vu**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(gYB*g2*vu**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(2,2) = mat2a(2,2)+(gYB*g2*vu**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(2,2) = mat2a(2,2)-(g1*gYB*vu**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,2) = mat2a(2,2)+(g1*gYB*vu**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2*RXiZ*Sin(TWp)**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*g2*vu**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(gYB*gBL*vu*x1*Cos(TWp)**2*RXiZp)/2._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBY*vu*x1*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(2,3) = mat2a(2,3)-(g1*gBY*vu*x1*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat2a(2,3) = mat2a(2,3)+(g2*gBL*vu*x1*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vu*x1*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)+(g1*gBL*vu*x1*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)+(gYB*gBY*vu*x1*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)-(g1*gBL*vu*x1*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)-(gYB*gBY*vu*x1*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,3) = mat2a(2,3)-(gYB*gBL*vu*x1*RXiZ*Sin(TWp)**2)/2._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBY*vu*x1*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(2,3) = mat2a(2,3)-(g1*gBY*vu*x1*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)+(gYB*gBL*vu*x2*Cos(TWp)**2*RXiZp)/2._dp
mat2a(2,4) = mat2a(2,4)+(g2*gBY*vu*x2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(2,4) = mat2a(2,4)+(g1*gBY*vu*x2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat2a(2,4) = mat2a(2,4)-(g2*gBL*vu*x2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)+(g2*gBL*vu*x2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)-(g1*gBL*vu*x2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)-(gYB*gBY*vu*x2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)+(g1*gBL*vu*x2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)+(gYB*gBY*vu*x2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(2,4) = mat2a(2,4)+(gYB*gBL*vu*x2*RXiZ*Sin(TWp)**2)/2._dp
mat2a(2,4) = mat2a(2,4)+(g2*gBY*vu*x2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(2,4) = mat2a(2,4)+(g1*gBY*vu*x2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+mC12
mat2a(3,3) = mat2a(3,3)+(gYB*gBL*vd**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(g1*gBY*vd**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(gYB*gBL*vu**2)/4._dp
mat2a(3,3) = mat2a(3,3)-(g1*gBY*vu**2)/4._dp
mat2a(3,3) = mat2a(3,3)+(gBL**2*x1**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(gBY**2*x1**2)/2._dp
mat2a(3,3) = mat2a(3,3)-(gBL**2*x2**2)/2._dp
mat2a(3,3) = mat2a(3,3)-(gBY**2*x2**2)/2._dp
mat2a(3,3) = mat2a(3,3)+MuP*Conjg(MuP)
mat2a(3,3) = mat2a(3,3)+gBL**2*x1**2*Cos(TWp)**2*RXiZp
mat2a(3,3) = mat2a(3,3)+gBY**2*x1**2*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat2a(3,3) = mat2a(3,3)-2*gBL*gBY*x1**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat2a(3,3) = mat2a(3,3)+2*gBL*gBY*x1**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(3,3) = mat2a(3,3)+gBL**2*x1**2*RXiZ*Sin(TWp)**2
mat2a(3,3) = mat2a(3,3)+gBY**2*x1**2*RXiZp*Sin(TW)**2*Sin(TWp)**2
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)+BMuP/2._dp
mat2a(3,4) = mat2a(3,4)+Conjg(BMuP)/2._dp
mat2a(3,4) = mat2a(3,4)-(gBL**2*x1*x2*Cos(TWp)**2*RXiZp)
mat2a(3,4) = mat2a(3,4)-(gBY**2*x1*x2*Cos(TWp)**2*RXiZ*Sin(TW)**2)
mat2a(3,4) = mat2a(3,4)+2*gBL*gBY*x1*x2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat2a(3,4) = mat2a(3,4)-2*gBL*gBY*x1*x2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(3,4) = mat2a(3,4)-(gBL**2*x1*x2*RXiZ*Sin(TWp)**2)
mat2a(3,4) = mat2a(3,4)-(gBY**2*x1*x2*RXiZp*Sin(TW)**2*Sin(TWp)**2)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+mC22
mat2a(4,4) = mat2a(4,4)-(gYB*gBL*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(g1*gBY*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(gYB*gBL*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(g1*gBY*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)-(gBL**2*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)-(gBY**2*x1**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(gBL**2*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+(gBY**2*x2**2)/2._dp
mat2a(4,4) = mat2a(4,4)+MuP*Conjg(MuP)
mat2a(4,4) = mat2a(4,4)+gBL**2*x2**2*Cos(TWp)**2*RXiZp
mat2a(4,4) = mat2a(4,4)+gBY**2*x2**2*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat2a(4,4) = mat2a(4,4)-2*gBL*gBY*x2**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat2a(4,4) = mat2a(4,4)+2*gBL*gBY*x2**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(4,4) = mat2a(4,4)+gBL**2*x2**2*RXiZ*Sin(TWp)**2
mat2a(4,4) = mat2a(4,4)+gBY**2*x2**2*RXiZp*Sin(TW)**2*Sin(TWp)**2

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,  & 
& cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,       & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,             & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,      & 
& cplUAhUAhVZpVZp,kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,  & 
& cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,       & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,             & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,      & 
& cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,  & 
& cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,       & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,             & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,      & 
& cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,            & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,         & 
& cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,      & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,            & 
& cplUAhUAhSucSu,cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,     & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplcChaChaUAhL(2,2,4),cplcChaChaUAhR(2,2,4),cplChiChiUAhL(7,7,4),   & 
& cplChiChiUAhR(7,7,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),cplcFeFeUAhL(3,3,4),      & 
& cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplFvFvUAhL(6,6,4),        & 
& cplFvFvUAhR(6,6,4),cplcgWmgWmUAh(4),cplcgWpCgWpCUAh(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),& 
& cplUAhhhVZp(4,4),cplUAhHpmcHpm(4,2,2),cplUAhHpmcVWm(4,2),cplUAhSdcSd(4,6,6),           & 
& cplUAhSecSe(4,6,6),cplUAhSucSu(4,6,6),cplUAhSvImSvIm(4,6,6),cplUAhSvImSvRe(4,6,6),     & 
& cplUAhSvReSvRe(4,6,6),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,2,2),& 
& cplUAhUAhSdcSd(4,4,6,6),cplUAhUAhSecSe(4,4,6,6),cplUAhUAhSucSu(4,4,6,6),               & 
& cplUAhUAhSvImSvIm(4,4,6,6),cplUAhUAhSvReSvRe(4,4,6,6),cplUAhUAhVPVP(4,4),              & 
& cplUAhUAhcVWmVWm(4,4),cplUAhUAhVZVZ(4,4),cplUAhUAhVZpVZp(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcChaChaUAhL(i1,i2,gO1)
coupR1 = cplcChaChaUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplChiChiUAhL(i1,i2,gO1)
coupR1 = cplChiChiUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWmgWmUAh(gO1)
coup2 =  cplcgWmgWmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWpCgWpCUAh(gO1)
coup2 =  cplcgWpCgWpCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZp2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZp(gO1,i2)
coup2 =  Conjg(cplUAhhhVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUAhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUAhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUAhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUAhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUAhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUAhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,             & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhhh,cplcChaChaUAhL,        & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpmcHpm,cplUAhHpmcVWm,         & 
& cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,      & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,            & 
& cplUAhUAhSucSu,cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,     & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplcChaChaUAhL(2,2,4),cplcChaChaUAhR(2,2,4),cplChiChiUAhL(7,7,4),   & 
& cplChiChiUAhR(7,7,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),cplcFeFeUAhL(3,3,4),      & 
& cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplFvFvUAhL(6,6,4),        & 
& cplFvFvUAhR(6,6,4),cplcgWmgWmUAh(4),cplcgWpCgWpCUAh(4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),& 
& cplUAhhhVZp(4,4),cplUAhHpmcHpm(4,2,2),cplUAhHpmcVWm(4,2),cplUAhSdcSd(4,6,6),           & 
& cplUAhSecSe(4,6,6),cplUAhSucSu(4,6,6),cplUAhSvImSvIm(4,6,6),cplUAhSvImSvRe(4,6,6),     & 
& cplUAhSvReSvRe(4,6,6),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,2,2),& 
& cplUAhUAhSdcSd(4,4,6,6),cplUAhUAhSecSe(4,4,6,6),cplUAhUAhSucSu(4,4,6,6),               & 
& cplUAhUAhSvImSvIm(4,4,6,6),cplUAhUAhSvReSvRe(4,4,6,6),cplUAhUAhVPVP(4,4),              & 
& cplUAhUAhcVWmVWm(4,4),cplUAhUAhVZVZ(4,4),cplUAhUAhVZpVZp(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcChaChaUAhL(i1,i2,gO1)
coupR1 = cplcChaChaUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplChiChiUAhL(i1,i2,gO1)
coupR1 = cplChiChiUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWmgWmUAh(gO1)
coup2 =  cplcgWmgWmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWpCgWpCUAh(gO1)
coup2 =  cplcgWpCgWpCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVP2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVZp2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZp(gO1,i2)
coup2 =  Conjg(cplUAhhhVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUAhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUAhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUAhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUAhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUAhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUAhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopAh 
 
Subroutine OneLoopHpm(g1,g2,gBL,gYB,gBY,Mu,Bmu,mHd2,mHu2,vd,vu,x1,x2,MHpm,            & 
& MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,            & 
& MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,              & 
& MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,         & 
& cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,              & 
& cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,           & 
& cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,            & 
& cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm,              & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,          & 
& cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,             & 
& cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,        & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MVWm,MVWm2,MChi(7),MChi2(7),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),            & 
& MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),MSe(6),           & 
& MSe2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,mHd2,mHu2,vd,vu,x1,x2

Complex(dp), Intent(in) :: Mu,Bmu

Complex(dp), Intent(in) :: cplAhHpmcUHpm(4,2,2),cplAhcUHpmVWm(4,2),cplChiChacUHpmL(7,2,2),cplChiChacUHpmR(7,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(6,3,2),cplFvFecUHpmR(6,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgZpgWmcUHpm(2),cplcgWmgZpUHpm(2),               & 
& cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),cplcgWpCgZpcUHpm(2),cplcgZpgWpCUHpm(2),           & 
& cplhhHpmcUHpm(4,2,2),cplhhcUHpmVWm(4,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplHpmcUHpmVZp(2,2),cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,6,2),cplSeSvRecUHpm(6,6,2),  & 
& cplcUHpmVPVWm(2),cplcUHpmVWmVZ(2),cplcUHpmVWmVZp(2),cplAhAhUHpmcUHpm(4,4,2,2),         & 
& cplhhhhUHpmcUHpm(4,4,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),cplUHpmSdcUHpmcSd(2,6,2,6),     & 
& cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),cplUHpmSvImSvImcUHpm(2,6,6,2),   & 
& cplUHpmSvReSvRecUHpm(2,6,6,2),cplUHpmcUHpmVPVP(2,2),cplUHpmcUHpmcVWmVWm(2,2),          & 
& cplUHpmcUHpmVZVZ(2,2),cplUHpmcUHpmVZpVZp(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHpm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(gYB**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(gYB*gBL*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*x1**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gYB*gBL*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*x2**2)/4._dp
mat2a(1,1) = mat2a(1,1)+Mu*Conjg(Mu)
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*RXiWm)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(g2**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)+Conjg(Bmu)
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*RXiWm)/4._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(gYB**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(gYB*gBL*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)-(g1*gBY*x1**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(gYB*gBL*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*gBY*x2**2)/4._dp
mat2a(2,2) = mat2a(2,2)+Mu*Conjg(Mu)
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*RXiWm)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,               & 
& cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,           & 
& cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,         & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm, & 
& cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MHpm2(i1)
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,               & 
& cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,           & 
& cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,         & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm, & 
& cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,               & 
& cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,           & 
& cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,         & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm, & 
& cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHpm
 
 
Subroutine Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,              & 
& MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,            & 
& MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,          & 
& cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,           & 
& cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,         & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm, & 
& cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MVWm,MVWm2,MChi(7),MChi2(7),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),            & 
& MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),MSe(6),           & 
& MSe2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhHpmcUHpm(4,2,2),cplAhcUHpmVWm(4,2),cplChiChacUHpmL(7,2,2),cplChiChacUHpmR(7,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(6,3,2),cplFvFecUHpmR(6,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgZpgWmcUHpm(2),cplcgWmgZpUHpm(2),               & 
& cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),cplcgWpCgZpcUHpm(2),cplcgZpgWpCUHpm(2),           & 
& cplhhHpmcUHpm(4,2,2),cplhhcUHpmVWm(4,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplHpmcUHpmVZp(2,2),cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,6,2),cplSeSvRecUHpm(6,6,2),  & 
& cplcUHpmVPVWm(2),cplcUHpmVWmVZ(2),cplcUHpmVWmVZp(2),cplAhAhUHpmcUHpm(4,4,2,2),         & 
& cplhhhhUHpmcUHpm(4,4,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),cplUHpmSdcUHpmcSd(2,6,2,6),     & 
& cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),cplUHpmSvImSvImcUHpm(2,6,6,2),   & 
& cplUHpmSvReSvRecUHpm(2,6,6,2),cplUHpmcUHpmVPVP(2,2),cplUHpmcUHpmcVWmVWm(2,2),          & 
& cplUHpmcUHpmVZVZ(2,2),cplUHpmcUHpmVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MCha(i2)*Real(SA_B0(p2,MChi2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplChiChacUHpmL(i1,i2,gO1)
coupR1 = cplChiChacUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChacUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChacUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFecUHpmL(i1,i2,gO1)
coupR1 = cplFvFecUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFecUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFecUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgWmcUHpm(gO1)
coup2 =  cplcgWmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgWmcUHpm(gO1)
coup2 =  cplcgWmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZcUHpm(gO1)
coup2 =  cplcgZgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZp2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZpcUHpm(gO1)
coup2 =  cplcgZpgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZp(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSdcUHpmcSu(i2,gO1,i1)
coup2 = Conjg(cplSdcUHpmcSu(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvImcUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvImcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvRecUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvRecUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVPVWm(gO1)
coup2 =  Conjg(cplcUHpmVPVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWm2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWm2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZp(gO1)
coup2 =  Conjg(cplcUHpmVWmVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSdcUHpmcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSecUHpmcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSucUHpmcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvImSvImcUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvReSvRecUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHpm 
 
Subroutine DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,           & 
& MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSu,            & 
& MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,          & 
& cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,           & 
& cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgZpgWmcUHpm,cplcgWmgZpUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplcgWpCgZpcUHpm,cplcgZpgWpCUHpm,cplhhHpmcUHpm,         & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZp,cplSdcUHpmcSu,cplSeSvImcUHpm, & 
& cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplcUHpmVWmVZp,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MVWm,MVWm2,MChi(7),MChi2(7),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),            & 
& MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),MSe(6),           & 
& MSe2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhHpmcUHpm(4,2,2),cplAhcUHpmVWm(4,2),cplChiChacUHpmL(7,2,2),cplChiChacUHpmR(7,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(6,3,2),cplFvFecUHpmR(6,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgZpgWmcUHpm(2),cplcgWmgZpUHpm(2),               & 
& cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),cplcgWpCgZpcUHpm(2),cplcgZpgWpCUHpm(2),           & 
& cplhhHpmcUHpm(4,2,2),cplhhcUHpmVWm(4,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplHpmcUHpmVZp(2,2),cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,6,2),cplSeSvRecUHpm(6,6,2),  & 
& cplcUHpmVPVWm(2),cplcUHpmVWmVZ(2),cplcUHpmVWmVZp(2),cplAhAhUHpmcUHpm(4,4,2,2),         & 
& cplhhhhUHpmcUHpm(4,4,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),cplUHpmSdcUHpmcSd(2,6,2,6),     & 
& cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),cplUHpmSvImSvImcUHpm(2,6,6,2),   & 
& cplUHpmSvReSvRecUHpm(2,6,6,2),cplUHpmcUHpmVPVP(2,2),cplUHpmcUHpmcVWmVWm(2,2),          & 
& cplUHpmcUHpmVZVZ(2,2),cplUHpmcUHpmVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MCha(i2)*Real(SA_DerB0(p2,MChi2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplChiChacUHpmL(i1,i2,gO1)
coupR1 = cplChiChacUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChacUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChacUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFecUHpmL(i1,i2,gO1)
coupR1 = cplFvFecUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFecUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFecUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgWmcUHpm(gO1)
coup2 =  cplcgWmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgWmcUHpm(gO1)
coup2 =  cplcgWmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZcUHpm(gO1)
coup2 =  cplcgZgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZp2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZpcUHpm(gO1)
coup2 =  cplcgZpgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVP2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZp(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSdcUHpmcSu(i2,gO1,i1)
coup2 = Conjg(cplSdcUHpmcSu(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvImcUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvImcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvRecUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvRecUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVP2,MVWm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVPVWm(gO1)
coup2 =  Conjg(cplcUHpmVPVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWm2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWm2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZp(gO1)
coup2 =  Conjg(cplcUHpmVWmVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSdcUHpmcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSecUHpmcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSucUHpmcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvImSvImcUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvReSvRecUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZpVZp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopHpm 
 
Subroutine OneLoopChi(g1,g2,gBL,gYB,gBY,MuP,Mu,M1,M2,MBp,MBBp,vd,vu,x1,               & 
& x2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,MSvIm,MSvIm2,         & 
& MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,     & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVPL,             & 
& cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,cplUChiChiVZpR,               & 
& cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,   & 
& cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,           & 
& cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,               & 
& cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,delta,MChi_1L,             & 
& MChi2_1L,ZN_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MChi(7),MChi2(7),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),         & 
& MSe2(6),MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(6),MSvIm2(6),               & 
& MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2

Complex(dp), Intent(in) :: MuP,Mu,M1,M2,MBp,MBBp

Complex(dp), Intent(in) :: cplUChiChiAhL(7,7,4),cplUChiChiAhR(7,7,4),cplUChiChacHpmL(7,2,2),cplUChiChacHpmR(7,2,2),& 
& cplUChiChacVWmL(7,2),cplUChiChacVWmR(7,2),cplUChiChihhL(7,7,4),cplUChiChihhR(7,7,4),   & 
& cplUChiChiVPL(7,7),cplUChiChiVPR(7,7),cplUChiChiVZL(7,7),cplUChiChiVZR(7,7),           & 
& cplUChiChiVZpL(7,7),cplUChiChiVZpR(7,7),cplUChiFdcSdL(7,3,6),cplUChiFdcSdR(7,3,6),     & 
& cplUChiFecSeL(7,3,6),cplUChiFecSeR(7,3,6),cplUChiFucSuL(7,3,6),cplUChiFucSuR(7,3,6),   & 
& cplUChiFvSvImL(7,6,6),cplUChiFvSvImR(7,6,6),cplUChiFvSvReL(7,6,6),cplUChiFvSvReR(7,6,6),& 
& cplcChaUChiHpmL(2,7,2),cplcChaUChiHpmR(2,7,2),cplcFdUChiSdL(3,7,6),cplcFdUChiSdR(3,7,6),& 
& cplcFeUChiSeL(3,7,6),cplcFeUChiSeR(3,7,6),cplcFuUChiSuL(3,7,6),cplcFuUChiSuR(3,7,6),   & 
& cplcChaUChiVWmL(2,7),cplcChaUChiVWmR(2,7)

Complex(dp) :: mat1a(7,7), mat1(7,7), mat2(7,7) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(7), test_m2(7),p2 
Real(dp), Intent(out) :: MChi_1L(7),MChi2_1L(7) 
Complex(dp), Intent(out) ::  ZN_1L(7,7) 
Real(dp) :: MChi_t(7),MChi2_t(7) 
Complex(dp) ::  ZN_t(7,7) 
Complex(dp) ::  phaseM, E7(7), sigL(7,7), sigR(7,7), sigSL(7,7), sigSR(7,7) 
Real(dp) :: ZNa(7,7), test(2), eig(7) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMChi'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+M1
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-(g1*vd)/2._dp
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(g1*vu)/2._dp
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+MBBp
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)-(gBY*x1)
mat1a(1,7) = 0._dp 
mat1a(1,7) = mat1a(1,7)+gBY*x2
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+M2
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(g2*vd)/2._dp
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)-(g2*vu)/2._dp
mat1a(2,5) = 0._dp 
mat1a(2,6) = 0._dp 
mat1a(2,7) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-(g1*vd)/2._dp
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(g2*vd)/2._dp
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)-1._dp*(Mu)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)-(gYB*vd)/2._dp
mat1a(3,6) = 0._dp 
mat1a(3,7) = 0._dp 
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(g1*vu)/2._dp
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)-(g2*vu)/2._dp
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)-1._dp*(Mu)
mat1a(4,4) = 0._dp 
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+(gYB*vu)/2._dp
mat1a(4,6) = 0._dp 
mat1a(4,7) = 0._dp 
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+MBBp
mat1a(5,2) = 0._dp 
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)-(gYB*vd)/2._dp
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+(gYB*vu)/2._dp
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+MBp
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)-(gBL*x1)
mat1a(5,7) = 0._dp 
mat1a(5,7) = mat1a(5,7)+gBL*x2
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)-(gBY*x1)
mat1a(6,2) = 0._dp 
mat1a(6,3) = 0._dp 
mat1a(6,4) = 0._dp 
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)-(gBL*x1)
mat1a(6,6) = 0._dp 
mat1a(6,7) = 0._dp 
mat1a(6,7) = mat1a(6,7)-1._dp*(MuP)
mat1a(7,1) = 0._dp 
mat1a(7,1) = mat1a(7,1)+gBY*x2
mat1a(7,2) = 0._dp 
mat1a(7,3) = 0._dp 
mat1a(7,4) = 0._dp 
mat1a(7,5) = 0._dp 
mat1a(7,5) = mat1a(7,5)+gBL*x2
mat1a(7,6) = 0._dp 
mat1a(7,6) = mat1a(7,6)-1._dp*(MuP)
mat1a(7,7) = 0._dp 

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,             & 
& MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,               & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVPL,cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,  & 
& cplUChiChiVZpR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,  & 
& cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,             & 
& cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,             & 
& cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,             & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,7
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,6
  Do i2=i1+1,7
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E7 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E7
    End If 
   End Do 
End Do 
 
ZNOS_0 = ZN_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,7
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_0 = ZN_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=7,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MChi2(il)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,             & 
& MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,               & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVPL,cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,  & 
& cplUChiChiVZpR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,  & 
& cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,             & 
& cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,             & 
& cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,             & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,7
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,6
  Do i2=i1+1,7
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E7 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E7
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
ZNOS_p2(il,:) = ZN_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,7
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_p2(il,:) = ZN_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MChi2_1L(iL)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,             & 
& MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,               & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVPL,cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,  & 
& cplUChiChiVZpR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,  & 
& cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,             & 
& cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,             & 
& cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,             & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,7
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,6
  Do i2=i1+1,7
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E7 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E7
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
ZNOS_p2(il,:) = ZN_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,7
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_p2(il,:) = ZN_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MChi2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MChi2_1L(il))
End If 
If (Abs(MChi2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopChi
 
 
Subroutine Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,           & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,            & 
& MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,          & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVPL,cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,  & 
& cplUChiChiVZpR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,  & 
& cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,             & 
& cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,             & 
& cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,             & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MChi(7),MChi2(7),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),         & 
& MSe2(6),MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(6),MSvIm2(6),               & 
& MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplUChiChiAhL(7,7,4),cplUChiChiAhR(7,7,4),cplUChiChacHpmL(7,2,2),cplUChiChacHpmR(7,2,2),& 
& cplUChiChacVWmL(7,2),cplUChiChacVWmR(7,2),cplUChiChihhL(7,7,4),cplUChiChihhR(7,7,4),   & 
& cplUChiChiVPL(7,7),cplUChiChiVPR(7,7),cplUChiChiVZL(7,7),cplUChiChiVZR(7,7),           & 
& cplUChiChiVZpL(7,7),cplUChiChiVZpR(7,7),cplUChiFdcSdL(7,3,6),cplUChiFdcSdR(7,3,6),     & 
& cplUChiFecSeL(7,3,6),cplUChiFecSeR(7,3,6),cplUChiFucSuL(7,3,6),cplUChiFucSuR(7,3,6),   & 
& cplUChiFvSvImL(7,6,6),cplUChiFvSvImR(7,6,6),cplUChiFvSvReL(7,6,6),cplUChiFvSvReR(7,6,6),& 
& cplcChaUChiHpmL(2,7,2),cplcChaUChiHpmR(2,7,2),cplcFdUChiSdL(3,7,6),cplcFdUChiSdR(3,7,6),& 
& cplcFeUChiSeL(3,7,6),cplcFeUChiSeR(3,7,6),cplcFuUChiSuL(3,7,6),cplcFuUChiSuR(3,7,6),   & 
& cplcChaUChiVWmL(2,7),cplcChaUChiVWmR(2,7)

Complex(dp), Intent(out) :: SigL(7,7),SigR(7,7), SigSL(7,7), SigSR(7,7) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(7,7), sumR(7,7), sumSL(7,7), sumSR(7,7) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Chi, Ah 
!------------------------ 
    Do i1 = 1, 7
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*Real(SA_B0(p2,MChi2(i1),MAh2(i2)),dp) 
coupL1 = cplUChiChiAhL(gO1,i1,i2)
coupR1 = cplUChiChiAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUChiChiAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUChiChiAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Cha 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MHpm2(i1)),dp) 
coupL1 = cplUChiChacHpmL(gO1,i2,i1)
coupR1 = cplUChiChacHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChacHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChacHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_B1(p2,MCha2(i2),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MCha(i2)*(Real(SA_B0(p2,MCha2(i2),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChacVWmL(gO1,i2)
coupR1 = cplUChiChacVWmR(gO1,i2)
coupL2 =  Conjg(cplUChiChacVWmL(gO2,i2))
coupR2 =  Conjg(cplUChiChacVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Chi 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),Mhh2(i1)),dp) 
coupL1 = cplUChiChihhL(gO1,i2,i1)
coupR1 = cplUChiChihhR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChihhL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChihhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_B1(p2,MChi2(i2),0._dp),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_B0(p2,MChi2(i2),0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChiVPL(gO1,i2)
coupR1 = cplUChiChiVPR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVPL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_B1(p2,MChi2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_B0(p2,MChi2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChiVZL(gO1,i2)
coupR1 = cplUChiChiVZR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_B1(p2,MChi2(i2),MVZp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_B0(p2,MChi2(i2),MVZp2),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChiVZpL(gO1,i2)
coupR1 = cplUChiChiVZpR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZpL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = 2._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplUChiFdcSdL(gO1,i2,i1)
coupR1 = cplUChiFdcSdR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFdcSdL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFdcSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSe2(i1)),dp) 
coupL1 = cplUChiFecSeL(gO1,i2,i1)
coupR1 = cplUChiFecSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFecSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFecSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = 2._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplUChiFucSuL(gO1,i2,i1)
coupR1 = cplUChiFucSuR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFucSuL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFucSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSvIm2(i1)),dp) 
coupL1 = cplUChiFvSvImL(gO1,i2,i1)
coupR1 = cplUChiFvSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSvRe2(i1)),dp) 
coupL1 = cplUChiFvSvReL(gO1,i2,i1)
coupR1 = cplUChiFvSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Hpm 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_B0(p2,MCha2(i1),MHpm2(i2)),dp) 
coupL1 = cplcChaUChiHpmL(i1,gO1,i2)
coupR1 = cplcChaUChiHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUChiHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUChiHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*Real(SA_B0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdUChiSdL(i1,gO1,i2)
coupR1 = cplcFdUChiSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcFdUChiSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcFdUChiSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Se 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_B0(p2,MFe2(i1),MSe2(i2)),dp) 
coupL1 = cplcFeUChiSeL(i1,gO1,i2)
coupR1 = cplcFeUChiSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUChiSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUChiSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuUChiSuL(i1,gO1,i2)
coupR1 = cplcFuUChiSuR(i1,gO1,i2)
coupL2 =  Conjg(cplcFuUChiSuL(i1,gO2,i2))
coupR2 =  Conjg(cplcFuUChiSuR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], VWm 
!------------------------ 
    Do i1 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_B1(p2,MCha2(i1),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MCha(i1)*(Real(SA_B0(p2,MCha2(i1),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcChaUChiVWmL(i1,gO1)
coupR1 = cplcChaUChiVWmR(i1,gO1)
coupL2 =  Conjg(cplcChaUChiVWmL(i1,gO2))
coupR2 =  Conjg(cplcChaUChiVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopChi 
 
Subroutine DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,             & 
& MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,           & 
& MSu,MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,      & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVPL,cplUChiChiVPR,cplUChiChiVZL,cplUChiChiVZR,cplUChiChiVZpL,  & 
& cplUChiChiVZpR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,  & 
& cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,cplUChiFvSvReR,             & 
& cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,             & 
& cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,cplcChaUChiVWmR,             & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MChi(7),MChi2(7),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),         & 
& MSe2(6),MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(6),MSvIm2(6),               & 
& MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplUChiChiAhL(7,7,4),cplUChiChiAhR(7,7,4),cplUChiChacHpmL(7,2,2),cplUChiChacHpmR(7,2,2),& 
& cplUChiChacVWmL(7,2),cplUChiChacVWmR(7,2),cplUChiChihhL(7,7,4),cplUChiChihhR(7,7,4),   & 
& cplUChiChiVPL(7,7),cplUChiChiVPR(7,7),cplUChiChiVZL(7,7),cplUChiChiVZR(7,7),           & 
& cplUChiChiVZpL(7,7),cplUChiChiVZpR(7,7),cplUChiFdcSdL(7,3,6),cplUChiFdcSdR(7,3,6),     & 
& cplUChiFecSeL(7,3,6),cplUChiFecSeR(7,3,6),cplUChiFucSuL(7,3,6),cplUChiFucSuR(7,3,6),   & 
& cplUChiFvSvImL(7,6,6),cplUChiFvSvImR(7,6,6),cplUChiFvSvReL(7,6,6),cplUChiFvSvReR(7,6,6),& 
& cplcChaUChiHpmL(2,7,2),cplcChaUChiHpmR(2,7,2),cplcFdUChiSdL(3,7,6),cplcFdUChiSdR(3,7,6),& 
& cplcFeUChiSeL(3,7,6),cplcFeUChiSeR(3,7,6),cplcFuUChiSuL(3,7,6),cplcFuUChiSuR(3,7,6),   & 
& cplcChaUChiVWmL(2,7),cplcChaUChiVWmR(2,7)

Complex(dp), Intent(out) :: SigL(7,7),SigR(7,7), SigSL(7,7), SigSR(7,7) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(7,7), sumR(7,7), sumSL(7,7), sumSR(7,7) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Chi, Ah 
!------------------------ 
    Do i1 = 1, 7
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*Real(SA_DerB0(p2,MChi2(i1),MAh2(i2)),dp) 
coupL1 = cplUChiChiAhL(gO1,i1,i2)
coupR1 = cplUChiChiAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUChiChiAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUChiChiAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Cha 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MHpm2(i1)),dp) 
coupL1 = cplUChiChacHpmL(gO1,i2,i1)
coupR1 = cplUChiChacHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChacHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChacHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_DerB1(p2,MCha2(i2),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MCha(i2)*(Real(SA_DerB0(p2,MCha2(i2),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChacVWmL(gO1,i2)
coupR1 = cplUChiChacVWmR(gO1,i2)
coupL2 =  Conjg(cplUChiChacVWmL(gO2,i2))
coupR2 =  Conjg(cplUChiChacVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Chi 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),Mhh2(i1)),dp) 
coupL1 = cplUChiChihhL(gO1,i2,i1)
coupR1 = cplUChiChihhR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChihhL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChihhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_DerB1(p2,MChi2(i2),MVP2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_DerB0(p2,MChi2(i2),MVP2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChiVPL(gO1,i2)
coupR1 = cplUChiChiVPR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVPL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_DerB1(p2,MChi2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_DerB0(p2,MChi2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChiVZL(gO1,i2)
coupR1 = cplUChiChiVZR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_DerB1(p2,MChi2(i2),MVZp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_DerB0(p2,MChi2(i2),MVZp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChiVZpL(gO1,i2)
coupR1 = cplUChiChiVZpR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZpL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = 2._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplUChiFdcSdL(gO1,i2,i1)
coupR1 = cplUChiFdcSdR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFdcSdL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFdcSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSe2(i1)),dp) 
coupL1 = cplUChiFecSeL(gO1,i2,i1)
coupR1 = cplUChiFecSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFecSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFecSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = 2._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplUChiFucSuL(gO1,i2,i1)
coupR1 = cplUChiFucSuR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFucSuL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFucSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSvIm2(i1)),dp) 
coupL1 = cplUChiFvSvImL(gO1,i2,i1)
coupR1 = cplUChiFvSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSvRe2(i1)),dp) 
coupL1 = cplUChiFvSvReL(gO1,i2,i1)
coupR1 = cplUChiFvSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Hpm 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MHpm2(i2)),dp) 
coupL1 = cplcChaUChiHpmL(i1,gO1,i2)
coupR1 = cplcChaUChiHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUChiHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUChiHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdUChiSdL(i1,gO1,i2)
coupR1 = cplcFdUChiSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcFdUChiSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcFdUChiSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Se 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MSe2(i2)),dp) 
coupL1 = cplcFeUChiSeL(i1,gO1,i2)
coupR1 = cplcFeUChiSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUChiSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUChiSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuUChiSuL(i1,gO1,i2)
coupR1 = cplcFuUChiSuR(i1,gO1,i2)
coupL2 =  Conjg(cplcFuUChiSuL(i1,gO2,i2))
coupR2 =  Conjg(cplcFuUChiSuR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], VWm 
!------------------------ 
    Do i1 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 7
  Do gO2 = 1, 7
B1m2 = -4._dp*(Real(SA_DerB1(p2,MCha2(i1),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MCha(i1)*(Real(SA_DerB0(p2,MCha2(i1),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcChaUChiVWmL(i1,gO1)
coupR1 = cplcChaUChiVWmR(i1,gO1)
coupL2 =  Conjg(cplcChaUChiVWmL(i1,gO2))
coupR2 =  Conjg(cplcChaUChiVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopChi 
 
Subroutine OneLoopCha(g2,Mu,M2,vd,vu,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,           & 
& MVZp,MVZp2,MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,            & 
& MFe,MFe2,MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,              & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,         & 
& cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,         & 
& cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,         & 
& cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,delta,MCha_1L,MCha2_1L,UM_1L,              & 
& UP_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),           & 
& MHpm2(2),MChi(7),MChi2(7),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(6),           & 
& MSvIm2(6),MFe(3),MFe2(3),MSvRe(6),MSvRe2(6),MSe(6),MSe2(6),MFv(6),MFv2(6),             & 
& MFu(3),MFu2(3),MSd(6),MSd2(6)

Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(in) :: Mu,M2

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,4),cplcUChaChaAhR(2,2,4),cplcUChaChahhL(2,2,4),cplcUChaChahhR(2,2,4),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChaVZpL(2,2),cplcUChaChaVZpR(2,2),cplcUChaChiHpmL(2,7,2),cplcUChaChiHpmR(2,7,2),& 
& cplcUChaChiVWmL(2,7),cplcUChaChiVWmR(2,7),cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6), & 
& cplcUChaFeSvImL(2,3,6),cplcUChaFeSvImR(2,3,6),cplcUChaFeSvReL(2,3,6),cplcUChaFeSvReR(2,3,6),& 
& cplcUChaFvSeL(2,6,6),cplcUChaFvSeR(2,6,6),cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp) :: mat1a(2,2), mat1(2,2) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2), p2 
Real(dp), Intent(out) :: MCha_1L(2),MCha2_1L(2) 
 Complex(dp), Intent(out) :: UM_1L(2,2), UP_1L(2,2) 
 
 Real(dp) :: MCha_t(2),MCha2_t(2) 
 Complex(dp) :: UM_t(2,2), UP_t(2,2), sigL(2,2), sigR(2,2), sigSL(2,2), sigSR(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: UM2(2,2), UP2(2,2) 
 
 Real(dp) :: UM1(2,2), UP1(2,2), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMCha'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+M2
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(g2*vu)/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(g2*vd)/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+Mu

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,        & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,cplcUChaChiHpmR,        & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
UPOS_0 = UP2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UM1,ierr,test) 
 
 
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2_t,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
UMOS_0 = UM2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=2,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MCha2(il) 
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,        & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,cplcUChaChiHpmR,        & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MCha2_t(iL)
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,        & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,cplcUChaChiHpmR,        & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MCha2_1L(il) = MCha2_t(il) 
MCha_1L(il) = Sqrt(MCha2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MCha2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MCha2_1L(il))
End If 
If (Abs(MCha2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UM1,ierr,test) 
 
 
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2_t,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(UM2),mat1),Transpose( Conjg(UP2))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
UP2(i1,:) = phaseM *UP2(i1,:) 
 End if 
End Do 
 
UMOS_p2(il,:) = UM2(il,:) 
 UPOS_p2(il,:) = UP2(il,:) 
 UM_1L = UM2 
 UP_1L = UP2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopCha
 
 
Subroutine Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,               & 
& MVZp2,MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,             & 
& MFe2,MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,   & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,cplcUChaChiHpmR,        & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),           & 
& MHpm2(2),MChi(7),MChi2(7),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(6),           & 
& MSvIm2(6),MFe(3),MFe2(3),MSvRe(6),MSvRe2(6),MSe(6),MSe2(6),MFv(6),MFv2(6),             & 
& MFu(3),MFu2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,4),cplcUChaChaAhR(2,2,4),cplcUChaChahhL(2,2,4),cplcUChaChahhR(2,2,4),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChaVZpL(2,2),cplcUChaChaVZpR(2,2),cplcUChaChiHpmL(2,7,2),cplcUChaChiHpmR(2,7,2),& 
& cplcUChaChiVWmL(2,7),cplcUChaChiVWmR(2,7),cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6), & 
& cplcUChaFeSvImL(2,3,6),cplcUChaFeSvImR(2,3,6),cplcUChaFeSvReL(2,3,6),cplcUChaFeSvReR(2,3,6),& 
& cplcUChaFvSeL(2,6,6),cplcUChaFvSeR(2,6,6),cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(2,2),SigR(2,2), SigSL(2,2), SigSR(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(2,2), sumR(2,2), sumSL(2,2), sumSR(2,2) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Cha, Ah 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MCha2(i1),MAh2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MAh2(i2)),dp) 
coupL1 = cplcUChaChaAhL(gO1,i1,i2)
coupR1 = cplcUChaChaAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChaChaAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChaChaAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Cha 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MCha2(i2),Mhh2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUChaChahhL(gO1,i2,i1)
coupR1 = cplcUChaChahhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChahhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChahhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChaVPL(gO1,i2)
coupR1 = cplcUChaChaVPR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVPL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChaVZL(gO1,i2)
coupR1 = cplcUChaChaVZR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChaVZpL(gO1,i2)
coupR1 = cplcUChaChaVZpR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZpL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Chi 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MChi2(i2),MHpm2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUChaChiHpmL(gO1,i2,i1)
coupR1 = cplcUChaChiHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChiHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChiHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChiVWmL(gO1,i2)
coupR1 = cplcUChaChiVWmR(gO1,i2)
coupL2 =  Conjg(cplcUChaChiVWmL(gO2,i2))
coupR2 =  Conjg(cplcUChaChiVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Su], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFd2(i2),MSu2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSu2(i1)),dp) 
coupL1 = cplcUChaFdcSuL(gO1,i2,i1)
coupR1 = cplcUChaFdcSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFdcSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFdcSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFe2(i2),MSvIm2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUChaFeSvImL(gO1,i2,i1)
coupR1 = cplcUChaFeSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFe2(i2),MSvRe2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUChaFeSvReL(gO1,i2,i1)
coupR1 = cplcUChaFeSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFv2(i2),MSe2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSe2(i1)),dp) 
coupL1 = cplcUChaFvSeL(gO1,i2,i1)
coupR1 = cplcUChaFvSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFvSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFvSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFu2(i1),MSd2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSd2(i2)),dp) 
coupL1 = cplcUChacFuSdL(gO1,i1,i2)
coupR1 = cplcUChacFuSdR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChacFuSdL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChacFuSdR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopCha 
 
Subroutine DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,            & 
& MVZp2,MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,             & 
& MFe2,MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,   & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChaVZpL,cplcUChaChaVZpR,cplcUChaChiHpmL,cplcUChaChiHpmR,        & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),           & 
& MHpm2(2),MChi(7),MChi2(7),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(6),           & 
& MSvIm2(6),MFe(3),MFe2(3),MSvRe(6),MSvRe2(6),MSe(6),MSe2(6),MFv(6),MFv2(6),             & 
& MFu(3),MFu2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,4),cplcUChaChaAhR(2,2,4),cplcUChaChahhL(2,2,4),cplcUChaChahhR(2,2,4),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChaVZpL(2,2),cplcUChaChaVZpR(2,2),cplcUChaChiHpmL(2,7,2),cplcUChaChiHpmR(2,7,2),& 
& cplcUChaChiVWmL(2,7),cplcUChaChiVWmR(2,7),cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6), & 
& cplcUChaFeSvImL(2,3,6),cplcUChaFeSvImR(2,3,6),cplcUChaFeSvReL(2,3,6),cplcUChaFeSvReR(2,3,6),& 
& cplcUChaFvSeL(2,6,6),cplcUChaFvSeR(2,6,6),cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(2,2),SigR(2,2), SigSL(2,2), SigSR(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(2,2), sumR(2,2), sumSL(2,2), sumSR(2,2) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Cha, Ah 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MCha2(i1),MAh2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MAh2(i2)),dp) 
coupL1 = cplcUChaChaAhL(gO1,i1,i2)
coupR1 = cplcUChaChaAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChaChaAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChaChaAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Cha 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),Mhh2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUChaChahhL(gO1,i2,i1)
coupR1 = cplcUChaChahhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChahhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChahhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChaVPL(gO1,i2)
coupR1 = cplcUChaChaVPR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVPL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChaVZL(gO1,i2)
coupR1 = cplcUChaChaVZR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChaVZpL(gO1,i2)
coupR1 = cplcUChaChaVZpR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZpL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Chi 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MHpm2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUChaChiHpmL(gO1,i2,i1)
coupR1 = cplcUChaChiHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChiHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChiHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Chi 
!------------------------ 
      Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChiVWmL(gO1,i2)
coupR1 = cplcUChaChiVWmR(gO1,i2)
coupL2 =  Conjg(cplcUChaChiVWmL(gO2,i2))
coupR2 =  Conjg(cplcUChaChiVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Su], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MSu2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSu2(i1)),dp) 
coupL1 = cplcUChaFdcSuL(gO1,i2,i1)
coupR1 = cplcUChaFdcSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFdcSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFdcSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),MSvIm2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUChaFeSvImL(gO1,i2,i1)
coupR1 = cplcUChaFeSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),MSvRe2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUChaFeSvReL(gO1,i2,i1)
coupR1 = cplcUChaFeSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MSe2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSe2(i1)),dp) 
coupL1 = cplcUChaFvSeL(gO1,i2,i1)
coupR1 = cplcUChaFvSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFvSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFvSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MSd2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSd2(i2)),dp) 
coupL1 = cplcUChacFuSdL(gO1,i1,i2)
coupR1 = cplcUChacFuSdR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChacFuSdL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChacFuSdR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopCha 
 
Subroutine OneLoopFv(Yx,Yv,vu,x1,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,               & 
& MSvIm,MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,               & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,          & 
& cplChiUFvSvImL,cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,             & 
& cplUFvFecHpmR,cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,         & 
& cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,           & 
& cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,delta,           & 
& MFv_1L,MFv2_1L,UV_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(4),MAh2(4),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(6),               & 
& MSvIm2(6),MChi(7),MChi2(7),MSvRe(6),MSvRe2(6),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: vu,x1

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),cplUFvChacSeL(6,2,6),cplUFvChacSeR(6,2,6),      & 
& cplChiUFvSvImL(7,6,6),cplChiUFvSvImR(7,6,6),cplChiUFvSvReL(7,6,6),cplChiUFvSvReR(7,6,6),& 
& cplUFvFecHpmL(6,3,2),cplUFvFecHpmR(6,3,2),cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),       & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZpL(6,6),cplUFvFvVZpR(6,6),cplcFeUFvHpmL(3,6,2),& 
& cplcFeUFvHpmR(3,6,2),cplcChaUFvSeL(2,6,6),cplcChaUFvSeR(2,6,6),cplcFeUFvVWmL(3,6),     & 
& cplcFeUFvVWmR(3,6)

Complex(dp) :: mat1a(6,6), mat1(6,6), mat2(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2 
Real(dp), Intent(out) :: MFv_1L(6),MFv2_1L(6) 
Complex(dp), Intent(out) ::  UV_1L(6,6) 
Real(dp) :: MFv_t(6),MFv2_t(6) 
Complex(dp) ::  UV_t(6,6) 
Complex(dp) ::  phaseM, E6(6), sigL(6,6), sigR(6,6), sigSL(6,6), sigSR(6,6) 
Real(dp) :: UVa(6,6), test(2), eig(6) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vu*Yv(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vu*Yv(2,1))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vu*Yv(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vu*Yv(1,2))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vu*Yv(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vu*Yv(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vu*Yv(1,3))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vu*Yv(2,3))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vu*Yv(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vu*Yv(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vu*Yv(1,2))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vu*Yv(1,3))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+sqrt(2._dp)*x1*Yx(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+(x1*Yx(1,2))/sqrt(2._dp)
mat1a(4,5) = mat1a(4,5)+(x1*Yx(2,1))/sqrt(2._dp)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+(x1*Yx(1,3))/sqrt(2._dp)
mat1a(4,6) = mat1a(4,6)+(x1*Yx(3,1))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vu*Yv(2,1))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vu*Yv(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vu*Yv(2,3))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+(x1*Yx(1,2))/sqrt(2._dp)
mat1a(5,4) = mat1a(5,4)+(x1*Yx(2,1))/sqrt(2._dp)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+sqrt(2._dp)*x1*Yx(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+(x1*Yx(2,3))/sqrt(2._dp)
mat1a(5,6) = mat1a(5,6)+(x1*Yx(3,2))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vu*Yv(3,1))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vu*Yv(3,2))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vu*Yv(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+(x1*Yx(1,3))/sqrt(2._dp)
mat1a(6,4) = mat1a(6,4)+(x1*Yx(3,1))/sqrt(2._dp)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+(x1*Yx(2,3))/sqrt(2._dp)
mat1a(6,5) = mat1a(6,5)+(x1*Yx(3,2))/sqrt(2._dp)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+sqrt(2._dp)*x1*Yx(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,         & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
UVOS_0 = UV_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_0 = UV_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,         & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,         & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,               & 
& MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,    & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(4),MAh2(4),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(6),               & 
& MSvIm2(6),MChi(7),MChi2(7),MSvRe(6),MSvRe2(6),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),cplUFvChacSeL(6,2,6),cplUFvChacSeR(6,2,6),      & 
& cplChiUFvSvImL(7,6,6),cplChiUFvSvImR(7,6,6),cplChiUFvSvReL(7,6,6),cplChiUFvSvReR(7,6,6),& 
& cplUFvFecHpmL(6,3,2),cplUFvFecHpmR(6,3,2),cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),       & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZpL(6,6),cplUFvFvVZpR(6,6),cplcFeUFvHpmL(3,6,2),& 
& cplcFeUFvHpmR(3,6,2),cplcChaUFvSeL(2,6,6),cplcChaUFvSeR(2,6,6),cplcFeUFvVWmL(3,6),     & 
& cplcFeUFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_B0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSe2(i1)),dp) 
coupL1 = cplUFvChacSeL(gO1,i2,i1)
coupR1 = cplUFvChacSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvChacSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvChacSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSvIm2(i1)),dp) 
coupL1 = cplChiUFvSvImL(i2,gO1,i1)
coupR1 = cplChiUFvSvImR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvImL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvImR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSvRe2(i1)),dp) 
coupL1 = cplChiUFvSvReL(i2,gO1,i1)
coupR1 = cplChiUFvSvReR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvReL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvReR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFecHpmL(gO1,i2,i1)
coupR1 = cplUFvFecHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFecHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFecHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWmL(gO1,i2)
coupR1 = cplUFvFecVWmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),0._dp),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZp2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZpL(gO1,i2)
coupR1 = cplUFvFvVZpR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZpL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hpm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_B0(p2,MFe2(i1),MHpm2(i2)),dp) 
coupL1 = cplcFeUFvHpmL(i1,gO1,i2)
coupR1 = cplcFeUFvHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUFvHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUFvHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Se 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSe2(i2)),dp) 
coupL1 = cplcChaUFvSeL(i1,gO1,i2)
coupR1 = cplcChaUFvSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUFvSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUFvSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], VWm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWmL(i1,gO1)
coupR1 = cplcFeUFvVWmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,            & 
& MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,    & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvHpmL,cplcFeUFvHpmR,         & 
& cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(4),MAh2(4),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(6),               & 
& MSvIm2(6),MChi(7),MChi2(7),MSvRe(6),MSvRe2(6),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,4),cplUFvFvAhR(6,6,4),cplUFvChacSeL(6,2,6),cplUFvChacSeR(6,2,6),      & 
& cplChiUFvSvImL(7,6,6),cplChiUFvSvImR(7,6,6),cplChiUFvSvReL(7,6,6),cplChiUFvSvReR(7,6,6),& 
& cplUFvFecHpmL(6,3,2),cplUFvFecHpmR(6,3,2),cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),       & 
& cplUFvFvhhL(6,6,4),cplUFvFvhhR(6,6,4),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZpL(6,6),cplUFvFvVZpR(6,6),cplcFeUFvHpmL(3,6,2),& 
& cplcFeUFvHpmR(3,6,2),cplcChaUFvSeL(2,6,6),cplcChaUFvSeR(2,6,6),cplcFeUFvVWmL(3,6),     & 
& cplcFeUFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_DerB0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSe2(i1)),dp) 
coupL1 = cplUFvChacSeL(gO1,i2,i1)
coupR1 = cplUFvChacSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvChacSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvChacSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSvIm2(i1)),dp) 
coupL1 = cplChiUFvSvImL(i2,gO1,i1)
coupR1 = cplChiUFvSvImR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvImL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvImR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSvRe2(i1)),dp) 
coupL1 = cplChiUFvSvReL(i2,gO1,i1)
coupR1 = cplChiUFvSvReR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvReL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvReR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFecHpmL(gO1,i2,i1)
coupR1 = cplUFvFecHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFecHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFecHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i2),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_DerB0(p2,MFe2(i2),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFecVWmL(gO1,i2)
coupR1 = cplUFvFecVWmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVP2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVP2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZpL(gO1,i2)
coupR1 = cplUFvFvVZpR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZpL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hpm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MHpm2(i2)),dp) 
coupL1 = cplcFeUFvHpmL(i1,gO1,i2)
coupR1 = cplcFeUFvHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUFvHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUFvHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Se 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MSe2(i2)),dp) 
coupL1 = cplcChaUFvSeL(i1,gO1,i2)
coupR1 = cplcChaUFvSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUFvSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUFvSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], VWm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i1),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_DerB0(p2,MFe2(i1),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcFeUFvVWmL(i1,gO1)
coupR1 = cplcFeUFvVWmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFv 
 
Subroutine OneLoopFe(Ye,vd,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,           & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,  & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),MSvIm(6),MSvIm2(6),MCha(2),MCha2(2),MSvRe(6),           & 
& MSvRe2(6),MSe(6),MSe2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,          & 
& MHpm(2),MHpm2(2),MFv(6),MFv2(6),MVWm,MVWm2

Real(dp), Intent(in) :: vd

Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vd*Ye(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,             & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,             & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,             & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,           & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,  & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),MSvIm(6),MSvIm2(6),MCha(2),MCha2(2),MSvRe(6),           & 
& MSvRe2(6),MSe(6),MSe2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,          & 
& MHpm(2),MHpm2(2),MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSe2(i1)),dp) 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,              & 
& MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,         & 
& cplcUFeChaSvReL,cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,              & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,            & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),MSvIm(6),MSvIm2(6),MCha(2),MCha2(2),MSvRe(6),           & 
& MSvRe2(6),MSe(6),MSe2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,          & 
& MHpm(2),MHpm2(2),MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSe2(i1)),dp) 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFe 
 
Subroutine OneLoopFd(Yd,vd,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,            & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,           & 
& MGlu2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,             & 
& cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,      & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,delta,           & 
& MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),MHpm2(2),MFu(3),           & 
& MFu2(3),MVWm,MVWm2,MGlu,MGlu2

Real(dp), Intent(in) :: vd

Complex(dp), Intent(in) :: Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,            & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,           & 
& MGlu2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,             & 
& cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,      & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,            & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),MHpm2(2),MFu(3),           & 
& MFu2(3),MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSd2(i1)),dp) 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSd2(i1)),dp) 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,              & 
& MSd2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,           & 
& MGlu,MGlu2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,        & 
& cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,      & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,            & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),MHpm2(2),MFu(3),           & 
& MFu2(3),MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSd2(i1)),dp) 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_DerB0(p2,MGlu2,MSd2(i1)),dp) 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFd 
 
Subroutine OneLoopFu(Yu,vu,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,          & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MChi(7),MChi2(7),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,               & 
& MCha(2),MCha2(2),MSd(6),MSd2(6)

Real(dp), Intent(in) :: vu

Complex(dp), Intent(in) :: Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,           & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,           & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,           & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,          & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MChi(7),MChi2(7),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,               & 
& MCha(2),MCha2(2),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSu2(i1)),dp) 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSd2(i2)),dp) 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,             & 
& MHpm2,MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,          & 
& MSd,MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,         & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MChi(7),MChi2(7),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,               & 
& MCha(2),MCha2(2),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_DerB0(p2,MGlu2,MSu2(i1)),dp) 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MSd2(i2)),dp) 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFu 
 
Subroutine OneLoopGlu(M3,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: M3

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopGlu'
 
mi = MGlu 

 
p2 = MGlu2
sigL = ZeroC 
sigR = ZeroC 
sigSL = ZeroC 
sigSR = ZeroC 
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,sigL,sigR,sigSL,sigSR)

mass = mi - 0.5_dp*(sigSL + sigSR)- 0.5_dp*MGlu*(SigR+SigL) 
mass2= mass**2 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
sig = ZeroC 
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,sigL,sigR,sigSL,sigSR)

mass = mi - SigSR - 0.5_dp*MGlu*(SigR+SigL) 
mass2= mass**2 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopGlu
 
 
Subroutine Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,           & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigL,SigR,SigSL,SigSR)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Complex(dp), Intent(out) :: SigL, SigR, SigSL, SigSR 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumSL, sumSR, sumR,sumL 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = -2._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplGluFdcSdL(i2,i1)
coupR1 = cplGluFdcSdR(i2,i1)
coupL2 =  Conjg(cplGluFdcSdL(i2,i1))
coupR2 =  Conjg(cplGluFdcSdR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = -2._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplGluFucSuL(i2,i1)
coupR1 = cplGluFucSuR(i2,i1)
coupL2 =  Conjg(cplGluFucSuL(i2,i1))
coupR2 =  Conjg(cplGluFucSuR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! VG, Glu 
!------------------------ 
SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -4._dp*(Real(SA_B1(p2,MGlu2,0._dp),dp)+ 0.5_dp*rMS) 
B0m2 = -8._dp*MGlu*(Real(SA_B0(p2,MGlu2,0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
coupL2 =  Conjg(cplGluGluVGL)
coupR2 =  Conjg(cplGluGluVGR)
SumSL = coupL1*coupR2*B0m2 
SumSR = coupR1*coupL2*B0m2 
sumR = coupL1*coupL2*B1m2 
sumL = coupR1*coupR2*B1m2 
SigL = SigL +3._dp/2._dp*sumL
SigR = SigR +3._dp/2._dp*sumR
SigSL = SigSL +3._dp/2._dp*sumSL
SigSR = SigSR +3._dp/2._dp*sumSR
!------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*Real(SA_B0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdGluSdL(i1,i2)
coupR1 = cplcFdGluSdR(i1,i2)
coupL2 =  Conjg(cplcFdGluSdL(i1,i2))
coupR2 =  Conjg(cplcFdGluSdR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuGluSuL(i1,i2)
coupR1 = cplcFuGluSuR(i1,i2)
coupL2 =  Conjg(cplcFuGluSuL(i1,i2))
coupR2 =  Conjg(cplcFuGluSuR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
 SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
 SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopGlu 
 
Subroutine DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,              & 
& MGlu2,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,   & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigL,SigR,SigSL,SigSR)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Complex(dp), Intent(out) :: SigL, SigR, SigSL, SigSR 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumSL, sumSR, sumR,sumL 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = -2._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplGluFdcSdL(i2,i1)
coupR1 = cplGluFdcSdR(i2,i1)
coupL2 =  Conjg(cplGluFdcSdL(i2,i1))
coupR2 =  Conjg(cplGluFdcSdR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = -2._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplGluFucSuL(i2,i1)
coupR1 = cplGluFucSuR(i2,i1)
coupL2 =  Conjg(cplGluFucSuL(i2,i1))
coupR2 =  Conjg(cplGluFucSuR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! VG, Glu 
!------------------------ 
SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -4._dp*(Real(SA_DerB1(p2,MGlu2,MVG2),dp)+ 0.5_dp*DerrMS) 
B0m2 = -8._dp*MGlu*(Real(SA_DerB0(p2,MGlu2,MVG2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
coupL2 =  Conjg(cplGluGluVGL)
coupR2 =  Conjg(cplGluGluVGR)
SumSL = coupL1*coupR2*B0m2 
SumSR = coupR1*coupL2*B0m2 
sumR = coupL1*coupL2*B1m2 
sumL = coupR1*coupR2*B1m2 
SigL = SigL +3._dp/2._dp*sumL
SigR = SigR +3._dp/2._dp*sumR
SigSL = SigSL +3._dp/2._dp*sumSL
SigSR = SigSR +3._dp/2._dp*sumSR
!------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdGluSdL(i1,i2)
coupR1 = cplcFdGluSdR(i1,i2)
coupL2 =  Conjg(cplcFdGluSdL(i1,i2))
coupR2 =  Conjg(cplcFdGluSdR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuGluSuL(i1,i2)
coupR1 = cplcFuGluSuR(i1,i2)
coupL2 =  Conjg(cplcFuGluSuL(i1,i2))
coupR2 =  Conjg(cplcFuGluSuR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
 SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
 SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopGlu 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,               & 
& cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,   & 
& cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplSdcSdVGVG(6,6), & 
& cplSucSuVGVG(6,6),cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! Glu, Glu 
!------------------------ 
sumI = 0._dp 
 
H0m2 = Real(SA_Hloop(p2,MGlu2,MGlu2),dp) 
B0m2 = 4._dp*MGlu*MGlu*Real(SA_B0(p2,MGlu2,MGlu2),dp) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,            & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,               & 
& cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,   & 
& cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplSdcSdVGVG(6,6), & 
& cplSucSuVGVG(6,6),cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! Glu, Glu 
!------------------------ 
sumI = 0._dp 
 
H0m2 = Real(SA_DerHloop(p2,MGlu2,MGlu2),dp) 
B0m2 = 4._dp*MGlu*MGlu*Real(SA_DerB0(p2,MGlu2,MGlu2),dp) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,           & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP, & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),               & 
& cplChiChiVPR(7,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3), & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWmgWmVP,        & 
& cplcgWpCgWpCVP,cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSdcSdVP(6,6),cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcVWmVPVWm,       & 
& cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),               & 
& cplSecSeVPVP(6,6),cplSucSuVPVP(6,6),cplSvImSvImVPVP(6,6),cplSvReSvReVPVP(6,6),         & 
& cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MCha2(i1).gt.50._dp**2).and.(MCha2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MCha2(i1).lt.50._dp**2).and.(MCha2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MChi2(i1).gt.50._dp**2).and.(MChi2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MChi2(i1).lt.50._dp**2).and.(MChi2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZp2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZp2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i2).gt.50._dp**2).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i2).lt.50._dp**2).and.(MSd2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i2).gt.50._dp**2).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i2).lt.50._dp**2).and.(MSe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i2).gt.50._dp**2).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i2).lt.50._dp**2).and.(MSu2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvIm2(i2).gt.50._dp**2).and.(MSvRe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvIm2(i2).lt.50._dp**2).and.(MSvRe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvIm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvIm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvRe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvRe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,             & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVP,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,           & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWmgWmVP,cplcgWpCgWpCVP, & 
& cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,       & 
& cplSvImSvReVP,cplcVWmVPVWm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplSdcSdVPVP,        & 
& cplSecSeVPVP,cplSucSuVPVP,cplSvImSvImVPVP,cplSvReSvReVPVP,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),               & 
& cplChiChiVPR(7,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3), & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWmgWmVP,        & 
& cplcgWpCgWpCVP,cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSdcSdVP(6,6),cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcVWmVPVWm,       & 
& cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),               & 
& cplSecSeVPVP(6,6),cplSucSuVPVP(6,6),cplSvImSvImVPVP(6,6),cplSvReSvReVPVP(6,6),         & 
& cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MCha2(i1).gt.50._dp**2).and.(MCha2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MCha2(i1).lt.50._dp**2).and.(MCha2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MChi2(i1).gt.50._dp**2).and.(MChi2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MChi2(i1).lt.50._dp**2).and.(MChi2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZp2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZp2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i2).gt.50._dp**2).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i2).lt.50._dp**2).and.(MSd2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i2).gt.50._dp**2).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i2).lt.50._dp**2).and.(MSe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i2).gt.50._dp**2).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i2).lt.50._dp**2).and.(MSu2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvIm2(i2).gt.50._dp**2).and.(MSvRe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvIm2(i2).lt.50._dp**2).and.(MSvRe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvIm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvIm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSvRe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSvRe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVZ(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,               & 
& MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,               & 
& MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,              & 
& MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,              & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),               & 
& cplChiChiVZR(7,7),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),              & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),  & 
& cplSecSeVZVZ(6,6),cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(6,6),cplSvReSvReVZVZ(6,6),         & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,              & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ, & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),               & 
& cplChiChiVZR(7,7),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),              & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),  & 
& cplSecSeVZVZ(6,6),cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(6,6),cplSvReSvReVZVZ(6,6),         & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,             & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ, & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),               & 
& cplChiChiVZR(7,7),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),              & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),  & 
& cplSecSeVZVZ(6,6),cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(6,6),cplSvReSvReVZVZ(6,6),         & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVZp(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,TW,TWp,Mhh,Mhh2,MAh,              & 
& MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,               & 
& MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,              & 
& MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpmcHpmVZpVZp,             & 
& cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,      & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),           & 
& cplChiChiVZpR(7,7),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),              & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),              & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6),cplcVWmVWmVZp,cplAhAhVZpVZp(4,4),cplhhhhVZpVZp(4,4),               & 
& cplHpmcHpmVZpVZp(2,2),cplSdcSdVZpVZp(6,6),cplSecSeVZpVZp(6,6),cplSucSuVZpVZp(6,6),     & 
& cplSvImSvImVZpVZp(6,6),cplSvReSvReVZpVZp(6,6),cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,     & 
& cplcVWmVWmVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZp'
 
mi2 = MVZp2 

 
p2 = MVZp2
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,             & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,      & 
& cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,       & 
& cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,               & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,             & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,      & 
& cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,cplSvImSvImVZpVZp,       & 
& cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,               & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZp
 
 
Subroutine Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,              & 
& MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,         & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,        & 
& cplhhhhVZpVZp,cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,           & 
& cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,               & 
& cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),           & 
& cplChiChiVZpR(7,7),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),              & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),              & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6),cplcVWmVWmVZp,cplAhAhVZpVZp(4,4),cplhhhhVZpVZp(4,4),               & 
& cplHpmcHpmVZpVZp(2,2),cplSdcSdVZpVZp(6,6),cplSecSeVZpVZp(6,6),cplSucSuVZpVZp(6,6),     & 
& cplSvImSvImVZpVZp(6,6),cplSvReSvReVZpVZp(6,6),cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,     & 
& cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZpVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZp 
 
Subroutine DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,             & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZp,cplcChaChaVZpL,        & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,         & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,        & 
& cplhhhhVZpVZp,cplHpmcHpmVZpVZp,cplSdcSdVZpVZp,cplSecSeVZpVZp,cplSucSuVZpVZp,           & 
& cplSvImSvImVZpVZp,cplSvReSvReVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,               & 
& cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,              & 
& MHpm(2),MHpm2(2),MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),              & 
& MSvRe(6),MSvRe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),           & 
& cplChiChiVZpR(7,7),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),              & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),              & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6),cplcVWmVWmVZp,cplAhAhVZpVZp(4,4),cplhhhhVZpVZp(4,4),               & 
& cplHpmcHpmVZpVZp(2,2),cplSdcSdVZpVZp(6,6),cplSecSeVZpVZp(6,6),cplSucSuVZpVZp(6,6),     & 
& cplSvImSvImVZpVZp(6,6),cplSvReSvReVZpVZp(6,6),cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,     & 
& cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZpVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZp 
 
Subroutine OneLoopVWm(g2,vd,vu,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,             & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,      & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MChi(7),MChi2(7),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWm,              & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),            & 
& MSe(6),MSe2(6),MSvRe(6),MSvRe2(6)

Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(in) :: cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm(4,2),         & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSucVWm(6,6),    & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,         & 
& cplAhAhcVWmVWm(4,4),cplhhhhcVWmVWm(4,4),cplHpmcHpmcVWmVWm(2,2),cplSdcSdcVWmVWm(6,6),   & 
& cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(6,6),cplSvReSvRecVWmVWm(6,6),& 
& cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3, & 
& cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,  & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWm'
 
mi2 = MVWm2 

 
p2 = MVWm2
PiSf = ZeroC 
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
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
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
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWm
 
 
Subroutine Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,               & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,      & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MChi(7),MChi2(7),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWm,              & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),            & 
& MSe(6),MSe2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm(4,2),         & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSucVWm(6,6),    & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,         & 
& cplAhAhcVWmVWm(4,4),cplhhhhcVWmVWm(4,4),cplHpmcHpmcVWmVWm(2,2),cplSdcSdcVWmVWm(6,6),   & 
& cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(6,6),cplSvReSvRecVWmVWm(6,6),& 
& cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3, & 
& cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,  & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MCha(i2)*Real(SA_B0(p2,MChi2(i1),MCha2(i2)),dp) 
coupL1 = cplChiChacVWmL(i1,i2)
coupR1 = cplChiChacVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWmL(i1,i2)
coupR1 = cplcFuFdcVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWmL(i1,i2)
coupR1 = cplFvFecVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWm2),dp)
coup1 = cplcgWpCgAcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,0._dp),dp)
coup1 = cplcgAgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVZ2),dp)
coup1 = cplcgZgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVZp2),dp)
coup1 = cplcgZpgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWm2),dp)
coup1 = cplcgWpCgZcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZp2,MVWm2),dp)
coup1 = cplcgWpCgZpcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWm2,Mhh2(i2)),dp)
coup1 = cplhhcVWmVWm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSu2(i1)),dp)  
coup1 = cplSdcSucVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSvIm2(i1)),dp)  
coup1 = cplSeSvImcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSvRe2(i1)),dp)  
coup1 = cplSeSvRecVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZp2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSucVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvRecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmcVWmVWmVWm2
coup2 = cplcVWmcVWmVWmVWm3
coup3 = cplcVWmcVWmVWmVWm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZp2) +RXi/4._dp*SA_A0(MVZp2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWm 
 
Subroutine DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,            & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,      & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(4),MAh2(4),MChi(7),MChi2(7),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWm,              & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(6),MSvIm2(6),            & 
& MSe(6),MSe2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm(4,2),         & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSucVWm(6,6),    & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,         & 
& cplAhAhcVWmVWm(4,4),cplhhhhcVWmVWm(4,4),cplHpmcHpmcVWmVWm(2,2),cplSdcSdcVWmVWm(6,6),   & 
& cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(6,6),cplSvReSvRecVWmVWm(6,6),& 
& cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3, & 
& cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,  & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MCha(i2)*Real(SA_DerB0(p2,MChi2(i1),MCha2(i2)),dp) 
coupL1 = cplChiChacVWmL(i1,i2)
coupR1 = cplChiChacVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWmL(i1,i2)
coupR1 = cplcFuFdcVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWmL(i1,i2)
coupR1 = cplFvFecVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWm2),dp)
coup1 = cplcgWpCgAcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVP2),dp)
coup1 = cplcgAgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVZ2),dp)
coup1 = cplcgZgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVZp2),dp)
coup1 = cplcgZpgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWm2),dp)
coup1 = cplcgWpCgZcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZp2,MVWm2),dp)
coup1 = cplcgWpCgZpcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWm2,Mhh2(i2)),dp)
coup1 = cplhhcVWmVWm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSu2(i1)),dp)  
coup1 = cplSdcSucVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSvIm2(i1)),dp)  
coup1 = cplSeSvImcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSvRe2(i1)),dp)  
coup1 = cplSeSvRecVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZp2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSucVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvRecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmcVWmVWmVWm2
coup2 = cplcVWmcVWmVWmVWm3
coup3 = cplcVWmcVWmVWmVWm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZp2) +RXi/4._dp*SA_DerA0(MVZp2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWm 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,               & 
& MSvRe,MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,              & 
& MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,         & 
& cplcUFeChaSvReL,cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,              & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,            & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),MSvIm(6),MSvIm2(6),MCha(2),MCha2(2),MSvRe(6),           & 
& MSvRe2(6),MSe(6),MSe2(6),MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,          & 
& MHpm(2),MHpm2(2),MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFe2(gO1),MCha2(i2),MSvIm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvIm2(i1)),dp) 
End If 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFe2(gO1),MCha2(i2),MSvRe2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvRe2(i1)),dp) 
End If 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFe2(gO1),MChi2(i2),MSe2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSe2(i1)),dp) 
End If 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,               & 
& MSd2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,           & 
& MGlu,MGlu2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,        & 
& cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,      & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigL,            & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(7),MChi2(7),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MHpm(2),MHpm2(2),MFu(3),           & 
& MFu2(3),MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFd2(gO1),MCha2(i2),MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSu2(i1)),dp) 
End If 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFd2(gO1),MChi2(i2),MSd2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSd2(i1)),dp) 
End If 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(MFd2(gO1),MGlu2,MSd2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSd2(i1)),dp) 
End If 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,              & 
& MHpm2,MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,          & 
& MSd,MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,         & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MSu(6),MSu2(6),MChi(7),MChi2(7),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(4),Mhh2(4),MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,               & 
& MCha(2),MCha2(2),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 7
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFu2(gO1),MChi2(i2),MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSu2(i1)),dp) 
End If 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(MFu2(gO1),MGlu2,MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSu2(i1)),dp) 
End If 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(MFu2(gO1),MCha2(i1),MSd2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSd2(i2)),dp) 
End If 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
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
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2), & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL(7,7),             & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcHpmVPVWm(2),cplcHpmVWmVZ(2), & 
& cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,             & 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhhhVPVZ(4,4),      & 
& cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVP(2,2),               & 
& cplHpmcHpmVPVZ(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSdVP(6,6), & 
& cplSdcSdVPVZ(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVZ(6,6),   & 
& cplSucSuVP(6,6),cplSucSuVPVZ(6,6),cplSucSuVZ(6,6),cplSvImSvImVPVZ(6,6),cplSvImSvReVP(6,6),& 
& cplSvImSvReVZ(6,6),cplSvReSvReVPVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZL(i2,i1)
coupR2 = cplcChaChaVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
coupL2 = cplChiChiVZL(i1,i2)
coupR2 = cplChiChiVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVP(i2,i1)
coup2 = cplSvImSvReVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZ2
coup2 = cplcVWmVPVWmVZ1
coup3 = cplcVWmVPVWmVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZ 
 
Subroutine DerPi1LoopVPVZ(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,              & 
& cplAhhhVZ,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,   & 
& cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,              & 
& cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZ,     & 
& cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,             & 
& cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,cplSvImSvImVPVZ, & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvReSvReVPVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2), & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplChiChiVPL(7,7),             & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcHpmVPVWm(2),cplcHpmVWmVZ(2), & 
& cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,             & 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhhhVPVZ(4,4),      & 
& cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVP(2,2),               & 
& cplHpmcHpmVPVZ(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSdVP(6,6), & 
& cplSdcSdVPVZ(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVZ(6,6),   & 
& cplSucSuVP(6,6),cplSucSuVPVZ(6,6),cplSucSuVZ(6,6),cplSvImSvImVPVZ(6,6),cplSvImSvReVP(6,6),& 
& cplSvImSvReVZ(6,6),cplSvReSvReVPVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZL(i2,i1)
coupR2 = cplcChaChaVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
coupL2 = cplChiChiVZL(i1,i2)
coupR2 = cplChiChiVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVP(i2,i1)
coup2 = cplSvImSvReVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZ2
coup2 = cplcVWmVPVWmVZ1
coup3 = cplcVWmVPVWmVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZ 
 
Subroutine Pi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,             & 
& cplAhhhVZp,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,           & 
& cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,& 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZp(4,4),cplAhhhVP(4,4),cplAhhhVZp(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),& 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),             & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZpL(3,3),& 
& cplcFeFeVZpR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),& 
& cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL(7,7),           & 
& cplChiChiVPR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcHpmVPVWm(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,      & 
& cplcVWmVWmVZp,cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),       & 
& cplhhhhVPVZp(4,4),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZp(4),             & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVPVZp(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),             & 
& cplHpmcVWmVZp(2),cplSdcSdVP(6,6),cplSdcSdVPVZp(6,6),cplSdcSdVZp(6,6),cplSecSeVP(6,6),  & 
& cplSecSeVPVZp(6,6),cplSecSeVZp(6,6),cplSucSuVP(6,6),cplSucSuVPVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvImVPVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZp(6,6),cplSvReSvReVPVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZpL(i2,i1)
coupR2 = cplcChaChaVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
coupL2 = cplChiChiVZpL(i1,i2)
coupR2 = cplChiChiVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVP(i2,i1)
coup2 = cplSvImSvReVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZp(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZp2
coup2 = cplcVWmVPVWmVZp1
coup3 = cplcVWmVPVWmVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZp 
 
Subroutine DerPi1LoopVPVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,             & 
& cplAhhhVZp,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,           & 
& cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL,cplChiChiVPR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVPVWm,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,& 
& cplcVWmVPVWmVZp3,cplcVWmVWmVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVPVZp, & 
& cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVPVZp,cplSdcSdVZp,         & 
& cplSecSeVP,cplSecSeVPVZp,cplSecSeVZp,cplSucSuVP,cplSucSuVPVZp,cplSucSuVZp,             & 
& cplSvImSvImVPVZp,cplSvImSvReVP,cplSvImSvReVZp,cplSvReSvReVPVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZp(4,4),cplAhhhVP(4,4),cplAhhhVZp(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),& 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),             & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZpL(3,3),& 
& cplcFeFeVZpR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),& 
& cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplChiChiVPL(7,7),           & 
& cplChiChiVPR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcHpmVPVWm(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,      & 
& cplcVWmVWmVZp,cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),       & 
& cplhhhhVPVZp(4,4),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZp(4),             & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVPVZp(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),             & 
& cplHpmcVWmVZp(2),cplSdcSdVP(6,6),cplSdcSdVPVZp(6,6),cplSdcSdVZp(6,6),cplSecSeVP(6,6),  & 
& cplSecSeVPVZp(6,6),cplSecSeVZp(6,6),cplSucSuVP(6,6),cplSucSuVPVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvImVPVZp(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZp(6,6),cplSvReSvReVPVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZpL(i2,i1)
coupR2 = cplcChaChaVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVPL(i1,i2)
coupR1 = cplChiChiVPR(i1,i2)
coupL2 = cplChiChiVZpL(i1,i2)
coupR2 = cplChiChiVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVP(i2,i1)
coup2 = cplSvImSvReVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZp(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZp2
coup2 = cplcVWmVPVWmVZp1
coup3 = cplcVWmVPVWmVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZp 
 
Subroutine Pi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,             & 
& cplAhhhVZp,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,      & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,            & 
& cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,             & 
& cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,        & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvReSvReVZVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVZVZp(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),& 
& cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),& 
& cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL(7,7),           & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplcHpmVWmVZ(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,         & 
& cplcVWmVWmVZVZp3,cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),    & 
& cplhhhhVZVZp(4,4),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),              & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcHpmVZVZp(2,2),               & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSdVZVZp(6,6),  & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZVZp(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),  & 
& cplSucSuVZVZp(6,6),cplSvImSvImVZVZp(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),       & 
& cplSvReSvReVZVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaVZpL(i2,i1)
coupR2 = cplcChaChaVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiVZpL(i1,i2)
coupR2 = cplChiChiVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplcHpmVWmVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplSdcSdVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplSecSeVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplSucSuVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplSvImSvReVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcVWmVZp(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcVWmVWmVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZp1
coup2 = cplcVWmVWmVZVZp2
coup3 = cplcVWmVWmVZVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZVZp 
 
Subroutine DerPi1LoopVZVZp(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,             & 
& cplAhhhVZp,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcFdFdVZL,      & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWmgWmVZ,            & 
& cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplChiChiVZR,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplFvFvVZL,cplFvFvVZpL,             & 
& cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,        & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcHpmVZVZp,cplHpmcVWmVZ,cplHpmcVWmVZp,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplSdcSdVZVZp,cplSecSeVZ,cplSecSeVZp,cplSecSeVZVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSucSuVZVZp,cplSvImSvImVZVZp,cplSvImSvReVZ,cplSvImSvReVZp,    & 
& cplSvReSvReVZVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVZVZp(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),& 
& cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),& 
& cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplChiChiVZL(7,7),           & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplcHpmVWmVZ(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,         & 
& cplcVWmVWmVZVZp3,cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),    & 
& cplhhhhVZVZp(4,4),cplhhVPVZ(4),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZ(4),              & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcHpmVZVZp(2,2),               & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSdVZVZp(6,6),  & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZVZp(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),  & 
& cplSucSuVZVZp(6,6),cplSvImSvImVZVZp(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),       & 
& cplSvReSvReVZVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaVZpL(i2,i1)
coupR2 = cplcChaChaVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiVZpL(i1,i2)
coupR2 = cplChiChiVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVPVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplcHpmVWmVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplSdcSdVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplSecSeVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplSucSuVZp(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplSvImSvReVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcVWmVZp(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcVWmVWmVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZp1
coup2 = cplcVWmVWmVZVZp2
coup3 = cplcVWmVWmVZVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZVZp 
 
Subroutine Pi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,              & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),               & 
& MFu2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),          & 
& MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),      & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWmgWmhh(4),cplcgWmgWmVZ,cplcgWpCgWpChh(4),cplcgWpCgWpCVZ,cplChiChihhL(7,7,4),     & 
& cplChiChihhR(7,7,4),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcHpmVWmVZ(2),               & 
& cplcVWmVWmVZ,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6),      & 
& cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),               & 
& cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvRe(4,6,6),            & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),     & 
& cplSvImSvReVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,         & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),               & 
& MFu2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),          & 
& MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),      & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWmgWmhh(4),cplcgWmgWmVZ,cplcgWpCgWpChh(4),cplcgWpCgWpCVZ,cplChiChihhL(7,7,4),     & 
& cplChiChihhR(7,7,4),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcHpmVWmVZ(2),               & 
& cplcVWmVWmVZ,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6),      & 
& cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),               & 
& cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvRe(4,6,6),            & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),     & 
& cplSvImSvReVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,       & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),     & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmAh(4),cplcgWmgWmVZ,cplcgWpCgWpCAh(4),      & 
& cplcgWpCgWpCVZ,cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChiVZL(7,7),              & 
& cplChiChiVZR(7,7),cplcHpmVWmVZ(2),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),             & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,        & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),     & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmAh(4),cplcgWmgWmVZ,cplcgWpCgWpCAh(4),      & 
& cplcgWpCgWpCVZ,cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChiVZL(7,7),              & 
& cplChiChiVZR(7,7),cplcHpmVWmVZ(2),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),             & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,         & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),               & 
& MFu2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),          & 
& MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),    & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),             & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),             & 
& cplcgWmgWmhh(4),cplcgWmgWmVZp,cplcgWpCgWpChh(4),cplcgWpCgWpCVZp,cplChiChihhL(7,7,4),   & 
& cplChiChihhR(7,7,4),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),   & 
& cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),               & 
& cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvRe(4,6,6),            & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZp
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZp
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZp(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZp(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZp(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZp(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZp(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZp(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZp
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZphh 
 
Subroutine DerPi1LoopVZphh(p2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,         & 
& MVWm,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,  & 
& cplChiChiVZpR,cplcHpmVWmVZp,cplcVWmVWmVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),               & 
& MFu2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),          & 
& MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),    & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),             & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),             & 
& cplcgWmgWmhh(4),cplcgWmgWmVZp,cplcgWpCgWpChh(4),cplcgWpCgWpCVZp,cplChiChihhL(7,7,4),   & 
& cplChiChihhR(7,7,4),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp,cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),   & 
& cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),               & 
& cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvRe(4,6,6),            & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZp
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZp
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZp(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZp(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZp(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZp(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZp(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZp(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZp
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZphh 
 
Subroutine Pi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),     & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),      & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),             & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcgWmgWmAh(4),cplcgWmgWmVZp,cplcgWpCgWpCAh(4),   & 
& cplcgWpCgWpCVZp,cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChiVZpL(7,7),            & 
& cplChiChiVZpR(7,7),cplcHpmVWmVZp(2),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),               & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZp(4),          & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZp(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZp
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZp
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZpVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZp(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZp(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZp(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZp(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZp(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZp(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZpAh 
 
Subroutine DerPi1LoopVZpAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpmVWm,             & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmAh,cplcgWmgWmVZp,cplcgWpCgWpCAh,cplcgWpCgWpCVZp,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcHpmVWmVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,           & 
& cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvImSvReVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmVWm(4,2),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),     & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),             & 
& cplAhSucSu(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),      & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),             & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcgWmgWmAh(4),cplcgWmgWmVZp,cplcgWpCgWpCAh(4),   & 
& cplcgWpCgWpCVZp,cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChiVZpL(7,7),            & 
& cplChiChiVZpR(7,7),cplcHpmVWmVZp(2),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),               & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplhhVPVZp(4),cplhhVZpVZp(4),cplhhVZVZp(4),          & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),& 
& cplSvImSvReVZp(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZp(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZpL(i1,i2)
coupR1 = cplcChaChaVZpR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 7
       Do i2 = 1, 7
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZpL(i1,i2)
coupR1 = cplChiChiVZpR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZp
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZp
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZpVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZp(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZp(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZp(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZp(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZp(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZp(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZpAh 
 
Subroutine Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,          & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,     & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,   & 
& cplcgWpCgZcHpm,cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,             & 
& cplcgZpgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,  & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhcHpmVWm(4,2),cplAhHpmcHpm(4,2,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),        & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),               & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,    & 
& cplcgWpCgAcHpm(2),cplcgWpCgZcHpm(2),cplcgWpCgZpcHpm(2),cplcgZgWmcHpm(2),               & 
& cplcgZgWpCVWm,cplcgZpgWmcHpm(2),cplcgZpgWpCVWm,cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),& 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,            & 
& cplcVWmVWmVZp,cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplhhcHpmVWm(4,2),               & 
& cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),      & 
& cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 7
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MCha2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MChi2(i2)),dp) 
coupL1 = cplcChaChiVWmL(i1,i2)
coupR1 = cplcChaChiVWmR(i1,i2)
coupL2 = cplChiChacHpmL(i2,i1,gO2)
coupR2 = cplChiChacHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWmL(i1,i2)
coupR1 = cplcFdFuVWmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWmL(i1,i2)
coupR1 = cplcFeFvVWmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,0._dp),dp) 
coup1 = cplcgAgWpCVWm
coup2 = cplcgWpCgAcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcgZgWpCVWm
coup2 = cplcgWpCgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZp2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVZp2),dp) 
coup1 = cplcgZpgWpCVWm
coup2 = cplcgWpCgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWm2),dp) 
coup1 = cplcgWmgZVWm
coup2 = cplcgZgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZp2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,MVWm2),dp) 
coup1 = cplcgWmgZpVWm
coup2 = cplcgZpgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWmVWm(i2)
coup2 = cplhhcHpmVWm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSd2(i1)),dp) 
coup1 = cplSucSdVWm(i2,i1)
coup2 = cplSdcHpmcSu(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSe2(i1)),dp) 
coup1 = cplSvImcSeVWm(i2,i1)
coup2 = cplSeSvImcHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSvRe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvRe2(i2),MSe2(i1)),dp) 
coup1 = cplSvRecSeVWm(i2,i1)
coup2 = cplSeSvRecHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,0._dp,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWm2,0._dp),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcHpmVPVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcHpmVWmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZp2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplHpmcHpmVZp(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZp2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVZp2),dp) 
coup1 = cplcVWmVWmVZp
coup2 = cplcHpmVWmVZp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWmHpm 
 
Subroutine DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpmVWm,cplAhHpmcHpm,    & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,     & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,   & 
& cplcgWpCgZcHpm,cplcgWpCgZpcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,cplcgZpgWmcHpm,             & 
& cplcgZpgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,  & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6),           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhcHpmVWm(4,2),cplAhHpmcHpm(4,2,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),        & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),               & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcgAgWpCVWm,cplcgWmgZpVWm,cplcgWmgZVWm,    & 
& cplcgWpCgAcHpm(2),cplcgWpCgZcHpm(2),cplcgWpCgZpcHpm(2),cplcgZgWmcHpm(2),               & 
& cplcgZgWpCVWm,cplcgZpgWmcHpm(2),cplcgZpgWpCVWm,cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),& 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,            & 
& cplcVWmVWmVZp,cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplhhcHpmVWm(4,2),               & 
& cplhhcVWmVWm(4),cplhhHpmcHpm(4,2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),      & 
& cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 7
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MChi2(i2)),dp) 
coupL1 = cplcChaChiVWmL(i1,i2)
coupR1 = cplcChaChiVWmR(i1,i2)
coupL2 = cplChiChacHpmL(i2,i1,gO2)
coupR2 = cplChiChacHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWmL(i1,i2)
coupR1 = cplcFdFuVWmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWmL(i1,i2)
coupR1 = cplcFeFvVWmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVP2),dp) 
coup1 = cplcgAgWpCVWm
coup2 = cplcgWpCgAcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcgZgWpCVWm
coup2 = cplcgWpCgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZp2),dp) 
coup1 = cplcgZpgWpCVWm
coup2 = cplcgWpCgZpcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWm2),dp) 
coup1 = cplcgWmgZVWm
coup2 = cplcgZgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZp2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,MVWm2),dp) 
coup1 = cplcgWmgZpVWm
coup2 = cplcgZpgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWmVWm(i2)
coup2 = cplhhcHpmVWm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSd2(i1)),dp) 
coup1 = cplSucSdVWm(i2,i1)
coup2 = cplSdcHpmcSu(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSe2(i1)),dp) 
coup1 = cplSvImcSeVWm(i2,i1)
coup2 = cplSeSvImcHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSvRe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvRe2(i2),MSe2(i1)),dp) 
coup1 = cplSvRecSeVWm(i2,i1)
coup2 = cplSeSvRecHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVP2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVP2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcHpmVPVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcHpmVWmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZp2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZp(i1)
coup2 = cplHpmcHpmVZp(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZp2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZp2),dp) 
coup1 = cplcVWmVWmVZp
coup2 = cplcHpmVWmVZp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWmHpm 
 
End Module LoopMasses_BLSSM 
