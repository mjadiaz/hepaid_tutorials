! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:55 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module CouplingsCT_BLSSM
 
Use Control 
Use Settings 
Use Model_Data_BLSSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine CalculateCouplingCT(g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,ZP,Mu,             & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,Tv,ZVI,ZVR,TW,TWp,g3,UM,UP,ZN,ZDL,             & 
& ZDR,ZEL,ZER,ZUL,ZUR,UV,pG,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZA,              & 
& dZP,dMu,dYd,dTd,dZD,dYe,dTe,dZE,dYu,dTu,dZU,dMuP,dYx,dTx,dYv,dTv,dZVI,dZVR,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,dg3,dUM,dUP,dZN,dZDL,dZDR,dZEL,           & 
& dZER,dZUL,dZUR,dUV,dpG,ctcplAhAhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,ctcplAhSecSe,           & 
& ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,ctcplhhhhhh,              & 
& ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,ctcplhhSvImSvRe, & 
& ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,ctcplSdcHpmcSu,          & 
& ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpmcVWm,   & 
& ctcplAhcHpmVWm,ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,            & 
& ctcplHpmcHpmVZp,ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,ctcplSdcSucVWm,   & 
& ctcplSeSvImcVWm,ctcplSeSvRecVWm,ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,               & 
& ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,ctcplSucSuVZ,ctcplSucSuVZp,ctcplSvImSvReVP,    & 
& ctcplSvImSvReVZ,ctcplSvImSvReVZp,ctcplSvImcSeVWm,ctcplSvRecSeVWm,ctcplhhVPVZ,          & 
& ctcplhhVPVZp,ctcplhhcVWmVWm,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,ctcplHpmcVWmVP,     & 
& ctcplHpmcVWmVZ,ctcplHpmcVWmVZp,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplcHpmVWmVZp,          & 
& ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,ctcplcChaChaAhL,             & 
& ctcplcChaChaAhR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,             & 
& ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,ctcplFvFvAhR,     & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChaFucSdL,ctcplChaFucSdR,ctcplFvChacSeL,        & 
& ctcplFvChacSeR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdChaSuL,ctcplcFdChaSuR,          & 
& ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplcFeChaSvReL,ctcplcFeChaSvReR,ctcplChiChihhL,    & 
& ctcplChiChihhR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,ctcplChiFecSeR,            & 
& ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplChiFvSvReL,         & 
& ctcplChiFvSvReR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,ctcplcFdChiSdR,       & 
& ctcplcFeChiSeL,ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,ctcplGluFdcSdL,            & 
& ctcplGluFdcSdR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,            & 
& ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplFvFecHpmL,ctcplFvFecHpmR,ctcplcFeFehhL,           & 
& ctcplcFeFehhR,ctcplcChaFeSvImL,ctcplcChaFeSvImR,ctcplcChaFeSvReL,ctcplcChaFeSvReR,     & 
& ctcplGluFucSuL,ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFuHpmL,              & 
& ctcplcFdFuHpmR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR,ctcplcChaFvSeL, & 
& ctcplcChaFvSeR,ctcplcFdGluSdL,ctcplcFdGluSdR,ctcplcFuGluSuL,ctcplcFuGluSuR,            & 
& ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplChiChacVWmL,ctcplChiChacVWmR,ctcplcChaChaVPL,     & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,           & 
& ctcplChiChiVZpR,ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcFdFdVGL,ctcplcFdFdVGR,         & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR, & 
& ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,ctcplcFeFeVPL,           & 
& ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,               & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR, & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplFvFvVPL,ctcplFvFvVPR,   & 
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,   & 
& ctcplGluGluVGL,ctcplGluGluVGR)

Implicit None 
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),ZA(4,4),ZP(2,2),TW,TWp,g3,dg1,dg2,              & 
& dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH(4,4),dZA(4,4),dZP(2,2),dSinTW,dCosTW,               & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,dg3

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),ZD(6,6),Ye(3,3),Te(3,3),ZE(6,6),Yu(3,3),Tu(3,3),ZU(6,6),           & 
& MuP,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),ZVR(6,6),UM(2,2),UP(2,2),ZN(7,7),         & 
& ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),UV(6,6),pG,dMu,dYd(3,3),         & 
& dTd(3,3),dZD(6,6),dYe(3,3),dTe(3,3),dZE(6,6),dYu(3,3),dTu(3,3),dZU(6,6),               & 
& dMuP,dYx(3,3),dTx(3,3),dYv(3,3),dTv(3,3),dZVI(6,6),dZVR(6,6),dUM(2,2),dUP(2,2),        & 
& dZN(7,7),dZDL(3,3),dZDR(3,3),dZEL(3,3),dZER(3,3),dZUL(3,3),dZUR(3,3),dUV(6,6),dpG

Complex(dp), Intent(out) :: ctcplAhAhhh(4,4,4),ctcplAhHpmcHpm(4,2,2),ctcplAhSdcSd(4,6,6),ctcplAhSecSe(4,6,6),     & 
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

