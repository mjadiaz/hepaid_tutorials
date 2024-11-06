! ------------------------------------------------------------------------------ 
! This file was automatically created by SARAH version 4.14.5 
! Two Loop diagrammatic calculation of Higgs masses (c) Mark Goodsell 2015-20 
! References: arXiv: 1503.03098, 1604.05335, 1706.05372  
! ------------------------------------------------------------------------------  

Module Pole2L_BLSSM 
 
Use Control 
Use Settings 
Use Couplings_BLSSM 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_BLSSM 
Use StandardModel 
Use TreeLevelMasses_BLSSM 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,             & 
& Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,              & 
& mC22,MBBp,M1,M2,M3,MBp,kont,tad2L,Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Real(dp) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),           & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),         & 
& cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplSdcSdVG(6,6),cplSucSuVG(6,6),             & 
& cplVGVGVG,cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4), & 
& cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),             & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),   & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),       & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),       & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),         & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),           & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),           & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),         & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,      & 
& cplGluGluVGR

Complex(dp) :: cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),cplAhAhSvImSvIm(4,4,6,6),& 
& cplAhAhSvImSvRe(4,4,6,6),cplAhAhSvReSvRe(4,4,6,6),cplAhhhSvImSvIm(4,4,6,6),            & 
& cplAhhhSvImSvRe(4,4,6,6),cplAhhhSvReSvRe(4,4,6,6),cplAhHpmSucSd(4,2,6,6),              & 
& cplAhHpmSvImcSe(4,2,6,6),cplAhHpmSvRecSe(4,2,6,6),cplAhSdcHpmcSu(4,6,2,6),             & 
& cplAhSeSvImcHpm(4,6,6,2),cplAhSeSvRecHpm(4,6,6,2),cplhhhhSdcSd(4,4,6,6),               & 
& cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvImSvRe(4,4,6,6),& 
& cplhhhhSvReSvRe(4,4,6,6),cplhhHpmSucSd(4,2,6,6),cplhhHpmSvImcSe(4,2,6,6),              & 
& cplhhHpmSvRecSe(4,2,6,6),cplhhSdcHpmcSu(4,6,2,6),cplhhSeSvImcHpm(4,6,6,2),             & 
& cplhhSeSvRecHpm(4,6,6,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),            & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),cplHpmSvImSvRecHpm(2,6,6,2),      & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSdSvImcSecSu(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),              & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),& 
& cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),cplSuSvReSvRecSu(6,6,6,6),         & 
& cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),& 
& cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6)

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(4)
Real(dp)  :: tempcont(4,4)
Real(dp)  :: tempcontah(4,4)
Real(dp)  :: runningval(4,4)
Real(dp), Intent(out) :: tad2l(4)
Real(dp), Intent(out) :: Pi2S(4,4)
Real(dp), Intent(out) :: Pi2P(4,4)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(4)
Real(dp)  :: tempcouplingmatrix(4,4)
Real(dp)  :: tempcouplingmatrixah(4,4)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(4)
real(dp)  :: delta2Lmasses(4,4)
real(dp)  :: delta2Lmassesah(4,4)
Real(dp)  :: tad1LG(4)
complex(dp) :: tad1LmatrixSd(6,6)
complex(dp) :: tad1LmatrixSu(6,6)
complex(dp) :: tad1LmatrixSe(6,6)
complex(dp) :: tad1LmatrixSvIm(6,6)
complex(dp) :: tad1LmatrixSvRe(6,6)
complex(dp) :: tad1Lmatrixhh(4,4)
complex(dp) :: tad1LmatrixAh(4,4)
complex(dp) :: tad1LmatrixHpm(2,2)
complex(dp) :: tad1LmatrixChi(7,7)
complex(dp) :: tad1LmatrixCha(2,2)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Where (Abs(MSd2/Qscale).lt.TwoLoopRegulatorMass )MSd2=Qscale*TwoLoopRegulatorMass
Where (Abs(MSu2/Qscale).lt.TwoLoopRegulatorMass )MSu2=Qscale*TwoLoopRegulatorMass
Where (Abs(MSe2/Qscale).lt.TwoLoopRegulatorMass )MSe2=Qscale*TwoLoopRegulatorMass
Where (Abs(MSvIm2/Qscale).lt.TwoLoopRegulatorMass )MSvIm2=Qscale*TwoLoopRegulatorMass
Where (Abs(MSvRe2/Qscale).lt.TwoLoopRegulatorMass )MSvRe2=Qscale*TwoLoopRegulatorMass
Where (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass )Mhh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass )MAh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MHpm2/Qscale).lt.TwoLoopRegulatorMass )MHpm2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(Mu,Yd,Td,ZD,ZA,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,               & 
& Tv,vu,x1,ZVI,ZVR,vd,ZH,ZP,g3,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,UV,UM,UP,ZN,pG,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,       & 
& cplSucSuVG,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,              & 
& cplFvChacSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,   & 
& cplcFeChaSvReR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,       & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,        & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,    & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,          & 
& cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsFor2LPole4(Yd,ZD,ZA,Ye,ZE,Yu,ZU,Yx,Yv,ZVI,ZVR,ZH,ZP,g3,cplAhAhSdcSd,    & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,             & 
& cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,         & 
& cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhSdcSd,           & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,    & 
& cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,       & 
& cplSdSvImcSecSu,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,           & 
& cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,     & 
& cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,             & 
& cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe)

! ----------------------------------
! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------
! ----------------------------------
delta2Ltadpoles(:)=0._dp
delta2Lmasses(:,:)=0._dp
delta2LmassesAh(:,:)=0._dp
tad1LG(:)=0._dp
if(include1l2lshift) then
temptad(:) = 0._dp 
  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 4
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 1._dp*(-J0(MFe2(i1),qscale)) 
  Do gE1 = 1, 4
coup1L = cplcFeFehhL(i1,i1,gE1)
coup1R = cplcFeFehhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFe(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 4
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 1._dp/2._dp*(-J0(MFv2(i1),qscale)) 
  Do gE1 = 1, 4
coup1L = cplFvFvhhL(i1,i1,gE1)
coup1R = cplFvFvhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFv(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MSd2(i1),qscale)) 
  Do gE1 = 1, 4
coup1 = cplhhSdcSd(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 1._dp*(-J0(MSe2(i1),qscale)) 
  Do gE1 = 1, 4
coup1 = cplhhSecSe(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MSu2(i1),qscale)) 
  Do gE1 = 1, 4
coup1 = cplhhSucSu(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 1._dp/2._dp*(-J0(MSvIm2(i1),qscale)) 
  Do gE1 = 1, 4
coup1 = cplhhSvImSvIm(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 1._dp/2._dp*(-J0(MSvRe2(i1),qscale)) 
  Do gE1 = 1, 4
coup1 = cplhhSvReSvRe(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

tad1LG=matmul(temptad*oo16Pi2,ZH)
! ----------------------------
! ----------------------------------
! ------- 1L2L SHIFTS --------
! ----------------------------------
end if ! include1l2lshift
! ----------------------------------
! ------- TADPOLE DIAGRAMS --------
! ----------------------------------
temptad(:)=0._dp
tempcouplingvector(:)=0._dp
! ---- Topology ToSSS
! ---- Ah,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplAhhhSvImSvIm(i1,gE1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSSS(MAh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Ah,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplAhhhSvImSvRe(i1,gE1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(MAh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Ah,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplAhhhSvReSvRe(i1,gE1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSSS(MAh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSdcSd(gE1,i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSSS(Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Se,conj[Se] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSecSe(gE1,i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(Mhh2(i1),MSe2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Su,conj[Su] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSucSu(gE1,i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSSS(Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSvImSvIm(gE1,i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSSS(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSvImSvRe(gE1,i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhhhSvReSvRe(gE1,i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSSS(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplSdcHpmcSu(i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*TfSSS(MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvIm,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhHpmSvImcSe(gE1,i1,i2,i3)
coup2 = cplSeSvImcHpm(i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*TfSSS(MHpm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvRe,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhHpmSvRecSe(gE1,i1,i2,i3)
coup2 = cplSeSvRecHpm(i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*TfSSS(MHpm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Topology ToSS
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplSdSecSdcSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSd2(i1),MSd2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplAhAhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSe2(i1),MSe2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhhhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSe2(i1),MSe2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplHpmSecHpmcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSe2(i1),MSe2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplSdSecSdcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSe2(i1),MSe2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplSeSecSecSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSe2(i1),MSe2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplSeSvImSvImcSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSe2(i1),MSe2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplSeSvReSvRecSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSe2(i1),MSe2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSuSvImSvImcSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSuSvReSvRecSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplAhAhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhhhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvIm2(i1),MSvIm2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplHpmSvImSvImcHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplSeSvImSvImcSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplSuSvImSvImcSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplSvImSvImSvImSvIm(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplAhAhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhhhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplHpmSvImSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplSeSvImSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplSuSvImSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplSvImSvImSvImSvRe(i1,i3,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplSvImSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplAhAhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhhhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvRe2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplHpmSvReSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplSeSvReSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplSuSvReSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplSvReSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Topology ToSSSS
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Ah,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(i3,i4,i1)
coup3 = cplAhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSe2(i1),MSe2(i2),MAh2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],hh,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(i3,i4,i1)
coup3 = cplhhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSe2(i1),MSe2(i2),Mhh2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplHpmSvImcSe(i3,i4,i1)
coup3 = cplSeSvImcHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSe2(i1),MSe2(i2),MHpm2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplHpmSvRecSe(i3,i4,i1)
coup3 = cplSeSvRecHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSe2(i1),MSe2(i2),MHpm2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvIm2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*TfSSSS(MSvIm2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i4,i1)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i4,i1)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplHpmSvRecSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MSvRe2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ToSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSV(MSd2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSV(MSu2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Topology ToSSFF
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFu(i4)*TfSSFbFb(MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFd(i4)*TfSSFbFb(MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSSFF(MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i3)*TfSSFbFb(MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Se,conj[Se],Cha,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFv(i4)*TfSSFbFb(MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Se,conj[Se],Chi,Fe ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i3)*MFe(i4)*TfSSFbFb(MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFu(i4)*TfSSFbFb(MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MCha(i4)*TfSSFbFb(MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSSFF(MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i3)*TfSSFbFb(MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFe(i4)*TfSSFbFb(MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSFF(MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MChi(i3)*MFv(i4)*TfSSFbFb(MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*TfSSFF(MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MFe(i4)*TfSSFbFb(MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i3)*MFv(i4)*TfSSFbFb(MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFe(i4)*TfSSFbFb(MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSFF(MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MChi(i3)*MFv(i4)*TfSSFbFb(MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology ToFFFS
! ---- Fd,bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Cha,Su ----
Do i1=1,3
Do i2=1,3
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Chi,Sd ----
Do i1=1,3
Do i2=1,3
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MChi(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Glu,Sd ----
Do i1=1,3
Do i2=1,3
Do i4=1,6
if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MGlu*TfFFFbS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fe,bar[Fe],Fe,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Cha,SvIm ----
Do i1=1,3
Do i2=1,3
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvImL(i1,i3,i4)
coup2R = cplcFeChaSvImR(i1,i3,i4)
coup3L = cplcChaFeSvImL(i3,i2,i4)
coup3R = cplcChaFeSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MCha2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvImL(i1,i3,i4)
coup2R = cplcFeChaSvImR(i1,i3,i4)
coup3L = cplcChaFeSvImL(i3,i2,i4)
coup3R = cplcChaFeSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MCha2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvImL(i1,i3,i4)
coup2R = cplcFeChaSvImR(i1,i3,i4)
coup3L = cplcChaFeSvImL(i3,i2,i4)
coup3R = cplcChaFeSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFe(i1)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MCha2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Cha,SvRe ----
Do i1=1,3
Do i2=1,3
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvReL(i1,i3,i4)
coup2R = cplcFeChaSvReR(i1,i3,i4)
coup3L = cplcChaFeSvReL(i3,i2,i4)
coup3R = cplcChaFeSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MCha2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvReL(i1,i3,i4)
coup2R = cplcFeChaSvReR(i1,i3,i4)
coup3L = cplcChaFeSvReL(i3,i2,i4)
coup3R = cplcChaFeSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MCha2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChaSvReL(i1,i3,i4)
coup2R = cplcFeChaSvReR(i1,i3,i4)
coup3L = cplcChaFeSvReL(i3,i2,i4)
coup3R = cplcChaFeSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFe(i1)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MCha2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Chi,Se ----
Do i1=1,3
Do i2=1,3
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChiSeL(i1,i3,i4)
coup2R = cplcFeChiSeR(i1,i3,i4)
coup3L = cplChiFecSeL(i3,i2,i4)
coup3R = cplChiFecSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MChi(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MChi2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChiSeL(i1,i3,i4)
coup2R = cplcFeChiSeR(i1,i3,i4)
coup3L = cplChiFecSeL(i3,i2,i4)
coup3R = cplChiFecSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MChi2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeChiSeL(i1,i3,i4)
coup2R = cplcFeChiSeR(i1,i3,i4)
coup3L = cplChiFecSeL(i3,i2,i4)
coup3R = cplChiFecSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i3)*MFe(i1)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MChi2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Fv,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,6
Do i4=1,2
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvHpmL(i1,i3,i4)
coup2R = cplcFeFvHpmR(i1,i3,i4)
coup3L = cplFvFecHpmL(i3,i2,i4)
coup3R = cplFvFecHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFv(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFv2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvHpmL(i1,i3,i4)
coup2R = cplcFeFvHpmR(i1,i3,i4)
coup3L = cplFvFecHpmL(i3,i2,i4)
coup3R = cplFvFecHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFv2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvHpmL(i1,i3,i4)
coup2R = cplcFeFvHpmR(i1,i3,i4)
coup3L = cplFvFecHpmL(i3,i2,i4)
coup3R = cplFvFecHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFv2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Chi,Su ----
Do i1=1,3
Do i2=1,3
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MChi(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,4
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Glu,Su ----
Do i1=1,3
Do i2=1,3
Do i4=1,6
if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MGlu*TfFFFbS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fu,bar[Fu],bar[Cha],Sd ----
Do i1=1,3
Do i2=1,3
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MCha(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Fv,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Cha,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvChacSeL(i1,i3,i4)
coup2R = cplFvChacSeR(i1,i3,i4)
coup3L = cplcChaFvSeL(i3,i2,i4)
coup3R = cplcChaFvSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MCha2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvChacSeL(i1,i3,i4)
coup2R = cplFvChacSeR(i1,i3,i4)
coup3L = cplcChaFvSeL(i3,i2,i4)
coup3R = cplcChaFvSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MCha2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvChacSeL(i1,i3,i4)
coup2R = cplFvChacSeR(i1,i3,i4)
coup3L = cplcChaFvSeL(i3,i2,i4)
coup3R = cplcChaFvSeR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MFv(i1)*MFv(i2)*TfFbFbFbS(MFv2(i1),MFv2(i2),MCha2(i3),MSe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Chi,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvImL(i3,i1,i4)
coup2R = cplChiFvSvImR(i3,i1,i4)
coup3L = cplChiFvSvImL(i3,i2,i4)
coup3R = cplChiFvSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MChi2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvImL(i3,i1,i4)
coup2R = cplChiFvSvImR(i3,i1,i4)
coup3L = cplChiFvSvImL(i3,i2,i4)
coup3R = cplChiFvSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MChi2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvImL(i3,i1,i4)
coup2R = cplChiFvSvImR(i3,i1,i4)
coup3L = cplChiFvSvImL(i3,i2,i4)
coup3R = cplChiFvSvImR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MChi(i3)*MFv(i1)*MFv(i2)*TfFbFbFbS(MFv2(i1),MFv2(i2),MChi2(i3),MSvIm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Chi,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvReL(i3,i1,i4)
coup2R = cplChiFvSvReR(i3,i1,i4)
coup3L = cplChiFvSvReL(i3,i2,i4)
coup3R = cplChiFvSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MChi2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvReL(i3,i1,i4)
coup2R = cplChiFvSvReR(i3,i1,i4)
coup3L = cplChiFvSvReL(i3,i2,i4)
coup3R = cplChiFvSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MChi2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplChiFvSvReL(i3,i1,i4)
coup2R = cplChiFvSvReR(i3,i1,i4)
coup3L = cplChiFvSvReL(i3,i2,i4)
coup3R = cplChiFvSvReR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MChi(i3)*MFv(i1)*MFv(i2)*TfFbFbFbS(MFv2(i1),MFv2(i2),MChi2(i3),MSvRe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Fe,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,2
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFecHpmL(i1,i3,i4)
coup2R = cplFvFecHpmR(i1,i3,i4)
coup3L = cplcFeFvHpmL(i3,i2,i4)
coup3R = cplcFeFvHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFe2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFecHpmL(i1,i3,i4)
coup2R = cplFvFecHpmR(i1,i3,i4)
coup3L = cplcFeFvHpmL(i3,i2,i4)
coup3R = cplcFeFvHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFe2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFecHpmL(i1,i3,i4)
coup2R = cplFvFecHpmR(i1,i3,i4)
coup3L = cplcFeFvHpmL(i3,i2,i4)
coup3R = cplcFeFvHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFv(i1)*MFv(i2)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFe2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Fv,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology ToFV
! ---- Fd ----
Do i1=1,3
if((MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFd(i1)*TfFV(MFd2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ---- Fu ----
Do i1=1,3
if((MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFu(i1)*TfFV(MFu2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ----------------------------
! ---- Final tadpole result --
temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles
tad2L=matmul(temptad,ZH)
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Ah,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplAhSecSe(i3,i4,i1)
coup3 = cplAhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MAh2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],hh,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplhhSecSe(i3,i4,i1)
coup3 = cplhhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),Mhh2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i4,i1)
coup3 = cplSeSvImcHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSvRecSe(i3,i4,i1)
coup3 = cplSeSvRecHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i4,i1)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvReSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i4,i1)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvReSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvRecSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology XoSSS
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSecSdcSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplAhAhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplhhhhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSecHpmcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplSdSecSdcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSecSecSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvImcSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSvReSvRecSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvImcSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSvReSvRecSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhAhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhhhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplHpmSvImSvImcHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvImcSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvImcSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvImSvIm(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhAhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhhhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvImSvRe(i1,i3,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhAhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhhhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvReSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSeSvReSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSuSvReSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSvReSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Topology YoSSSS
! ---- Sd,conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplAhAhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplhhhhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdSdcSdcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdSecSdcSe(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplAhAhSecSe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplhhhhSecSe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplHpmSecHpmcSe(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSdSecSdcSe(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSeSecSecSe(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSeSvImSvImcSe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSeSvReSvRecSe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplAhAhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplhhhhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSuSucSucSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSuSvImSvImcSu(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSuSvReSvRecSu(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplAhAhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplhhhhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplHpmSvImSvImcHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplSeSvImSvImcSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplSuSvImSvImcSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvIm(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhAhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhhhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvImSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSeSvImSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSuSvImSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvRe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhAhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhhhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvReSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSeSvReSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSuSvReSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplSvReSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplAhAhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplhhhhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplHpmSvImSvImcHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplSeSvImSvImcSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplSuSvImSvImcSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplSvImSvImSvImSvIm(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplSvImSvImSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhAhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhhhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvImSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSeSvImSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSuSvImSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvRe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhAhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhhhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvReSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSeSvReSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSuSvReSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplSvReSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ZoSSSS
! ---- Sd,conj[Sd],Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i4)
coup3 = cplSdSdcSdcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Se,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i4)
coup3 = cplSdSecSdcSe(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i4)
coup3 = cplSdSucSdcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i4)
coup3 = cplSeSecSecSe(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i3,i4)
coup3 = cplSeSvImSvImcSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i3,i4)
coup3 = cplSeSvImSvRecSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i3,i4)
coup3 = cplSeSvReSvRecSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i4)
coup3 = cplSuSucSucSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i3,i4)
coup3 = cplSuSvImSvImcSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i3,i4)
coup3 = cplSuSvImSvRecSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i3,i4)
coup3 = cplSuSvReSvRecSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i3,i4)
coup3 = cplSvImSvImSvImSvIm(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvImSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvReSvRe(i1,i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i3,i4)
coup3 = cplSvImSvReSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i3,i4)
coup3 = cplSvReSvReSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology SoSSS
! ---- Ah,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvImSvIm(i1,gE1,i2,i3)
coup2 = cplAhhhSvImSvIm(i1,gE2,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Ah,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvImSvRe(i1,gE1,i2,i3)
coup2 = cplAhhhSvImSvRe(i1,gE2,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Ah,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvReSvRe(i1,gE1,i2,i3)
coup2 = cplAhhhSvReSvRe(i1,gE2,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,i1,i2,i3)
coup2 = cplhhhhSdcSd(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Se,conj[Se] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,i1,i2,i3)
coup2 = cplhhhhSecSe(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MSe2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Su,conj[Su] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,i1,i2,i3)
coup2 = cplhhhhSucSu(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,i1,i2,i3)
coup2 = cplhhhhSvImSvIm(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,Mhh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,i1,i2,i3)
coup2 = cplhhhhSvImSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,i1,i2,i3)
coup2 = cplhhhhSvReSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,Mhh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplhhSdcHpmcSu(gE2,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*SfSSS(p2,MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvIm,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhHpmSvImcSe(gE1,i1,i2,i3)
coup2 = cplhhSeSvImcHpm(gE2,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*SfSSS(p2,MHpm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvRe,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhHpmSvRecSe(gE1,i1,i2,i3)
coup2 = cplhhSeSvRecHpm(gE2,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*SfSSS(p2,MHpm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Topology UoSSSS
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhhhSdcSd(gE2,i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhHpmSucSd(gE2,i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],hh,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhhhSecSe(gE2,i3,i4,i1)
coup3 = cplhhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),Mhh2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhHpmSvImcSe(gE2,i3,i4,i1)
coup3 = cplSeSvImcHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhHpmSvRecSe(gE2,i3,i4,i1)
coup3 = cplSeSvRecHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhhhSucSu(gE2,i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSdcHpmcSu(gE2,i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplAhhhSvImSvIm(i3,gE2,i1,i4)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(i3,gE2,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhhhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhhhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhHpmSvImcSe(gE2,i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvIm(i3,gE2,i1,i4)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(i3,gE2,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhhhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhhhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhHpmSvImcSe(gE2,i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplAhhhSvImSvRe(i3,gE2,i4,i1)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplAhhhSvReSvRe(i3,gE2,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhhhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhhhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhHpmSvRecSe(gE2,i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(i3,gE2,i4,i1)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplAhhhSvReSvRe(i3,gE2,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhhhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhhhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhHpmSvRecSe(gE2,i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoSSSSS
! ---- Sd,conj[Sd],Sd,Ah,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplAhSdcSd(i4,i2,i5)
coup4 = cplAhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplhhSdcSd(i4,i2,i5)
coup4 = cplhhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdcHpmcSu(i2,i4,i5)
coup4 = cplHpmSucSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Ah,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplAhSecSe(i4,i2,i5)
coup4 = cplAhSecSe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MAh2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,hh,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplhhSecSe(i4,i2,i5)
coup4 = cplhhSecSe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Mhh2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvIm,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSeSvImcHpm(i2,i4,i5)
coup4 = cplHpmSvImcSe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvIm2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvRe,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3 = cplSeSvRecHpm(i2,i4,i5)
coup4 = cplHpmSvRecSe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplAhSucSu(i4,i2,i5)
coup4 = cplAhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplhhSucSu(i4,i2,i5)
coup4 = cplhhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplHpmSucSd(i4,i2,i5)
coup4 = cplSdcHpmcSu(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvImcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i5,i2)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvReSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i5,i2)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvReSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvRecSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvImcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i5,i2)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvReSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i5,i2)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvReSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvRecSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSSSSS
! ---- Sd,conj[Sd],conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSdcSd(gE2,i4,i2)
coup3 = cplAhSdcSd(i5,i2,i1)
coup4 = cplAhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSdcSd(gE2,i4,i2)
coup3 = cplhhSdcSd(i5,i2,i1)
coup4 = cplhhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Su],conj[Sd],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplHpmSucSd(i5,i2,i1)
coup4 = cplSdcHpmcSu(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MSd2(i1),MSu2(i2),MSd2(i3),MSu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvIm,conj[Se],SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2 = cplhhSvImSvIm(gE2,i2,i4)
coup3 = cplHpmSvImcSe(i5,i2,i1)
coup4 = cplSeSvImcHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSe2(i1),MSvIm2(i2),MSe2(i3),MSvIm2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvIm,conj[Se],SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i2,i4)
coup3 = cplHpmSvImcSe(i5,i2,i1)
coup4 = cplSeSvRecHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSS(p2,MSe2(i1),MSvIm2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvRe,conj[Se],SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplHpmSvRecSe(i5,i2,i1)
coup4 = cplSeSvRecHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSe2(i1),MSvRe2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],conj[Se],Se,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2 = cplhhSecSe(gE2,i4,i2)
coup3 = cplAhSecSe(i5,i2,i1)
coup4 = cplAhSecSe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],conj[Se],Se,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2 = cplhhSecSe(gE2,i4,i2)
coup3 = cplhhSecSe(i5,i2,i1)
coup4 = cplhhSecSe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplAhSucSu(i5,i2,i1)
coup4 = cplAhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplhhSucSu(i5,i2,i1)
coup4 = cplhhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvImSvIm(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvImSvIm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvImSvIm(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvImSvIm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i4,i2)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvImSvRe(gE2,i4,i2)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvReSvRe(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2 = cplhhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvReSvRe(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology WoSSSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSd2(i1),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSu2(i1),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology MoSSSSV
! ---- Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSd2(i1),MSd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSu2(i1),MSu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Topology WoSSFF
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MCha(i3)*MFu(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFd(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFd(i3)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Cha,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFv(i4)*WfSSFbFb(p2,MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Chi,Fe ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*MFe(i4)*WfSSFbFb(p2,MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSecSe(gE1,gE2,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFu(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,2
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MCha(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFu(i3)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*WfSSFF(p2,MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhhhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology MoFFFFS
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,Fv,bar[Fe],Fv,Hpm ----
Do i1=1,3
Do i2=1,6
Do i3=1,3
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFv(i2)*MFv(i4)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fe,Fv,bar[Fe],Hpm ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i2)*MFv(i1)*MFv(i3)*MFe(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i4)*MfFFbFFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFe(i4)*MfFFFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Sd,bar[Fd],conj[Sd],Fd,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,bar[Fu],conj[Sd],Fu,Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Se,Fv,conj[Se],Fv,Cha ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i4)*MfSFSFbF(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Se,bar[Fe],conj[Se],Fe,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MFe(i4)*MFe(i2)*MfSFbSFbFb(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i3)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MfSFSFFb(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fd],conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i5)*MFd(i2)*MfSFbSFbFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvIm,Fe,SvIm,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fv,SvIm,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fe,SvRe,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fv,SvRe,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fe,SvIm,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fv,SvIm,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fe,SvRe,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fv,SvRe,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Topology VoSSSFF
! ---- Sd,conj[Sd],Sd,Chi,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Glu,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Chi,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3L = cplcFeChiSeL(i5,i4,i2)
coup3R = cplcFeChiSeR(i5,i4,i2)
coup4L = cplChiFecSeL(i4,i5,i3)
coup4R = cplChiFecSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i5)*VfSSSFbFb(p2,MSe2(i1),MSe2(i2),MSe2(i3),MChi2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3L = cplcFeChiSeL(i5,i4,i2)
coup3R = cplcFeChiSeR(i5,i4,i2)
coup4L = cplChiFecSeL(i4,i5,i3)
coup4R = cplChiFecSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSe2(i1),MSe2(i2),MSe2(i3),MChi2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Fv,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3L = cplcChaFvSeL(i5,i4,i2)
coup3R = cplcChaFvSeR(i5,i4,i2)
coup4L = cplFvChacSeL(i4,i5,i3)
coup4R = cplFvChacSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MCha(i5)*VfSSSFbFb(p2,MSe2(i1),MSe2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSecSe(gE1,i1,i2)
coup2 = cplhhSecSe(gE2,i3,i1)
coup3L = cplcChaFvSeL(i5,i4,i2)
coup3R = cplcChaFvSeR(i5,i4,i2)
coup4L = cplFvChacSeL(i4,i5,i3)
coup4R = cplFvChacSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSe2(i1),MSe2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Cha,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Chi,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Glu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFu(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvIm(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvIm(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i1,i2)
coup2 = cplhhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvImSvRe(gE2,i3,i1)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvImSvRe(gE1,i2,i1)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplhhSvReSvRe(gE1,i1,i2)
coup2 = cplhhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology VoFFFFS
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Chi,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Glu,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Cha],conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MCha(i4)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MCha(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MCha(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Chi,conj[Se] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i1)*MFe(i3)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i1)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MChi(i4)*MFe(i3)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Fv,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFv(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFv(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Cha],SvIm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MCha(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MCha(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MCha(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Cha],SvRe ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MCha(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MCha(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MCha(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Cha,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Chi,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Glu,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Cha,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Chi,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Chi,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fe,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
do gE1=1,4
Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2S(gE2,gE1)=Pi2S(gE1,gE2)
End do
End do
Pi2S=Pi2S+delta2lmasses
Pi2S = Matmul(Pi2S,ZH)
Pi2S = Matmul(Transpose(ZH),Pi2S)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Ah,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplAhSecSe(i3,i4,i1)
coup3 = cplAhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MAh2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],hh,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplhhSecSe(i3,i4,i1)
coup3 = cplhhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),Mhh2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i4,i1)
coup3 = cplSeSvImcHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSvRecSe(i3,i4,i1)
coup3 = cplSeSvRecHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvIm(i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvIm(i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*WfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvImSvRe(i3,i4,i1)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhSvReSvRe(i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvImSvRe(i3,i4,i1)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhSvReSvRe(i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvRecSe(i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology XoSSS
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSecSdcSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplAhAhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplhhhhSecSe(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplHpmSecHpmcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplSdSecSdcSe(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSecSecSe(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvImcSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2 = cplSeSvReSvRecSe(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSe2(i1),MSe2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvImcSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSvReSvRecSu(i2,i3,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplAhAhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplhhhhSvImSvIm(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplHpmSvImSvImcHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvImcSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvImcSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvImSvIm(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplAhAhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplhhhhSvImSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvImSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSeSvImSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSuSvImSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvImSvRe(i1,i3,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplAhAhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplhhhhSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplHpmSvReSvRecHpm(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSeSvReSvRecSe(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSuSvReSvRecSu(i3,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSvImSvImSvReSvRe(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2 = cplSvReSvReSvReSvRe(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology YoSSSS
! ---- Sd,conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplAhAhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplhhhhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdSdcSdcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdSecSdcSe(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplAhAhSecSe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplhhhhSecSe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplHpmSecHpmcSe(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSdSecSdcSe(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSeSecSecSe(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSeSvImSvImcSe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSeSvReSvRecSe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplAhAhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplhhhhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSuSucSucSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSuSvImSvImcSu(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSuSvReSvRecSu(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplAhAhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplhhhhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplHpmSvImSvImcHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplSeSvImSvImcSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplSuSvImSvImcSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvIm(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhAhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhhhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvImSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSeSvImSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSuSvImSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvRe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhAhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhhhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvReSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSeSvReSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSuSvReSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplSvReSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplAhAhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplhhhhSvImSvIm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplHpmSvImSvImcHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplSeSvImSvImcSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplSuSvImSvImcSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplSvImSvImSvImSvIm(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplSvImSvImSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhAhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhhhSvImSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvImSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSeSvImSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSuSvImSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvImSvRe(i2,i4,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhAhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhhhSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvReSvRecHpm(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSeSvReSvRecSe(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSuSvReSvRecSu(i4,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSvImSvImSvReSvRe(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplSvReSvReSvReSvRe(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ZoSSSS
! ---- Sd,conj[Sd],Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i4)
coup3 = cplSdSdcSdcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Se,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i4)
coup3 = cplSdSecSdcSe(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i4)
coup3 = cplSdSucSdcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Se,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i4)
coup3 = cplSeSecSecSe(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i3,i4)
coup3 = cplSeSvImSvImcSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i3,i4)
coup3 = cplSeSvImSvRecSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i3,i4)
coup3 = cplSeSvReSvRecSe(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSe2(i1),MSe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i4)
coup3 = cplSuSucSucSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i3,i4)
coup3 = cplSuSvImSvImcSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i3,i4)
coup3 = cplSuSvImSvRecSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i3,i4)
coup3 = cplSuSvReSvRecSu(i2,i3,i4,i1)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i3,i4)
coup3 = cplSvImSvImSvImSvIm(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvImSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*ZfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i3,i4)
coup3 = cplSvImSvImSvReSvRe(i1,i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i3,i4)
coup3 = cplSvImSvReSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i3,i4)
coup3 = cplSvReSvReSvReSvRe(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology SoSSS
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,i1,i2,i3)
coup2 = cplAhAhSdcSd(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Se,conj[Se] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,i1,i2,i3)
coup2 = cplAhAhSecSe(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MSe2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Su,conj[Su] ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,i1,i2,i3)
coup2 = cplAhAhSucSu(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,MAh2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,i1,i2,i3)
coup2 = cplAhAhSvImSvIm(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,i1,i2,i3)
coup2 = cplAhAhSvImSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,i1,i2,i3)
coup2 = cplAhAhSvReSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvIm ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvImSvIm(gE1,i1,i2,i3)
coup2 = cplAhhhSvImSvIm(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,Mhh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,SvIm,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvImSvRe(gE1,i1,i2,i3)
coup2 = cplAhhhSvImSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,SvRe,SvRe ----
Do i1=1,4
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhhhSvReSvRe(gE1,i1,i2,i3)
coup2 = cplAhhhSvReSvRe(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,Mhh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplAhSdcHpmcSu(gE2,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*SfSSS(p2,MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvIm,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhHpmSvImcSe(gE1,i1,i2,i3)
coup2 = cplAhSeSvImcHpm(gE2,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*SfSSS(p2,MHpm2(i1),MSvIm2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,SvRe,conj[Se] ----
Do i1=1,2
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhHpmSvRecSe(gE1,i1,i2,i3)
coup2 = cplAhSeSvRecHpm(gE2,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*SfSSS(p2,MHpm2(i1),MSvRe2(i2),MSe2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology UoSSSS
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhAhSdcSd(gE2,i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhHpmSucSd(gE2,i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Ah,Se ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhAhSecSe(gE2,i3,i4,i1)
coup3 = cplAhSecSe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),MAh2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhHpmSvImcSe(gE2,i3,i4,i1)
coup3 = cplSeSvImcHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Hpm,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhHpmSvRecSe(gE2,i3,i4,i1)
coup3 = cplSeSvRecHpm(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSe2(i1),MSe2(i2),MHpm2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhAhSucSu(gE2,i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSdcHpmcSu(gE2,i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhAhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhAhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhhhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhHpmSvImcSe(gE2,i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvIm2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhAhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhAhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvIm(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhHpmSvImcSe(gE2,i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvIm2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhAhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplAhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhAhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplAhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhhhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplhhSvImSvIm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhhhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvImSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhHpmSvRecSe(gE2,i3,i1,i4)
coup3 = cplSeSvImcHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvRe2(i1),MSvIm2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhAhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplAhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhAhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplAhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MAh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhhhSvImSvRe(gE2,i3,i4,i1)
coup3 = cplhhSvImSvRe(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvIm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,4
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhhhSvReSvRe(gE2,i3,i1,i4)
coup3 = cplhhSvReSvRe(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),Mhh2(i3),MSvRe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhHpmSvRecSe(gE2,i3,i1,i4)
coup3 = cplSeSvRecHpm(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MSvRe2(i1),MSvRe2(i2),MHpm2(i3),MSe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoSSSSS
! ---- Sd,conj[Sd],Sd,Ah,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplAhSdcSd(i4,i2,i5)
coup4 = cplAhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplhhSdcSd(i4,i2,i5)
coup4 = cplhhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdcHpmcSu(i2,i4,i5)
coup4 = cplHpmSucSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Ah,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplAhSecSe(i4,i2,i5)
coup4 = cplAhSecSe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MAh2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,hh,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplhhSecSe(i4,i2,i5)
coup4 = cplhhSecSe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),Mhh2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvIm,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSeSvImcHpm(i2,i4,i5)
coup4 = cplHpmSvImcSe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvIm2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,SvRe,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3 = cplSeSvRecHpm(i2,i4,i5)
coup4 = cplHpmSvRecSe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplAhSucSu(i4,i2,i5)
coup4 = cplAhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplhhSucSu(i4,i2,i5)
coup4 = cplhhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplHpmSucSd(i4,i2,i5)
coup4 = cplSdcHpmcSu(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvImcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i5,i2)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplAhSvReSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i5,i2)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplhhSvReSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3 = cplHpmSvRecSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvIm(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvImcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvIm(i4,i2,i5)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvIm(i4,i2,i5)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvImcSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSSS(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvImSvRe(i4,i5,i2)
coup4 = cplAhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Ah,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplAhSvReSvRe(i4,i2,i5)
coup4 = cplAhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MAh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvImSvRe(i4,i5,i2)
coup4 = cplhhSvImSvRe(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,hh,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,4
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplhhSvReSvRe(i4,i2,i5)
coup4 = cplhhSvReSvRe(i4,i3,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),Mhh2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Hpm,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3 = cplHpmSvRecSe(i4,i2,i5)
coup4 = cplSeSvRecHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MHpm2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSSSSS
! ---- Sd,conj[Sd],conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSdcSd(gE2,i4,i2)
coup3 = cplAhSdcSd(i5,i2,i1)
coup4 = cplAhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSdcSd(gE2,i4,i2)
coup3 = cplhhSdcSd(i5,i2,i1)
coup4 = cplhhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Su],conj[Sd],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplHpmSucSd(i5,i2,i1)
coup4 = cplSdcHpmcSu(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MSd2(i1),MSu2(i2),MSd2(i3),MSu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvIm,conj[Se],SvIm,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2 = cplAhSvImSvIm(gE2,i2,i4)
coup3 = cplHpmSvImcSe(i5,i2,i1)
coup4 = cplSeSvImcHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSe2(i1),MSvIm2(i2),MSe2(i3),MSvIm2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvIm,conj[Se],SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i2,i4)
coup3 = cplHpmSvImcSe(i5,i2,i1)
coup4 = cplSeSvRecHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSS(p2,MSe2(i1),MSvIm2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,SvRe,conj[Se],SvRe,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplHpmSvRecSe(i5,i2,i1)
coup4 = cplSeSvRecHpm(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSe2(i1),MSvRe2(i2),MSe2(i3),MSvRe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],conj[Se],Se,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2 = cplAhSecSe(gE2,i4,i2)
coup3 = cplAhSecSe(i5,i2,i1)
coup4 = cplAhSecSe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],conj[Se],Se,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2 = cplAhSecSe(gE2,i4,i2)
coup3 = cplhhSecSe(i5,i2,i1)
coup4 = cplhhSecSe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSe2(i1),MSe2(i2),MSe2(i3),MSe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplAhSucSu(i5,i2,i1)
coup4 = cplAhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplhhSucSu(i5,i2,i1)
coup4 = cplhhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvImSvIm(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvImSvIm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvImSvIm(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvImSvIm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvIm2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvIm,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvIm2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvIm(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvIm(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i4,i2)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvImSvRe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvIm,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvImSvRe(gE2,i4,i2)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvImSvRe(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvIm2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvImSvRe(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvImSvRe(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplAhSvReSvRe(i5,i1,i2)
coup4 = cplAhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,SvRe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2 = cplAhSvReSvRe(gE2,i2,i4)
coup3 = cplhhSvReSvRe(i5,i1,i2)
coup4 = cplhhSvReSvRe(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MSvRe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology WoSSSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSd2(i1),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSu2(i1),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Topology MoSSSSV
! ---- Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSd2(i1),MSd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSu2(i1),MSu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Topology WoSSFF
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MCha(i3)*MFu(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFd(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFd(i3)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Se,conj[Se],Cha,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,6
if((MCha(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFv(i4)*WfSSFbFb(p2,MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2L = cplFvChacSeL(i4,i3,i1)
coup2R = cplFvChacSeR(i4,i3,i1)
coup3L = cplcChaFvSeL(i3,i4,i2)
coup3R = cplcChaFvSeR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSe2(i1),MSe2(i2),MCha2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Se,conj[Se],Chi,Fe ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*MFe(i4)*WfSSFbFb(p2,MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSecSe(gE1,gE2,i1,i2)
coup2L = cplChiFecSeL(i3,i4,i1)
coup2R = cplChiFecSeR(i3,i4,i1)
coup3L = cplcFeChiSeL(i4,i3,i2)
coup3R = cplcFeChiSeR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSe2(i1),MSe2(i2),MChi2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFu(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,2
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MCha(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFu(i3)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvImL(i3,i4,i2)
coup3R = cplcChaFeSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvIm2(i1),MSvIm2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvIm(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvImL(i3,i4,i2)
coup3R = cplChiFvSvImR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MSvIm2(i1),MSvIm2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvImL(i4,i3,i1)
coup2R = cplcFeChaSvImR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*WfSSFF(p2,MSvIm2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvImSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvImL(i3,i4,i1)
coup2R = cplChiFvSvImR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvIm2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,2
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MFe(i4)*WfSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplcFeChaSvReL(i4,i3,i1)
coup2R = cplcFeChaSvReR(i4,i3,i1)
coup3L = cplcChaFeSvReL(i3,i4,i2)
coup3R = cplcChaFeSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MSvRe2(i1),MSvRe2(i2),MCha2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MChi(i3)*MFv(i4)*WfSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhAhSvReSvRe(gE1,gE2,i1,i2)
coup2L = cplChiFvSvReL(i3,i4,i1)
coup2R = cplChiFvSvReR(i3,i4,i1)
coup3L = cplChiFvSvReL(i3,i4,i2)
coup3R = cplChiFvSvReR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MSvRe2(i1),MSvRe2(i2),MChi2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology MoFFFFS
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,Fv,bar[Fe],Fv,Hpm ----
Do i1=1,3
Do i2=1,6
Do i3=1,3
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFv(i2)*MFv(i4)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvHpmL(i1,i2,i5)
coup3R = cplcFeFvHpmR(i1,i2,i5)
coup4L = cplFvFecHpmL(i4,i3,i5)
coup4R = cplFvFecHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fe,Fv,bar[Fe],Hpm ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i2)*MFv(i1)*MFv(i3)*MFe(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i4)*MfFFbFFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFe(i4)*MfFFFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvHpmL(i2,i1,i5)
coup3R = cplcFeFvHpmR(i2,i1,i5)
coup4L = cplFvFecHpmL(i3,i4,i5)
coup4R = cplFvFecHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Sd,bar[Fd],conj[Sd],Fd,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,bar[Fu],conj[Sd],Fu,Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Se,Fv,conj[Se],Fv,Cha ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i4)*MfSFSFbF(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvChacSeL(i2,i5,i1)
coup3R = cplFvChacSeR(i2,i5,i1)
coup4L = cplcChaFvSeL(i5,i4,i3)
coup4R = cplcChaFvSeR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSe2(i1),MFv2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Se,bar[Fe],conj[Se],Fe,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MFe(i4)*MFe(i2)*MfSFbSFbFb(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplChiFecSeL(i5,i2,i1)
coup3R = cplChiFecSeR(i5,i2,i1)
coup4L = cplcFeChiSeL(i4,i5,i3)
coup4R = cplcFeChiSeR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MfSFSFFb(p2,MSe2(i1),MFe2(i2),MSe2(i3),MFe2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fd],conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i5)*MFd(i2)*MfSFbSFbFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
! ---- SvIm,Fe,SvIm,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvIm2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fv,SvIm,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvIm2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fe,SvRe,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvImL(i2,i5,i1)
coup3R = cplcFeChaSvImR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvIm2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvIm,Fv,SvRe,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvImL(i5,i2,i1)
coup3R = cplChiFvSvImR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvIm2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fe,SvIm,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvImL(i5,i4,i3)
coup4R = cplcChaFeSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvRe2(i1),MFe2(i2),MSvIm2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fv,SvIm,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvImL(i5,i4,i3)
coup4R = cplChiFvSvImR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvRe2(i1),MFv2(i2),MSvIm2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fe,SvRe,bar[Fe],Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MFe(i2)*MFe(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeChaSvReL(i2,i5,i1)
coup3R = cplcFeChaSvReR(i2,i5,i1)
coup4L = cplcChaFeSvReL(i5,i4,i3)
coup4R = cplcChaFeSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i5)*MfSFSFFb(p2,MSvRe2(i1),MFe2(i2),MSvRe2(i3),MFe2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- SvRe,Fv,SvRe,Fv,Chi ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MFv(i2)*MFv(i4)*MfSFbSFbFb(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplChiFvSvReL(i5,i2,i1)
coup3R = cplChiFvSvReR(i5,i2,i1)
coup4L = cplChiFvSvReL(i5,i4,i3)
coup4R = cplChiFvSvReR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i5)*MfSFSFFb(p2,MSvRe2(i1),MFv2(i2),MSvRe2(i3),MFv2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Topology VoSSSFF
! ---- Sd,conj[Sd],Sd,Chi,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Glu,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Chi,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3L = cplcFeChiSeL(i5,i4,i2)
coup3R = cplcFeChiSeR(i5,i4,i2)
coup4L = cplChiFecSeL(i4,i5,i3)
coup4R = cplChiFecSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i5)*VfSSSFbFb(p2,MSe2(i1),MSe2(i2),MSe2(i3),MChi2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3L = cplcFeChiSeL(i5,i4,i2)
coup3R = cplcFeChiSeR(i5,i4,i2)
coup4L = cplChiFecSeL(i4,i5,i3)
coup4R = cplChiFecSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSe2(i1),MSe2(i2),MSe2(i3),MChi2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Se,conj[Se],Se,Fv,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MCha(i5) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3L = cplcChaFvSeL(i5,i4,i2)
coup3R = cplcChaFvSeR(i5,i4,i2)
coup4L = cplFvChacSeL(i4,i5,i3)
coup4R = cplFvChacSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MCha(i5)*VfSSSFbFb(p2,MSe2(i1),MSe2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSecSe(gE1,i1,i2)
coup2 = cplAhSecSe(gE2,i3,i1)
coup3L = cplcChaFvSeL(i5,i4,i2)
coup3R = cplcChaFvSeR(i5,i4,i2)
coup4L = cplFvChacSeL(i4,i5,i3)
coup4R = cplFvChacSeR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSe2(i1),MSe2(i2),MSe2(i3),MFv2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Cha,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Chi,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Glu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFu(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvIm(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvIm(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvIm,SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i1,i2)
coup2 = cplAhSvImSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvIm2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvImL(i4,i5,i3)
coup4R = cplcChaFeSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvIm,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvImSvRe(gE2,i3,i1)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvImL(i4,i5,i3)
coup4R = cplChiFvSvImR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvIm2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvImL(i5,i4,i2)
coup3R = cplcFeChaSvImR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvIm,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvImSvRe(gE1,i2,i1)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvImL(i4,i5,i2)
coup3R = cplChiFvSvImR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvIm2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Cha,bar[Fe] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFe(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplcFeChaSvReL(i5,i4,i2)
coup3R = cplcFeChaSvReR(i5,i4,i2)
coup4L = cplcChaFeSvReL(i4,i5,i3)
coup4R = cplcChaFeSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MCha2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- SvRe,SvRe,SvRe,Chi,Fv ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i5)*VfSSSFbFb(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1 = cplAhSvReSvRe(gE1,i1,i2)
coup2 = cplAhSvReSvRe(gE2,i1,i3)
coup3L = cplChiFvSvReL(i4,i5,i2)
coup3R = cplChiFvSvReR(i4,i5,i2)
coup4L = cplChiFvSvReL(i4,i5,i3)
coup4R = cplChiFvSvReR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MSvRe2(i1),MSvRe2(i2),MSvRe2(i3),MChi2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology VoFFFFS
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Chi,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Glu,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Cha],conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MCha(i4)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MCha(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MCha(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Chi,conj[Se] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i1)*MFe(i3)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFe(i1)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MChi(i4)*MFe(i3)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplChiFecSeL(i4,i2,i5)
coup3R = cplChiFecSeR(i4,i2,i5)
coup4L = cplcFeChiSeL(i3,i4,i5)
coup4R = cplcFeChiSeR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MChi2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Fv,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFv(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFv(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i4,i2,i5)
coup3R = cplFvFecHpmR(i4,i2,i5)
coup4L = cplcFeFvHpmL(i3,i4,i5)
coup4R = cplcFeFvHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Cha],SvIm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MCha(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MCha(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MCha(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvImL(i4,i2,i5)
coup3R = cplcChaFeSvImR(i4,i2,i5)
coup4L = cplcFeChaSvImL(i3,i4,i5)
coup4R = cplcFeChaSvImR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Cha],SvRe ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MCha(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MCha(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MCha(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcChaFeSvReL(i4,i2,i5)
coup3R = cplcChaFeSvReR(i4,i2,i5)
coup4L = cplcFeChaSvReL(i3,i4,i5)
coup4R = cplcFeChaSvReR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MCha2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Cha,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Chi,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Glu,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,4
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,2
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Cha,conj[Se] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvChacSeL(i2,i4,i5)
coup3R = cplFvChacSeR(i2,i4,i5)
coup4L = cplcChaFvSeL(i4,i3,i5)
coup4R = cplcChaFvSeR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MCha2(i4),MSe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Chi,SvIm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvImL(i4,i2,i5)
coup3R = cplChiFvSvImR(i4,i2,i5)
coup4L = cplChiFvSvImL(i4,i3,i5)
coup4R = cplChiFvSvImR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvIm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Chi,SvRe ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MChi(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplChiFvSvReL(i4,i2,i5)
coup3R = cplChiFvSvReR(i4,i2,i5)
coup4L = cplChiFvSvReL(i4,i3,i5)
coup4R = cplChiFvSvReR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MChi2(i4),MSvRe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fe,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,3
Do i5=1,2
if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFecHpmL(i2,i4,i5)
coup3R = cplFvFecHpmR(i2,i4,i5)
coup4L = cplcFeFvHpmL(i4,i3,i5)
coup4R = cplcFeFvHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,4
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,4
   Do gE2=1,4
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
do gE1=1,4
Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcontah(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcontah(gE1,gE2)+tempcontah(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2P(gE2,gE1)=Pi2P(gE1,gE2)
End do
End do
Pi2P=Pi2P+delta2lmassesah
Pi2P = Matmul(Pi2P,ZA)
Pi2P = Matmul(Transpose(ZA),Pi2P)
End Subroutine CalculatePi2S
End Module Pole2L_BLSSM 
 