Complex(dp), Intent(out) :: ctcplChiChacVWmR(7,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateCouplingCT'
 
ctcplAhAhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,ZA,               & 
& dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZA,ctcplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,vd,vu,ZA,ZP,dg2,dvd,dvu,dZA,dZP,             & 
& ctcplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSdcSd = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSdcSd(gt1,gt2,gt3,Mu,Yd,Td,ZD,ZA,dMu,dYd,dTd,dZD,dZA,               & 
& ctcplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSecSe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSecSe(gt1,gt2,gt3,Mu,Ye,Te,ZE,ZA,dMu,dYe,dTe,dZE,dZA,               & 
& ctcplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSucSu = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSucSu(gt1,gt2,gt3,Mu,Yu,Tu,ZU,ZA,dMu,dYu,dTu,dZU,dZA,               & 
& ctcplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvImSvIm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSvImSvIm(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,ZA,               & 
& dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZA,ctcplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvImSvRe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSvImSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,ZVR,              & 
& ZA,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZVR,dZA,ctcplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvReSvRe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSvReSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVR,ZA,               & 
& dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVR,dZA,ctcplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhhhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,ctcplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,               & 
& ZP,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZP,ctcplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSdcSd = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Yd,Td,vd,vu,x1,              & 
& x2,ZD,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYd,dTd,dvd,dvu,dx1,dx2,dZD,dZH,ctcplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSecSe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Ye,Te,vd,vu,x1,              & 
& x2,ZE,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYe,dTe,dvd,dvu,dx1,dx2,dZE,dZH,ctcplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSucSu = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Yu,Tu,vd,vu,x1,              & 
& x2,ZU,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYu,dTu,dvd,dvu,dx1,dx2,dZU,dZH,ctcplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvImSvIm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSvImSvIm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,Tx,Yv,             & 
& Tv,vd,vu,x1,x2,ZVI,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMuP,dMu,dYx,dTx,dYv,dTv,dvd,             & 
& dvu,dx1,dx2,dZVI,dZH,ctcplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvImSvRe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSvImSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,ZVR,              & 
& ZH,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZVR,dZH,ctcplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvReSvRe = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSvReSvRe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,Tx,Yv,             & 
& Tv,vd,vu,x1,x2,ZVR,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMuP,dMu,dYx,dTx,dYv,dTv,dvd,             & 
& dvu,dx1,dx2,dZVR,dZH,ctcplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Mu,Yd,Td,Yu,Tu,vd,vu,ZD,ZU,ZP,dg2,            & 
& dMu,dYd,dTd,dYu,dTu,dvd,dvu,dZD,dZU,dZP,ctcplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSvImcSe(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,x1,ZE,              & 
& ZVI,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVI,dZP,ctcplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSvRecSe(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,x1,ZE,              & 
& ZVR,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVR,dZP,ctcplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Mu,Yd,Td,Yu,Tu,vd,vu,ZD,ZU,ZP,               & 
& dg2,dMu,dYd,dTd,dYu,dTu,dvd,dvu,dZD,dZU,dZP,ctcplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSeSvImcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingSeSvImcHpm(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,x1,ZE,              & 
& ZVI,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVI,dZP,ctcplSeSvImcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSeSvRecHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingSeSvRecHpm(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,x1,ZE,              & 
& ZVR,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVR,dZP,ctcplSeSvRecHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhVP = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CT_CouplingAhhhVP(gt1,gt2,g1,g2,gBY,ZH,ZA,TW,dg1,dg2,dgBY,dZH,dZA,               & 
& dSinTW,dCosTW,dTanTW,ctcplAhhhVP(gt1,gt2))

 End Do 
End Do 


ctcplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZH,ZA,TW,TWp,dg1,dg2,dgBL,           & 
& dgYB,dgBY,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZ(gt1,gt2))

 End Do 
End Do 


ctcplAhhhVZp = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZH,ZA,TW,TWp,dg1,dg2,               & 
& dgBL,dgYB,dgBY,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZp(gt1,gt2))

 End Do 
End Do 


ctcplAhHpmcVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplAhcHpmVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhHpmcVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhcHpmVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,              & 
& dTanTW,ctcplHpmcHpmVP(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,gYB,ZP,TW,TWp,dg1,dg2,dgYB,dZP,               & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVZp(gt1,gt2,g1,g2,gYB,ZP,TW,TWp,dg1,dg2,dgYB,dZP,              & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcHpmVZp(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,ctcplSdcSdVG(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVP(gt1,gt2,g1,g2,gBY,ZD,TW,dg1,dg2,dgBY,dZD,dSinTW,              & 
& dCosTW,dTanTW,ctcplSdcSdVP(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZD,TW,TWp,dg1,dg2,dgBL,             & 
& dgYB,dgBY,dZD,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZD,TW,TWp,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZD,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSdcSdVZp(gt1,gt2))

 End Do 
End Do 


ctcplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


ctcplSeSvImcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSeSvImcVWm(gt1,gt2,g2,ZE,ZVI,dg2,dZE,dZVI,ctcplSeSvImcVWm(gt1,gt2))

 End Do 
End Do 


ctcplSeSvRecVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSeSvRecVWm(gt1,gt2,g2,ZE,ZVR,dg2,dZE,dZVR,ctcplSeSvRecVWm(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVP(gt1,gt2,g1,g2,gBY,ZE,TW,dg1,dg2,dgBY,dZE,dSinTW,              & 
& dCosTW,dTanTW,ctcplSecSeVP(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZE,TW,TWp,dg1,dg2,dgBL,             & 
& dgYB,dgBY,dZE,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSecSeVZ(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZE,TW,TWp,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZE,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSecSeVZp(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVG(gt1,gt2,g3,dg3,ctcplSucSuVG(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVP(gt1,gt2,g1,g2,gBY,ZU,TW,dg1,dg2,dgBY,dZU,dSinTW,              & 
& dCosTW,dTanTW,ctcplSucSuVP(gt1,gt2))

 End Do 
End Do 


ctcplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSucSdVWm(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZU,TW,TWp,dg1,dg2,dgBL,             & 
& dgYB,dgBY,dZU,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSucSuVZ(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZU,TW,TWp,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZU,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSucSuVZp(gt1,gt2))

 End Do 
End Do 


ctcplSvImSvReVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvImSvReVP(gt1,gt2,g1,g2,gBY,ZVI,ZVR,TW,dg1,dg2,dgBY,dZVI,            & 
& dZVR,dSinTW,dCosTW,dTanTW,ctcplSvImSvReVP(gt1,gt2))

 End Do 
End Do 


ctcplSvImSvReVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvImSvReVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZVI,ZVR,TW,TWp,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dZVI,dZVR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,             & 
& ctcplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


ctcplSvImSvReVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvImSvReVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZVI,ZVR,TW,TWp,dg1,             & 
& dg2,dgBL,dgYB,dgBY,dZVI,dZVR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,             & 
& ctcplSvImSvReVZp(gt1,gt2))

 End Do 
End Do 


ctcplSvImcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvImcSeVWm(gt1,gt2,g2,ZE,ZVI,dg2,dZE,dZVI,ctcplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


ctcplSvRecSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvRecSeVWm(gt1,gt2,g2,ZE,ZVR,dg2,dZE,dZVR,ctcplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhVPVZ = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhVPVZ(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVPVZ(gt1))

End Do 


ctcplhhVPVZp = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhVPVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVPVZp(gt1))

End Do 


ctcplhhcVWmVWm = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,ctcplhhcVWmVWm(gt1))

End Do 


ctcplhhVZVZ = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhVZVZ(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZVZ(gt1))

End Do 


ctcplhhVZVZp = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhVZVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZVZp(gt1))

End Do 


ctcplhhVZpVZp = 0._dp 
Do gt1 = 1, 4
Call CT_CouplinghhVZpVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,dg1,             & 
& dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZpVZp(gt1))

End Do 


ctcplHpmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplHpmcVWmVP(gt1))

End Do 


ctcplHpmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVZ(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,dvd,             & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcVWmVZ(gt1))

End Do 


ctcplHpmcVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVZp(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,dvd,            & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcVWmVZp(gt1))

End Do 


ctcplcHpmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplcHpmVPVWm(gt1))

End Do 


ctcplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVWmVZ(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,dvd,             & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpmVWmVZ(gt1))

End Do 


ctcplcHpmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVWmVZp(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,dvd,            & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpmVWmVZp(gt1))

End Do 


ctcplVGVGVG = 0._dp 
Call CT_CouplingVGVGVG(g3,dg3,ctcplVGVGVG)



ctcplcVWmVPVWm = 0._dp 
Call CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWmVPVWm)



ctcplcVWmVWmVZ = 0._dp 
Call CT_CouplingcVWmVWmVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,         & 
& dTanTWp,ctcplcVWmVWmVZ)



ctcplcVWmVWmVZp = 0._dp 
Call CT_CouplingcVWmVWmVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,        & 
& dTanTWp,ctcplcVWmVWmVZp)



ctcplcChaChaAhL = 0._dp 
ctcplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 4
Call CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,ZA,UM,UP,dg2,dZA,dUM,dUP,ctcplcChaChaAhL(gt1,gt2,gt3)& 
& ,ctcplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChiAhL = 0._dp 
ctcplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 4
Call CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,ZA,ZN,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZA,dZN,ctcplChiChiAhL(gt1,gt2,gt3),ctcplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFdAhL = 0._dp 
ctcplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,ctcplcFdFdAhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFeAhL = 0._dp 
ctcplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,ctcplcFeFeAhL(gt1,gt2,gt3)& 
& ,ctcplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuAhL = 0._dp 
ctcplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,ctcplcFuFuAhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFvAhL = 0._dp 
ctcplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 4
Call CT_CouplingFvFvAh(gt1,gt2,gt3,Yx,Yv,ZA,UV,dYx,dYv,dZA,dUV,ctcplFvFvAhL(gt1,gt2,gt3)& 
& ,ctcplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacHpmL = 0._dp 
ctcplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,gYB,ZP,ZN,UM,UP,dg1,dg2,dgYB,            & 
& dZP,dZN,dUM,dUP,ctcplChiChacHpmL(gt1,gt2,gt3),ctcplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChaFucSdL = 0._dp 
ctcplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,               & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplChaFucSdL(gt1,gt2,gt3),ctcplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvChacSeL = 0._dp 
ctcplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingFvChacSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,dg2,dYe,dYv,dZE,            & 
& dUM,dUP,dUV,ctcplFvChacSeL(gt1,gt2,gt3),ctcplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChahhL = 0._dp 
ctcplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 4
Call CT_CouplingcChaChahh(gt1,gt2,gt3,g2,ZH,UM,UP,dg2,dZH,dUM,dUP,ctcplcChaChahhL(gt1,gt2,gt3)& 
& ,ctcplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChaSuL = 0._dp 
ctcplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,               & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcFdChaSuL(gt1,gt2,gt3),ctcplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChaSvImL = 0._dp 
ctcplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFeChaSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVI,dUM,dUP,dZEL,dZER,ctcplcFeChaSvImL(gt1,gt2,gt3),ctcplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChaSvReL = 0._dp 
ctcplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFeChaSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVR,dUM,dUP,dZEL,dZER,ctcplcFeChaSvReL(gt1,gt2,gt3),ctcplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChihhL = 0._dp 
ctcplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 4
Call CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,ZH,ZN,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZH,dZN,ctcplChiChihhL(gt1,gt2,gt3),ctcplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFdcSdL = 0._dp 
ctcplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yd,ZD,ZN,ZDL,ZDR,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYd,dZD,dZN,dZDL,dZDR,ctcplChiFdcSdL(gt1,gt2,gt3)               & 
& ,ctcplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFecSeL = 0._dp 
ctcplChiFecSeR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,ZER,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYe,dZE,dZN,dZEL,dZER,ctcplChiFecSeL(gt1,gt2,gt3)               & 
& ,ctcplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFucSuL = 0._dp 
ctcplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yu,ZU,ZN,ZUL,ZUR,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYu,dZU,dZN,dZUL,dZUR,ctcplChiFucSuL(gt1,gt2,gt3)               & 
& ,ctcplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFvSvImL = 0._dp 
ctcplChiFvSvImR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingChiFvSvIm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVI,ZN,UV,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYx,dYv,dZVI,dZN,dUV,ctcplChiFvSvImL(gt1,gt2,gt3)               & 
& ,ctcplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFvSvReL = 0._dp 
ctcplChiFvSvReR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingChiFvSvRe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVR,ZN,UV,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYx,dYv,dZVR,dZN,dUV,ctcplChiFvSvReL(gt1,gt2,gt3)               & 
& ,ctcplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChiHpmL = 0._dp 
ctcplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 7
  Do gt3 = 1, 2
Call CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,gYB,ZP,ZN,UM,UP,dg1,dg2,dgYB,            & 
& dZP,dZN,dUM,dUP,ctcplcChaChiHpmL(gt1,gt2,gt3),ctcplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChiSdL = 0._dp 
ctcplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yd,ZD,ZN,ZDL,ZDR,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYd,dZD,dZN,dZDL,dZDR,ctcplcFdChiSdL(gt1,gt2,gt3)               & 
& ,ctcplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChiSeL = 0._dp 
ctcplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,ZER,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYe,dZE,dZN,dZEL,dZER,ctcplcFeChiSeL(gt1,gt2,gt3)               & 
& ,ctcplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuChiSuL = 0._dp 
ctcplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yu,ZU,ZN,ZUL,ZUR,              & 
& dg1,dg2,dgBL,dgYB,dgBY,dYu,dZU,dZN,dZUL,dZUR,ctcplcFuChiSuL(gt1,gt2,gt3)               & 
& ,ctcplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFdcSdL = 0._dp 
ctcplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplGluFdcSdL(gt2,gt3),ctcplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


ctcplcFdFdhhL = 0._dp 
ctcplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,ctcplcFdFdhhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFdcSuL = 0._dp 
ctcplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,              & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcChaFdcSuL(gt1,gt2,gt3),ctcplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFdcHpmL = 0._dp 
ctcplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,               & 
& dZP,dZDL,dZDR,dZUL,dZUR,ctcplcFuFdcHpmL(gt1,gt2,gt3),ctcplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFecHpmL = 0._dp 
ctcplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,dZP,dUV,             & 
& dZEL,dZER,ctcplFvFecHpmL(gt1,gt2,gt3),ctcplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFehhL = 0._dp 
ctcplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,ctcplcFeFehhL(gt1,gt2,gt3)& 
& ,ctcplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFeSvImL = 0._dp 
ctcplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFeSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVI,dUM,dUP,dZEL,dZER,ctcplcChaFeSvImL(gt1,gt2,gt3),ctcplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFeSvReL = 0._dp 
ctcplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFeSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVR,dUM,dUP,dZEL,dZER,ctcplcChaFeSvReL(gt1,gt2,gt3),ctcplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFucSuL = 0._dp 
ctcplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplGluFucSuL(gt2,gt3),ctcplGluFucSuR(gt2,gt3))

 End Do 
End Do 


ctcplcFuFuhhL = 0._dp 
ctcplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,ctcplcFuFuhhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFuHpmL = 0._dp 
ctcplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,dZP,            & 
& dZDL,dZDR,dZUL,dZUR,ctcplcFdFuHpmL(gt1,gt2,gt3),ctcplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFvhhL = 0._dp 
ctcplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 4
Call CT_CouplingFvFvhh(gt1,gt2,gt3,Yx,Yv,ZH,UV,dYx,dYv,dZH,dUV,ctcplFvFvhhL(gt1,gt2,gt3)& 
& ,ctcplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFvHpmL = 0._dp 
ctcplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,dZP,dUV,             & 
& dZEL,dZER,ctcplcFeFvHpmL(gt1,gt2,gt3),ctcplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFvSeL = 0._dp 
ctcplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingcChaFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,dg2,dYe,dYv,dZE,            & 
& dUM,dUP,dUV,ctcplcChaFvSeL(gt1,gt2,gt3),ctcplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdGluSdL = 0._dp 
ctcplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplcFdGluSdL(gt1,gt3),ctcplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


ctcplcFuGluSuL = 0._dp 
ctcplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplcFuGluSuL(gt1,gt3),ctcplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


ctcplcChacFuSdL = 0._dp 
ctcplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,              & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplcChacFuSdL(gt1,gt2,gt3),ctcplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacVWmL = 0._dp 
ctcplChiChacVWmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 2
Call CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplChiChacVWmL(gt1,gt2)& 
& ,ctcplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVPL = 0._dp 
ctcplcChaChaVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,dSinTW,              & 
& dCosTW,dTanTW,ctcplcChaChaVPL(gt1,gt2),ctcplcChaChaVPR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVZL = 0._dp 
ctcplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,gYB,UM,UP,TW,TWp,dg1,dg2,dgYB,dUM,            & 
& dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcChaChaVZL(gt1,gt2)              & 
& ,ctcplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVZpL = 0._dp 
ctcplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVZp(gt1,gt2,g1,g2,gYB,UM,UP,TW,TWp,dg1,dg2,dgYB,               & 
& dUM,dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcChaChaVZpL(gt1,gt2)         & 
& ,ctcplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVPL = 0._dp 
ctcplChiChiVPR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CT_CouplingChiChiVP(gt1,gt2,g1,g2,gBY,ZN,TW,dg1,dg2,dgBY,dZN,dSinTW,             & 
& dCosTW,dTanTW,ctcplChiChiVPL(gt1,gt2),ctcplChiChiVPR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVZL = 0._dp 
ctcplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CT_CouplingChiChiVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZN,TW,TWp,dg1,dg2,dgBL,            & 
& dgYB,dgBY,dZN,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplChiChiVZL(gt1,gt2)     & 
& ,ctcplChiChiVZR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVZpL = 0._dp 
ctcplChiChiVZpR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CT_CouplingChiChiVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZN,TW,TWp,dg1,dg2,dgBL,           & 
& dgYB,dgBY,dZN,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplChiChiVZpL(gt1,gt2)    & 
& ,ctcplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChiVWmL = 0._dp 
ctcplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 7
Call CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplcChaChiVWmL(gt1,gt2)& 
& ,ctcplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVGL = 0._dp 
ctcplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,ctcplcFdFdVGL(gt1,gt2),ctcplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVPL = 0._dp 
ctcplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,              & 
& dTanTW,ctcplcFdFdVPL(gt1,gt2),ctcplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZL = 0._dp 
ctcplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,           & 
& dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZL(gt1,gt2)               & 
& ,ctcplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZpL = 0._dp 
ctcplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,               & 
& dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZpL(gt1,gt2)         & 
& ,ctcplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFdcVWmL = 0._dp 
ctcplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFuFdcVWmL(gt1,gt2)   & 
& ,ctcplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


ctcplFvFecVWmL = 0._dp 
ctcplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CT_CouplingFvFecVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplFvFecVWmL(gt1,gt2)       & 
& ,ctcplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVPL = 0._dp 
ctcplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,              & 
& dTanTW,ctcplcFeFeVPL(gt1,gt2),ctcplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZL = 0._dp 
ctcplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,           & 
& dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZL(gt1,gt2)               & 
& ,ctcplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZpL = 0._dp 
ctcplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,               & 
& dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZpL(gt1,gt2)         & 
& ,ctcplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVGL = 0._dp 
ctcplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,ctcplcFuFuVGL(gt1,gt2),ctcplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVPL = 0._dp 
ctcplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,              & 
& dTanTW,ctcplcFuFuVPL(gt1,gt2),ctcplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFuVWmL = 0._dp 
ctcplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFdFuVWmL(gt1,gt2)     & 
& ,ctcplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZL = 0._dp 
ctcplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,           & 
& dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZL(gt1,gt2)               & 
& ,ctcplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZpL = 0._dp 
ctcplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,               & 
& dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZpL(gt1,gt2)         & 
& ,ctcplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVPL = 0._dp 
ctcplFvFvVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingFvFvVP(gt1,gt2,g1,g2,gBY,UV,TW,dg1,dg2,dgBY,dUV,dSinTW,               & 
& dCosTW,dTanTW,ctcplFvFvVPL(gt1,gt2),ctcplFvFvVPR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZL = 0._dp 
ctcplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingFvFvVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,UV,TW,TWp,dg1,dg2,dgBL,              & 
& dgYB,dgBY,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplFvFvVZL(gt1,gt2)       & 
& ,ctcplFvFvVZR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZpL = 0._dp 
ctcplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingFvFvVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,UV,TW,TWp,dg1,dg2,dgBL,             & 
& dgYB,dgBY,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplFvFvVZpL(gt1,gt2)      & 
& ,ctcplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFvVWmL = 0._dp 
ctcplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CT_CouplingcFeFvVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplcFeFvVWmL(gt1,gt2)       & 
& ,ctcplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


ctcplGluGluVGL = 0._dp 
ctcplGluGluVGR = 0._dp 
Call CT_CouplingGluGluVG(g3,pG,dg3,dpG,ctcplGluGluVGL,ctcplGluGluVGR)



Iname = Iname - 1 
End Subroutine CalculateCouplingCT

Subroutine CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,               & 
& ZH,ZA,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),ZA(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,             & 
& dvu,dx1,dx2,dZH(4,4),dZA(4,4)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res-(gYB**2*vd*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res-(g2**2*vd*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res+(g1**2*vu*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res+(gYB**2*vu*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt3,4)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt3,4)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1**2*vd*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res+(gYB**2*vd*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(g1**2*vu*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(gYB**2*vu*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(g2**2*vu*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res+(gYB*gBL*x1*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt3,4)*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt3,4)*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res-(gYB*gBL*vd*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(gBL**2*x1*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,3))
res = res-(gBY**2*x1*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,3))
res = res+gBL**2*x2*dZH(gt3,4)*ZA(gt1,3)*ZA(gt2,3)
res = res+gBY**2*x2*dZH(gt3,4)*ZA(gt1,3)*ZA(gt2,3)
res = res+(gYB*gBL*vd*dZH(gt3,1)*ZA(gt1,4)*ZA(gt2,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt3,1)*ZA(gt1,4)*ZA(gt2,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt3,2)*ZA(gt1,4)*ZA(gt2,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt3,2)*ZA(gt1,4)*ZA(gt2,4))/2._dp
res = res+gBL**2*x1*dZH(gt3,3)*ZA(gt1,4)*ZA(gt2,4)
res = res+gBY**2*x1*dZH(gt3,3)*ZA(gt1,4)*ZA(gt2,4)
res = res-(gBL**2*x2*dZH(gt3,4)*ZA(gt1,4)*ZA(gt2,4))
res = res-(gBY**2*x2*dZH(gt3,4)*ZA(gt1,4)*ZA(gt2,4))
res = res-(g1**2*vd*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1))/4._dp
res = res-(gYB**2*vd*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1))/4._dp
res = res-(g2**2*vd*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vd*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vd*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))/4._dp
res = res-(gYB*gBL*vd*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*vd*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*vd*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*vd*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,1))/2._dp
res = res-(g1**2*vd*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(gYB**2*vd*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(g2**2*vd*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dvd*g1**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dvd*gYB**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dvd*g2**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dg1*g1*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dgYB*gYB*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dg2*g2*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/2._dp
res = res+(g1**2*vd*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vd*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*g1**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*gYB**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*g2**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dgYB*gYB*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res-(gYB*gBL*vd*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*vd*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*gYB*gBL*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*g1*gBY*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBY*g1*vd*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBL*gYB*vd*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgYB*gBL*vd*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dg1*gBY*vd*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*vd*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*vd*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dvd*gYB*gBL*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dvd*g1*gBY*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBY*g1*vd*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBL*gYB*vd*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgYB*gBL*vd*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dg1*gBY*vd*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,1))/2._dp
res = res+(g1**2*vu*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vu*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))/4._dp
res = res-(g1**2*vu*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2))/4._dp
res = res-(gYB**2*vu*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2))/4._dp
res = res-(g2**2*vu*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2))/4._dp
res = res+(gYB*gBL*vu*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*vu*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*vu*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*vu*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,2))/2._dp
res = res+(g1**2*vu*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vu*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g1**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*gYB**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g2**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dgYB*gYB*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res-(g1**2*vu*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(gYB**2*vu*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(g2**2*vu*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dvu*g1**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dvu*gYB**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dvu*g2**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dg1*g1*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dgYB*gYB*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dg2*g2*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/2._dp
res = res+(gYB*gBL*vu*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*vu*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvu*gYB*gBL*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvu*g1*gBY*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBY*g1*vu*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBL*gYB*vu*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgYB*gBL*vu*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dg1*gBY*vu*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*vu*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*vu*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dvu*gYB*gBL*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dvu*g1*gBY*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBY*g1*vu*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBL*gYB*vu*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgYB*gBL*vu*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dg1*gBY*vu*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x1*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*x1*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*x1*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*x1*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res-(gBL**2*x1*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,3))
res = res-(gBY**2*x1*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,3))
res = res+gBL**2*x1*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,3)
res = res+gBY**2*x1*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,3)
res = res-(gYB*gBL*x1*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*x1*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dx1*gYB*gBL*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dx1*g1*gBY*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBY*g1*x1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBL*gYB*x1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgYB*gBL*x1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dg1*gBY*x1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*x1*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*x1*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dx1*gYB*gBL*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dx1*g1*gBY*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBY*g1*x1*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBL*gYB*x1*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgYB*gBL*x1*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dg1*gBY*x1*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(gBL**2*x1*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))
res = res-(gBY**2*x1*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))
res = res-(dx1*gBL**2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))
res = res-(dx1*gBY**2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))
res = res-2*dgBL*gBL*x1*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
res = res-2*dgBY*gBY*x1*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
res = res+gBL**2*x1*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+gBY**2*x1*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+dx1*gBL**2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+dx1*gBY**2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+2*dgBL*gBL*x1*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+2*dgBY*gBY*x1*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,3)
res = res+(gYB*gBL*x2*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*x2*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*x2*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*x2*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,4))/2._dp
res = res+gBL**2*x2*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,4)
res = res+gBY**2*x2*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,4)
res = res-(gBL**2*x2*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,4))
res = res-(gBY**2*x2*dZA(gt2,4)*ZA(gt1,4)*ZH(gt3,4))
res = res+(gYB*gBL*x2*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*x2*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dx2*gYB*gBL*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dx2*g1*gBY*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBY*g1*x2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBL*gYB*x2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgYB*gBL*x2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dg1*gBY*x2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*x2*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*x2*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dx2*gYB*gBL*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dx2*g1*gBY*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBY*g1*x2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBL*gYB*x2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgYB*gBL*x2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dg1*gBY*x2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,4))/2._dp
res = res+gBL**2*x2*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res+gBY**2*x2*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res+dx2*gBL**2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res+dx2*gBY**2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res+2*dgBL*gBL*x2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res+2*dgBY*gBY*x2*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,4)
res = res-(gBL**2*x2*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4))
res = res-(gBY**2*x2*dZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4))
res = res-(dx2*gBL**2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4))
res = res-(dx2*gBY**2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4))
res = res-2*dgBL*gBL*x2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4)
res = res-2*dgBY*gBY*x2*ZA(gt1,4)*ZA(gt2,4)*ZH(gt3,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhhh  
 
 
Subroutine CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,vd,vu,ZA,ZP,dg2,dvd,dvu,               & 
& dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,ZA(4,4),ZP(2,2),dg2,dvd,dvu,dZA(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vu*dZP(gt3,2)*ZA(gt1,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZA(gt1,2)*ZP(gt2,1))/4._dp
res = res+(g2**2*vu*dZP(gt3,1)*ZA(gt1,1)*ZP(gt2,2))/4._dp
res = res+(g2**2*vd*dZP(gt3,1)*ZA(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g2**2*vu*dZP(gt2,2)*ZA(gt1,1)*ZP(gt3,1))/4._dp
res = res+(g2**2*vd*dZP(gt2,2)*ZA(gt1,2)*ZP(gt3,1))/4._dp
res = res+(g2**2*vu*dZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(g2**2*vd*dZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dvu*g2**2*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vu*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvd*g2**2*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vd*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(g2**2*vu*dZP(gt2,1)*ZA(gt1,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZA(gt1,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*dZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dvu*g2**2*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcHpm  
 
 
Subroutine CT_CouplingAhSdcSd(gt1,gt2,gt3,Mu,Yd,Td,ZD,ZA,dMu,dYd,dTd,dZD,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),ZD(6,6),dMu,dYd(3,3),dTd(3,3),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZD(gt3,j2)*ZA(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZA(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZA(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dZA(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dTd(j1,j2)*ZA(gt1,1)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZA(gt1,2)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZA(gt1,2)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,2)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((dMu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,2)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*ZA(gt1,1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dZA(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZD(gt2,j2))*ZA(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSdcSd  
 
 
Subroutine CT_CouplingAhSecSe(gt1,gt2,gt3,Mu,Ye,Te,ZE,ZA,dMu,dYe,dTe,dZE,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),ZE(6,6),dMu,dYe(3,3),dTe(3,3),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZE(gt3,j2)*ZA(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZA(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZA(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dZA(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dTe(j1,j2)*ZA(gt1,1)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZA(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZA(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((dMu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*ZA(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dZA(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt2,j2))*ZA(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSecSe  
 
 
Subroutine CT_CouplingAhSucSu(gt1,gt2,gt3,Mu,Yu,Tu,ZU,ZA,dMu,dYu,dTu,dZU,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Mu,Yu(3,3),Tu(3,3),ZU(6,6),dMu,dYu(3,3),dTu(3,3),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZA(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZA(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2)*ZA(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dZA(gt1,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZA(gt1,2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZA(gt1,1)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZA(gt1,1)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,1)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((dMu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,1)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*ZA(gt1,2)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dZA(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZU(gt2,j2))*ZA(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSucSu  
 
 
Subroutine CT_CouplingAhSvImSvIm(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,            & 
& ZA,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,x1,ZA(4,4),dvu,dx1,dZA(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),dMuP,dMu,dYx(3,3),dTx(3,3),           & 
& dYv(3,3),dTv(3,3),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvImSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVI(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVI(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvImSvIm  
 
 
Subroutine CT_CouplingAhSvImSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,            & 
& ZVR,ZA,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZVR,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,x1,ZA(4,4),dvu,dx1,dZA(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),ZVR(6,6),dMuP,dMu,dYx(3,3),           & 
& dTx(3,3),dYv(3,3),dTv(3,3),dZVI(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvImSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvImSvRe  
 
 
Subroutine CT_CouplingAhSvReSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVR,            & 
& ZA,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVR,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,x1,ZA(4,4),dvu,dx1,dZA(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVR(6,6),dMuP,dMu,dYx(3,3),dTx(3,3),           & 
& dYv(3,3),dTv(3,3),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvReSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dTx(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvReSvRe  
 
 
Subroutine CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,               & 
& ZH,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*g1**2*vd*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(-3*gYB**2*vd*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(g1**2*vu*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(gYB**2*vu*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt3,4)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt3,4)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1**2*vu*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(gYB**2*vu*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(g1**2*vd*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(gYB**2*vd*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(g2**2*vd*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res-(gYB*gBL*vd*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res-(g1*gBY*vd*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt3,1)*ZH(gt1,4)*ZH(gt2,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt3,1)*ZH(gt1,4)*ZH(gt2,1))/2._dp
res = res+(gYB*gBL*vd*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,1))/2._dp
res = res+(g1*gBY*vd*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,1))/2._dp
res = res+(g1**2*vu*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(gYB**2*vu*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g2**2*vu*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g1**2*vd*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(gYB**2*vd*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g1**2*vd*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(gYB**2*vd*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(-3*g1**2*vu*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(-3*gYB**2*vu*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(gYB*gBL*x1*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt3,4)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt3,4)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(gYB*gBL*x1*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(gYB*gBL*vu*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(g1*gBY*vu*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt3,2)*ZH(gt1,4)*ZH(gt2,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt3,2)*ZH(gt1,4)*ZH(gt2,2))/2._dp
res = res-(gYB*gBL*vu*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,2))/2._dp
res = res-(g1*gBY*vu*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,2))/2._dp
res = res-(gYB*gBL*x1*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res-(g1*gBY*x1*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res+(gYB*gBL*x1*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(g1*gBY*x1*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res-3*gBL**2*x1*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,3)
res = res-3*gBY**2*x1*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,3)
res = res+gBL**2*x2*dZH(gt3,4)*ZH(gt1,3)*ZH(gt2,3)
res = res+gBY**2*x2*dZH(gt3,4)*ZH(gt1,3)*ZH(gt2,3)
res = res+gBL**2*x2*dZH(gt3,3)*ZH(gt1,4)*ZH(gt2,3)
res = res+gBY**2*x2*dZH(gt3,3)*ZH(gt1,4)*ZH(gt2,3)
res = res+gBL**2*x1*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,3)
res = res+gBY**2*x1*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,3)
res = res+(gYB*gBL*x2*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,4))/2._dp
res = res+(g1*gBY*x2*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,4))/2._dp
res = res+(gYB*gBL*vd*dZH(gt3,4)*ZH(gt1,1)*ZH(gt2,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt3,4)*ZH(gt1,1)*ZH(gt2,4))/2._dp
res = res-(gYB*gBL*x2*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,4))/2._dp
res = res-(g1*gBY*x2*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt3,4)*ZH(gt1,2)*ZH(gt2,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt3,4)*ZH(gt1,2)*ZH(gt2,4))/2._dp
res = res+gBL**2*x2*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,4)
res = res+gBY**2*x2*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,4)
res = res+gBL**2*x1*dZH(gt3,4)*ZH(gt1,3)*ZH(gt2,4)
res = res+gBY**2*x1*dZH(gt3,4)*ZH(gt1,3)*ZH(gt2,4)
res = res+(gYB*gBL*vd*dZH(gt3,1)*ZH(gt1,4)*ZH(gt2,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt3,1)*ZH(gt1,4)*ZH(gt2,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt3,2)*ZH(gt1,4)*ZH(gt2,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt3,2)*ZH(gt1,4)*ZH(gt2,4))/2._dp
res = res+gBL**2*x1*dZH(gt3,3)*ZH(gt1,4)*ZH(gt2,4)
res = res+gBY**2*x1*dZH(gt3,3)*ZH(gt1,4)*ZH(gt2,4)
res = res-3*gBL**2*x2*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,4)
res = res-3*gBY**2*x2*dZH(gt3,4)*ZH(gt1,4)*ZH(gt2,4)
res = res+(-3*g1**2*vd*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(-3*gYB**2*vd*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vu*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt2,4)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt2,4)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(g1**2*vu*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vu*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g1**2*vd*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vd*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res-(gYB*gBL*vd*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*vd*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt2,1)*ZH(gt1,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt2,1)*ZH(gt1,4)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*vd*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*vd*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,1))/2._dp
res = res+(-3*g1**2*vd*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*gYB**2*vd*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vu*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dvd*g1**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*dvd*gYB**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*dvd*g2**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*dg1*g1*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dgYB*gYB*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dg2*g2*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dvu*g1**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(dvu*gYB**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(dvu*g2**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dgYB*gYB*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dx1*gYB*gBL*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dx1*g1*gBY*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dgBY*g1*x1*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dgBL*gYB*x1*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dgYB*gBL*x1*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dg1*gBY*x1*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dx2*gYB*gBL*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dx2*g1*gBY*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dgBY*g1*x2*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dgBL*gYB*x2*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dgYB*gBL*x2*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dg1*gBY*x2*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(g1**2*vu*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vu*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g1**2*vd*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(gYB**2*vd*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvu*g1**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvu*gYB**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvu*g2**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dgYB*gYB*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvd*g1**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*gYB**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*g2**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dgYB*gYB*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(gYB*gBL*x1*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(gYB*gBL*vd*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*vd*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dx1*gYB*gBL*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dx1*g1*gBY*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBY*g1*x1*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBL*gYB*x1*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgYB*gBL*x1*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dg1*gBY*x1*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*gYB*gBL*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*g1*gBY*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBY*g1*vd*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgBL*gYB*vd*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dgYB*gBL*vd*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dg1*gBY*vd*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(gYB*gBL*vd*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*vd*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dx2*gYB*gBL*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dx2*g1*gBY*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBY*g1*x2*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBL*gYB*x2*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgYB*gBL*x2*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dg1*gBY*x2*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dvd*gYB*gBL*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dvd*g1*gBY*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBY*g1*vd*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgBL*gYB*vd*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dgYB*gBL*vd*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(dg1*gBY*vd*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,1))/2._dp
res = res+(g1**2*vu*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vu*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g1**2*vd*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vd*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g1**2*vd*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vd*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(-3*g1**2*vu*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(-3*gYB**2*vu*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(gYB*gBL*x1*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt2,4)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt2,4)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res+(gYB*gBL*x1*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(gYB*gBL*vu*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*vu*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt2,2)*ZH(gt1,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt2,2)*ZH(gt1,4)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*vu*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*vu*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,2))/2._dp
res = res+(g1**2*vu*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vu*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g1**2*vd*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vd*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g1**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*gYB**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g2**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dgYB*gYB*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvd*g1**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvd*gYB**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvd*g2**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dgYB*gYB*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(gYB**2*vd*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*g1**2*vu*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*gYB**2*vu*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(gYB*gBL*x1*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dvd*g1**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(dvd*gYB**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(dvd*g2**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dgYB*gYB*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dvu*g1**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*dvu*gYB**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*dvu*g2**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*dg1*g1*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dgYB*gYB*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dg2*g2*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dx1*gYB*gBL*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dx1*g1*gBY*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dgBY*g1*x1*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dgBL*gYB*x1*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dgYB*gBL*x1*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dg1*gBY*x1*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dx2*gYB*gBL*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dx2*g1*gBY*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dgBY*g1*x2*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dgBL*gYB*x2*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dgYB*gBL*x2*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dg1*gBY*x2*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(gYB*gBL*x1*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(gYB*gBL*vu*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(g1*gBY*vu*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dx1*gYB*gBL*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dx1*g1*gBY*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBY*g1*x1*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBL*gYB*x1*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgYB*gBL*x1*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dg1*gBY*x1*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvu*gYB*gBL*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvu*g1*gBY*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBY*g1*vu*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgBL*gYB*vu*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dgYB*gBL*vu*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dg1*gBY*vu*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*vu*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(g1*gBY*vu*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dx2*gYB*gBL*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dx2*g1*gBY*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBY*g1*x2*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBL*gYB*x2*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgYB*gBL*x2*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dg1*gBY*x2*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dvu*gYB*gBL*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dvu*g1*gBY*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBY*g1*vu*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgBL*gYB*vu*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dgYB*gBL*vu*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(dg1*gBY*vu*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,2))/2._dp
res = res-(gYB*gBL*x1*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*x1*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*x1*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*x1*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res-3*gBL**2*x1*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,3)
res = res-3*gBY**2*x1*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,3)
res = res+gBL**2*x2*dZH(gt2,4)*ZH(gt1,3)*ZH(gt3,3)
res = res+gBY**2*x2*dZH(gt2,4)*ZH(gt1,3)*ZH(gt3,3)
res = res+gBL**2*x2*dZH(gt2,3)*ZH(gt1,4)*ZH(gt3,3)
res = res+gBY**2*x2*dZH(gt2,3)*ZH(gt1,4)*ZH(gt3,3)
res = res+gBL**2*x1*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,3)
res = res+gBY**2*x1*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,3)
res = res-(gYB*gBL*x1*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*x1*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dx1*gYB*gBL*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dx1*g1*gBY*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBY*g1*x1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBL*gYB*x1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgYB*gBL*x1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dg1*gBY*x1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvd*gYB*gBL*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvd*g1*gBY*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBY*g1*vd*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgBL*gYB*vd*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dgYB*gBL*vd*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dg1*gBY*vd*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*x1*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*x1*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dx1*gYB*gBL*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dx1*g1*gBY*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBY*g1*x1*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBL*gYB*x1*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgYB*gBL*x1*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dg1*gBY*x1*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvu*gYB*gBL*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvu*g1*gBY*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBY*g1*vu*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgBL*gYB*vu*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dgYB*gBL*vu*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dg1*gBY*vu*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(gYB*gBL*vd*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(g1*gBY*vd*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(gYB*gBL*vu*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(g1*gBY*vu*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-3*gBL**2*x1*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-3*gBY**2*x1*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res+gBL**2*x2*dZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res+gBY**2*x2*dZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res-(dvd*gYB*gBL*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dvd*g1*gBY*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dgBY*g1*vd*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dgBL*gYB*vd*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dgYB*gBL*vd*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dg1*gBY*vd*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*gYB*gBL*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*g1*gBY*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dgBY*g1*vu*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dgBL*gYB*vu*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dgYB*gBL*vu*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dg1*gBY*vu*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-3*dx1*gBL**2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-3*dx1*gBY**2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-6*dgBL*gBL*x1*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-6*dgBY*gBY*x1*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res+dx2*gBL**2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res+dx2*gBY**2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res+2*dgBL*gBL*x2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res+2*dgBY*gBY*x2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,3)
res = res+gBL**2*x2*dZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+gBY**2*x2*dZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+gBL**2*x1*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+gBY**2*x1*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+dx2*gBL**2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+dx2*gBY**2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+2*dgBL*gBL*x2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+2*dgBY*gBY*x2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,3)
res = res+dx1*gBL**2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+dx1*gBY**2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+2*dgBL*gBL*x1*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+2*dgBY*gBY*x1*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,3)
res = res+(gYB*gBL*x2*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*x2*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,4))/2._dp
res = res+(gYB*gBL*vd*dZH(gt2,4)*ZH(gt1,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt2,4)*ZH(gt1,1)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*x2*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*x2*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt2,4)*ZH(gt1,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt2,4)*ZH(gt1,2)*ZH(gt3,4))/2._dp
res = res+gBL**2*x2*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,4)
res = res+gBY**2*x2*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,4)
res = res+gBL**2*x1*dZH(gt2,4)*ZH(gt1,3)*ZH(gt3,4)
res = res+gBY**2*x1*dZH(gt2,4)*ZH(gt1,3)*ZH(gt3,4)
res = res+(gYB*gBL*vd*dZH(gt2,1)*ZH(gt1,4)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt2,1)*ZH(gt1,4)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt2,2)*ZH(gt1,4)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt2,2)*ZH(gt1,4)*ZH(gt3,4))/2._dp
res = res+gBL**2*x1*dZH(gt2,3)*ZH(gt1,4)*ZH(gt3,4)
res = res+gBY**2*x1*dZH(gt2,3)*ZH(gt1,4)*ZH(gt3,4)
res = res-3*gBL**2*x2*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,4)
res = res-3*gBY**2*x2*dZH(gt2,4)*ZH(gt1,4)*ZH(gt3,4)
res = res+(gYB*gBL*x2*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*x2*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(gYB*gBL*vd*dZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dx2*gYB*gBL*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dx2*g1*gBY*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBY*g1*x2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBL*gYB*x2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgYB*gBL*x2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dg1*gBY*x2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dvd*gYB*gBL*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dvd*g1*gBY*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBY*g1*vd*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgBL*gYB*vd*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dgYB*gBL*vd*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res+(dg1*gBY*vd*ZH(gt1,4)*ZH(gt2,1)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*x2*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*x2*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dx2*gYB*gBL*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dx2*g1*gBY*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBY*g1*x2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBL*gYB*x2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgYB*gBL*x2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dg1*gBY*x2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dvu*gYB*gBL*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dvu*g1*gBY*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBY*g1*vu*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgBL*gYB*vu*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dgYB*gBL*vu*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res-(dg1*gBY*vu*ZH(gt1,4)*ZH(gt2,2)*ZH(gt3,4))/2._dp
res = res+gBL**2*x2*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+gBY**2*x2*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+gBL**2*x1*dZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+gBY**2*x1*dZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+dx2*gBL**2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+dx2*gBY**2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+2*dgBL*gBL*x2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+2*dgBY*gBY*x2*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,4)
res = res+dx1*gBL**2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+dx1*gBY**2*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+2*dgBL*gBL*x1*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+2*dgBY*gBY*x1*ZH(gt1,4)*ZH(gt2,3)*ZH(gt3,4)
res = res+(gYB*gBL*vd*dZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(g1*gBY*vd*dZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(gYB*gBL*vu*dZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(g1*gBY*vu*dZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+gBL**2*x1*dZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res+gBY**2*x1*dZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res-3*gBL**2*x2*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
res = res-3*gBY**2*x2*dZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
res = res+(dvd*gYB*gBL*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(dvd*g1*gBY*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(dgBY*g1*vd*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(dgBL*gYB*vd*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(dgYB*gBL*vd*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+(dg1*gBY*vd*ZH(gt1,1)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dvu*gYB*gBL*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dvu*g1*gBY*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dgBY*g1*vu*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dgBL*gYB*vu*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dgYB*gBL*vu*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res-(dg1*gBY*vu*ZH(gt1,2)*ZH(gt2,4)*ZH(gt3,4))/2._dp
res = res+dx1*gBL**2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res+dx1*gBY**2*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res+2*dgBL*gBL*x1*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res+2*dgBY*gBY*x1*ZH(gt1,3)*ZH(gt2,4)*ZH(gt3,4)
res = res-3*dx2*gBL**2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
res = res-3*dx2*gBY**2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
res = res-6*dgBL*gBL*x2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
res = res-6*dgBY*gBY*x2*ZH(gt1,4)*ZH(gt2,4)*ZH(gt3,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_Couplinghhhhhh  
 
 
Subroutine CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,vd,vu,x1,               & 
& x2,ZH,ZP,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),ZP(2,2),dg1,dg2,dgBL,dgYB,dgBY,dvd,             & 
& dvu,dx1,dx2,dZH(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res-(gYB**2*vd*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vu*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res+(g1**2*vu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res+(gYB**2*vu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res-(g2**2*vu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res-(gYB*gBL*x1*dZP(gt3,1)*ZH(gt1,3)*ZP(gt2,1))/2._dp
res = res-(g1*gBY*x1*dZP(gt3,1)*ZH(gt1,3)*ZP(gt2,1))/2._dp
res = res+(gYB*gBL*x2*dZP(gt3,1)*ZH(gt1,4)*ZP(gt2,1))/2._dp
res = res+(g1*gBY*x2*dZP(gt3,1)*ZH(gt1,4)*ZP(gt2,1))/2._dp
res = res-(g2**2*vu*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res+(g1**2*vd*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res+(gYB**2*vd*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res-(g2**2*vd*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res-(g1**2*vu*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res-(gYB**2*vu*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res-(g2**2*vu*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res+(gYB*gBL*x1*dZP(gt3,2)*ZH(gt1,3)*ZP(gt2,2))/2._dp
res = res+(g1*gBY*x1*dZP(gt3,2)*ZH(gt1,3)*ZP(gt2,2))/2._dp
res = res-(gYB*gBL*x2*dZP(gt3,2)*ZH(gt1,4)*ZP(gt2,2))/2._dp
res = res-(g1*gBY*x2*dZP(gt3,2)*ZH(gt1,4)*ZP(gt2,2))/2._dp
res = res-(g1**2*vd*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res-(gYB**2*vd*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res+(g1**2*vu*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res+(gYB**2*vu*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res-(gYB*gBL*x1*dZP(gt2,1)*ZH(gt1,3)*ZP(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZP(gt2,1)*ZH(gt1,3)*ZP(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZP(gt2,1)*ZH(gt1,4)*ZP(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZP(gt2,1)*ZH(gt1,4)*ZP(gt3,1))/2._dp
res = res-(g1**2*vd*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gYB**2*vd*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(gYB**2*vu*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gYB*gBL*x1*dZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(g1*gBY*x1*dZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(gYB*gBL*x2*dZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(g1*gBY*x2*dZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dvd*g1**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvd*gYB**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvd*g2**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dg1*g1*vd*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dgYB*gYB*vd*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vd*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dvu*g1**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(dvu*gYB**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvu*g2**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dgYB*gYB*vu*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vu*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dx1*gYB*gBL*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dx1*g1*gBY*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dgBY*g1*x1*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dgBL*gYB*x1*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dgYB*gBL*x1*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg1*gBY*x1*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dx2*gYB*gBL*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dx2*g1*gBY*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dgBY*g1*x2*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dgBL*gYB*x2*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dgYB*gBL*x2*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dg1*gBY*x2*ZH(gt1,4)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(g2**2*vu*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dvu*g2**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vu*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvd*g2**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vd*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(g2**2*vu*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res+(g1**2*vd*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res+(gYB**2*vd*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res-(g1**2*vu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res-(gYB**2*vu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res+(gYB*gBL*x1*dZP(gt2,2)*ZH(gt1,3)*ZP(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZP(gt2,2)*ZH(gt1,3)*ZP(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZP(gt2,2)*ZH(gt1,4)*ZP(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZP(gt2,2)*ZH(gt1,4)*ZP(gt3,2))/2._dp
res = res-(g2**2*vu*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dvu*g2**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res+(gYB**2*vd*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g1**2*vu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(gYB**2*vu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res+(gYB*gBL*x1*dZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(g1*gBY*x1*dZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(gYB*gBL*x2*dZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(g1*gBY*x2*dZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dvd*g1**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res+(dvd*gYB**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvd*g2**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dgYB*gYB*vd*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vd*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dvu*g1**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvu*gYB**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvu*g2**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dg1*g1*vu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dgYB*gYB*vu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dx1*gYB*gBL*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dx1*g1*gBY*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dgBY*g1*x1*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dgBL*gYB*x1*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dgYB*gBL*x1*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dg1*gBY*x1*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dx2*gYB*gBL*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dx2*g1*gBY*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dgBY*g1*x2*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dgBL*gYB*x2*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dgYB*gBL*x2*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg1*gBY*x2*ZH(gt1,4)*ZP(gt2,2)*ZP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcHpm  
 
 
Subroutine CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Yd,Td,vd,              & 
& vu,x1,x2,ZD,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYd,dTd,dvd,dvu,dx1,dx2,dZD,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),ZD(6,6),dMu,dYd(3,3),dTd(3,3),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZD(gt2,j1))*dZH(gt1,3)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZD(gt2,j1))*dZH(gt1,3)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZD(gt2,j1))*dZH(gt1,3)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZD(gt2,j1))*dZH(gt1,3)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZD(gt2,j1))*dZH(gt1,4)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZD(gt2,j1))*dZH(gt1,4)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZD(gt2,j1))*dZH(gt1,4)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZD(gt2,j1))*dZH(gt1,4)*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,3 + j1))*dZH(gt1,1)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZD(gt2,3 + j1))*dZH(gt1,1)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZD(gt2,3 + j1))*dZH(gt1,1)*ZD(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZD(gt2,3 + j1))*dZH(gt1,1)*ZD(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZD(gt2,3 + j1))*dZH(gt1,3)*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZD(gt2,3 + j1))*dZH(gt1,3)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZD(gt2,3 + j1))*dZH(gt1,3)*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZD(gt2,3 + j1))*dZH(gt1,3)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZD(gt2,3 + j1))*dZH(gt1,4)*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZD(gt2,3 + j1))*dZH(gt1,4)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZD(gt2,3 + j1))*dZH(gt1,4)*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZD(gt2,3 + j1))*dZH(gt1,4)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB*gBL*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1*gBY*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB*gBL*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1*gBY*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB*gBL*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1*gBY*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB*gBL*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1*gBY*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gYB*gBL*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBL**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*g1*gBY*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBY**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gBL*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*gBY*x1*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gYB*gBL*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBL**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*g1*gBY*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBY**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x1*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gYB*gBL*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBL**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*g1*gBY*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBY**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gYB*gBL*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBL**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*g1*gBY*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBY**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gBL*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*gBY*x2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dZH(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZH(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZD(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dZH(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*ZH(gt1,1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,j2))*ZD(gt3,3 + j1)*ZH(gt1,1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dZH(gt1,1)*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dZH(gt1,1)*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dZD(gt3,j3)*Yd(j1,j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,3 + j3))*Conjg(Yd(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSdcSd  
 
 
Subroutine CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Ye,Te,vd,              & 
& vu,x1,x2,ZE,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYe,dTe,dvd,dvu,dx1,dx2,dZE,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),ZE(6,6),dMu,dYe(3,3),dTe(3,3),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(ZE(gt2,j1))*dZH(gt1,3)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZE(gt2,j1))*dZH(gt1,3)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(ZE(gt2,j1))*dZH(gt1,3)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZE(gt2,j1))*dZH(gt1,3)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(ZE(gt2,j1))*dZH(gt1,4)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZE(gt2,j1))*dZH(gt1,4)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(ZE(gt2,j1))*dZH(gt1,4)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZE(gt2,j1))*dZH(gt1,4)*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZE(gt2,3 + j1))*dZH(gt1,1)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZE(gt2,3 + j1))*dZH(gt1,1)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZE(gt2,3 + j1))*dZH(gt1,1)*ZE(gt3,3 + j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZE(gt2,3 + j1))*dZH(gt1,1)*ZE(gt3,3 + j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,3 + j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,3 + j1))/4._dp
End Do 
Do j1 = 1,3
res = res+gYB*gBL*x1*Conjg(ZE(gt2,3 + j1))*dZH(gt1,3)*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZE(gt2,3 + j1))*dZH(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*gBY*x1*Conjg(ZE(gt2,3 + j1))*dZH(gt1,3)*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZE(gt2,3 + j1))*dZH(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZE(gt2,3 + j1))*dZH(gt1,4)*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZE(gt2,3 + j1))*dZH(gt1,4)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZE(gt2,3 + j1))*dZH(gt1,4)*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZE(gt2,3 + j1))*dZH(gt1,4)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB*gBL*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1*gBY*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB*gBL*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1*gBY*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+dg1*g1*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1)
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+dgYB*gYB*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1)
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB*gBL*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1*gBY*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB*gBL*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1*gBY*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+gYB*gBL*x1*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*gBY*x1*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gYB*gBL*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBL**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*g1*gBY*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBY**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x1*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res+gYB*gBL*x1*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*gBY*x1*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+dx1*gYB*gBL*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(dx1*gBL**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+dx1*g1*gBY*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(dx1*gBY**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBY*g1*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgBL*gYB*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgYB*gBL*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dg1*gBY*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x1*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gYB*gBL*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBL**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*g1*gBY*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBY**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gYB*gBL*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dx2*gBL**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*g1*gBY*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dx2*gBY**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,4))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dZH(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZH(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZE(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dZH(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*ZH(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,j2))*ZE(gt3,3 + j1)*ZH(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dZH(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dZH(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,3 + j3))*Conjg(Ye(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSecSe  
 
 
Subroutine CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Mu,Yu,Tu,vd,              & 
& vu,x1,x2,ZU,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMu,dYu,dTu,dvd,dvu,dx1,dx2,dZU,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(in) :: Mu,Yu(3,3),Tu(3,3),ZU(6,6),dMu,dYu(3,3),dTu(3,3),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*gYB*gBL*x1*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*gBY*x1*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,3))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,3))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*gBL*x2*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*gBY*x2*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,4))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,4))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(ZU(gt2,j1))*dZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZU(gt2,j1))*dZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(ZU(gt2,j1))*dZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZU(gt2,j1))*dZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(ZU(gt2,j1))*dZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZU(gt2,j1))*dZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(ZU(gt2,j1))*dZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZU(gt2,j1))*dZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB**2*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB*gBL*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1*gBY*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB**2*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB*gBL*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1*gBY*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x1*Conjg(dZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x1*Conjg(dZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gYB*gBL*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBL**2*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*g1*gBY*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBY**2*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gBL*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*gBY*x1*Conjg(ZU(gt2,j1))*ZH(gt1,3)*ZU(gt3,j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x2*Conjg(dZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x2*Conjg(dZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gYB*gBL*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBL**2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*g1*gBY*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBY**2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x2*Conjg(ZU(gt2,j1))*ZH(gt1,4)*ZU(gt3,j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZU(gt2,3 + j1))*dZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZU(gt2,3 + j1))*dZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZU(gt2,3 + j1))*dZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZU(gt2,3 + j1))*dZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(-2*gYB*gBL*x1*Conjg(ZU(gt2,3 + j1))*dZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZU(gt2,3 + j1))*dZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*gBY*x1*Conjg(ZU(gt2,3 + j1))*dZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZU(gt2,3 + j1))*dZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*gBL*x2*Conjg(ZU(gt2,3 + j1))*dZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZU(gt2,3 + j1))*dZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*gBY*x2*Conjg(ZU(gt2,3 + j1))*dZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZU(gt2,3 + j1))*dZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB*gBL*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1*gBY*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*g1*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(-2*dgYB*gYB*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB*gBL*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1*gBY*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*g1*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(2*dgYB*gYB*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(-2*gYB*gBL*x1*Conjg(dZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*gBY*x1*Conjg(dZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dx1*gYB*gBL*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBL**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dx1*g1*gBY*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBY**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dgBY*g1*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dgBL*gYB*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dgYB*gBL*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*gBY*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x1*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*gBL*x2*Conjg(dZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*gBY*x2*Conjg(dZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dx2*gYB*gBL*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBL**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dx2*g1*gBY*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBY**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dgBY*g1*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dgBL*gYB*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gBL*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dgYB*gBL*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*gBY*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*gBY*x2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,4)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZH(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZH(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2)*ZH(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dZH(gt1,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZH(gt1,2)*ZU(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZH(gt1,1)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*ZH(gt1,2)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dZH(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,j2))*ZH(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZU(gt3,j3)*Yu(j1,j2)*ZH(gt1,2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZH(gt1,2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZH(gt1,2)*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZH(gt1,2)*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSucSu  
 
 
Subroutine CT_CouplinghhSvImSvIm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,             & 
& Tx,Yv,Tv,vd,vu,x1,x2,ZVI,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMuP,dMu,dYx,dTx,dYv,               & 
& dTv,dvd,dvu,dx1,dx2,dZVI,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),dMuP,dMu,dYx(3,3),dTx(3,3),           & 
& dYv(3,3),dTv(3,3),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvImSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB*gBL*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1*gBY*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB*gBL*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1*gBY*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vd*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB*gBL*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1*gBY*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB*gBL*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1*gBY*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vu*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gYB*gBL*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBL**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*g1*gBY*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBY**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x1*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBL**2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBY**2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x1*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x1*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gYB*gBL*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBL**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*g1*gBY*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBY**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBL**2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBY**2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x2*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MuP)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvImSvIm  
 
 
Subroutine CT_CouplinghhSvImSvRe(gt1,gt2,gt3,MuP,Mu,Yx,Tx,Yv,Tv,vu,x1,ZVI,            & 
& ZVR,ZH,dMuP,dMu,dYx,dTx,dYv,dTv,dvu,dx1,dZVI,dZVR,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,x1,ZH(4,4),dvu,dx1,dZH(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),ZVR(6,6),dMuP,dMu,dYx(3,3),           & 
& dTx(3,3),dYv(3,3),dTv(3,3),dZVI(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvImSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(Mu)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMu)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVR(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dZVI(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(MuP*Conjg(dYx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvImSvRe  
 
 
Subroutine CT_CouplinghhSvReSvRe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,MuP,Mu,Yx,             & 
& Tx,Yv,Tv,vd,vu,x1,x2,ZVR,ZH,dg1,dg2,dgBL,dgYB,dgBY,dMuP,dMu,dYx,dTx,dYv,               & 
& dTv,dvd,dvu,dx1,dx2,dZVR,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,             & 
& dx2,dZH(4,4)

Complex(dp), Intent(in) :: MuP,Mu,Yx(3,3),Tx(3,3),Yv(3,3),Tv(3,3),ZVR(6,6),dMuP,dMu,dYx(3,3),dTx(3,3),           & 
& dYv(3,3),dTv(3,3),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvReSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gYB*gBL*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1*gBY*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gYB*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vd*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vd*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*gYB*gBL*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1*gBY*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vd*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*gYB*gBL*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1*gBY*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gYB*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*vu*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*vu*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gYB*gBL*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1*gBY*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*vu*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*gBL*x1*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x1*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*gBY*x1*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x1*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gYB*gBL*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBL**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*g1*gBY*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx1*gBY**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*g1*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gYB*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res-(dgYB*gBL*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*gBY*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x1*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,3))
End Do 
Do j1 = 1,3
res = res+(gBL**2*x1*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x1*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBL**2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx1*gBY**2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x1*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x1*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*gBL*x2*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL**2*x2*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*gBY*x2*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY**2*x2*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gYB*gBL*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBL**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*g1*gBY*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dx2*gBY**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*g1*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*gYB*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBL*gBL*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res+(dgYB*gBL*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*gBY*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res+dgBY*gBY*x2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,4)
End Do 
Do j1 = 1,3
res = res-(gBL**2*x2*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY**2*x2*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBL**2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dx2*gBY**2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*gBL*x2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))
End Do 
Do j1 = 1,3
res = res-(dgBY*gBY*x2*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,4)*Yx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(Tx(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dTx(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVR(gt3,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dYx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dZVR(gt2,3 + j1))*Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(MuP*Conjg(dYx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMuP*Conjg(Yx(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MuP)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMuP)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,4))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*Tx(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*Yx(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*Yx(j2,j1))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yx(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*dYx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,j3))*Yx(j2,j1)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yx(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvReSvRe  
 
 
Subroutine CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Mu,Yd,Td,Yu,Tu,vd,vu,ZD,ZU,             & 
& ZP,dg2,dMu,dYd,dTd,dYu,dTu,dvd,dvu,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,ZP(2,2),dg2,dvd,dvu,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dMu,dYd(3,3),dTd(3,3),             & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZP(gt1,1)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZP(gt1,2)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZP(gt1,1)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZD(gt3,j2)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZD(gt3,j2)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+dMu*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(dZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dMu)*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZP(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,j2))*ZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,1)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,2)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,1)*Yd(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yu(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yd(j1,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yu(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSucSd  
 
 
Subroutine CT_CouplingHpmSvImcSe(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,              & 
& x1,ZE,ZVI,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVI,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,x1,ZP(2,2),dg2,dvd,dvu,dx1,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),Yx(3,3),Yv(3,3),Tv(3,3),ZE(6,6),ZVI(6,6),dMu,dYe(3,3),             & 
& dTe(3,3),dYx(3,3),dYv(3,3),dTv(3,3),dZE(6,6),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSvImcSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZVI(gt2,j1))*dZP(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*dZP(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZVI(gt2,j1))*dZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*dZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(Mu)*Conjg(ZVI(gt2,j2))*dZP(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZP(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*dZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Mu*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((dMu*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(Mu)*Conjg(ZVI(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(Mu)*Conjg(ZVI(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(Mu)*Conjg(dZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dMu)*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dZP(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZVI(gt2,j2))*ZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZP(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZP(gt1,2)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dZP(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt1,2)*Yx(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt1,2)*Yx(j2,j1)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dZP(gt1,2)*Yv(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZVI(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j1,j3))*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dZE(gt3,j3)*Yx(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dZE(gt3,j3)*Yx(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dZE(gt3,j3)*Yv(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dYv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dYx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*dYx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j1,j3))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSvImcSe  
 
 
Subroutine CT_CouplingHpmSvRecSe(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,              & 
& x1,ZE,ZVR,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVR,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,x1,ZP(2,2),dg2,dvd,dvu,dx1,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),Yx(3,3),Yv(3,3),Tv(3,3),ZE(6,6),ZVR(6,6),dMu,dYe(3,3),             & 
& dTe(3,3),dYx(3,3),dYv(3,3),dTv(3,3),dZE(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSvRecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*dZP(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZVR(gt2,j1))*dZP(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*dZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZVR(gt2,j1))*dZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*dZP(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt1,1)*ZE(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZP(gt1,2)*ZE(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*dZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZVR(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dZP(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*ZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZP(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZP(gt1,2)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dZP(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt1,2)*Yx(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt1,2)*Yx(j2,j1)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dZP(gt1,2)*Yv(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dZE(gt3,j3)*Yx(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dZE(gt3,j3)*Yx(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dZE(gt3,j3)*Yv(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dYv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dYx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*dYx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j1,j3))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Yx(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j3))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSvRecSe  
 
 
Subroutine CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Mu,Yd,Td,Yu,Tu,vd,vu,ZD,               & 
& ZU,ZP,dg2,dMu,dYd,dTd,dYu,dTu,dvd,dvu,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,ZP(2,2),dg2,dvd,dvu,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Yd(3,3),Td(3,3),Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dMu,dYd(3,3),dTd(3,3),             & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcHpmcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZU(gt3,j2)*ZP(gt2,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZP(gt2,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZU(gt3,j2)*ZP(gt2,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(Mu)*Conjg(dZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dMu)*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dTu(j1,j2)*ZP(gt2,2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZP(gt2,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,3 + j1))*Conjg(Td(j1,j2))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(dZD(gt1,3 + j1))*Conjg(Yd(j1,j2))*ZP(gt2,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Mu*Conjg(dYd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+dMu*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*ZP(gt2,2)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,j2))*ZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yd(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yu(j1,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,1)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,2)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yd(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,2)*Yu(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dYd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcHpmcSu  
 
 
Subroutine CT_CouplingSeSvImcHpm(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,              & 
& x1,ZE,ZVI,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVI,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,x1,ZP(2,2),dg2,dvd,dvu,dx1,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),Yx(3,3),Yv(3,3),Tv(3,3),ZE(6,6),ZVI(6,6),dMu,dYe(3,3),             & 
& dTe(3,3),dYx(3,3),dYv(3,3),dTv(3,3),dZE(6,6),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvImcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*dZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*dZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Te(j1,j2))*dZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*dZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt3,1)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dYv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVI(gt2,j2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZE(gt1,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dTv(j1,j2)*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZE(gt1,j2))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dZP(gt3,1)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt3,1)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt3,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dYe(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVI(gt2,j3))*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,j2))*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZVI(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZE(gt1,j2))*Conjg(Yx(j1,j3))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dZE(gt1,j2))*Conjg(Yx(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(x1*Conjg(dYx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dx1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVI(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvImcHpm  
 
 
Subroutine CT_CouplingSeSvRecHpm(gt1,gt2,gt3,g2,Mu,Ye,Te,Yx,Yv,Tv,vd,vu,              & 
& x1,ZE,ZVR,ZP,dg2,dMu,dYe,dTe,dYx,dYv,dTv,dvd,dvu,dx1,dZE,dZVR,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,x1,ZP(2,2),dg2,dvd,dvu,dx1,dZP(2,2)

Complex(dp), Intent(in) :: Mu,Ye(3,3),Te(3,3),Yx(3,3),Yv(3,3),Tv(3,3),ZE(6,6),ZVR(6,6),dMu,dYe(3,3),             & 
& dTe(3,3),dYx(3,3),dYv(3,3),dTv(3,3),dZE(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvRecHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*dZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*dZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Te(j1,j2))*dZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*dZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt3,1)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dYv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(Mu)*Conjg(dZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMu)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZVR(gt2,j2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dZE(gt1,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Mu*Conjg(dYe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dMu*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dTv(j1,j2)*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZE(gt1,j2))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dZP(gt3,1)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt3,1)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt3,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dYe(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,j3))*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,j2))*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZVR(gt2,3 + j3))*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZE(gt1,j2))*Conjg(Yx(j1,j3))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dZE(gt1,j2))*Conjg(Yx(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(x1*Conjg(dYx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dx1*Conjg(Yx(j3,j1))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvRecHpm  
 
 
Subroutine CT_CouplingAhhhVP(gt1,gt2,g1,g2,gBY,ZH,ZA,TW,dg1,dg2,dgBY,dZH,             & 
& dZA,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,ZH(4,4),ZA(4,4),TW,dg1,dg2,dgBY,dZH(4,4),dZA(4,4),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*Cos(TW)*dZH(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g2*dZH(gt2,1)*Sin(TW)*ZA(gt1,1))/2._dp
res = res-(g1*Cos(TW)*dZH(gt2,2)*ZA(gt1,2))/2._dp
res = res+(g2*dZH(gt2,2)*Sin(TW)*ZA(gt1,2))/2._dp
res = res+gBY*Cos(TW)*dZH(gt2,3)*ZA(gt1,3)
res = res-(gBY*Cos(TW)*dZH(gt2,4)*ZA(gt1,4))
res = res+(g1*Cos(TW)*dZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g2*dZA(gt1,1)*Sin(TW)*ZH(gt2,1))/2._dp
res = res+(dCosTW*g1*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dSinTW*g2*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dg1*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dg2*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*Cos(TW)*dZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g2*dZA(gt1,2)*Sin(TW)*ZH(gt2,2))/2._dp
res = res-(dCosTW*g1*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dSinTW*g2*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dg1*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dg2*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+gBY*Cos(TW)*dZA(gt1,3)*ZH(gt2,3)
res = res+dCosTW*gBY*ZA(gt1,3)*ZH(gt2,3)
res = res+dgBY*Cos(TW)*ZA(gt1,3)*ZH(gt2,3)
res = res-(gBY*Cos(TW)*dZA(gt1,4)*ZH(gt2,4))
res = res-(dCosTW*gBY*ZA(gt1,4)*ZH(gt2,4))
res = res-(dgBY*Cos(TW)*ZA(gt1,4)*ZH(gt2,4))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVP  
 
 
Subroutine CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZH,ZA,TW,TWp,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,ZH(4,4),ZA(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dZH(4,4),             & 
& dZA(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp)*dZH(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g1*Cos(TWp)*dZH(gt2,1)*Sin(TW)*ZA(gt1,1))/2._dp
res = res+(gYB*dZH(gt2,1)*Sin(TWp)*ZA(gt1,1))/2._dp
res = res+(g2*Cos(TW)*Cos(TWp)*dZH(gt2,2)*ZA(gt1,2))/2._dp
res = res+(g1*Cos(TWp)*dZH(gt2,2)*Sin(TW)*ZA(gt1,2))/2._dp
res = res-(gYB*dZH(gt2,2)*Sin(TWp)*ZA(gt1,2))/2._dp
res = res-(gBY*Cos(TWp)*dZH(gt2,3)*Sin(TW)*ZA(gt1,3))
res = res+gBL*dZH(gt2,3)*Sin(TWp)*ZA(gt1,3)
res = res+gBY*Cos(TWp)*dZH(gt2,4)*Sin(TW)*ZA(gt1,4)
res = res-(gBL*dZH(gt2,4)*Sin(TWp)*ZA(gt1,4))
res = res-(g2*Cos(TW)*Cos(TWp)*dZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*Cos(TWp)*dZA(gt1,1)*Sin(TW)*ZH(gt2,1))/2._dp
res = res+(gYB*dZA(gt1,1)*Sin(TWp)*ZH(gt2,1))/2._dp
res = res+(dSinTWp*gYB*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dCosTWp*g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dSinTW*g1*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dCosTW*g2*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dg2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dCosTWp*g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dg1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dgYB*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*Cos(TWp)*dZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g1*Cos(TWp)*dZA(gt1,2)*Sin(TW)*ZH(gt2,2))/2._dp
res = res-(gYB*dZA(gt1,2)*Sin(TWp)*ZH(gt2,2))/2._dp
res = res-(dSinTWp*gYB*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dCosTWp*g2*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dCosTW*g2*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dgYB*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(gBY*Cos(TWp)*dZA(gt1,3)*Sin(TW)*ZH(gt2,3))
res = res+gBL*dZA(gt1,3)*Sin(TWp)*ZH(gt2,3)
res = res+dSinTWp*gBL*ZA(gt1,3)*ZH(gt2,3)
res = res-(dSinTW*gBY*Cos(TWp)*ZA(gt1,3)*ZH(gt2,3))
res = res-(dCosTWp*gBY*Sin(TW)*ZA(gt1,3)*ZH(gt2,3))
res = res-(dgBY*Cos(TWp)*Sin(TW)*ZA(gt1,3)*ZH(gt2,3))
res = res+dgBL*Sin(TWp)*ZA(gt1,3)*ZH(gt2,3)
res = res+gBY*Cos(TWp)*dZA(gt1,4)*Sin(TW)*ZH(gt2,4)
res = res-(gBL*dZA(gt1,4)*Sin(TWp)*ZH(gt2,4))
res = res-(dSinTWp*gBL*ZA(gt1,4)*ZH(gt2,4))
res = res+dSinTW*gBY*Cos(TWp)*ZA(gt1,4)*ZH(gt2,4)
res = res+dCosTWp*gBY*Sin(TW)*ZA(gt1,4)*ZH(gt2,4)
res = res+dgBY*Cos(TWp)*Sin(TW)*ZA(gt1,4)*ZH(gt2,4)
res = res-(dgBL*Sin(TWp)*ZA(gt1,4)*ZH(gt2,4))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZ  
 
 
Subroutine CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZH,ZA,TW,TWp,dg1,             & 
& dg2,dgBL,dgYB,dgBY,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,ZH(4,4),ZA(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dZH(4,4),             & 
& dZA(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gYB*Cos(TWp)*dZH(gt2,1)*ZA(gt1,1))/2._dp
res = res+(g2*Cos(TW)*dZH(gt2,1)*Sin(TWp)*ZA(gt1,1))/2._dp
res = res+(g1*dZH(gt2,1)*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
res = res-(gYB*Cos(TWp)*dZH(gt2,2)*ZA(gt1,2))/2._dp
res = res-(g2*Cos(TW)*dZH(gt2,2)*Sin(TWp)*ZA(gt1,2))/2._dp
res = res-(g1*dZH(gt2,2)*Sin(TW)*Sin(TWp)*ZA(gt1,2))/2._dp
res = res+gBL*Cos(TWp)*dZH(gt2,3)*ZA(gt1,3)
res = res+gBY*dZH(gt2,3)*Sin(TW)*Sin(TWp)*ZA(gt1,3)
res = res-(gBL*Cos(TWp)*dZH(gt2,4)*ZA(gt1,4))
res = res-(gBY*dZH(gt2,4)*Sin(TW)*Sin(TWp)*ZA(gt1,4))
res = res+(gYB*Cos(TWp)*dZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*dZA(gt1,1)*Sin(TWp)*ZH(gt2,1))/2._dp
res = res+(g1*dZA(gt1,1)*Sin(TW)*Sin(TWp)*ZH(gt2,1))/2._dp
res = res+(dCosTWp*gYB*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dSinTWp*g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dgYB*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dSinTWp*g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dSinTW*g1*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dCosTW*g2*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dg2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dg1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gYB*Cos(TWp)*dZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(g2*Cos(TW)*dZA(gt1,2)*Sin(TWp)*ZH(gt2,2))/2._dp
res = res-(g1*dZA(gt1,2)*Sin(TW)*Sin(TWp)*ZH(gt2,2))/2._dp
res = res-(dCosTWp*gYB*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dSinTWp*g2*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dgYB*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dSinTWp*g1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dSinTW*g1*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dCosTW*g2*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dg2*Cos(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res-(dg1*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+gBL*Cos(TWp)*dZA(gt1,3)*ZH(gt2,3)
res = res+gBY*dZA(gt1,3)*Sin(TW)*Sin(TWp)*ZH(gt2,3)
res = res+dCosTWp*gBL*ZA(gt1,3)*ZH(gt2,3)
res = res+dgBL*Cos(TWp)*ZA(gt1,3)*ZH(gt2,3)
res = res+dSinTWp*gBY*Sin(TW)*ZA(gt1,3)*ZH(gt2,3)
res = res+dSinTW*gBY*Sin(TWp)*ZA(gt1,3)*ZH(gt2,3)
res = res+dgBY*Sin(TW)*Sin(TWp)*ZA(gt1,3)*ZH(gt2,3)
res = res-(gBL*Cos(TWp)*dZA(gt1,4)*ZH(gt2,4))
res = res-(gBY*dZA(gt1,4)*Sin(TW)*Sin(TWp)*ZH(gt2,4))
res = res-(dCosTWp*gBL*ZA(gt1,4)*ZH(gt2,4))
res = res-(dgBL*Cos(TWp)*ZA(gt1,4)*ZH(gt2,4))
res = res-(dSinTWp*gBY*Sin(TW)*ZA(gt1,4)*ZH(gt2,4))
res = res-(dSinTW*gBY*Sin(TWp)*ZA(gt1,4)*ZH(gt2,4))
res = res-(dgBY*Sin(TW)*Sin(TWp)*ZA(gt1,4)*ZH(gt2,4))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZp  
 
 
Subroutine CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(4,4),ZP(2,2),dg2,dZA(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZA(gt1,2))/2._dp
res = res-(g2*dZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZA(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcVWm  
 
 
Subroutine CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(4,4),ZP(2,2),dg2,dZA(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZA(gt1,2))/2._dp
res = res-(g2*dZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZA(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhcHpmVWm  
 
 
Subroutine CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(4,4),ZP(2,2),dg2,dZH(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZH(gt1,1))/2._dp
res = res+(g2*dZP(gt2,2)*ZH(gt1,2))/2._dp
res = res-(g2*dZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*dZH(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcVWm  
 
 
Subroutine CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(4,4),ZP(2,2),dg2,dZH(4,4),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*dZP(gt2,1)*ZH(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZH(gt1,2))/2._dp
res = res+(g2*dZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcHpmVWm  
 
 
Subroutine CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,               & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW,dg1,dg2,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*Cos(TW)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res-(g2*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res-(g2*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g1*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTW*g2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g2*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVP  
 
 
Subroutine CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,gYB,ZP,TW,TWp,dg1,dg2,dgYB,             & 
& dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,          & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(gYB*dZP(gt2,1)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(gYB*dZP(gt2,2)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res-(gYB*dZP(gt1,1)*Sin(TWp)*ZP(gt2,1))/2._dp
res = res-(dSinTWp*gYB*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dCosTWp*g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g2*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Cos(TW)*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dgYB*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(gYB*dZP(gt1,2)*Sin(TWp)*ZP(gt2,2))/2._dp
res = res-(dSinTWp*gYB*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dCosTWp*g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g2*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Cos(TW)*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dgYB*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVZ  
 
 
Subroutine CT_CouplingHpmcHpmVZp(gt1,gt2,g1,g2,gYB,ZP,TW,TWp,dg1,dg2,dgYB,            & 
& dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,          & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gYB*Cos(TWp)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res+(g2*Cos(TW)*dZP(gt2,1)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(g1*dZP(gt2,1)*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(gYB*Cos(TWp)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res+(g2*Cos(TW)*dZP(gt2,2)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res-(g1*dZP(gt2,2)*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res-(gYB*Cos(TWp)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*Cos(TW)*dZP(gt1,1)*Sin(TWp)*ZP(gt2,1))/2._dp
res = res-(g1*dZP(gt1,1)*Sin(TW)*Sin(TWp)*ZP(gt2,1))/2._dp
res = res-(dCosTWp*gYB*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dSinTWp*g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dgYB*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTWp*g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTW*g1*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dCosTW*g2*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg2*Cos(TW)*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg1*Sin(TW)*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(gYB*Cos(TWp)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Cos(TW)*dZP(gt1,2)*Sin(TWp)*ZP(gt2,2))/2._dp
res = res-(g1*dZP(gt1,2)*Sin(TW)*Sin(TWp)*ZP(gt2,2))/2._dp
res = res-(dCosTWp*gYB*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dSinTWp*g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dgYB*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTWp*g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g1*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dCosTW*g2*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Sin(TW)*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVZp  
 
 
Subroutine CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVG  
 
 
Subroutine CT_CouplingSdcSdVP(gt1,gt2,g1,g2,gBY,ZD,TW,dg1,dg2,dgBY,dZD,               & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*dZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZD(gt1,3 + j1))*Cos(TW)*dZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVP  
 
 
Subroutine CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZD,TW,TWp,dg1,dg2,            & 
& dgBL,dgYB,dgBY,dZD,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*Cos(TW)*Cos(TWp)*dZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gYB*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g2*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Cos(TW)*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Cos(TW)*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g1*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gYB*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVZ  
 
 
Subroutine CT_CouplingSdcSdVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZD,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZD,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(gYB*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gYB*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g2*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g1*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZD(gt1,j1))*Cos(TW)*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZD(gt1,j1))*Cos(TW)*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gYB*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/6._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVZp  
 
 
Subroutine CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSucVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZD(gt1,j1))*dZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSucVWm  
 
 
Subroutine CT_CouplingSeSvImcVWm(gt1,gt2,g2,ZE,ZVI,dg2,dZE,dZVI,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZE(6,6),ZVI(6,6),dZE(6,6),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvImcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1)))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvImcVWm  
 
 
Subroutine CT_CouplingSeSvRecVWm(gt1,gt2,g2,ZE,ZVR,dg2,dZE,dZVR,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZE(6,6),ZVR(6,6),dZE(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvRecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvRecVWm  
 
 
Subroutine CT_CouplingSecSeVP(gt1,gt2,g1,g2,gBY,ZE,TW,dg1,dg2,dgBY,dZE,               & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*dZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZE(gt1,3 + j1))*Cos(TW)*dZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*gBY*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dCosTW*gBY*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVP  
 
 
Subroutine CT_CouplingSecSeVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZE,TW,TWp,dg1,dg2,            & 
& dgBL,dgYB,dgBY,dZE,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*Cos(TW)*Cos(TWp)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1)*Sin(TW)
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gYB*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gBL*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g2*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Cos(TW)*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Cos(TW)*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g1*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBY*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(dZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gYB*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gBL*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+dSinTW*g1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+dCosTWp*g1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBY*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+dg1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(dZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVZ  
 
 
Subroutine CT_CouplingSecSeVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZE,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZE,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(gYB*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gYB*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBL*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g2*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(dZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gBY*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Cos(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Cos(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gYB*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBL*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gYB*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBL*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBL*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgYB*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gBY*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVZp  
 
 
Subroutine CT_CouplingSucSuVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVG  
 
 
Subroutine CT_CouplingSucSuVP(gt1,gt2,g1,g2,gBY,ZU,TW,dg1,dg2,dgBY,dZU,               & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*dZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZU(gt1,3 + j1))*Cos(TW)*dZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g2*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(2*dCosTW*g1*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(dZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVP  
 
 
Subroutine CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSdVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSdVWm  
 
 
Subroutine CT_CouplingSucSuVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZU,TW,TWp,dg1,dg2,            & 
& dgBL,dgYB,dgBY,dZU,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*Cos(TW)*Cos(TWp)*dZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gYB*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g2*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Cos(TW)*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Cos(TW)*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g1*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dSinTWp*gYB*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dSinTW*g1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dCosTWp*g1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*Conjg(dZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dgYB*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVZ  
 
 
Subroutine CT_CouplingSucSuVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZU,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZU,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(gYB*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gYB*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g2*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g1*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZU(gt1,j1))*Cos(TW)*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZU(gt1,j1))*Cos(TW)*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dCosTWp*gYB*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*gYB*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dgYB*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dSinTWp*g1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dSinTW*g1*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(dZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/6._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVZp  
 
 
Subroutine CT_CouplingSvImSvReVP(gt1,gt2,g1,g2,gBY,ZVI,ZVR,TW,dg1,dg2,dgBY,           & 
& dZVI,dZVR,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZVI(6,6),ZVR(6,6),dZVI(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImSvReVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*gBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVI(gt1,3 + j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImSvReVP  
 
 
Subroutine CT_CouplingSvImSvReVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZVI,ZVR,TW,TWp,            & 
& dg1,dg2,dgBL,dgYB,dgBY,dZVI,dZVR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZVI(6,6),ZVR(6,6),dZVI(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImSvReVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(dSinTWp*gYB*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBL*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*gBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TW)*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW)*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW)*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVI(gt1,3 + j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(gBY*Conjg(dZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dgBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TWp)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVI(gt1,3 + j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TWp))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImSvReVZ  
 
 
Subroutine CT_CouplingSvImSvReVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZVI,ZVR,TW,               & 
& TWp,dg1,dg2,dgBL,dgYB,dgBY,dZVI,dZVR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,             & 
& dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZVI(6,6),ZVR(6,6),dZVI(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImSvReVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(dCosTWp*gYB*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*gBL*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVI(gt1,3 + j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gYB*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgYB*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBL*Conjg(dZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBL*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Cos(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTWp*gBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*gBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVI(gt1,3 + j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(gBY*Conjg(dZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(dgBY*Conjg(ZVI(gt1,3 + j1))*Conjg(ZVR(gt2,3 + j1))*Sin(TW)*Sin(TWp))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImSvReVZp  
 
 
Subroutine CT_CouplingSvImcSeVWm(gt1,gt2,g2,ZE,ZVI,dg2,dZE,dZVI,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZE(6,6),ZVI(6,6),dZE(6,6),dZVI(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImcSeVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZVI(gt1,j1))*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVI(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZVI(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImcSeVWm  
 
 
Subroutine CT_CouplingSvRecSeVWm(gt1,gt2,g2,ZE,ZVR,dg2,dZE,dZVR,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZE(6,6),ZVR(6,6),dZE(6,6),dZVR(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvRecSeVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZVR(gt1,j1))*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZVR(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZVR(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvRecSeVWm  
 
 
Subroutine CT_CouplinghhVPVZ(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,             & 
& dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,              & 
& dvu,dx1,dx2,dZH(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)**2*Cos(TWp)*dZH(gt1,1))/2._dp
res = res-(g1*g2*vu*Cos(TW)**2*Cos(TWp)*dZH(gt1,2))/2._dp
res = res-(g1**2*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g2**2*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW))/2._dp
res = res-(g1**2*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TW))/2._dp
res = res+(g2**2*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TW))/2._dp
res = res-2*gBY**2*x1*Cos(TW)*Cos(TWp)*dZH(gt1,3)*Sin(TW)
res = res-2*gBY**2*x2*Cos(TW)*Cos(TWp)*dZH(gt1,4)*Sin(TW)
res = res+(g1*g2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2)/2._dp
res = res+(g1*g2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW)**2)/2._dp
res = res+(g1*gYB*vd*Cos(TW)*dZH(gt1,1)*Sin(TWp))/2._dp
res = res+(g1*gYB*vu*Cos(TW)*dZH(gt1,2)*Sin(TWp))/2._dp
res = res+2*gBL*gBY*x1*Cos(TW)*dZH(gt1,3)*Sin(TWp)
res = res+2*gBL*gBY*x2*Cos(TW)*dZH(gt1,4)*Sin(TWp)
res = res-(gYB*g2*vd*dZH(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res-(gYB*g2*vu*dZH(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res+(dSinTWp*g1*gYB*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res-(dCosTWp*g1*g2*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res-(dSinTW*g1**2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dCosTW*g1*g2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res+(dSinTW*g2**2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*gYB*g2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dCosTWp*g1**2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dCosTWp*g2**2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dCosTW*g1**2*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dSinTW*g1*g2*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dCosTW*g2**2*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dvd*g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dvd*g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg1*g1*vd*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+dg2*g2*vd*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dCosTWp*g1*g2*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1*gYB*vd*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*gYB*g2*vd*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dvd*g1*gYB*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dgYB*g1*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*gYB*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dSinTWp*g1*gYB*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res-(dCosTWp*g1*g2*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res-(dSinTW*g1**2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))
res = res+(dSinTW*g2**2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*gYB*g2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dCosTWp*g1**2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dCosTWp*g2**2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dCosTW*g1**2*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dSinTW*g1*g2*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+(dCosTW*g2**2*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dvu*g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dvu*g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dg1*g1*vu*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2))
res = res+dg2*g2*vu*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+(dCosTWp*g1*g2*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+(dCosTW*g1*gYB*vu*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTW*gYB*g2*vu*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dvu*g1*gYB*Cos(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dgYB*g1*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dg1*gYB*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dvu*gYB*g2*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dg2*gYB*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dgYB*g2*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+2*dSinTWp*gBL*gBY*x1*Cos(TW)*ZH(gt1,3)
res = res-2*dSinTW*gBY**2*x1*Cos(TW)*Cos(TWp)*ZH(gt1,3)
res = res-2*dCosTWp*gBY**2*x1*Cos(TW)*Sin(TW)*ZH(gt1,3)
res = res-2*dCosTW*gBY**2*x1*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res-2*dx1*gBY**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res-4*dgBY*gBY*x1*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res+2*dCosTW*gBL*gBY*x1*Sin(TWp)*ZH(gt1,3)
res = res+2*dx1*gBL*gBY*Cos(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dgBY*gBL*x1*Cos(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dgBL*gBY*x1*Cos(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dSinTWp*gBL*gBY*x2*Cos(TW)*ZH(gt1,4)
res = res-2*dSinTW*gBY**2*x2*Cos(TW)*Cos(TWp)*ZH(gt1,4)
res = res-2*dCosTWp*gBY**2*x2*Cos(TW)*Sin(TW)*ZH(gt1,4)
res = res-2*dCosTW*gBY**2*x2*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res-2*dx2*gBY**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res-4*dgBY*gBY*x2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res+2*dCosTW*gBL*gBY*x2*Sin(TWp)*ZH(gt1,4)
res = res+2*dx2*gBL*gBY*Cos(TW)*Sin(TWp)*ZH(gt1,4)
res = res+2*dgBY*gBL*x2*Cos(TW)*Sin(TWp)*ZH(gt1,4)
res = res+2*dgBL*gBY*x2*Cos(TW)*Sin(TWp)*ZH(gt1,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVPVZ  
 
 
Subroutine CT_CouplinghhVPVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,            & 
& dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,              & 
& dvu,dx1,dx2,dZH(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*gYB*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1))/2._dp
res = res+(g1*gYB*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2))/2._dp
res = res+2*gBL*gBY*x1*Cos(TW)*Cos(TWp)*dZH(gt1,3)
res = res+2*gBL*gBY*x2*Cos(TW)*Cos(TWp)*dZH(gt1,4)
res = res-(gYB*g2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW))/2._dp
res = res-(gYB*g2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW))/2._dp
res = res+(g1*g2*vd*Cos(TW)**2*dZH(gt1,1)*Sin(TWp))/2._dp
res = res+(g1*g2*vu*Cos(TW)**2*dZH(gt1,2)*Sin(TWp))/2._dp
res = res+(g1**2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res-(g2**2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1**2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res-(g2**2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res+2*gBY**2*x1*Cos(TW)*dZH(gt1,3)*Sin(TW)*Sin(TWp)
res = res+2*gBY**2*x2*Cos(TW)*dZH(gt1,4)*Sin(TW)*Sin(TWp)
res = res-(g1*g2*vd*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))/2._dp
res = res-(g1*g2*vu*dZH(gt1,2)*Sin(TW)**2*Sin(TWp))/2._dp
res = res+(dCosTWp*g1*gYB*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dSinTWp*g1*g2*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1*gYB*vd*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*gYB*g2*vd*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dvd*g1*gYB*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dgYB*g1*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*gYB*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dCosTWp*gYB*g2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dSinTWp*g1**2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g2**2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g1*g2*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dSinTW*g1**2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+dCosTW*g1*g2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dSinTW*g2**2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1**2*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTW*g2**2*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dvd*g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dvd*g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+dg1*g1*vd*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dg2*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dvd*g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dg2*g1*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dg1*g2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dCosTWp*g1*gYB*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res+(dSinTWp*g1*g2*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+(dCosTW*g1*gYB*vu*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTW*gYB*g2*vu*Cos(TWp)*ZH(gt1,2))/2._dp
res = res+(dvu*g1*gYB*Cos(TW)*Cos(TWp)*ZH(gt1,2))/2._dp
res = res+(dgYB*g1*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))/2._dp
res = res+(dg1*gYB*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dCosTWp*gYB*g2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dSinTWp*g1**2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g2**2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dvu*gYB*g2*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dg2*gYB*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dgYB*g2*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g1*g2*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+(dSinTW*g1**2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+dCosTW*g1*g2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dSinTW*g2**2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dCosTW*g1**2*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dCosTW*g2**2*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dvu*g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dvu*g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+dg1*g1*vu*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dg2*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dvu*g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dg2*g1*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dg1*g2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+2*dCosTWp*gBL*gBY*x1*Cos(TW)*ZH(gt1,3)
res = res+2*dCosTW*gBL*gBY*x1*Cos(TWp)*ZH(gt1,3)
res = res+2*dx1*gBL*gBY*Cos(TW)*Cos(TWp)*ZH(gt1,3)
res = res+2*dgBY*gBL*x1*Cos(TW)*Cos(TWp)*ZH(gt1,3)
res = res+2*dgBL*gBY*x1*Cos(TW)*Cos(TWp)*ZH(gt1,3)
res = res+2*dSinTWp*gBY**2*x1*Cos(TW)*Sin(TW)*ZH(gt1,3)
res = res+2*dSinTW*gBY**2*x1*Cos(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dCosTW*gBY**2*x1*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dx1*gBY**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+4*dgBY*gBY*x1*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+2*dCosTWp*gBL*gBY*x2*Cos(TW)*ZH(gt1,4)
res = res+2*dCosTW*gBL*gBY*x2*Cos(TWp)*ZH(gt1,4)
res = res+2*dx2*gBL*gBY*Cos(TW)*Cos(TWp)*ZH(gt1,4)
res = res+2*dgBY*gBL*x2*Cos(TW)*Cos(TWp)*ZH(gt1,4)
res = res+2*dgBL*gBY*x2*Cos(TW)*Cos(TWp)*ZH(gt1,4)
res = res+2*dSinTWp*gBY**2*x2*Cos(TW)*Sin(TW)*ZH(gt1,4)
res = res+2*dSinTW*gBY**2*x2*Cos(TW)*Sin(TWp)*ZH(gt1,4)
res = res+2*dCosTW*gBY**2*x2*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+2*dx2*gBY**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+4*dgBY*gBY*x2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVPVZp  
 
 
Subroutine CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu,ZH(4,4),dg2,dvd,dvu,dZH(4,4)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*dZH(gt1,1))/2._dp
res = res+(g2**2*vu*dZH(gt1,2))/2._dp
res = res+(dvd*g2**2*ZH(gt1,1))/2._dp
res = res+dg2*g2*vd*ZH(gt1,1)
res = res+(dvu*g2**2*ZH(gt1,2))/2._dp
res = res+dg2*g2*vu*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcVWmVWm  
 
 
Subroutine CT_CouplinghhVZVZ(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,             & 
& dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,              & 
& dvu,dx1,dx2,dZH(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vd*dZH(gt1,1))/8._dp
res = res+(gYB**2*vd*dZH(gt1,1))/4._dp
res = res+(g2**2*vd*dZH(gt1,1))/8._dp
res = res-(g1**2*vd*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res+(g2**2*vd*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res+(g1**2*vd*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-(gYB**2*vd*Cos(TWp)**2*dZH(gt1,1))/4._dp
res = res+(g2**2*vd*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-(g1**2*vd*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+(g2**2*vd*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+(g1**2*vu*dZH(gt1,2))/8._dp
res = res+(gYB**2*vu*dZH(gt1,2))/4._dp
res = res+(g2**2*vu*dZH(gt1,2))/8._dp
res = res-(g1**2*vu*Cos(TW)**2*dZH(gt1,2))/8._dp
res = res+(g2**2*vu*Cos(TW)**2*dZH(gt1,2))/8._dp
res = res+(g1**2*vu*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res-(gYB**2*vu*Cos(TWp)**2*dZH(gt1,2))/4._dp
res = res+(g2**2*vu*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res-(g1**2*vu*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res+(g2**2*vu*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res+gBL**2*x1*dZH(gt1,3)
res = res+(gBY**2*x1*dZH(gt1,3))/2._dp
res = res-(gBY**2*x1*Cos(TW)**2*dZH(gt1,3))/2._dp
res = res-(gBL**2*x1*Cos(TWp)**2*dZH(gt1,3))
res = res+(gBY**2*x1*Cos(TWp)**2*dZH(gt1,3))/2._dp
res = res-(gBY**2*x1*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,3))/2._dp
res = res+gBL**2*x2*dZH(gt1,4)
res = res+(gBY**2*x2*dZH(gt1,4))/2._dp
res = res-(gBY**2*x2*Cos(TW)**2*dZH(gt1,4))/2._dp
res = res-(gBL**2*x2*Cos(TWp)**2*dZH(gt1,4))
res = res+(gBY**2*x2*Cos(TWp)**2*dZH(gt1,4))/2._dp
res = res-(gBY**2*x2*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,4))/2._dp
res = res+(g1*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g1*g2*vd*Cos(TW)*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW))/2._dp
res = res+(g1*g2*vu*Cos(TW)*Cos(TWp)**2*dZH(gt1,2)*Sin(TW))/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res+(g1**2*vd*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res+(gBY**2*x1*dZH(gt1,3)*Sin(TW)**2)/2._dp
res = res+(gBY**2*x1*Cos(TWp)**2*dZH(gt1,3)*Sin(TW)**2)/2._dp
res = res+(gBY**2*x2*dZH(gt1,4)*Sin(TW)**2)/2._dp
res = res+(gBY**2*x2*Cos(TWp)**2*dZH(gt1,4)*Sin(TW)**2)/2._dp
res = res-(gYB*g2*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TWp))
res = res-(gYB*g2*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TWp))
res = res-(g1*gYB*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res-(g1*gYB*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW)*Sin(TWp))
res = res-4*gBL*gBY*x1*Cos(TWp)*dZH(gt1,3)*Sin(TW)*Sin(TWp)
res = res-4*gBL*gBY*x2*Cos(TWp)*dZH(gt1,4)*Sin(TW)*Sin(TWp)
res = res-(g1**2*vd*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res+(gYB**2*vd*dZH(gt1,1)*Sin(TWp)**2)/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res+(g1**2*vd*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-(g2**2*vd*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-(g1**2*vu*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res+(gYB**2*vu*dZH(gt1,2)*Sin(TWp)**2)/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res+(g1**2*vu*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res-(g2**2*vu*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res+gBL**2*x1*dZH(gt1,3)*Sin(TWp)**2
res = res-(gBY**2*x1*dZH(gt1,3)*Sin(TWp)**2)/2._dp
res = res+(gBY**2*x1*Cos(TW)**2*dZH(gt1,3)*Sin(TWp)**2)/2._dp
res = res+gBL**2*x2*dZH(gt1,4)*Sin(TWp)**2
res = res-(gBY**2*x2*dZH(gt1,4)*Sin(TWp)**2)/2._dp
res = res+(gBY**2*x2*Cos(TW)**2*dZH(gt1,4)*Sin(TWp)**2)/2._dp
res = res-(g1*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(g1*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(g1**2*vd*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vd*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g1**2*vu*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vu*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(gBY**2*x1*dZH(gt1,3)*Sin(TW)**2*Sin(TWp)**2)/2._dp
res = res-(gBY**2*x2*dZH(gt1,4)*Sin(TW)**2*Sin(TWp)**2)/2._dp
res = res+(dvd*g1**2*ZH(gt1,1))/8._dp
res = res+(dvd*gYB**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*ZH(gt1,1))/4._dp
res = res+(dgYB*gYB*vd*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1**2*vd*Cos(TW)*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1*g2*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vd*Cos(TW)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g1**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dCosTWp*gYB**2*vd*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dCosTWp*g2**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*gYB*g2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g2**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+(dvd*g1**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dvd*gYB**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dgYB*gYB*vd*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1**2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1*g2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1**2*vd*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g2**2*vd*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dvd*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g1*gYB*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+dCosTWp*g1*g2*vd*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dSinTW*g1**2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g2**2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dvd*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dvd*g1**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g1**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g2**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dSinTWp*g1**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dSinTWp*gYB**2*vd*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g2**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dCosTWp*gYB*g2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*g2**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTW*g1*gYB*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTW*gYB*g2*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dvd*gYB*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dg2*gYB*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dgYB*g2*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1*gYB*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dSinTWp*g1*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dvd*g1*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dgYB*g1*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1*gYB*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dSinTWp*g1**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dSinTWp*g2**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dvd*gYB**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g2**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dgYB*gYB*vd*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dg2*g2*vd*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1**2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dSinTW*g1*g2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dCosTW*g2**2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dSinTW*g1**2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1*g2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dSinTW*g2**2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dvd*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvu*g1**2*ZH(gt1,2))/8._dp
res = res+(dvu*gYB**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*ZH(gt1,2))/4._dp
res = res+(dgYB*gYB*vu*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1**2*vu*Cos(TW)*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1*g2*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res+(dCosTW*g2**2*vu*Cos(TW)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TW)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Cos(TW)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res+(dCosTWp*g1**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dCosTWp*gYB**2*vu*Cos(TWp)*ZH(gt1,2))/2._dp
res = res+(dCosTWp*g2**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTWp*gYB*g2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))
res = res-(dCosTWp*g1**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res+(dCosTWp*g2**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res+(dvu*g1**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dvu*gYB**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dgYB*gYB*vu*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1**2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1*g2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dCosTW*g2**2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1**2*vu*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1*g2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTW*g2**2*vu*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dvu*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g1*gYB*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))
res = res+dCosTWp*g1*g2*vu*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+(dSinTW*g1**2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1*g2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTW*g2**2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dvu*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dvu*g1**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dCosTWp*g1**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g2**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dSinTWp*g1**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dSinTWp*gYB**2*vu*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g2**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dCosTWp*gYB*g2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2))
res = res+(dSinTWp*g1**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTWp*g2**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTW*g1*gYB*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dCosTW*gYB*g2*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dvu*gYB*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dg2*gYB*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dgYB*g2*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dCosTWp*g1*gYB*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dSinTWp*g1*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dvu*g1*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dgYB*g1*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dg1*gYB*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dSinTWp*g1**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dSinTWp*g2**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dvu*gYB**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g2**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dgYB*gYB*vu*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dg2*g2*vu*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1**2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dSinTW*g1*g2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dCosTW*g2**2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dSinTW*g1**2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1*g2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dSinTW*g2**2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dvu*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+dx1*gBL**2*ZH(gt1,3)
res = res+(dx1*gBY**2*ZH(gt1,3))/2._dp
res = res+2*dgBL*gBL*x1*ZH(gt1,3)
res = res+dgBY*gBY*x1*ZH(gt1,3)
res = res-(dCosTW*gBY**2*x1*Cos(TW)*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TW)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Cos(TW)**2*ZH(gt1,3))
res = res-2*dCosTWp*gBL**2*x1*Cos(TWp)*ZH(gt1,3)
res = res+dCosTWp*gBY**2*x1*Cos(TWp)*ZH(gt1,3)
res = res-(dCosTWp*gBY**2*x1*Cos(TW)**2*Cos(TWp)*ZH(gt1,3))
res = res-(dx1*gBL**2*Cos(TWp)**2*ZH(gt1,3))
res = res+(dx1*gBY**2*Cos(TWp)**2*ZH(gt1,3))/2._dp
res = res-2*dgBL*gBL*x1*Cos(TWp)**2*ZH(gt1,3)
res = res+dgBY*gBY*x1*Cos(TWp)**2*ZH(gt1,3)
res = res-(dCosTW*gBY**2*x1*Cos(TW)*Cos(TWp)**2*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,3))
res = res+dSinTW*gBY**2*x1*Sin(TW)*ZH(gt1,3)
res = res-4*dSinTWp*gBL*gBY*x1*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res+dSinTW*gBY**2*x1*Cos(TWp)**2*Sin(TW)*ZH(gt1,3)
res = res+(dx1*gBY**2*Sin(TW)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Sin(TW)**2*ZH(gt1,3)
res = res+dCosTWp*gBY**2*x1*Cos(TWp)*Sin(TW)**2*ZH(gt1,3)
res = res+(dx1*gBY**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,3)
res = res+2*dSinTWp*gBL**2*x1*Sin(TWp)*ZH(gt1,3)
res = res-(dSinTWp*gBY**2*x1*Sin(TWp)*ZH(gt1,3))
res = res+dSinTWp*gBY**2*x1*Cos(TW)**2*Sin(TWp)*ZH(gt1,3)
res = res-4*dSinTW*gBL*gBY*x1*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res-4*dCosTWp*gBL*gBY*x1*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-4*dx1*gBL*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-4*dgBY*gBL*x1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-4*dgBL*gBY*x1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-(dSinTWp*gBY**2*x1*Sin(TW)**2*Sin(TWp)*ZH(gt1,3))
res = res+dx1*gBL**2*Sin(TWp)**2*ZH(gt1,3)
res = res-(dx1*gBY**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res+2*dgBL*gBL*x1*Sin(TWp)**2*ZH(gt1,3)
res = res-(dgBY*gBY*x1*Sin(TWp)**2*ZH(gt1,3))
res = res+dCosTW*gBY**2*x1*Cos(TW)*Sin(TWp)**2*ZH(gt1,3)
res = res+(dx1*gBY**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,3)
res = res-(dSinTW*gBY**2*x1*Sin(TW)*Sin(TWp)**2*ZH(gt1,3))
res = res-(dx1*gBY**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,3))
res = res+dx2*gBL**2*ZH(gt1,4)
res = res+(dx2*gBY**2*ZH(gt1,4))/2._dp
res = res+2*dgBL*gBL*x2*ZH(gt1,4)
res = res+dgBY*gBY*x2*ZH(gt1,4)
res = res-(dCosTW*gBY**2*x2*Cos(TW)*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TW)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Cos(TW)**2*ZH(gt1,4))
res = res-2*dCosTWp*gBL**2*x2*Cos(TWp)*ZH(gt1,4)
res = res+dCosTWp*gBY**2*x2*Cos(TWp)*ZH(gt1,4)
res = res-(dCosTWp*gBY**2*x2*Cos(TW)**2*Cos(TWp)*ZH(gt1,4))
res = res-(dx2*gBL**2*Cos(TWp)**2*ZH(gt1,4))
res = res+(dx2*gBY**2*Cos(TWp)**2*ZH(gt1,4))/2._dp
res = res-2*dgBL*gBL*x2*Cos(TWp)**2*ZH(gt1,4)
res = res+dgBY*gBY*x2*Cos(TWp)**2*ZH(gt1,4)
res = res-(dCosTW*gBY**2*x2*Cos(TW)*Cos(TWp)**2*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,4))
res = res+dSinTW*gBY**2*x2*Sin(TW)*ZH(gt1,4)
res = res-4*dSinTWp*gBL*gBY*x2*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res+dSinTW*gBY**2*x2*Cos(TWp)**2*Sin(TW)*ZH(gt1,4)
res = res+(dx2*gBY**2*Sin(TW)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Sin(TW)**2*ZH(gt1,4)
res = res+dCosTWp*gBY**2*x2*Cos(TWp)*Sin(TW)**2*ZH(gt1,4)
res = res+(dx2*gBY**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,4)
res = res+2*dSinTWp*gBL**2*x2*Sin(TWp)*ZH(gt1,4)
res = res-(dSinTWp*gBY**2*x2*Sin(TWp)*ZH(gt1,4))
res = res+dSinTWp*gBY**2*x2*Cos(TW)**2*Sin(TWp)*ZH(gt1,4)
res = res-4*dSinTW*gBL*gBY*x2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res-4*dCosTWp*gBL*gBY*x2*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-4*dx2*gBL*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-4*dgBY*gBL*x2*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-4*dgBL*gBY*x2*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-(dSinTWp*gBY**2*x2*Sin(TW)**2*Sin(TWp)*ZH(gt1,4))
res = res+dx2*gBL**2*Sin(TWp)**2*ZH(gt1,4)
res = res-(dx2*gBY**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res+2*dgBL*gBL*x2*Sin(TWp)**2*ZH(gt1,4)
res = res-(dgBY*gBY*x2*Sin(TWp)**2*ZH(gt1,4))
res = res+dCosTW*gBY**2*x2*Cos(TW)*Sin(TWp)**2*ZH(gt1,4)
res = res+(dx2*gBY**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,4)
res = res-(dSinTW*gBY**2*x2*Sin(TW)*Sin(TWp)**2*ZH(gt1,4))
res = res-(dx2*gBY**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,4))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZ  
 
 
Subroutine CT_CouplinghhVZVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,TWp,            & 
& dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,              & 
& dvu,dx1,dx2,dZH(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gYB*g2*vd*Cos(TW)*Cos(TWp)**2*dZH(gt1,1))/2._dp
res = res-(gYB*g2*vu*Cos(TW)*Cos(TWp)**2*dZH(gt1,2))/2._dp
res = res-(g1*gYB*vd*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))/2._dp
res = res-(g1*gYB*vu*Cos(TWp)**2*dZH(gt1,2)*Sin(TW))/2._dp
res = res-2*gBL*gBY*x1*Cos(TWp)**2*dZH(gt1,3)*Sin(TW)
res = res-2*gBL*gBY*x2*Cos(TWp)**2*dZH(gt1,4)*Sin(TW)
res = res-(g1**2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/4._dp
res = res+(gYB**2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/2._dp
res = res-(g2**2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/4._dp
res = res+(g1**2*vd*Cos(TW)**2*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/4._dp
res = res-(g2**2*vd*Cos(TW)**2*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/4._dp
res = res-(g1**2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TWp))/4._dp
res = res+(gYB**2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TWp))/2._dp
res = res-(g2**2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TWp))/4._dp
res = res+(g1**2*vu*Cos(TW)**2*Cos(TWp)*dZH(gt1,2)*Sin(TWp))/4._dp
res = res-(g2**2*vu*Cos(TW)**2*Cos(TWp)*dZH(gt1,2)*Sin(TWp))/4._dp
res = res+2*gBL**2*x1*Cos(TWp)*dZH(gt1,3)*Sin(TWp)
res = res-(gBY**2*x1*Cos(TWp)*dZH(gt1,3)*Sin(TWp))
res = res+gBY**2*x1*Cos(TW)**2*Cos(TWp)*dZH(gt1,3)*Sin(TWp)
res = res+2*gBL**2*x2*Cos(TWp)*dZH(gt1,4)*Sin(TWp)
res = res-(gBY**2*x2*Cos(TWp)*dZH(gt1,4)*Sin(TWp))
res = res+gBY**2*x2*Cos(TW)**2*Cos(TWp)*dZH(gt1,4)*Sin(TWp)
res = res-(g1*g2*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res-(g1*g2*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TW)*Sin(TWp))
res = res-(g1**2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(g2**2*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(g1**2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(g2**2*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(gBY**2*x1*Cos(TWp)*dZH(gt1,3)*Sin(TW)**2*Sin(TWp))
res = res-(gBY**2*x2*Cos(TWp)*dZH(gt1,4)*Sin(TW)**2*Sin(TWp))
res = res+(gYB*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TWp)**2)/2._dp
res = res+(gYB*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TWp)**2)/2._dp
res = res+(g1*gYB*vd*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*gYB*vu*dZH(gt1,2)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+2*gBL*gBY*x1*dZH(gt1,3)*Sin(TW)*Sin(TWp)**2
res = res+2*gBL*gBY*x2*dZH(gt1,4)*Sin(TW)*Sin(TWp)**2
res = res-(dSinTWp*g1**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+(dSinTWp*gYB**2*vd*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g2**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dCosTWp*gYB*g2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*g2**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTW*g1*gYB*vd*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dCosTW*gYB*g2*vd*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dCosTWp*g1*gYB*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-(dSinTWp*g1*g2*vd*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-(dvd*g1*gYB*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dgYB*g1*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg1*gYB*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g1**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dSinTWp*g2**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g1**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dCosTWp*gYB**2*vd*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dCosTWp*g2**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+dSinTWp*gYB*g2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(dCosTWp*g1**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g2**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dvd*gYB**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dvd*g2**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dg1*g1*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+dgYB*gYB*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res-(dg2*g2*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1**2*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTW*g2**2*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dvd*g1**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dvd*g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dg1*g1*vd*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dg2*g2*vd*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+dSinTWp*g1*gYB*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dCosTWp*g1*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dSinTW*g1**2*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dCosTW*g1*g2*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTW*g2**2*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg2*g1*vd*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1*g2*vd*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g2**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dg1*g1*vd*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dSinTW*g1*gYB*vd*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*gYB*g2*vd*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvd*gYB*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*gYB*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dgYB*g2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvd*g1*gYB*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dgYB*g1*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1*gYB*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g1**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res+(dSinTWp*gYB**2*vu*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g2**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dCosTWp*gYB*g2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2))
res = res+(dSinTWp*g1**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTWp*g2**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTW*g1*gYB*vu*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dCosTW*gYB*g2*vu*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dvu*gYB*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dg2*gYB*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dgYB*g2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dCosTWp*g1*gYB*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2))
res = res-(dSinTWp*g1*g2*vu*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2))
res = res-(dvu*g1*gYB*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dgYB*g1*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dg1*gYB*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTWp*g1**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dSinTWp*g2**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g1**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dCosTWp*gYB**2*vu*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dCosTWp*g2**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+dSinTWp*gYB*g2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res+(dCosTWp*g1**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g2**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dvu*gYB**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dvu*g2**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dg1*g1*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+dgYB*gYB*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-(dg2*g2*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dCosTW*g1**2*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res-(dCosTW*g2**2*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dvu*g1**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dvu*g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dg1*g1*vu*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dg2*g2*vu*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+dSinTWp*g1*gYB*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dCosTWp*g1*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dSinTW*g1**2*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res+(dSinTW*g2**2*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dg2*g1*vu*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dg1*g2*vu*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2))
res = res-(dCosTWp*g1**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dCosTWp*g2**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dg1*g1*vu*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dSinTW*g1*gYB*vu*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dCosTW*gYB*g2*vu*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dvu*gYB*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg2*gYB*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dgYB*g2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dvu*g1*gYB*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dgYB*g1*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg1*gYB*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+2*dSinTWp*gBL**2*x1*Cos(TWp)*ZH(gt1,3)
res = res-(dSinTWp*gBY**2*x1*Cos(TWp)*ZH(gt1,3))
res = res+dSinTWp*gBY**2*x1*Cos(TW)**2*Cos(TWp)*ZH(gt1,3)
res = res-2*dSinTW*gBL*gBY*x1*Cos(TWp)**2*ZH(gt1,3)
res = res-4*dCosTWp*gBL*gBY*x1*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res-2*dx1*gBL*gBY*Cos(TWp)**2*Sin(TW)*ZH(gt1,3)
res = res-2*dgBY*gBL*x1*Cos(TWp)**2*Sin(TW)*ZH(gt1,3)
res = res-2*dgBL*gBY*x1*Cos(TWp)**2*Sin(TW)*ZH(gt1,3)
res = res-(dSinTWp*gBY**2*x1*Cos(TWp)*Sin(TW)**2*ZH(gt1,3))
res = res+2*dCosTWp*gBL**2*x1*Sin(TWp)*ZH(gt1,3)
res = res-(dCosTWp*gBY**2*x1*Sin(TWp)*ZH(gt1,3))
res = res+dCosTWp*gBY**2*x1*Cos(TW)**2*Sin(TWp)*ZH(gt1,3)
res = res+2*dx1*gBL**2*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res-(dx1*gBY**2*Cos(TWp)*Sin(TWp)*ZH(gt1,3))
res = res+4*dgBL*gBL*x1*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res-2*dgBY*gBY*x1*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res+2*dCosTW*gBY**2*x1*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res+dx1*gBY**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res+2*dgBY*gBY*x1*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res+4*dSinTWp*gBL*gBY*x1*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-2*dSinTW*gBY**2*x1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res-(dCosTWp*gBY**2*x1*Sin(TW)**2*Sin(TWp)*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,3))
res = res-2*dgBY*gBY*x1*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,3)
res = res+2*dSinTW*gBL*gBY*x1*Sin(TWp)**2*ZH(gt1,3)
res = res+2*dx1*gBL*gBY*Sin(TW)*Sin(TWp)**2*ZH(gt1,3)
res = res+2*dgBY*gBL*x1*Sin(TW)*Sin(TWp)**2*ZH(gt1,3)
res = res+2*dgBL*gBY*x1*Sin(TW)*Sin(TWp)**2*ZH(gt1,3)
res = res+2*dSinTWp*gBL**2*x2*Cos(TWp)*ZH(gt1,4)
res = res-(dSinTWp*gBY**2*x2*Cos(TWp)*ZH(gt1,4))
res = res+dSinTWp*gBY**2*x2*Cos(TW)**2*Cos(TWp)*ZH(gt1,4)
res = res-2*dSinTW*gBL*gBY*x2*Cos(TWp)**2*ZH(gt1,4)
res = res-4*dCosTWp*gBL*gBY*x2*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res-2*dx2*gBL*gBY*Cos(TWp)**2*Sin(TW)*ZH(gt1,4)
res = res-2*dgBY*gBL*x2*Cos(TWp)**2*Sin(TW)*ZH(gt1,4)
res = res-2*dgBL*gBY*x2*Cos(TWp)**2*Sin(TW)*ZH(gt1,4)
res = res-(dSinTWp*gBY**2*x2*Cos(TWp)*Sin(TW)**2*ZH(gt1,4))
res = res+2*dCosTWp*gBL**2*x2*Sin(TWp)*ZH(gt1,4)
res = res-(dCosTWp*gBY**2*x2*Sin(TWp)*ZH(gt1,4))
res = res+dCosTWp*gBY**2*x2*Cos(TW)**2*Sin(TWp)*ZH(gt1,4)
res = res+2*dx2*gBL**2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res-(dx2*gBY**2*Cos(TWp)*Sin(TWp)*ZH(gt1,4))
res = res+4*dgBL*gBL*x2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res-2*dgBY*gBY*x2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res+2*dCosTW*gBY**2*x2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res+dx2*gBY**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res+2*dgBY*gBY*x2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res+4*dSinTWp*gBL*gBY*x2*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-2*dSinTW*gBY**2*x2*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res-(dCosTWp*gBY**2*x2*Sin(TW)**2*Sin(TWp)*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,4))
res = res-2*dgBY*gBY*x2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,4)
res = res+2*dSinTW*gBL*gBY*x2*Sin(TWp)**2*ZH(gt1,4)
res = res+2*dx2*gBL*gBY*Sin(TW)*Sin(TWp)**2*ZH(gt1,4)
res = res+2*dgBY*gBL*x2*Sin(TW)*Sin(TWp)**2*ZH(gt1,4)
res = res+2*dgBL*gBY*x2*Sin(TW)*Sin(TWp)**2*ZH(gt1,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZp  
 
 
Subroutine CT_CouplinghhVZpVZp(gt1,g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH,TW,               & 
& TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,dvu,dx1,dx2,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,vd,vu,x1,x2,ZH(4,4),TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dvd,              & 
& dvu,dx1,dx2,dZH(4,4),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vd*dZH(gt1,1))/8._dp
res = res+(gYB**2*vd*dZH(gt1,1))/4._dp
res = res+(g2**2*vd*dZH(gt1,1))/8._dp
res = res-(g1**2*vd*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res+(g2**2*vd*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res-(g1**2*vd*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+(gYB**2*vd*Cos(TWp)**2*dZH(gt1,1))/4._dp
res = res-(g2**2*vd*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+(g1**2*vd*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-(g2**2*vd*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+(g1**2*vu*dZH(gt1,2))/8._dp
res = res+(gYB**2*vu*dZH(gt1,2))/4._dp
res = res+(g2**2*vu*dZH(gt1,2))/8._dp
res = res-(g1**2*vu*Cos(TW)**2*dZH(gt1,2))/8._dp
res = res+(g2**2*vu*Cos(TW)**2*dZH(gt1,2))/8._dp
res = res-(g1**2*vu*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res+(gYB**2*vu*Cos(TWp)**2*dZH(gt1,2))/4._dp
res = res-(g2**2*vu*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res+(g1**2*vu*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res-(g2**2*vu*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))/8._dp
res = res+gBL**2*x1*dZH(gt1,3)
res = res+(gBY**2*x1*dZH(gt1,3))/2._dp
res = res-(gBY**2*x1*Cos(TW)**2*dZH(gt1,3))/2._dp
res = res+gBL**2*x1*Cos(TWp)**2*dZH(gt1,3)
res = res-(gBY**2*x1*Cos(TWp)**2*dZH(gt1,3))/2._dp
res = res+(gBY**2*x1*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,3))/2._dp
res = res+gBL**2*x2*dZH(gt1,4)
res = res+(gBY**2*x2*dZH(gt1,4))/2._dp
res = res-(gBY**2*x2*Cos(TW)**2*dZH(gt1,4))/2._dp
res = res+gBL**2*x2*Cos(TWp)**2*dZH(gt1,4)
res = res-(gBY**2*x2*Cos(TWp)**2*dZH(gt1,4))/2._dp
res = res+(gBY**2*x2*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,4))/2._dp
res = res+(g1*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vd*Cos(TW)*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW))/2._dp
res = res-(g1*g2*vu*Cos(TW)*Cos(TWp)**2*dZH(gt1,2)*Sin(TW))/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-(g1**2*vd*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res+(g2**2*vd*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res-(g1**2*vu*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res+(g2**2*vu*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)/8._dp
res = res+(gBY**2*x1*dZH(gt1,3)*Sin(TW)**2)/2._dp
res = res-(gBY**2*x1*Cos(TWp)**2*dZH(gt1,3)*Sin(TW)**2)/2._dp
res = res+(gBY**2*x2*dZH(gt1,4)*Sin(TW)**2)/2._dp
res = res-(gBY**2*x2*Cos(TWp)**2*dZH(gt1,4)*Sin(TW)**2)/2._dp
res = res+gYB*g2*vd*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TWp)
res = res+gYB*g2*vu*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TWp)
res = res+g1*gYB*vd*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp)
res = res+g1*gYB*vu*Cos(TWp)*dZH(gt1,2)*Sin(TW)*Sin(TWp)
res = res+4*gBL*gBY*x1*Cos(TWp)*dZH(gt1,3)*Sin(TW)*Sin(TWp)
res = res+4*gBL*gBY*x2*Cos(TWp)*dZH(gt1,4)*Sin(TW)*Sin(TWp)
res = res+(g1**2*vd*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-(gYB**2*vd*dZH(gt1,1)*Sin(TWp)**2)/4._dp
res = res+(g2**2*vd*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-(g1**2*vd*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res+(g2**2*vd*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res+(g1**2*vu*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res-(gYB**2*vu*dZH(gt1,2)*Sin(TWp)**2)/4._dp
res = res+(g2**2*vu*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res-(g1**2*vu*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res+(g2**2*vu*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)/8._dp
res = res-(gBL**2*x1*dZH(gt1,3)*Sin(TWp)**2)
res = res+(gBY**2*x1*dZH(gt1,3)*Sin(TWp)**2)/2._dp
res = res-(gBY**2*x1*Cos(TW)**2*dZH(gt1,3)*Sin(TWp)**2)/2._dp
res = res-(gBL**2*x2*dZH(gt1,4)*Sin(TWp)**2)
res = res+(gBY**2*x2*dZH(gt1,4)*Sin(TWp)**2)/2._dp
res = res-(gBY**2*x2*Cos(TW)**2*dZH(gt1,4)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vd*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g1**2*vu*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vu*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(gBY**2*x1*dZH(gt1,3)*Sin(TW)**2*Sin(TWp)**2)/2._dp
res = res+(gBY**2*x2*dZH(gt1,4)*Sin(TW)**2*Sin(TWp)**2)/2._dp
res = res+(dvd*g1**2*ZH(gt1,1))/8._dp
res = res+(dvd*gYB**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*ZH(gt1,1))/4._dp
res = res+(dgYB*gYB*vd*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1**2*vd*Cos(TW)*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1*g2*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vd*Cos(TW)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g1**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+(dCosTWp*gYB**2*vd*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(dCosTWp*g2**2*vd*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+dSinTWp*gYB*g2*vd*Cos(TW)*Cos(TWp)*ZH(gt1,1)
res = res+(dCosTWp*g1**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g2**2*vd*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dvd*gYB**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g2**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dgYB*gYB*vd*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dg2*g2*vd*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1**2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dSinTW*g1*g2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dCosTW*g2**2*vd*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1**2*vd*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g2**2*vd*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dvd*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dSinTWp*g1*gYB*vd*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res-(dCosTWp*g1*g2*vd*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-(dSinTW*g1**2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1*g2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dSinTW*g2**2*vd*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res-(dvd*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dvd*g1**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dCosTWp*g1**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g2**2*vd*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dSinTWp*g1**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*gYB**2*vd*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dSinTWp*g2**2*vd*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+dCosTWp*gYB*g2*vd*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dSinTWp*g1**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dSinTWp*g2**2*vd*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+dSinTW*g1*gYB*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dCosTW*gYB*g2*vd*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dvd*gYB*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dg2*gYB*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dgYB*g2*vd*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dCosTWp*g1*gYB*vd*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dSinTWp*g1*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dvd*g1*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dgYB*g1*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dg1*gYB*vd*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(dSinTWp*g1**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*g2**2*vd*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+(dvd*g1**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dvd*gYB**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dgYB*gYB*vd*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dCosTW*g1**2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1*g2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vd*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dvd*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dg1*g1*vd*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dg2*g2*vd*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1**2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(dSinTW*g2**2*vd*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvd*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-(dvd*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vd*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-(dg2*g2*vd*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dvu*g1**2*ZH(gt1,2))/8._dp
res = res+(dvu*gYB**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*ZH(gt1,2))/4._dp
res = res+(dgYB*gYB*vu*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1**2*vu*Cos(TW)*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1*g2*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res+(dCosTW*g2**2*vu*Cos(TW)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TW)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Cos(TW)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g1**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res+(dCosTWp*gYB**2*vu*Cos(TWp)*ZH(gt1,2))/2._dp
res = res-(dCosTWp*g2**2*vu*Cos(TWp)*ZH(gt1,2))/4._dp
res = res+dSinTWp*gYB*g2*vu*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+(dCosTWp*g1**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g2**2*vu*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dvu*gYB**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g2**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dgYB*gYB*vu*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dg2*g2*vu*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1**2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dSinTW*g1*g2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dCosTW*g2**2*vu*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1**2*vu*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1*g2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dSinTW*g2**2*vu*Sin(TW)*ZH(gt1,2))/4._dp
res = res+(dvu*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dSinTWp*g1*gYB*vu*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res-(dCosTWp*g1*g2*vu*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2))
res = res-(dSinTW*g1**2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1*g2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dSinTW*g2**2*vu*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/4._dp
res = res-(dvu*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))/2._dp
res = res+(dvu*g1**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dCosTWp*g1**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dCosTWp*g2**2*vu*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dSinTWp*g1**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTWp*gYB**2*vu*Sin(TWp)*ZH(gt1,2))/2._dp
res = res+(dSinTWp*g2**2*vu*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+dCosTWp*gYB*g2*vu*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dSinTWp*g1**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dSinTWp*g2**2*vu*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+dSinTW*g1*gYB*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dCosTW*gYB*g2*vu*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dvu*gYB*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dg2*gYB*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dgYB*g2*vu*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dCosTWp*g1*gYB*vu*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+dSinTWp*g1*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+dvu*g1*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+dgYB*g1*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+dg1*gYB*vu*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+(dSinTWp*g1**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res-(dSinTWp*g2**2*vu*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))/4._dp
res = res+(dvu*g1**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dvu*gYB**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dgYB*gYB*vu*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dCosTW*g1**2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1*g2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dCosTW*g2**2*vu*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dvu*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dg1*g1*vu*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dg2*g2*vu*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dSinTW*g1**2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dCosTW*g1*g2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-(dSinTW*g2**2*vu*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+(dvu*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res-(dvu*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/8._dp
res = res+(dg1*g1*vu*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res-(dg2*g2*vu*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/4._dp
res = res+dx1*gBL**2*ZH(gt1,3)
res = res+(dx1*gBY**2*ZH(gt1,3))/2._dp
res = res+2*dgBL*gBL*x1*ZH(gt1,3)
res = res+dgBY*gBY*x1*ZH(gt1,3)
res = res-(dCosTW*gBY**2*x1*Cos(TW)*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TW)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Cos(TW)**2*ZH(gt1,3))
res = res+2*dCosTWp*gBL**2*x1*Cos(TWp)*ZH(gt1,3)
res = res-(dCosTWp*gBY**2*x1*Cos(TWp)*ZH(gt1,3))
res = res+dCosTWp*gBY**2*x1*Cos(TW)**2*Cos(TWp)*ZH(gt1,3)
res = res+dx1*gBL**2*Cos(TWp)**2*ZH(gt1,3)
res = res-(dx1*gBY**2*Cos(TWp)**2*ZH(gt1,3))/2._dp
res = res+2*dgBL*gBL*x1*Cos(TWp)**2*ZH(gt1,3)
res = res-(dgBY*gBY*x1*Cos(TWp)**2*ZH(gt1,3))
res = res+dCosTW*gBY**2*x1*Cos(TW)*Cos(TWp)**2*ZH(gt1,3)
res = res+(dx1*gBY**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,3)
res = res+dSinTW*gBY**2*x1*Sin(TW)*ZH(gt1,3)
res = res+4*dSinTWp*gBL*gBY*x1*Cos(TWp)*Sin(TW)*ZH(gt1,3)
res = res-(dSinTW*gBY**2*x1*Cos(TWp)**2*Sin(TW)*ZH(gt1,3))
res = res+(dx1*gBY**2*Sin(TW)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Sin(TW)**2*ZH(gt1,3)
res = res-(dCosTWp*gBY**2*x1*Cos(TWp)*Sin(TW)**2*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,3))
res = res-2*dSinTWp*gBL**2*x1*Sin(TWp)*ZH(gt1,3)
res = res+dSinTWp*gBY**2*x1*Sin(TWp)*ZH(gt1,3)
res = res-(dSinTWp*gBY**2*x1*Cos(TW)**2*Sin(TWp)*ZH(gt1,3))
res = res+4*dSinTW*gBL*gBY*x1*Cos(TWp)*Sin(TWp)*ZH(gt1,3)
res = res+4*dCosTWp*gBL*gBY*x1*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+4*dx1*gBL*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+4*dgBY*gBL*x1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+4*dgBL*gBY*x1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,3)
res = res+dSinTWp*gBY**2*x1*Sin(TW)**2*Sin(TWp)*ZH(gt1,3)
res = res-(dx1*gBL**2*Sin(TWp)**2*ZH(gt1,3))
res = res+(dx1*gBY**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res-2*dgBL*gBL*x1*Sin(TWp)**2*ZH(gt1,3)
res = res+dgBY*gBY*x1*Sin(TWp)**2*ZH(gt1,3)
res = res-(dCosTW*gBY**2*x1*Cos(TW)*Sin(TWp)**2*ZH(gt1,3))
res = res-(dx1*gBY**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res-(dgBY*gBY*x1*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,3))
res = res+dSinTW*gBY**2*x1*Sin(TW)*Sin(TWp)**2*ZH(gt1,3)
res = res+(dx1*gBY**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,3))/2._dp
res = res+dgBY*gBY*x1*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,3)
res = res+dx2*gBL**2*ZH(gt1,4)
res = res+(dx2*gBY**2*ZH(gt1,4))/2._dp
res = res+2*dgBL*gBL*x2*ZH(gt1,4)
res = res+dgBY*gBY*x2*ZH(gt1,4)
res = res-(dCosTW*gBY**2*x2*Cos(TW)*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TW)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Cos(TW)**2*ZH(gt1,4))
res = res+2*dCosTWp*gBL**2*x2*Cos(TWp)*ZH(gt1,4)
res = res-(dCosTWp*gBY**2*x2*Cos(TWp)*ZH(gt1,4))
res = res+dCosTWp*gBY**2*x2*Cos(TW)**2*Cos(TWp)*ZH(gt1,4)
res = res+dx2*gBL**2*Cos(TWp)**2*ZH(gt1,4)
res = res-(dx2*gBY**2*Cos(TWp)**2*ZH(gt1,4))/2._dp
res = res+2*dgBL*gBL*x2*Cos(TWp)**2*ZH(gt1,4)
res = res-(dgBY*gBY*x2*Cos(TWp)**2*ZH(gt1,4))
res = res+dCosTW*gBY**2*x2*Cos(TW)*Cos(TWp)**2*ZH(gt1,4)
res = res+(dx2*gBY**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,4)
res = res+dSinTW*gBY**2*x2*Sin(TW)*ZH(gt1,4)
res = res+4*dSinTWp*gBL*gBY*x2*Cos(TWp)*Sin(TW)*ZH(gt1,4)
res = res-(dSinTW*gBY**2*x2*Cos(TWp)**2*Sin(TW)*ZH(gt1,4))
res = res+(dx2*gBY**2*Sin(TW)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Sin(TW)**2*ZH(gt1,4)
res = res-(dCosTWp*gBY**2*x2*Cos(TWp)*Sin(TW)**2*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,4))
res = res-2*dSinTWp*gBL**2*x2*Sin(TWp)*ZH(gt1,4)
res = res+dSinTWp*gBY**2*x2*Sin(TWp)*ZH(gt1,4)
res = res-(dSinTWp*gBY**2*x2*Cos(TW)**2*Sin(TWp)*ZH(gt1,4))
res = res+4*dSinTW*gBL*gBY*x2*Cos(TWp)*Sin(TWp)*ZH(gt1,4)
res = res+4*dCosTWp*gBL*gBY*x2*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+4*dx2*gBL*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+4*dgBY*gBL*x2*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+4*dgBL*gBY*x2*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,4)
res = res+dSinTWp*gBY**2*x2*Sin(TW)**2*Sin(TWp)*ZH(gt1,4)
res = res-(dx2*gBL**2*Sin(TWp)**2*ZH(gt1,4))
res = res+(dx2*gBY**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res-2*dgBL*gBL*x2*Sin(TWp)**2*ZH(gt1,4)
res = res+dgBY*gBY*x2*Sin(TWp)**2*ZH(gt1,4)
res = res-(dCosTW*gBY**2*x2*Cos(TW)*Sin(TWp)**2*ZH(gt1,4))
res = res-(dx2*gBY**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res-(dgBY*gBY*x2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,4))
res = res+dSinTW*gBY**2*x2*Sin(TW)*Sin(TWp)**2*ZH(gt1,4)
res = res+(dx2*gBY**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,4))/2._dp
res = res+dgBY*gBY*x2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZpVZp  
 
 
Subroutine CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVP  
 
 
Subroutine CT_CouplingHpmcVWmVZ(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,           & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gYB,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dvd,dvu,dZP(2,2),dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TWp)*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*Cos(TWp)*dZP(gt1,2)*Sin(TW))/2._dp
res = res-(gYB*g2*vd*dZP(gt1,1)*Sin(TWp))/2._dp
res = res+(gYB*g2*vu*dZP(gt1,2)*Sin(TWp))/2._dp
res = res-(dSinTWp*gYB*g2*vd*ZP(gt1,1))/2._dp
res = res+(dSinTW*g1*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+(dSinTWp*gYB*g2*vu*ZP(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res-(dCosTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dvu*gYB*g2*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*gYB*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dgYB*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVZ  
 
 
Subroutine CT_CouplingHpmcVWmVZp(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,               & 
& dgYB,dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gYB,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dvd,dvu,dZP(2,2),dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gYB*g2*vd*Cos(TWp)*dZP(gt1,1))/2._dp
res = res+(gYB*g2*vu*Cos(TWp)*dZP(gt1,2))/2._dp
res = res-(g1*g2*vd*dZP(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*g2*vu*dZP(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res-(dCosTWp*gYB*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dSinTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*gYB*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*gYB*g2*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*gYB*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dgYB*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dSinTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dSinTW*g1*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVZp  
 
 
Subroutine CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVPVWm  
 
 
Subroutine CT_CouplingcHpmVWmVZ(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,dgYB,           & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gYB,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dvd,dvu,dZP(2,2),dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TWp)*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*Cos(TWp)*dZP(gt1,2)*Sin(TW))/2._dp
res = res-(gYB*g2*vd*dZP(gt1,1)*Sin(TWp))/2._dp
res = res+(gYB*g2*vu*dZP(gt1,2)*Sin(TWp))/2._dp
res = res-(dSinTWp*gYB*g2*vd*ZP(gt1,1))/2._dp
res = res+(dSinTW*g1*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+(dSinTWp*gYB*g2*vu*ZP(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res-(dCosTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dvu*gYB*g2*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*gYB*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dgYB*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVWmVZ  
 
 
Subroutine CT_CouplingcHpmVWmVZp(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,dg1,dg2,               & 
& dgYB,dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gYB,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgYB,dvd,dvu,dZP(2,2),dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gYB*g2*vd*Cos(TWp)*dZP(gt1,1))/2._dp
res = res+(gYB*g2*vu*Cos(TWp)*dZP(gt1,2))/2._dp
res = res-(g1*g2*vd*dZP(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*g2*vu*dZP(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res-(dCosTWp*gYB*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*gYB*g2*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*gYB*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dgYB*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res-(dSinTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*gYB*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*gYB*g2*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*gYB*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dgYB*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res+(dSinTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dSinTW*g1*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVWmVZp  
 
 
Subroutine CT_CouplingVGVGVG(g3,dg3,res)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingVGVGVG' 
 
res = 0._dp 
res = res+dg3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingVGVGVG  
 
 
Subroutine CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+dSinTW*g2
res = res+dg2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVPVWm  
 
 
Subroutine CT_CouplingcVWmVWmVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(dCosTWp*g2*Cos(TW))
res = res-(dCosTW*g2*Cos(TWp))
res = res-(dg2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVWmVZ  
 
 
Subroutine CT_CouplingcVWmVWmVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,          & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVWmVZp' 
 
res = 0._dp 
res = res+dSinTWp*g2*Cos(TW)
res = res+dCosTW*g2*Sin(TWp)
res = res+dg2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVWmVZp  
 
 
Subroutine CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,ZA,UM,UP,dg2,dZA,dUM,dUP,              & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,ZA(4,4),dg2,dZA(4,4)

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*dZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*dZA(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*ZA(gt3,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR+(g2*dZA(gt3,1)*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp)
resR = resR+(g2*dZA(gt3,2)*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp)
resR = resR+(g2*dUP(gt2,1)*UM(gt1,2)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,2)*UP(gt2,1)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,2)*UP(gt2,1)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUP(gt2,2)*UM(gt1,1)*ZA(gt3,2))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,1)*UP(gt2,2)*ZA(gt3,2))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,1)*UP(gt2,2)*ZA(gt3,2))/sqrt(2._dp)
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaAh  
 
 
Subroutine CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,ZA,ZN,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZA,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,ZA(4,4),dg1,dg2,dgBL,dgYB,dgBY,dZA(4,4)

Complex(dp), Intent(in) :: ZN(7,7),dZN(7,7)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*dZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*dZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*dZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*dZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*dZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*dZA(gt3,1))/2._dp
resL = resL-(g1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*dZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*dZA(gt3,2))/2._dp
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*dZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*dZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*dZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*dZA(gt3,2))/2._dp
resL = resL+gBY*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1))*dZA(gt3,3)
resL = resL+gBL*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5))*dZA(gt3,3)
resL = resL+gBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6))*dZA(gt3,3)
resL = resL+gBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6))*dZA(gt3,3)
resL = resL-(gBY*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1))*dZA(gt3,4))
resL = resL-(gBL*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,5))*dZA(gt3,4))
resL = resL-(gBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7))*dZA(gt3,4))
resL = resL-(gBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,7))*dZA(gt3,4))
resL = resL+(g1*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,1))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,2))*ZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,3))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,3))*ZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,3))*ZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,5))*ZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,1))*ZA(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,2))*ZA(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*ZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,5))*ZA(gt3,1))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*ZA(gt3,1))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,1))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,2))*ZA(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,4))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,4))*ZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,4))*ZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,5))*ZA(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,1))*ZA(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,2))*ZA(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*ZA(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,5))*ZA(gt3,2))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*ZA(gt3,2))/2._dp
resL = resL+gBY*Conjg(dZN(gt2,6))*Conjg(ZN(gt1,1))*ZA(gt3,3)
resL = resL+gBL*Conjg(dZN(gt2,6))*Conjg(ZN(gt1,5))*ZA(gt3,3)
resL = resL+gBY*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,6))*ZA(gt3,3)
resL = resL+gBL*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,6))*ZA(gt3,3)
resL = resL+gBY*Conjg(dZN(gt1,6))*Conjg(ZN(gt2,1))*ZA(gt3,3)
resL = resL+dgBY*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1))*ZA(gt3,3)
resL = resL+gBL*Conjg(dZN(gt1,6))*Conjg(ZN(gt2,5))*ZA(gt3,3)
resL = resL+dgBL*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5))*ZA(gt3,3)
resL = resL+gBY*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,6))*ZA(gt3,3)
resL = resL+gBL*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,6))*ZA(gt3,3)
resL = resL+dgBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6))*ZA(gt3,3)
resL = resL+dgBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6))*ZA(gt3,3)
resL = resL-(gBY*Conjg(dZN(gt2,7))*Conjg(ZN(gt1,1))*ZA(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt2,7))*Conjg(ZN(gt1,5))*ZA(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,7))*ZA(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,7))*ZA(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt1,7))*Conjg(ZN(gt2,1))*ZA(gt3,4))
resL = resL-(dgBY*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1))*ZA(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt1,7))*Conjg(ZN(gt2,5))*ZA(gt3,4))
resL = resL-(dgBL*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,5))*ZA(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,7))*ZA(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,7))*ZA(gt3,4))
resL = resL-(dgBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7))*ZA(gt3,4))
resL = resL-(dgBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,7))*ZA(gt3,4))
resR = 0._dp 
resR = resR-(g1*dZN(gt2,3)*ZA(gt3,1)*ZN(gt1,1))/2._dp
resR = resR+(g1*dZN(gt2,4)*ZA(gt3,2)*ZN(gt1,1))/2._dp
resR = resR-(gBY*dZN(gt2,6)*ZA(gt3,3)*ZN(gt1,1))
resR = resR+gBY*dZN(gt2,7)*ZA(gt3,4)*ZN(gt1,1)
resR = resR+(g2*dZN(gt2,3)*ZA(gt3,1)*ZN(gt1,2))/2._dp
resR = resR-(g2*dZN(gt2,4)*ZA(gt3,2)*ZN(gt1,2))/2._dp
resR = resR-(g1*dZN(gt2,1)*ZA(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(g2*dZN(gt2,2)*ZA(gt3,1)*ZN(gt1,3))/2._dp
resR = resR-(gYB*dZN(gt2,5)*ZA(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(g1*dZN(gt2,1)*ZA(gt3,2)*ZN(gt1,4))/2._dp
resR = resR-(g2*dZN(gt2,2)*ZA(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(gYB*dZN(gt2,5)*ZA(gt3,2)*ZN(gt1,4))/2._dp
resR = resR-(gYB*dZN(gt2,3)*ZA(gt3,1)*ZN(gt1,5))/2._dp
resR = resR+(gYB*dZN(gt2,4)*ZA(gt3,2)*ZN(gt1,5))/2._dp
resR = resR-(gBL*dZN(gt2,6)*ZA(gt3,3)*ZN(gt1,5))
resR = resR+gBL*dZN(gt2,7)*ZA(gt3,4)*ZN(gt1,5)
resR = resR-(gBY*dZN(gt2,1)*ZA(gt3,3)*ZN(gt1,6))
resR = resR-(gBL*dZN(gt2,5)*ZA(gt3,3)*ZN(gt1,6))
resR = resR+gBY*dZN(gt2,1)*ZA(gt3,4)*ZN(gt1,7)
resR = resR+gBL*dZN(gt2,5)*ZA(gt3,4)*ZN(gt1,7)
resR = resR-(g1*dZN(gt1,3)*ZA(gt3,1)*ZN(gt2,1))/2._dp
resR = resR+(g1*dZN(gt1,4)*ZA(gt3,2)*ZN(gt2,1))/2._dp
resR = resR-(gBY*dZN(gt1,6)*ZA(gt3,3)*ZN(gt2,1))
resR = resR+gBY*dZN(gt1,7)*ZA(gt3,4)*ZN(gt2,1)
resR = resR-(g1*dZA(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR-(dg1*ZA(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR+(g1*dZA(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR+(dg1*ZA(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR-(gBY*dZA(gt3,3)*ZN(gt1,6)*ZN(gt2,1))
resR = resR-(dgBY*ZA(gt3,3)*ZN(gt1,6)*ZN(gt2,1))
resR = resR+gBY*dZA(gt3,4)*ZN(gt1,7)*ZN(gt2,1)
resR = resR+dgBY*ZA(gt3,4)*ZN(gt1,7)*ZN(gt2,1)
resR = resR+(g2*dZN(gt1,3)*ZA(gt3,1)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZN(gt1,4)*ZA(gt3,2)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZA(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR+(dg2*ZA(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZA(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(dg2*ZA(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(g1*dZN(gt1,1)*ZA(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(g2*dZN(gt1,2)*ZA(gt3,1)*ZN(gt2,3))/2._dp
resR = resR-(gYB*dZN(gt1,5)*ZA(gt3,1)*ZN(gt2,3))/2._dp
resR = resR-(g1*dZA(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR-(dg1*ZA(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR+(g2*dZA(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR+(dg2*ZA(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR-(gYB*dZA(gt3,1)*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR-(dgYB*ZA(gt3,1)*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR+(g1*dZN(gt1,1)*ZA(gt3,2)*ZN(gt2,4))/2._dp
resR = resR-(g2*dZN(gt1,2)*ZA(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(gYB*dZN(gt1,5)*ZA(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(g1*dZA(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR+(dg1*ZA(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR-(g2*dZA(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(dg2*ZA(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(gYB*dZA(gt3,2)*ZN(gt1,5)*ZN(gt2,4))/2._dp
resR = resR+(dgYB*ZA(gt3,2)*ZN(gt1,5)*ZN(gt2,4))/2._dp
resR = resR-(gYB*dZN(gt1,3)*ZA(gt3,1)*ZN(gt2,5))/2._dp
resR = resR+(gYB*dZN(gt1,4)*ZA(gt3,2)*ZN(gt2,5))/2._dp
resR = resR-(gBL*dZN(gt1,6)*ZA(gt3,3)*ZN(gt2,5))
resR = resR+gBL*dZN(gt1,7)*ZA(gt3,4)*ZN(gt2,5)
resR = resR-(gYB*dZA(gt3,1)*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR-(dgYB*ZA(gt3,1)*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(gYB*dZA(gt3,2)*ZN(gt1,4)*ZN(gt2,5))/2._dp
resR = resR+(dgYB*ZA(gt3,2)*ZN(gt1,4)*ZN(gt2,5))/2._dp
resR = resR-(gBL*dZA(gt3,3)*ZN(gt1,6)*ZN(gt2,5))
resR = resR-(dgBL*ZA(gt3,3)*ZN(gt1,6)*ZN(gt2,5))
resR = resR+gBL*dZA(gt3,4)*ZN(gt1,7)*ZN(gt2,5)
resR = resR+dgBL*ZA(gt3,4)*ZN(gt1,7)*ZN(gt2,5)
resR = resR-(gBY*dZN(gt1,1)*ZA(gt3,3)*ZN(gt2,6))
resR = resR-(gBL*dZN(gt1,5)*ZA(gt3,3)*ZN(gt2,6))
resR = resR-(gBY*dZA(gt3,3)*ZN(gt1,1)*ZN(gt2,6))
resR = resR-(dgBY*ZA(gt3,3)*ZN(gt1,1)*ZN(gt2,6))
resR = resR-(gBL*dZA(gt3,3)*ZN(gt1,5)*ZN(gt2,6))
resR = resR-(dgBL*ZA(gt3,3)*ZN(gt1,5)*ZN(gt2,6))
resR = resR+gBY*dZN(gt1,1)*ZA(gt3,4)*ZN(gt2,7)
resR = resR+gBL*dZN(gt1,5)*ZA(gt3,4)*ZN(gt2,7)
resR = resR+gBY*dZA(gt3,4)*ZN(gt1,1)*ZN(gt2,7)
resR = resR+dgBY*ZA(gt3,4)*ZN(gt1,1)*ZN(gt2,7)
resR = resR+gBL*dZA(gt3,4)*ZN(gt1,5)*ZN(gt2,7)
resR = resR+dgBL*ZA(gt3,4)*ZN(gt1,5)*ZN(gt2,7)
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiAh  
 
 
Subroutine CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dZA(gt3,1)*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dYd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZA(gt3,1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZA(gt3,1)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZA(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*ZA(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdAh  
 
 
Subroutine CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dZA(gt3,1)*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZA(gt3,1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZA(gt3,1)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZA(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*ZA(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeAh  
 
 
Subroutine CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZA(gt3,2)*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZA(gt3,2)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZA(gt3,2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZA(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZA(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuAh  
 
 
Subroutine CT_CouplingFvFvAh(gt1,gt2,gt3,Yx,Yv,ZA,UV,dYx,dYv,dZA,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(4,4),dZA(4,4)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6),dYx(3,3),dYv(3,3),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*dZA(gt3,3)*Yx(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*dZA(gt3,3)*Yx(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dZA(gt3,2)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dZA(gt3,2)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dYv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dYv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,j2))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,j2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,j2))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*dYx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*dYx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j2))*Conjg(UV(gt1,3 + j1))*Yx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,3 + j2))*Yx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZA(gt3,2)*UV(gt1,j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dZA(gt3,3)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZA(gt3,2)*UV(gt1,3 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dZA(gt3,3)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,j2)*UV(gt1,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,3 + j1)*UV(gt2,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt2,3 + j2)*UV(gt1,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,3 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt1,3 + j2)*UV(gt2,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*UV(gt1,3 + j2)*UV(gt2,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,3 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*UV(gt1,3 + j1)*UV(gt2,3 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvAh  
 
 
Subroutine CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,gYB,ZP,ZN,UM,UP,dg1,               & 
& dg2,dgYB,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gYB,ZP(2,2),dg1,dg2,dgYB,dZP(2,2)

Complex(dp), Intent(in) :: ZN(7,7),UM(2,2),UP(2,2),dZN(7,7),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*dZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*dZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,3))*dZP(gt3,1))
resL = resL+(gYB*Conjg(UM(gt2,2))*Conjg(ZN(gt1,5))*dZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(UM(gt2,1))*ZP(gt3,1))
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g1*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(dUM(gt2,1))*Conjg(ZN(gt1,3))*ZP(gt3,1))
resL = resL-(dg2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,3))*ZP(gt3,1))
resL = resL+(gYB*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,5))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dgYB*Conjg(UM(gt2,2))*Conjg(ZN(gt1,5))*ZP(gt3,1))/sqrt(2._dp)
resR = 0._dp 
resR = resR-((g1*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,1))/sqrt(2._dp))
resR = resR-((g2*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,2))/sqrt(2._dp))
resR = resR-(g2*dZP(gt3,2)*UP(gt2,1)*ZN(gt1,4))
resR = resR-((gYB*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,5))/sqrt(2._dp))
resR = resR-(g2*dZN(gt1,4)*UP(gt2,1)*ZP(gt3,2))
resR = resR-((g1*dZN(gt1,1)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dZN(gt1,2)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((gYB*dZN(gt1,5)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g1*dUP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg1*UP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg2*UP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-(g2*dUP(gt2,1)*ZN(gt1,4)*ZP(gt3,2))
resR = resR-(dg2*UP(gt2,1)*ZN(gt1,4)*ZP(gt3,2))
resR = resR-((gYB*dUP(gt2,2)*ZN(gt1,5)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dgYB*UP(gt2,2)*ZN(gt1,5)*ZP(gt3,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacHpm  
 
 
Subroutine CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,             & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChaFucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZUL(gt2,j1))*Conjg(UM(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(UM(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt1,2))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*UP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZD(gt3,j2)*UP(gt1,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dUP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*UP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChaFucSd  
 
 
Subroutine CT_CouplingFvChacSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,dg2,dYe,              & 
& dYv,dZE,dUM,dUP,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),UM(2,2),UP(2,2),UV(6,6),dYe(3,3),dYv(3,3),dZE(6,6),           & 
& dUM(2,2),dUP(2,2),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvChacSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt2,1))*Conjg(UV(gt1,j1))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt1,j1))*Conjg(UM(gt2,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt2,1))*Conjg(UV(gt1,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt2,1))*Conjg(UV(gt1,j1))*ZE(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(UV(gt1,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(UV(gt1,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,j2))*Conjg(UM(gt2,2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(UV(gt1,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZE(gt3,j2)*UP(gt2,2)*UV(gt1,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UP(gt2,2)*ZE(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUP(gt2,2)*UV(gt1,3 + j1)*ZE(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*UP(gt2,2)*UV(gt1,3 + j1)*ZE(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvChacSe  
 
 
Subroutine CT_CouplingcChaChahh(gt1,gt2,gt3,g2,ZH,UM,UP,dg2,dZH,dUM,dUP,              & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,ZH(4,4),dg2,dZH(4,4)

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChahh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*dZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*dZH(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*ZH(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*ZH(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*ZH(gt3,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((g2*dZH(gt3,1)*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp))
resR = resR-((g2*dZH(gt3,2)*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,1)*UM(gt1,2)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((g2*dUM(gt1,2)*UP(gt2,1)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((dg2*UM(gt1,2)*UP(gt2,1)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,2)*UM(gt1,1)*ZH(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dUM(gt1,1)*UP(gt2,2)*ZH(gt3,2))/sqrt(2._dp))
resR = resR-((dg2*UM(gt1,1)*UP(gt2,2)*ZH(gt3,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChahh  
 
 
Subroutine CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,             & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChaSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*dYd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZU(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dZDL(gt1,j1)*UP(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dUP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZDL(gt1,j2)*UP(gt2,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dUP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChaSu  
 
 
Subroutine CT_CouplingcFeChaSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVI,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVI(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVI(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChaSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVI(gt3,j2))*dYe(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZVI(gt3,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVI(gt3,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dZEL(gt1,j1)*UP(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dUP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZVI(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZVI(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dZEL(gt1,j2)*UP(gt2,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dUP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChaSvIm  
 
 
Subroutine CT_CouplingcFeChaSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVR,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVR(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVR(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChaSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVR(gt3,j2))*dYe(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVR(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZVR(gt3,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVR(gt3,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZVR(gt3,j1))*dZEL(gt1,j1)*UP(gt2,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZVR(gt3,j1))*dUP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZVR(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZVR(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dZEL(gt1,j2)*UP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dUP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChaSvRe  
 
 
Subroutine CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,ZH,ZN,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZH,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,ZH(4,4),dg1,dg2,dgBL,dgYB,dgBY,dZH(4,4)

Complex(dp), Intent(in) :: ZN(7,7),dZN(7,7)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*dZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*dZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*dZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*dZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*dZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*dZH(gt3,1))/2._dp
resL = resL-(g1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*dZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*dZH(gt3,2))/2._dp
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*dZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*dZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*dZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*dZH(gt3,2))/2._dp
resL = resL+gBY*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1))*dZH(gt3,3)
resL = resL+gBL*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5))*dZH(gt3,3)
resL = resL+gBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6))*dZH(gt3,3)
resL = resL+gBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6))*dZH(gt3,3)
resL = resL-(gBY*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1))*dZH(gt3,4))
resL = resL-(gBL*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,5))*dZH(gt3,4))
resL = resL-(gBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7))*dZH(gt3,4))
resL = resL-(gBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,7))*dZH(gt3,4))
resL = resL+(g1*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,1))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,2))*ZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,3))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,3))*ZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,3))*ZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,5))*ZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,1))*ZH(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,2))*ZH(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*ZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(gYB*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,5))*ZH(gt3,1))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*ZH(gt3,1))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,1))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,2))*ZH(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,4))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,4))*ZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,4))*ZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,5))*ZH(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,1))*ZH(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,2))*ZH(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*ZH(gt3,2))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL-(gYB*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,5))*ZH(gt3,2))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*ZH(gt3,2))/2._dp
resL = resL+gBY*Conjg(dZN(gt2,6))*Conjg(ZN(gt1,1))*ZH(gt3,3)
resL = resL+gBL*Conjg(dZN(gt2,6))*Conjg(ZN(gt1,5))*ZH(gt3,3)
resL = resL+gBY*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,6))*ZH(gt3,3)
resL = resL+gBL*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,6))*ZH(gt3,3)
resL = resL+gBY*Conjg(dZN(gt1,6))*Conjg(ZN(gt2,1))*ZH(gt3,3)
resL = resL+dgBY*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1))*ZH(gt3,3)
resL = resL+gBL*Conjg(dZN(gt1,6))*Conjg(ZN(gt2,5))*ZH(gt3,3)
resL = resL+dgBL*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5))*ZH(gt3,3)
resL = resL+gBY*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,6))*ZH(gt3,3)
resL = resL+gBL*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,6))*ZH(gt3,3)
resL = resL+dgBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6))*ZH(gt3,3)
resL = resL+dgBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6))*ZH(gt3,3)
resL = resL-(gBY*Conjg(dZN(gt2,7))*Conjg(ZN(gt1,1))*ZH(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt2,7))*Conjg(ZN(gt1,5))*ZH(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,7))*ZH(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,7))*ZH(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt1,7))*Conjg(ZN(gt2,1))*ZH(gt3,4))
resL = resL-(dgBY*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1))*ZH(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt1,7))*Conjg(ZN(gt2,5))*ZH(gt3,4))
resL = resL-(dgBL*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,5))*ZH(gt3,4))
resL = resL-(gBY*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,7))*ZH(gt3,4))
resL = resL-(gBL*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,7))*ZH(gt3,4))
resL = resL-(dgBY*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7))*ZH(gt3,4))
resL = resL-(dgBL*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,7))*ZH(gt3,4))
resR = 0._dp 
resR = resR+(g1*dZN(gt2,3)*ZH(gt3,1)*ZN(gt1,1))/2._dp
resR = resR-(g1*dZN(gt2,4)*ZH(gt3,2)*ZN(gt1,1))/2._dp
resR = resR+gBY*dZN(gt2,6)*ZH(gt3,3)*ZN(gt1,1)
resR = resR-(gBY*dZN(gt2,7)*ZH(gt3,4)*ZN(gt1,1))
resR = resR-(g2*dZN(gt2,3)*ZH(gt3,1)*ZN(gt1,2))/2._dp
resR = resR+(g2*dZN(gt2,4)*ZH(gt3,2)*ZN(gt1,2))/2._dp
resR = resR+(g1*dZN(gt2,1)*ZH(gt3,1)*ZN(gt1,3))/2._dp
resR = resR-(g2*dZN(gt2,2)*ZH(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(gYB*dZN(gt2,5)*ZH(gt3,1)*ZN(gt1,3))/2._dp
resR = resR-(g1*dZN(gt2,1)*ZH(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(g2*dZN(gt2,2)*ZH(gt3,2)*ZN(gt1,4))/2._dp
resR = resR-(gYB*dZN(gt2,5)*ZH(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(gYB*dZN(gt2,3)*ZH(gt3,1)*ZN(gt1,5))/2._dp
resR = resR-(gYB*dZN(gt2,4)*ZH(gt3,2)*ZN(gt1,5))/2._dp
resR = resR+gBL*dZN(gt2,6)*ZH(gt3,3)*ZN(gt1,5)
resR = resR-(gBL*dZN(gt2,7)*ZH(gt3,4)*ZN(gt1,5))
resR = resR+gBY*dZN(gt2,1)*ZH(gt3,3)*ZN(gt1,6)
resR = resR+gBL*dZN(gt2,5)*ZH(gt3,3)*ZN(gt1,6)
resR = resR-(gBY*dZN(gt2,1)*ZH(gt3,4)*ZN(gt1,7))
resR = resR-(gBL*dZN(gt2,5)*ZH(gt3,4)*ZN(gt1,7))
resR = resR+(g1*dZN(gt1,3)*ZH(gt3,1)*ZN(gt2,1))/2._dp
resR = resR-(g1*dZN(gt1,4)*ZH(gt3,2)*ZN(gt2,1))/2._dp
resR = resR+gBY*dZN(gt1,6)*ZH(gt3,3)*ZN(gt2,1)
resR = resR-(gBY*dZN(gt1,7)*ZH(gt3,4)*ZN(gt2,1))
resR = resR+(g1*dZH(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR+(dg1*ZH(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR-(g1*dZH(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR-(dg1*ZH(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR+gBY*dZH(gt3,3)*ZN(gt1,6)*ZN(gt2,1)
resR = resR+dgBY*ZH(gt3,3)*ZN(gt1,6)*ZN(gt2,1)
resR = resR-(gBY*dZH(gt3,4)*ZN(gt1,7)*ZN(gt2,1))
resR = resR-(dgBY*ZH(gt3,4)*ZN(gt1,7)*ZN(gt2,1))
resR = resR-(g2*dZN(gt1,3)*ZH(gt3,1)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZN(gt1,4)*ZH(gt3,2)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZH(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR-(dg2*ZH(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZH(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(dg2*ZH(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(g1*dZN(gt1,1)*ZH(gt3,1)*ZN(gt2,3))/2._dp
resR = resR-(g2*dZN(gt1,2)*ZH(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(gYB*dZN(gt1,5)*ZH(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(g1*dZH(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR+(dg1*ZH(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR-(g2*dZH(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR-(dg2*ZH(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR+(gYB*dZH(gt3,1)*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR+(dgYB*ZH(gt3,1)*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR-(g1*dZN(gt1,1)*ZH(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(g2*dZN(gt1,2)*ZH(gt3,2)*ZN(gt2,4))/2._dp
resR = resR-(gYB*dZN(gt1,5)*ZH(gt3,2)*ZN(gt2,4))/2._dp
resR = resR-(g1*dZH(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR-(dg1*ZH(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR+(g2*dZH(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(dg2*ZH(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(gYB*dZH(gt3,2)*ZN(gt1,5)*ZN(gt2,4))/2._dp
resR = resR-(dgYB*ZH(gt3,2)*ZN(gt1,5)*ZN(gt2,4))/2._dp
resR = resR+(gYB*dZN(gt1,3)*ZH(gt3,1)*ZN(gt2,5))/2._dp
resR = resR-(gYB*dZN(gt1,4)*ZH(gt3,2)*ZN(gt2,5))/2._dp
resR = resR+gBL*dZN(gt1,6)*ZH(gt3,3)*ZN(gt2,5)
resR = resR-(gBL*dZN(gt1,7)*ZH(gt3,4)*ZN(gt2,5))
resR = resR+(gYB*dZH(gt3,1)*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(dgYB*ZH(gt3,1)*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR-(gYB*dZH(gt3,2)*ZN(gt1,4)*ZN(gt2,5))/2._dp
resR = resR-(dgYB*ZH(gt3,2)*ZN(gt1,4)*ZN(gt2,5))/2._dp
resR = resR+gBL*dZH(gt3,3)*ZN(gt1,6)*ZN(gt2,5)
resR = resR+dgBL*ZH(gt3,3)*ZN(gt1,6)*ZN(gt2,5)
resR = resR-(gBL*dZH(gt3,4)*ZN(gt1,7)*ZN(gt2,5))
resR = resR-(dgBL*ZH(gt3,4)*ZN(gt1,7)*ZN(gt2,5))
resR = resR+gBY*dZN(gt1,1)*ZH(gt3,3)*ZN(gt2,6)
resR = resR+gBL*dZN(gt1,5)*ZH(gt3,3)*ZN(gt2,6)
resR = resR+gBY*dZH(gt3,3)*ZN(gt1,1)*ZN(gt2,6)
resR = resR+dgBY*ZH(gt3,3)*ZN(gt1,1)*ZN(gt2,6)
resR = resR+gBL*dZH(gt3,3)*ZN(gt1,5)*ZN(gt2,6)
resR = resR+dgBL*ZH(gt3,3)*ZN(gt1,5)*ZN(gt2,6)
resR = resR-(gBY*dZN(gt1,1)*ZH(gt3,4)*ZN(gt2,7))
resR = resR-(gBL*dZN(gt1,5)*ZH(gt3,4)*ZN(gt2,7))
resR = resR-(gBY*dZH(gt3,4)*ZN(gt1,1)*ZN(gt2,7))
resR = resR-(dgBY*ZH(gt3,4)*ZN(gt1,1)*ZN(gt2,7))
resR = resR-(gBL*dZH(gt3,4)*ZN(gt1,5)*ZN(gt2,7))
resR = resR-(dgBL*ZH(gt3,4)*ZN(gt1,5)*ZN(gt2,7))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChihh  
 
 
Subroutine CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yd,ZD,ZN,ZDL,            & 
& ZDR,dg1,dg2,dgBL,dgYB,dgBY,dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(7,7),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(7,7),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*dZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,5))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,5))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZN(gt1,1))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(dZN(gt1,5))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZN(gt1,5))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,5))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,5))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgBL*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,5))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgYB*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,5))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,3))*dZD(gt3,3 + j1)*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,3))*dYd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,3))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDL(gt2,j2))*Conjg(ZN(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,1)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZN(gt1,1)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZN(gt1,5)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZN(gt1,5)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,5))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,5))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(dgBL*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgYB*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,5))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZN(gt1,3)*ZD(gt3,j2)*ZDR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZD(gt3,j2)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*ZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFdcSd  
 
 
Subroutine CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,            & 
& ZER,dg1,dg2,dgBL,dgYB,dgBY,dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(7,7),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(7,7),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,5))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,5))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt1,1))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt1,5))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,5))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,5))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,5))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dgYB*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,5))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,3))*dZE(gt3,3 + j1)*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,3))*dYe(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,3))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZEL(gt2,j2))*Conjg(ZN(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,1)*ZE(gt3,3 + j1)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-((gBY*dZN(gt1,1)*ZE(gt3,3 + j1)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZN(gt1,5)*ZE(gt3,3 + j1)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-((gBL*dZN(gt1,5)*ZE(gt3,3 + j1)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-((gBY*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-((gBY*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-((dgBY*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,5))
End Do 
Do j1 = 1,3
resR = resR-((gBL*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gYB*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,5))
End Do 
Do j1 = 1,3
resR = resR-((gBL*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dgBL*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgYB*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,5))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZN(gt1,3)*ZE(gt3,j2)*ZER(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZE(gt3,j2)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*ZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFecSe  
 
 
Subroutine CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yu,ZU,ZN,ZUL,            & 
& ZUR,dg1,dg2,dgBL,dgYB,dgBY,dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(7,7),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(7,7),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,2))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,5))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,5))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(dZN(gt1,5))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZN(gt1,5))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgBL*Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dgYB*Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,4))*Conjg(ZUL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,4))*Conjg(ZUL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUL(gt2,j2))*Conjg(ZN(gt1,4))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,4))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZUR(gt2,j1)*ZN(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZUR(gt2,j1)*ZN(gt1,1)*ZU(gt3,3 + j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*gYB*dZUR(gt2,j1)*ZN(gt1,5)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZUR(gt2,j1)*ZN(gt1,5)*ZU(gt3,3 + j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZU(gt3,3 + j1)*ZN(gt1,1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZU(gt3,3 + j1)*ZN(gt1,1)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*gYB*dZU(gt3,3 + j1)*ZN(gt1,5)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZU(gt3,3 + j1)*ZN(gt1,5)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*dZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*gYB*dZN(gt1,5)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*dZN(gt1,5)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*dg1*ZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*ZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(dgBL*ZN(gt1,5)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*dgYB*ZN(gt1,5)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZN(gt1,4)*ZU(gt3,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZU(gt3,j2)*ZN(gt1,4)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZN(gt1,4)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*ZN(gt1,4)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFucSu  
 
 
Subroutine CT_CouplingChiFvSvIm(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVI,              & 
& ZN,UV,dg1,dg2,dgBL,dgYB,dgBY,dYx,dYv,dZVI,dZN,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),ZVI(6,6),ZN(7,7),UV(6,6),dYx(3,3),dYv(3,3),dZVI(6,6),dZN(7,7),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFvSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt1,5))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgYB*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt1,1))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt1,5))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,3 + j1)))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,j2))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Conjg(ZVI(gt3,3 + j1))*dYx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Conjg(ZVI(gt3,3 + j2))*dYx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,3 + j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,6))*Conjg(UV(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Conjg(ZVI(gt3,3 + j1))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,6))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Conjg(ZVI(gt3,3 + j2))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVI(gt3,j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZN(gt1,4))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZVI(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVI(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dZN(gt1,2)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZVI(gt3,j1))*dZN(gt1,5)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVI(gt3,j1))*dZN(gt1,5)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVI(gt3,3 + j1))*dZN(gt1,1)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVI(gt3,3 + j1))*dZN(gt1,5)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVI(gt3,3 + j1))*dUV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dZVI(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(ZVI(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVI(gt3,3 + j1))*dUV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgYB*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dZVI(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(ZVI(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*dZN(gt1,4)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j2))*dZN(gt1,6)*UV(gt2,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dZN(gt1,4)*UV(gt2,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dZN(gt1,6)*UV(gt2,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*dUV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dUV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j2))*dUV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yx(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dUV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,3 + j2))*Conjg(Yx(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYx(j1,j2))*Conjg(ZVI(gt3,3 + j2))*UV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,3 + j1))*Conjg(Yx(j1,j2))*UV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYx(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFvSvIm  
 
 
Subroutine CT_CouplingChiFvSvRe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVR,              & 
& ZN,UV,dg1,dg2,dgBL,dgYB,dgBY,dYx,dYv,dZVR,dZN,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),ZVR(6,6),ZN(7,7),UV(6,6),dYx(3,3),dYv(3,3),dZVR(6,6),dZN(7,7),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFvSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dZN(gt1,5))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt1,5))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgYB*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dZN(gt1,1))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dZN(gt1,5))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBL*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,3 + j1)))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,j2))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Conjg(ZVR(gt3,3 + j1))*dYx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Conjg(ZVR(gt3,3 + j2))*dYx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,3 + j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,6))*Conjg(UV(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j2))*Conjg(ZN(gt1,6))*Conjg(ZVR(gt3,3 + j1))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,6))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,6))*Conjg(ZVR(gt3,3 + j2))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZVR(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(ZVR(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZVR(gt3,j1))*dZN(gt1,2)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(ZVR(gt3,j1))*dZN(gt1,5)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(ZVR(gt3,j1))*dZN(gt1,5)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVR(gt3,3 + j1))*dZN(gt1,1)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVR(gt3,3 + j1))*dZN(gt1,5)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZVR(gt3,3 + j1))*dUV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dZVR(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(ZVR(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZVR(gt3,3 + j1))*dUV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBL*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgYB*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dZVR(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(ZVR(gt3,3 + j1))*UV(gt2,3 + j1)*ZN(gt1,5))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*dZN(gt1,4)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*dZN(gt1,6)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dZN(gt1,4)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dZN(gt1,6)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*dUV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dUV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*dUV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dUV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,3 + j2))*Conjg(Yx(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*Conjg(ZVR(gt3,3 + j2))*UV(gt2,3 + j1)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,3 + j1))*Conjg(Yx(j1,j2))*UV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UV(gt2,3 + j2)*ZN(gt1,6))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFvSvRe  
 
 
Subroutine CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,gYB,ZP,ZN,UM,UP,dg1,               & 
& dg2,dgYB,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gYB,ZP(2,2),dg1,dg2,dgYB,dZP(2,2)

Complex(dp), Intent(in) :: ZN(7,7),UM(2,2),UP(2,2),dZN(7,7),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,4))*dZP(gt3,2))
resL = resL-((gYB*Conjg(UP(gt1,2))*Conjg(ZN(gt2,5))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dZN(gt2,4))*Conjg(UP(gt1,1))*ZP(gt3,2))
resL = resL-((g1*Conjg(dZN(gt2,1))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dZN(gt2,2))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((gYB*Conjg(dZN(gt2,5))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g1*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZN(gt2,4))*ZP(gt3,2))
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,4))*ZP(gt3,2))
resL = resL-((gYB*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,5))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dgYB*Conjg(UP(gt1,2))*Conjg(ZN(gt2,5))*ZP(gt3,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR+(g1*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,1))/sqrt(2._dp)
resR = resR+(g2*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,2))/sqrt(2._dp)
resR = resR-(g2*dZP(gt3,1)*UM(gt1,1)*ZN(gt2,3))
resR = resR+(gYB*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(g2*dZN(gt2,3)*UM(gt1,1)*ZP(gt3,1))
resR = resR+(g1*dZN(gt2,1)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dZN(gt2,2)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(gYB*dZN(gt2,5)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g1*dUM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg1*UM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR-(g2*dUM(gt1,1)*ZN(gt2,3)*ZP(gt3,1))
resR = resR-(dg2*UM(gt1,1)*ZN(gt2,3)*ZP(gt3,1))
resR = resR+(gYB*dUM(gt1,2)*ZN(gt2,5)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dgYB*UM(gt1,2)*ZN(gt2,5)*ZP(gt3,1))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiHpm  
 
 
Subroutine CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yd,ZD,ZN,ZDL,            & 
& ZDR,dg1,dg2,dgBL,dgYB,dgBY,dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(7,7),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(7,7),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChiSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt2,1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZN(gt2,5))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt2,5))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,5)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,5)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,5)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,5)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,5)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgYB*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,5)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,3))*dYd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,3))*Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,j2))*Conjg(ZN(gt2,3))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,3))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZN(gt2,1)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZD(gt3,j1))*dZN(gt2,1)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZN(gt2,2)*ZDL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZD(gt3,j1))*dZN(gt2,5)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZD(gt3,j1))*dZN(gt2,5)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgYB*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZN(gt2,3)*ZDL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*ZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*ZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChiSd  
 
 
Subroutine CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,            & 
& ZER,dg1,dg2,dgBL,dgYB,dgBY,dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(7,7),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(7,7),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChiSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-((gBY*Conjg(dZN(gt2,1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZN(gt2,5))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-((gBL*Conjg(dZN(gt2,5))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-((gBY*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-((gBY*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-((dgBY*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,5)))
End Do 
Do j1 = 1,3
resL = resL-((gBL*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gYB*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,5)))
End Do 
Do j1 = 1,3
resL = resL-((gBL*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dgBL*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgYB*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,5)))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,3))*dYe(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,3))*Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,j2))*Conjg(ZN(gt2,3))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,3))*Ye(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZN(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(ZE(gt3,j1))*dZN(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZN(gt2,2)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(ZE(gt3,j1))*dZN(gt2,5)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(ZE(gt3,j1))*dZN(gt2,5)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dgBY*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gYB*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dgBL*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dgYB*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,5))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZN(gt2,3)*ZEL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*ZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*ZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChiSe  
 
 
Subroutine CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yu,ZU,ZN,ZUL,            & 
& ZUR,dg1,dg2,dgBL,dgYB,dgBY,dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,dg1,dg2,dgBL,dgYB,dgBY

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(7,7),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(7,7),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuChiSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*gYB*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,5))*Conjg(ZU(gt3,3 + j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,5))*Conjg(ZU(gt3,3 + j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,1))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*gYB*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,5))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,5))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*gYB*Conjg(dZN(gt2,5))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dZN(gt2,5))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*dg1*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(ZN(gt2,5))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*dgYB*Conjg(ZN(gt2,5))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt2,4))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,4))*Conjg(ZU(gt3,j2))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZU(gt3,j2))*Conjg(ZN(gt2,4))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,4))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,5))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(ZU(gt3,j1))*dZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(ZU(gt3,j1))*dZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(ZU(gt3,j1))*dZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(ZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(dZU(gt3,j1))*ZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dZU(gt3,j1))*ZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(ZU(gt3,j1))*ZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dgYB*Conjg(ZU(gt3,j1))*ZN(gt2,5)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZUL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*ZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*ZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuChiSu  
 
 
Subroutine CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFdcSd' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZDL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZDR(gt2,j1)*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFdcSd  
 
 
Subroutine CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(4,4),dZH(4,4)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dZH(gt3,1)*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dYd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZH(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*ZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdhh  
 
 
Subroutine CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,            & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFdcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZDL(gt2,j1))*Conjg(UP(gt1,1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(UP(gt1,2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZU(gt3,j2)*UM(gt1,2)*ZDR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*UM(gt1,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dUM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*UM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFdcSu  
 
 
Subroutine CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,             & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZP(gt3,2)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZP(gt3,1)*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcHpm  
 
 
Subroutine CT_CouplingFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,               & 
& dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),UV(6,6),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dUV(6,6),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFecHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dZP(gt3,2)*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dYv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZP(gt3,1)*UV(gt1,j2)*ZER(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dUV(gt1,j2)*ZER(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*UV(gt1,j2)*ZER(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFecHpm  
 
 
Subroutine CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(4,4),dZH(4,4)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dZH(gt3,1)*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZH(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*ZEL(gt1,j2)*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFehh  
 
 
Subroutine CT_CouplingcChaFeSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVI,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVI(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVI(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFeSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVI(gt3,j1))*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVI(gt3,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(UP(gt1,2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVI(gt3,j2))*dZER(gt2,j1)*UM(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVI(gt3,j2))*dUM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,j2))*Conjg(Ye(j1,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYe(j1,j2))*Conjg(ZVI(gt3,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFeSvIm  
 
 
Subroutine CT_CouplingcChaFeSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVR,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVR(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVR(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFeSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVR(gt3,j1))*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVR(gt3,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(UP(gt1,2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVR(gt3,j2))*dZER(gt2,j1)*UM(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVR(gt3,j2))*dUM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVR(gt3,j2))*Conjg(Ye(j1,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYe(j1,j2))*Conjg(ZVR(gt3,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFeSvRe  
 
 
Subroutine CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFucSu' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZUR(gt2,j1)*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFucSu  
 
 
Subroutine CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(4,4),dZH(4,4)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZH(gt3,2)*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZH(gt3,2)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZH(gt3,2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZH(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZH(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuhh  
 
 
Subroutine CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,              & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZP(gt3,1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZP(gt3,2)*ZDL(gt1,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*ZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuHpm  
 
 
Subroutine CT_CouplingFvFvhh(gt1,gt2,gt3,Yx,Yv,ZH,UV,dYx,dYv,dZH,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(4,4),dZH(4,4)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6),dYx(3,3),dYv(3,3),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.4)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*dZH(gt3,3)*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*dZH(gt3,3)*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dZH(gt3,2)*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dZH(gt3,2)*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dYv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dYv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,j2))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,j2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,j2))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*dYx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*dYx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j2))*Conjg(UV(gt1,3 + j1))*Yx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,3 + j2))*Yx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZH(gt3,2)*UV(gt1,j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dZH(gt3,3)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZH(gt3,2)*UV(gt1,3 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dZH(gt3,3)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,j2)*UV(gt1,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,3 + j1)*UV(gt2,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt2,3 + j2)*UV(gt1,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,3 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt1,3 + j2)*UV(gt2,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*UV(gt1,3 + j2)*UV(gt2,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,3 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYx(j1,j2))*UV(gt1,3 + j1)*UV(gt2,3 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvhh  
 
 
Subroutine CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,               & 
& dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),UV(6,6),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dUV(6,6),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Conjg(ZER(gt1,j1))*dZP(gt3,1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZP(gt3,2)*UV(gt2,3 + j1)*ZEL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZEL(gt1,j2)*UV(gt2,3 + j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*ZEL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*UV(gt2,3 + j1)*ZEL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvHpm  
 
 
Subroutine CT_CouplingcChaFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,dg2,dYe,              & 
& dYv,dZE,dUM,dUP,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),UM(2,2),UP(2,2),UV(6,6),dYe(3,3),dYv(3,3),dZE(6,6),           & 
& dUM(2,2),dUP(2,2),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFvSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(UV(gt2,3 + j1))*Conjg(ZE(gt3,j2))*dYv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZE(gt3,j2))*Conjg(UP(gt1,2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZE(gt3,j2))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(UV(gt2,3 + j1))*Conjg(ZE(gt3,j2))*Yv(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dUV(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dUM(gt1,1)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZE(gt3,j1))*UM(gt1,1)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZE(gt3,j1))*UM(gt1,1)*UV(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dUV(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dUM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*UM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*UM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFvSe  
 
 
Subroutine CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdGluSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZD(gt3,j1))*dZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdGluSd  
 
 
Subroutine CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuGluSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZUR(gt1,j1))*Conjg(ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZU(gt3,j1))*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuGluSu  
 
 
Subroutine CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,            & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChacFuSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*dYu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt2,j1))*Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZD(gt3,j2))*Conjg(UP(gt1,2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dZUL(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dUM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZUL(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dUM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChacFuSd  
 
 
Subroutine CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(7,7),UM(2,2),UP(2,2),dZN(7,7),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(UM(gt2,1))*dZN(gt1,2))
resL = resL-((g2*Conjg(UM(gt2,2))*dZN(gt1,3))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUM(gt2,1))*ZN(gt1,2))
resL = resL-(dg2*Conjg(UM(gt2,1))*ZN(gt1,2))
resL = resL-((g2*Conjg(dUM(gt2,2))*ZN(gt1,3))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*ZN(gt1,3))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(ZN(gt1,2))*dUP(gt2,1))
resR = resR+(g2*Conjg(ZN(gt1,4))*dUP(gt2,2))/sqrt(2._dp)
resR = resR-(g2*Conjg(dZN(gt1,2))*UP(gt2,1))
resR = resR-(dg2*Conjg(ZN(gt1,2))*UP(gt2,1))
resR = resR+(g2*Conjg(dZN(gt1,4))*UP(gt2,2))/sqrt(2._dp)
resR = resR+(dg2*Conjg(ZN(gt1,4))*UP(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacVWm  
 
 
Subroutine CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,               & 
& dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2))/2._dp
resL = resL+g2*Conjg(UM(gt2,1))*dUM(gt1,1)*Sin(TW)
resL = resL+(g2*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL+dSinTW*g2*Conjg(UM(gt2,1))*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+(dCosTW*g1*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(dSinTW*g2*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(g1*Conjg(dUM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(dg1*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+(g1*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2))/2._dp
resR = resR+g2*Conjg(UP(gt1,1))*dUP(gt2,1)*Sin(TW)
resR = resR+(g2*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+dSinTW*g2*Conjg(UP(gt1,1))*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+(dCosTW*g1*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(dSinTW*g2*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(g1*Conjg(dUP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(dg1*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVP  
 
 
Subroutine CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,gYB,UM,UP,TW,TWp,dg1,dg2,               & 
& dgYB,dUM,dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW,TWp,dg1,dg2,dgYB,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(UM(gt2,1))*Cos(TW)*Cos(TWp)*dUM(gt1,1)
resL = resL+(g2*Conjg(UM(gt2,2))*Cos(TW)*Cos(TWp)*dUM(gt1,2))/2._dp
resL = resL-(g1*Conjg(UM(gt2,2))*Cos(TWp)*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL+(gYB*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TWp))/2._dp
resL = resL+dCosTWp*g2*Conjg(UM(gt2,1))*Cos(TW)*UM(gt1,1)
resL = resL+dCosTW*g2*Conjg(UM(gt2,1))*Cos(TWp)*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Cos(TW)*Cos(TWp)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Cos(TW)*Cos(TWp)*UM(gt1,1)
resL = resL+(dSinTWp*gYB*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(dCosTWp*g2*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL-(dSinTW*g1*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dCosTW*g2*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Cos(TW)*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Cos(TW)*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL-(dCosTWp*g1*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(g1*Conjg(dUM(gt2,2))*Cos(TWp)*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(dg1*Conjg(UM(gt2,2))*Cos(TWp)*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(gYB*Conjg(dUM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL+(dgYB*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+g2*Conjg(UP(gt1,1))*Cos(TW)*Cos(TWp)*dUP(gt2,1)
resR = resR+(g2*Conjg(UP(gt1,2))*Cos(TW)*Cos(TWp)*dUP(gt2,2))/2._dp
resR = resR-(g1*Conjg(UP(gt1,2))*Cos(TWp)*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+(gYB*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TWp))/2._dp
resR = resR+dCosTWp*g2*Conjg(UP(gt1,1))*Cos(TW)*UP(gt2,1)
resR = resR+dCosTW*g2*Conjg(UP(gt1,1))*Cos(TWp)*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Cos(TW)*Cos(TWp)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Cos(TW)*Cos(TWp)*UP(gt2,1)
resR = resR+(dSinTWp*gYB*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(dCosTWp*g2*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR-(dSinTW*g1*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dCosTW*g2*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Cos(TW)*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Cos(TW)*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR-(dCosTWp*g1*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR-(g1*Conjg(dUP(gt1,2))*Cos(TWp)*Sin(TW)*UP(gt2,2))/2._dp
resR = resR-(dg1*Conjg(UP(gt1,2))*Cos(TWp)*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(gYB*Conjg(dUP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR+(dgYB*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVZ  
 
 
Subroutine CT_CouplingcChaChaVZp(gt1,gt2,g1,g2,gYB,UM,UP,TW,TWp,dg1,dg2,              & 
& dgYB,dUM,dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW,TWp,dg1,dg2,dgYB,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(gYB*Conjg(UM(gt2,2))*Cos(TWp)*dUM(gt1,2))/2._dp
resL = resL-(g2*Conjg(UM(gt2,1))*Cos(TW)*dUM(gt1,1)*Sin(TWp))
resL = resL-(g2*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2)*Sin(TWp))/2._dp
resL = resL+(g1*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
resL = resL-(dSinTWp*g2*Conjg(UM(gt2,1))*Cos(TW)*UM(gt1,1))
resL = resL-(dCosTW*g2*Conjg(UM(gt2,1))*Sin(TWp)*UM(gt1,1))
resL = resL-(g2*Conjg(dUM(gt2,1))*Cos(TW)*Sin(TWp)*UM(gt1,1))
resL = resL-(dg2*Conjg(UM(gt2,1))*Cos(TW)*Sin(TWp)*UM(gt1,1))
resL = resL+(dCosTWp*gYB*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL-(dSinTWp*g2*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(gYB*Conjg(dUM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dgYB*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dSinTWp*g1*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(dSinTW*g1*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(dCosTW*g2*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(g2*Conjg(dUM(gt2,2))*Cos(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(dg2*Conjg(UM(gt2,2))*Cos(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL+(g1*Conjg(dUM(gt2,2))*Sin(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL+(dg1*Conjg(UM(gt2,2))*Sin(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+(gYB*Conjg(UP(gt1,2))*Cos(TWp)*dUP(gt2,2))/2._dp
resR = resR-(g2*Conjg(UP(gt1,1))*Cos(TW)*dUP(gt2,1)*Sin(TWp))
resR = resR-(g2*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2)*Sin(TWp))/2._dp
resR = resR+(g1*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW)*Sin(TWp))/2._dp
resR = resR-(dSinTWp*g2*Conjg(UP(gt1,1))*Cos(TW)*UP(gt2,1))
resR = resR-(dCosTW*g2*Conjg(UP(gt1,1))*Sin(TWp)*UP(gt2,1))
resR = resR-(g2*Conjg(dUP(gt1,1))*Cos(TW)*Sin(TWp)*UP(gt2,1))
resR = resR-(dg2*Conjg(UP(gt1,1))*Cos(TW)*Sin(TWp)*UP(gt2,1))
resR = resR+(dCosTWp*gYB*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR-(dSinTWp*g2*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(gYB*Conjg(dUP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dgYB*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dSinTWp*g1*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(dSinTW*g1*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(dCosTW*g2*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(g2*Conjg(dUP(gt1,2))*Cos(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(dg2*Conjg(UP(gt1,2))*Cos(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR+(g1*Conjg(dUP(gt1,2))*Sin(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR+(dg1*Conjg(UP(gt1,2))*Sin(TW)*Sin(TWp)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVZp  
 
 
Subroutine CT_CouplingChiChiVP(gt1,gt2,g1,g2,gBY,ZN,TW,dg1,dg2,dgBY,dZN,              & 
& dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZN(7,7),dZN(7,7)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(ZN(gt2,3))*Cos(TW)*dZN(gt1,3))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,4))*Cos(TW)*dZN(gt1,4))/2._dp
resL = resL+gBY*Conjg(ZN(gt2,6))*Cos(TW)*dZN(gt1,6)
resL = resL-(gBY*Conjg(ZN(gt2,7))*Cos(TW)*dZN(gt1,7))
resL = resL-(g2*Conjg(ZN(gt2,3))*dZN(gt1,3)*Sin(TW))/2._dp
resL = resL+(g2*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TW))/2._dp
resL = resL+(dCosTW*g1*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL-(dSinTW*g2*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL-(dCosTW*g1*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL+(dSinTW*g2*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+dCosTW*gBY*Conjg(ZN(gt2,6))*ZN(gt1,6)
resL = resL+gBY*Conjg(dZN(gt2,6))*Cos(TW)*ZN(gt1,6)
resL = resL+dgBY*Conjg(ZN(gt2,6))*Cos(TW)*ZN(gt1,6)
resL = resL-(dCosTW*gBY*Conjg(ZN(gt2,7))*ZN(gt1,7))
resL = resL-(gBY*Conjg(dZN(gt2,7))*Cos(TW)*ZN(gt1,7))
resL = resL-(dgBY*Conjg(ZN(gt2,7))*Cos(TW)*ZN(gt1,7))
resR = 0._dp 
resR = resR-(g1*Conjg(ZN(gt1,3))*Cos(TW)*dZN(gt2,3))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,4))*Cos(TW)*dZN(gt2,4))/2._dp
resR = resR-(gBY*Conjg(ZN(gt1,6))*Cos(TW)*dZN(gt2,6))
resR = resR+gBY*Conjg(ZN(gt1,7))*Cos(TW)*dZN(gt2,7)
resR = resR+(g2*Conjg(ZN(gt1,3))*dZN(gt2,3)*Sin(TW))/2._dp
resR = resR-(g2*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TW))/2._dp
resR = resR-(dCosTW*g1*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR+(dSinTW*g2*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR+(dCosTW*g1*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR-(dSinTW*g2*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(dCosTW*gBY*Conjg(ZN(gt1,6))*ZN(gt2,6))
resR = resR-(gBY*Conjg(dZN(gt1,6))*Cos(TW)*ZN(gt2,6))
resR = resR-(dgBY*Conjg(ZN(gt1,6))*Cos(TW)*ZN(gt2,6))
resR = resR+dCosTW*gBY*Conjg(ZN(gt1,7))*ZN(gt2,7)
resR = resR+gBY*Conjg(dZN(gt1,7))*Cos(TW)*ZN(gt2,7)
resR = resR+dgBY*Conjg(ZN(gt1,7))*Cos(TW)*ZN(gt2,7)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVP  
 
 
Subroutine CT_CouplingChiChiVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,ZN,TW,TWp,dg1,               & 
& dg2,dgBL,dgYB,dgBY,dZN,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZN(7,7),dZN(7,7)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,3))*Cos(TW)*Cos(TWp)*dZN(gt1,3))/2._dp
resL = resL+(g2*Conjg(ZN(gt2,4))*Cos(TW)*Cos(TWp)*dZN(gt1,4))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,3))*Cos(TWp)*dZN(gt1,3)*Sin(TW))/2._dp
resL = resL+(g1*Conjg(ZN(gt2,4))*Cos(TWp)*dZN(gt1,4)*Sin(TW))/2._dp
resL = resL-(gBY*Conjg(ZN(gt2,6))*Cos(TWp)*dZN(gt1,6)*Sin(TW))
resL = resL+gBY*Conjg(ZN(gt2,7))*Cos(TWp)*dZN(gt1,7)*Sin(TW)
resL = resL+(gYB*Conjg(ZN(gt2,3))*dZN(gt1,3)*Sin(TWp))/2._dp
resL = resL-(gYB*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TWp))/2._dp
resL = resL+gBL*Conjg(ZN(gt2,6))*dZN(gt1,6)*Sin(TWp)
resL = resL-(gBL*Conjg(ZN(gt2,7))*dZN(gt1,7)*Sin(TWp))
resL = resL+(dSinTWp*gYB*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL-(dCosTWp*g2*Conjg(ZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL-(dSinTW*g1*Conjg(ZN(gt2,3))*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL-(dCosTW*g2*Conjg(ZN(gt2,3))*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Cos(TW)*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,3))*Cos(TW)*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL-(dCosTWp*g1*Conjg(ZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,3))*Cos(TWp)*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,3))*Cos(TWp)*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,3))*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt2,3))*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL-(dSinTWp*gYB*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL+(dCosTWp*g2*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL+(dSinTW*g1*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dCosTW*g2*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Cos(TW)*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,4))*Cos(TW)*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dCosTWp*g1*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,4))*Cos(TWp)*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,4))*Cos(TWp)*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+dSinTWp*gBL*Conjg(ZN(gt2,6))*ZN(gt1,6)
resL = resL-(dSinTW*gBY*Conjg(ZN(gt2,6))*Cos(TWp)*ZN(gt1,6))
resL = resL-(dCosTWp*gBY*Conjg(ZN(gt2,6))*Sin(TW)*ZN(gt1,6))
resL = resL-(gBY*Conjg(dZN(gt2,6))*Cos(TWp)*Sin(TW)*ZN(gt1,6))
resL = resL-(dgBY*Conjg(ZN(gt2,6))*Cos(TWp)*Sin(TW)*ZN(gt1,6))
resL = resL+gBL*Conjg(dZN(gt2,6))*Sin(TWp)*ZN(gt1,6)
resL = resL+dgBL*Conjg(ZN(gt2,6))*Sin(TWp)*ZN(gt1,6)
resL = resL-(dSinTWp*gBL*Conjg(ZN(gt2,7))*ZN(gt1,7))
resL = resL+dSinTW*gBY*Conjg(ZN(gt2,7))*Cos(TWp)*ZN(gt1,7)
resL = resL+dCosTWp*gBY*Conjg(ZN(gt2,7))*Sin(TW)*ZN(gt1,7)
resL = resL+gBY*Conjg(dZN(gt2,7))*Cos(TWp)*Sin(TW)*ZN(gt1,7)
resL = resL+dgBY*Conjg(ZN(gt2,7))*Cos(TWp)*Sin(TW)*ZN(gt1,7)
resL = resL-(gBL*Conjg(dZN(gt2,7))*Sin(TWp)*ZN(gt1,7))
resL = resL-(dgBL*Conjg(ZN(gt2,7))*Sin(TWp)*ZN(gt1,7))
resR = 0._dp 
resR = resR+(g2*Conjg(ZN(gt1,3))*Cos(TW)*Cos(TWp)*dZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(ZN(gt1,4))*Cos(TW)*Cos(TWp)*dZN(gt2,4))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,3))*Cos(TWp)*dZN(gt2,3)*Sin(TW))/2._dp
resR = resR-(g1*Conjg(ZN(gt1,4))*Cos(TWp)*dZN(gt2,4)*Sin(TW))/2._dp
resR = resR+gBY*Conjg(ZN(gt1,6))*Cos(TWp)*dZN(gt2,6)*Sin(TW)
resR = resR-(gBY*Conjg(ZN(gt1,7))*Cos(TWp)*dZN(gt2,7)*Sin(TW))
resR = resR-(gYB*Conjg(ZN(gt1,3))*dZN(gt2,3)*Sin(TWp))/2._dp
resR = resR+(gYB*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TWp))/2._dp
resR = resR-(gBL*Conjg(ZN(gt1,6))*dZN(gt2,6)*Sin(TWp))
resR = resR+gBL*Conjg(ZN(gt1,7))*dZN(gt2,7)*Sin(TWp)
resR = resR-(dSinTWp*gYB*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR+(dCosTWp*g2*Conjg(ZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR+(dSinTW*g1*Conjg(ZN(gt1,3))*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR+(dCosTW*g2*Conjg(ZN(gt1,3))*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,3))*Cos(TW)*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,3))*Cos(TW)*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR+(dCosTWp*g1*Conjg(ZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,3))*Cos(TWp)*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,3))*Cos(TWp)*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR-(gYB*Conjg(dZN(gt1,3))*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dgYB*Conjg(ZN(gt1,3))*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR+(dSinTWp*gYB*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR-(dCosTWp*g2*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR-(dSinTW*g1*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dCosTW*g2*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,4))*Cos(TW)*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,4))*Cos(TW)*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dCosTWp*g1*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,4))*Cos(TWp)*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,4))*Cos(TWp)*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR+(gYB*Conjg(dZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dgYB*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dSinTWp*gBL*Conjg(ZN(gt1,6))*ZN(gt2,6))
resR = resR+dSinTW*gBY*Conjg(ZN(gt1,6))*Cos(TWp)*ZN(gt2,6)
resR = resR+dCosTWp*gBY*Conjg(ZN(gt1,6))*Sin(TW)*ZN(gt2,6)
resR = resR+gBY*Conjg(dZN(gt1,6))*Cos(TWp)*Sin(TW)*ZN(gt2,6)
resR = resR+dgBY*Conjg(ZN(gt1,6))*Cos(TWp)*Sin(TW)*ZN(gt2,6)
resR = resR-(gBL*Conjg(dZN(gt1,6))*Sin(TWp)*ZN(gt2,6))
resR = resR-(dgBL*Conjg(ZN(gt1,6))*Sin(TWp)*ZN(gt2,6))
resR = resR+dSinTWp*gBL*Conjg(ZN(gt1,7))*ZN(gt2,7)
resR = resR-(dSinTW*gBY*Conjg(ZN(gt1,7))*Cos(TWp)*ZN(gt2,7))
resR = resR-(dCosTWp*gBY*Conjg(ZN(gt1,7))*Sin(TW)*ZN(gt2,7))
resR = resR-(gBY*Conjg(dZN(gt1,7))*Cos(TWp)*Sin(TW)*ZN(gt2,7))
resR = resR-(dgBY*Conjg(ZN(gt1,7))*Cos(TWp)*Sin(TW)*ZN(gt2,7))
resR = resR+gBL*Conjg(dZN(gt1,7))*Sin(TWp)*ZN(gt2,7)
resR = resR+dgBL*Conjg(ZN(gt1,7))*Sin(TWp)*ZN(gt2,7)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVZ  
 
 
Subroutine CT_CouplingChiChiVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,ZN,TW,TWp,dg1,              & 
& dg2,dgBL,dgYB,dgBY,dZN,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZN(7,7),dZN(7,7)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(gYB*Conjg(ZN(gt2,3))*Cos(TWp)*dZN(gt1,3))/2._dp
resL = resL-(gYB*Conjg(ZN(gt2,4))*Cos(TWp)*dZN(gt1,4))/2._dp
resL = resL+gBL*Conjg(ZN(gt2,6))*Cos(TWp)*dZN(gt1,6)
resL = resL-(gBL*Conjg(ZN(gt2,7))*Cos(TWp)*dZN(gt1,7))
resL = resL+(g2*Conjg(ZN(gt2,3))*Cos(TW)*dZN(gt1,3)*Sin(TWp))/2._dp
resL = resL-(g2*Conjg(ZN(gt2,4))*Cos(TW)*dZN(gt1,4)*Sin(TWp))/2._dp
resL = resL+(g1*Conjg(ZN(gt2,3))*dZN(gt1,3)*Sin(TW)*Sin(TWp))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TW)*Sin(TWp))/2._dp
resL = resL+gBY*Conjg(ZN(gt2,6))*dZN(gt1,6)*Sin(TW)*Sin(TWp)
resL = resL-(gBY*Conjg(ZN(gt2,7))*dZN(gt1,7)*Sin(TW)*Sin(TWp))
resL = resL+(dCosTWp*gYB*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL+(dSinTWp*g2*Conjg(ZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL+(gYB*Conjg(dZN(gt2,3))*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dgYB*Conjg(ZN(gt2,3))*Cos(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dSinTWp*g1*Conjg(ZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL+(dSinTW*g1*Conjg(ZN(gt2,3))*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dCosTW*g2*Conjg(ZN(gt2,3))*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,3))*Cos(TW)*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,3))*Cos(TW)*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,3))*Sin(TW)*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,3))*Sin(TW)*Sin(TWp)*ZN(gt1,3))/2._dp
resL = resL-(dCosTWp*gYB*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL-(dSinTWp*g2*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL-(gYB*Conjg(dZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dgYB*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dSinTWp*g1*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL-(dSinTW*g1*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dCosTW*g2*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,4))*Cos(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,4))*Cos(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,4))*Sin(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,4))*Sin(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+dCosTWp*gBL*Conjg(ZN(gt2,6))*ZN(gt1,6)
resL = resL+gBL*Conjg(dZN(gt2,6))*Cos(TWp)*ZN(gt1,6)
resL = resL+dgBL*Conjg(ZN(gt2,6))*Cos(TWp)*ZN(gt1,6)
resL = resL+dSinTWp*gBY*Conjg(ZN(gt2,6))*Sin(TW)*ZN(gt1,6)
resL = resL+dSinTW*gBY*Conjg(ZN(gt2,6))*Sin(TWp)*ZN(gt1,6)
resL = resL+gBY*Conjg(dZN(gt2,6))*Sin(TW)*Sin(TWp)*ZN(gt1,6)
resL = resL+dgBY*Conjg(ZN(gt2,6))*Sin(TW)*Sin(TWp)*ZN(gt1,6)
resL = resL-(dCosTWp*gBL*Conjg(ZN(gt2,7))*ZN(gt1,7))
resL = resL-(gBL*Conjg(dZN(gt2,7))*Cos(TWp)*ZN(gt1,7))
resL = resL-(dgBL*Conjg(ZN(gt2,7))*Cos(TWp)*ZN(gt1,7))
resL = resL-(dSinTWp*gBY*Conjg(ZN(gt2,7))*Sin(TW)*ZN(gt1,7))
resL = resL-(dSinTW*gBY*Conjg(ZN(gt2,7))*Sin(TWp)*ZN(gt1,7))
resL = resL-(gBY*Conjg(dZN(gt2,7))*Sin(TW)*Sin(TWp)*ZN(gt1,7))
resL = resL-(dgBY*Conjg(ZN(gt2,7))*Sin(TW)*Sin(TWp)*ZN(gt1,7))
resR = 0._dp 
resR = resR-(gYB*Conjg(ZN(gt1,3))*Cos(TWp)*dZN(gt2,3))/2._dp
resR = resR+(gYB*Conjg(ZN(gt1,4))*Cos(TWp)*dZN(gt2,4))/2._dp
resR = resR-(gBL*Conjg(ZN(gt1,6))*Cos(TWp)*dZN(gt2,6))
resR = resR+gBL*Conjg(ZN(gt1,7))*Cos(TWp)*dZN(gt2,7)
resR = resR-(g2*Conjg(ZN(gt1,3))*Cos(TW)*dZN(gt2,3)*Sin(TWp))/2._dp
resR = resR+(g2*Conjg(ZN(gt1,4))*Cos(TW)*dZN(gt2,4)*Sin(TWp))/2._dp
resR = resR-(g1*Conjg(ZN(gt1,3))*dZN(gt2,3)*Sin(TW)*Sin(TWp))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TW)*Sin(TWp))/2._dp
resR = resR-(gBY*Conjg(ZN(gt1,6))*dZN(gt2,6)*Sin(TW)*Sin(TWp))
resR = resR+gBY*Conjg(ZN(gt1,7))*dZN(gt2,7)*Sin(TW)*Sin(TWp)
resR = resR-(dCosTWp*gYB*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR-(dSinTWp*g2*Conjg(ZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR-(gYB*Conjg(dZN(gt1,3))*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dgYB*Conjg(ZN(gt1,3))*Cos(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dSinTWp*g1*Conjg(ZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR-(dSinTW*g1*Conjg(ZN(gt1,3))*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dCosTW*g2*Conjg(ZN(gt1,3))*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,3))*Cos(TW)*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,3))*Cos(TW)*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,3))*Sin(TW)*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,3))*Sin(TW)*Sin(TWp)*ZN(gt2,3))/2._dp
resR = resR+(dCosTWp*gYB*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR+(dSinTWp*g2*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR+(gYB*Conjg(dZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dgYB*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dSinTWp*g1*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR+(dSinTW*g1*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dCosTW*g2*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,4))*Cos(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,4))*Cos(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,4))*Sin(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,4))*Sin(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dCosTWp*gBL*Conjg(ZN(gt1,6))*ZN(gt2,6))
resR = resR-(gBL*Conjg(dZN(gt1,6))*Cos(TWp)*ZN(gt2,6))
resR = resR-(dgBL*Conjg(ZN(gt1,6))*Cos(TWp)*ZN(gt2,6))
resR = resR-(dSinTWp*gBY*Conjg(ZN(gt1,6))*Sin(TW)*ZN(gt2,6))
resR = resR-(dSinTW*gBY*Conjg(ZN(gt1,6))*Sin(TWp)*ZN(gt2,6))
resR = resR-(gBY*Conjg(dZN(gt1,6))*Sin(TW)*Sin(TWp)*ZN(gt2,6))
resR = resR-(dgBY*Conjg(ZN(gt1,6))*Sin(TW)*Sin(TWp)*ZN(gt2,6))
resR = resR+dCosTWp*gBL*Conjg(ZN(gt1,7))*ZN(gt2,7)
resR = resR+gBL*Conjg(dZN(gt1,7))*Cos(TWp)*ZN(gt2,7)
resR = resR+dgBL*Conjg(ZN(gt1,7))*Cos(TWp)*ZN(gt2,7)
resR = resR+dSinTWp*gBY*Conjg(ZN(gt1,7))*Sin(TW)*ZN(gt2,7)
resR = resR+dSinTW*gBY*Conjg(ZN(gt1,7))*Sin(TWp)*ZN(gt2,7)
resR = resR+gBY*Conjg(dZN(gt1,7))*Sin(TW)*Sin(TWp)*ZN(gt2,7)
resR = resR+dgBY*Conjg(ZN(gt1,7))*Sin(TW)*Sin(TWp)*ZN(gt2,7)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVZp  
 
 
Subroutine CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(7,7),UM(2,2),UP(2,2),dZN(7,7),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.7)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,2))*dUM(gt1,1))
resL = resL-((g2*Conjg(ZN(gt2,3))*dUM(gt1,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dZN(gt2,2))*UM(gt1,1))
resL = resL-(dg2*Conjg(ZN(gt2,2))*UM(gt1,1))
resL = resL-((g2*Conjg(dZN(gt2,3))*UM(gt1,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(ZN(gt2,3))*UM(gt1,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(UP(gt1,1))*dZN(gt2,2))
resR = resR+(g2*Conjg(UP(gt1,2))*dZN(gt2,4))/sqrt(2._dp)
resR = resR-(g2*Conjg(dUP(gt1,1))*ZN(gt2,2))
resR = resR-(dg2*Conjg(UP(gt1,1))*ZN(gt2,2))
resR = resR+(g2*Conjg(dUP(gt1,2))*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(dg2*Conjg(UP(gt1,2))*ZN(gt2,4))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiVWm  
 
 
Subroutine CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVG  
 
 
Subroutine CT_CouplingcFdFdVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,               & 
& dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*gBY)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBY*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTW*gBY)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBY*Cos(TW))/6._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVP  
 
 
Subroutine CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,               & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gYB)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBY*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBL*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgYB*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTWp*gYB)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBY*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBL*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgYB*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZ  
 
 
Subroutine CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,              & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gYB)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBL*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgYB*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBY*Sin(TW)*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTWp*gYB)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBL*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgYB*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*g1*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBY*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZp  
 
 
Subroutine CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*dZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcVWm  
 
 
Subroutine CT_CouplingFvFecVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(6,6),ZEL(3,3),dUV(6,6),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*dUV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFecVWm  
 
 
Subroutine CT_CouplingcFeFeVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,               & 
& dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*gBY)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBY*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTW*g1
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*gBY)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Cos(TW)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBY*Cos(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVP  
 
 
Subroutine CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,               & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*gYB)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*gBL)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*gBY*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gBY*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBY*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBL*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgYB*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*gYB
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTWp*gBL)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*gBY*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*g1*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*gBY*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBY*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBL*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgYB*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZ  
 
 
Subroutine CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,              & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*gYB)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*gBL)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBL*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgYB*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*gBY*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*gBY*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBY*Sin(TW)*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTWp*gYB
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTWp*gBL)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBL*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgYB*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*g1*Sin(TW)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTWp*gBY*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTW*g1*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*gBY*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Sin(TW)*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBY*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZp  
 
 
Subroutine CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVG  
 
 
Subroutine CT_CouplingcFuFuVP(gt1,gt2,g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,               & 
& dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*gBY)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBY*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTW*gBY)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBY*Cos(TW))/6._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVP  
 
 
Subroutine CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*dZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuVWm  
 
 
Subroutine CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,               & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gYB)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dgBY*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBL*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgYB*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dSinTWp*gYB)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dSinTW*g1*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dCosTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dg1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dgBY*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBL*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dgYB*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZ  
 
 
Subroutine CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,              & 
& dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gYB)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBL*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgYB*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgBY*Sin(TW)*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dCosTWp*gYB)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*gBL)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBL*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dgYB*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dSinTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTWp*gBY*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dSinTW*g1*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dgBY*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZp  
 
 
Subroutine CT_CouplingFvFvVP(gt1,gt2,g1,g2,gBY,UV,TW,dg1,dg2,dgBY,dUV,dSinTW,         & 
& dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBY,TW,dg1,dg2,dgBY,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UV(6,6),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(UV(gt2,3 + j1))*Cos(TW)*dUV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g1*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*g2*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*gBY*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTW*gBY*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dUV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(UV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(UV(gt1,3 + j1))*Cos(TW)*dUV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTW*g1*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g2*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTW*gBY*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dUV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dUV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dUV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*gBY*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(dUV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*Conjg(UV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVP  
 
 
Subroutine CT_CouplingFvFvVZ(gt1,gt2,g1,g2,gBL,gYB,gBY,UV,TW,TWp,dg1,dg2,             & 
& dgBL,dgYB,dgBY,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UV(6,6),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,3 + j1))*Cos(TWp)*dUV(gt1,3 + j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*dUV(gt1,3 + j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*gYB*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*gBL*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*g2*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*g1*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTW*g2*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*gBY*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*g1*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*gBY*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dUV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dUV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dUV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dUV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgYB*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTWp*gBL*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*gBY*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*gBY*Conjg(UV(gt2,3 + j1))*Sin(TW)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dUV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBL*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,3 + j1))*Cos(TWp)*dUV(gt2,3 + j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(UV(gt1,3 + j1))*dUV(gt2,3 + j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gYB*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gBL*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g2*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g1*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*g2*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*gBY*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dUV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g1*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*gBY*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dUV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(dUV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(dUV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dUV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgYB*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*gBL*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gBY*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gBY*Conjg(UV(gt1,3 + j1))*Sin(TW)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dUV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(dUV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBL*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZ  
 
 
Subroutine CT_CouplingFvFvVZp(gt1,gt2,g1,g2,gBL,gYB,gBY,UV,TW,TWp,dg1,dg2,            & 
& dgBL,dgYB,dgBY,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gYB,gBY,TW,TWp,dg1,dg2,dgBL,dgYB,dgBY,dSinTW,dCosTW,dTanTW,dSinTWp,         & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UV(6,6),dUV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(gYB*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*Cos(TWp)*dUV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(UV(gt2,3 + j1))*dUV(gt1,3 + j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*gYB*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*gBL*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g2*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gYB*Conjg(dUV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBL*Conjg(dUV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBL*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgYB*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*gBY*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g2*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*gBY*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dUV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(dUV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dgBY*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*gBL*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(dUV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBL*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTWp*gBY*Conjg(UV(gt2,3 + j1))*Sin(TW)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*gBY*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gBY*Conjg(dUV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dgBY*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(UV(gt1,3 + j1))*Cos(TWp)*dUV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(UV(gt1,3 + j1))*dUV(gt2,3 + j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gYB*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gBL*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*g2*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(dUV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(dUV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBL*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgYB*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*g1*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gBY*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*g1*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTW*g2*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gBY*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dUV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dUV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(dUV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dgBY*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*gBL*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBL*Conjg(dUV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBL*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*gBY*Conjg(UV(gt1,3 + j1))*Sin(TW)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*gBY*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(gBY*Conjg(dUV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dgBY*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZp  
 
 
Subroutine CT_CouplingcFeFvVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(6,6),ZEL(3,3),dUV(6,6),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*dZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvVWm  
 
 
Subroutine CT_CouplingGluGluVG(g3,pG,dg3,dpG,resL,resR)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,dpG

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluGluVG' 
 
resL = 0._dp 
resL = resL-(g3*pG*Conjg(dpG))
resL = resL-(dpG*g3*Conjg(pG))
resL = resL-(dg3*pG*Conjg(pG))
resR = 0._dp 
resR = resR-(g3*pG*Conjg(dpG))
resR = resR-(dpG*g3*Conjg(pG))
resR = resR-(dg3*pG*Conjg(pG))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluGluVG  
 
 
End Module CouplingsCT_BLSSM 
